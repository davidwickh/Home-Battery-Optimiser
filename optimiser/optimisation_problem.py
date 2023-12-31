"""
Main file for the optimisation problem
"""
# pylint: disable=import-error, too-many-locals, too-many-statements, consider-using-generator, unused-variable
import pulp as pl  # type: ignore
from optimiser.constants import OptimiserConstants


def main():
    """
    Main function
    :return:
    """
    # Define the problem
    problem = pl.LpProblem("BatteryOptimisation", pl.LpMinimize)

    # Time slices
    time_slices = range(1, 25)

    demand = {}
    for _t in time_slices:
        demand[_t] = 100

    # ---- Define variables ----
    # Renewable electricity flow
    renewable_electricity_to_house = pl.LpVariable.dicts(
        name="renewable_electricity_to_house_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    renewable_electricity_to_battery = pl.LpVariable.dicts(
        name="renewable_electricity_to_battery_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    total_renewable_generation = pl.LpVariable.dicts(
        name="total_renewable_generation_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )

    # Battery electricity flow
    battery_electricity_to_house = pl.LpVariable.dicts(
        name="battery_electricity_to_house_{time_slices}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    battery_electricity_to_grid = pl.LpVariable.dicts(
        name="battery_electricity_to_grid_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    electricity_to_battery = pl.LpVariable.dicts(
        name="electricity_to_battery_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )

    # Grid electricity flow
    grid_electricity_to_house = pl.LpVariable.dicts(
        name="grid_electricity_to_house_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    grid_electricity_to_battery = pl.LpVariable.dicts(
        name="grid_electricity_to_battery_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )

    # Fuel Costs
    fuel_costs = pl.LpVariable.dicts(
        name="fuel_costs_{t}", indices=time_slices, lowBound=0, cat="Continuous"
    )
    battery_electricity_costs = pl.LpVariable.dicts(
        name="battery_electricity_costs_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    grid_electricity_costs = pl.LpVariable.dicts(
        name="grid_electricity_costs_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    renewable_eletricity_costs = pl.LpVariable.dicts(
        name="renewable_eletricity_costs_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    battery_to_grid_sales = pl.LpVariable.dicts(
        name="battery_to_grid_sales_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    # Battery state of charge
    battery_state_of_charge = pl.LpVariable.dicts(
        name="battery_state_of_charge_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )
    battery_degradation = pl.LpVariable.dicts(
        name="battery_degradation_{t}",
        indices=time_slices,
        lowBound=0,
        cat="Continuous",
    )

    # Define objective function
    problem += (
        pl.lpSum(battery_electricity_costs)
        + pl.lpSum(grid_electricity_costs)
        + pl.lpSum(renewable_eletricity_costs)
    ), "Objective - minimise fuel costs"

    # Define constraints
    for _t in time_slices:
        # Electricity flow constraints
        problem += (
            renewable_electricity_to_house[_t]
            + battery_electricity_to_house[_t]
            + grid_electricity_to_house[_t]
        ) - demand[_t] == 0, f"Demand {_t}"

        problem += (
            renewable_electricity_to_battery[_t]
            + grid_electricity_to_battery[_t]
            - battery_electricity_to_grid[_t]
        ) - electricity_to_battery[_t] == 0, f"Electricity flow constraint {_t}"

        # Renewable production constraints
        problem += (
            renewable_electricity_to_house[_t] + renewable_electricity_to_battery[_t]
        ) - total_renewable_generation[_t] == 0, f"Total renewable generation {_t}"

        problem += (
            (total_renewable_generation[_t])
            <= OptimiserConstants.max_renewable_generation,
            f"Maximum renewable generation {_t}",
        )

        # Battery constraints
        # At the start of the model the battery is empty
        if _t == 1:
            problem += battery_state_of_charge[_t] == 0, f"Battery state of charge {_t}"
        else:
            problem += (
                battery_state_of_charge[_t - 1]
                + electricity_to_battery[_t]
                - battery_electricity_to_house[_t]
                - battery_electricity_to_grid[_t]
                - battery_degradation[_t]
            ) - battery_state_of_charge[_t] == 0, f"Battery state of charge {_t}"

        # Rate of electricity leaving the battery cannot exceed the maximum discharge rate
        problem += (
            (battery_electricity_to_house[_t] + battery_electricity_to_grid[_t])
            <= OptimiserConstants.max_battery_discharge_rate
            * OptimiserConstants.timeslice_size,
            f"Battery discharge rate {_t}",
        )

        # Rate of electricity entering the battery cannot exceed the maximum charge rate
        problem += (
            electricity_to_battery[_t]
            <= OptimiserConstants.max_battery_charge_rate
            * OptimiserConstants.timeslice_size,
            f"Battery charge rate {_t}",
        )

        # The battery cannot exceed its maximum capacity
        problem += (
            battery_state_of_charge[_t] <= OptimiserConstants.max_battery_cap,
            f"Battery capacity {_t}",
        )

        # The battery cannot be less than 0
        problem += (
            battery_state_of_charge[_t] >= 0,
            f"Battery minimum state of charge {_t}",
        )

        # Financial constraints
        problem += (
            (grid_electricity_to_house[_t] + grid_electricity_to_battery[_t])
            * OptimiserConstants.unit_price_grid_electricity
        ) - grid_electricity_costs[_t] == 0, f"Grid electricity costs {_t}"
        problem += (
            battery_electricity_to_house[_t]
            * OptimiserConstants.unit_price_battery_electricity
        ) - battery_electricity_costs[_t] == 0, f"Battery electricity costs {_t}"
        problem += (
            renewable_electricity_to_house[_t]
            * OptimiserConstants.unit_price_renewable_electricity
        ) - renewable_eletricity_costs[_t] == 0, f"Renewable electricity costs {_t}"
        problem += (
            battery_to_grid_sales[_t] * OptimiserConstants.unit_price_battery_sale_price
        ) - battery_to_grid_sales[_t] == 0, f"Battery to grid sales {_t}"

    problem.writeLP("BatteryOptimisation.lp")
    problem.solve()
    print(pl.LpStatus[problem.status])

    print("---- Costs ----")
    print("Total Cost = £", pl.value(problem.objective))
    print(
        "Total Battery Costs = ",
        sum([pl.value(battery_electricity_costs[t]) for t in time_slices]),
    )
    print(
        "Total Grid Costs = ",
        sum([pl.value(grid_electricity_costs[t]) for t in time_slices]),
    )
    print(
        "Total Renewable Costs = ",
        sum([pl.value(renewable_eletricity_costs[t]) for t in time_slices]),
    )

    print("---- Energy Flows ----")
    print(
        f"Total Electricity Sent from Battery to Grid = "
        f"{sum([pl.value(battery_to_grid_sales[t]) for t in time_slices])} kWh"
    )
    print(
        f"Total Renewable Generation = "
        f"{sum([pl.value(total_renewable_generation[t]) for t in time_slices])} kWh"
    )
    print(
        f"Total Electricity Sent from Renewables to House = "
        f"{sum([pl.value(renewable_electricity_to_house[t]) for t in time_slices])} kWh"
    )
    print(
        f"Total Electricity Sent from Renewables to Battery = "
        f"{sum([pl.value(renewable_electricity_to_battery[t]) for t in time_slices])} kWh"
    )
    print(
        f"Total Electricity Sent from Battery to House = "
        f"{sum([pl.value(battery_electricity_to_house[t]) for t in time_slices])} kWh"
    )
    print(
        f"Total Electricity Sent from Grid to House = "
        f"{sum([pl.value(grid_electricity_to_house[t]) for t in time_slices])} kWh"
    )


if __name__ == "__main__":
    main()
