import pulp as pl
from pulp import LpVariable


def main():
    # Define the problem
    problem = pl.LpProblem("BatteryOptimisation", pl.LpMinimize)

    # Time slices
    T = range(1, 25)

    TIMESLICE_SIZE = 0.5

    # Renewable Generation Constants
    MAX_RENEWABLE_GENERATION = 10  # kWh

    # Battery Constants
    MAX_BATTERY_DISCHARGE_RATE = 5
    MAX_BATTERY_CHARGE_RATE = 5
    MAX_BATTERY_CAP = 100

    # Costs Constants
    UNIT_PRICE_GRID_ELECTRICITY = 0.3
    UNIT_PRICE_BATTERY_ELECTRICITY = 0
    UNIT_PRICE_RENEWABLE_ELECTRICITY = 0
    UNIT_PRICE_BATTERY_SALE_PRICE = 0.1

    demand = {}
    for t in T:
        demand[t] = 100

    # ---- Define variables ----
    # Renewable electricity flow
    renewable_electricity_to_house = LpVariable.dicts(
        name="renewable_electricity_to_house_{t}",
        indexs=T,
        lowBound=0,
        cat="Continuous",
    )
    renewable_electricity_to_battery = LpVariable.dicts(
        name="renewable_electricity_to_battery_{t}",
        indexs=T,
        lowBound=0,
        cat="Continuous",
    )
    total_renewable_generation = LpVariable.dicts(
        name="total_renewable_generation_{t}", indexs=T, lowBound=0, cat="Continuous"
    )

    # Battery electricity flow
    battery_electricity_to_house = LpVariable.dicts(
        name="battery_electricity_to_house_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    battery_electricity_to_grid = LpVariable.dicts(
        name="battery_electricity_to_grid_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    electricity_to_battery = LpVariable.dicts(
        name="electricity_to_battery_{t}", indexs=T, lowBound=0, cat="Continuous"
    )

    # Grid electricity flow
    grid_electricity_to_house = LpVariable.dicts(
        name="grid_electricity_to_house_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    grid_electricity_to_battery = LpVariable.dicts(
        name="grid_electricity_to_battery_{t}", indexs=T, lowBound=0, cat="Continuous"
    )

    # Fuel Costs
    fuel_costs = LpVariable.dicts(
        name="fuel_costs_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    battery_electricity_costs = LpVariable.dicts(
        name="battery_electricity_costs_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    grid_electricity_costs = LpVariable.dicts(
        name="grid_electricity_costs_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    renewable_eletricity_costs = LpVariable.dicts(
        name="renewable_eletricity_costs_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    battery_to_grid_sales = LpVariable.dicts(
        name="battery_to_grid_sales_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    # Battery state of charge
    battery_state_of_charge = LpVariable.dicts(
        name="battery_state_of_charge_{t}", indexs=T, lowBound=0, cat="Continuous"
    )
    battery_degradation = LpVariable.dicts(
        name="battery_degradation_{t}", indexs=T, lowBound=0, cat="Continuous"
    )

    # Define objective function
    problem += (
        pl.lpSum(battery_electricity_costs)
        + pl.lpSum(grid_electricity_costs)
        + pl.lpSum(renewable_eletricity_costs)
    ), "Objective - minimise fuel costs"

    # Define constraints
    for t in T:
        # Electricity flow constraints
        problem += (
            renewable_electricity_to_house[t]
            + battery_electricity_to_house[t]
            + grid_electricity_to_house[t]
        ) - demand[t] == 0, f"Demand {t}"

        problem += (
            renewable_electricity_to_battery[t]
            + grid_electricity_to_battery[t]
            - battery_electricity_to_grid[t]
        ) - electricity_to_battery[t] == 0, f"Electricity flow constraint {t}"

        # Renewable production constraints
        problem += (
            renewable_electricity_to_house[t] + renewable_electricity_to_battery[t]
        ) - total_renewable_generation[t] == 0, f"Total renewable generation {t}"

        problem += (
            total_renewable_generation[t]
        ) <= MAX_RENEWABLE_GENERATION, f"Maximum renewable generation {t}"

        # Battery constraints
        # At the start of the model the battery is empty
        if t == 1:
            problem += battery_state_of_charge[t] == 0, f"Battery state of charge {t}"
        else:
            problem += (
                battery_state_of_charge[t - 1]
                + electricity_to_battery[t]
                - battery_electricity_to_house[t]
                - battery_electricity_to_grid[t]
                - battery_degradation[t]
            ) - battery_state_of_charge[t] == 0, f"Battery state of charge {t}"

        # Rate of electricity leaving the battery cannot exceed the maximum discharge rate
        problem += (
            (battery_electricity_to_house[t] + battery_electricity_to_grid[t])
            <= MAX_BATTERY_DISCHARGE_RATE * TIMESLICE_SIZE,
            f"Battery discharge rate {t}",
        )

        # Rate of electricity entering the battery cannot exceed the maximum charge rate
        problem += (
            electricity_to_battery[t] <= MAX_BATTERY_CHARGE_RATE * TIMESLICE_SIZE,
            f"Battery charge rate {t}",
        )

        # The battery cannot exceed its maximum capacity
        problem += (
            battery_state_of_charge[t] <= MAX_BATTERY_CAP,
            f"Battery capacity {t}",
        )

        # The battery cannot be less than 0
        problem += (
            battery_state_of_charge[t] >= 0,
            f"Battery minimum state of charge {t}",
        )

        # Financial constraints
        problem += (
            (grid_electricity_to_house[t] + grid_electricity_to_battery[t])
            * UNIT_PRICE_GRID_ELECTRICITY
        ) - grid_electricity_costs[t] == 0, f"Grid electricity costs {t}"
        problem += (
            battery_electricity_to_house[t] * UNIT_PRICE_BATTERY_ELECTRICITY
        ) - battery_electricity_costs[t] == 0, f"Battery electricity costs {t}"
        problem += (
            renewable_electricity_to_house[t] * UNIT_PRICE_RENEWABLE_ELECTRICITY
        ) - renewable_eletricity_costs[t] == 0, f"Renewable electricity costs {t}"
        problem += (
            battery_to_grid_sales[t] * UNIT_PRICE_BATTERY_SALE_PRICE
        ) - battery_to_grid_sales[t] == 0, f"Battery to grid sales {t}"

    problem.writeLP("BatteryOptimisation.lp")
    problem.solve()
    print(pl.LpStatus[problem.status])

    print("---- Costs ----")
    print("Total Cost = £", pl.value(problem.objective))
    print(
        "Total Battery Costs = ",
        sum([pl.value(battery_electricity_costs[t]) for t in T]),
    )
    print("Total Grid Costs = ", sum([pl.value(grid_electricity_costs[t]) for t in T]))
    print(
        "Total Renewable Costs = ",
        sum([pl.value(renewable_eletricity_costs[t]) for t in T]),
    )

    print("---- Energy Flows ----")
    print(
        f"Total Electricity Sent from Battery to Grid = {sum([pl.value(battery_to_grid_sales[t]) for t in T])} kWh"
    )
    print(
        f"Total Renewable Generation = {sum([pl.value(total_renewable_generation[t]) for t in T])} kWh"
    )
    print(
        f"Total Electricity Sent from Renewables to House = {sum([pl.value(renewable_electricity_to_house[t]) for t in T])} kWh"
    )
    print(
        f"Total Electricity Sent from Renewables to Battery = {sum([pl.value(renewable_electricity_to_battery[t]) for t in T])} kWh"
    )
    print(
        f"Total Electricity Sent from Battery to House = {sum([pl.value(battery_electricity_to_house[t]) for t in T])} kWh"
    )
    print(
        f"Total Electricity Sent from Grid to House = {sum([pl.value(grid_electricity_to_house[t]) for t in T])} kWh"
    )

    print("---- Battery ----")
    print(
        f"Total Battery Degradation = {sum([pl.value(battery_degradation[t]) for t in T])} kWh"
    )


if __name__ == "__main__":
    main()
