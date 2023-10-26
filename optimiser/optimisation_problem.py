"""
Main file for the optimisation problem
"""
import logging
from dataclasses import dataclass, field

# pylint: disable=import-error, too-many-locals, too-many-statements, consider-using-generator, unused-variable
import pulp as pl  # type: ignore
from optimiser.constants import OptimiserConstants
from optimiser.variables.battery_state_of_charge_variables import (
    BatteryStateOfChargeVariables,
)
from optimiser.variables.electricity_flow_variables import (
    RenewableElectricityFlowVariables,
    BatteryElectricityFlowVariables,
    GridElectricityFlowVariables,
)
from optimiser.variables.fuel_cost_variables import FuelCostVariables

logger = logging.getLogger(__name__)


@dataclass
class Optimiser:
    """
    Class that builds and runs the optimisation problem.
    """

    problem: pl.LpProblem = field(
        default_factory=lambda: pl.LpProblem("BatteryOptimisation", pl.LpMinimize)
    )
    time_slices: range = field(default_factory=lambda: range(1, 25))
    demand = {t: 1 for t in range(1, 25)}

    @classmethod
    def build_optimiser(cls):
        """
        Method that servers to build the optimiser. At a high level this method:
        - Creates the optimisation variables
        - Creates the objective function
        - Creates the constraints
        :return:
        """
        logger.info("Building optimiser")
        cls._define_objective_function()
        for _t in cls.time_slices:
            cls._define_electricity_flow_constraints(_t)
            cls._define_renewable_production_constraints(_t)
            cls._define_battery_constraints(_t)
            cls._define_financial_constraints(_t)
        cls.problem.writeLP("BatteryOptimisation.lp")
        logger.info("Finished building optimiser")

    @classmethod
    def _define_objective_function(cls):
        """
        Method that defines the objective function.
        :return:
        """
        cls.problem += (
            pl.lpSum(FuelCostVariables.get_battery_electricity_costs(cls.time_slices))
            + pl.lpSum(FuelCostVariables.get_grid_electricity_costs(cls.time_slices))
            + pl.lpSum(
                FuelCostVariables.get_renewable_electricity_costs(cls.time_slices)
            )
            - pl.lpSum(FuelCostVariables.get_battery_to_grid_sales(cls.time_slices))
        ), "Objective - minimise fuel costs"

    @classmethod
    def _define_electricity_flow_constraints(cls, _t):
        """
        Method that defines the electricity flow constraints.
        :param _t:
        :return:
        """
        cls.problem += (
            RenewableElectricityFlowVariables.get_renewable_electricity_to_house(_t)
            + BatteryElectricityFlowVariables.get_battery_electricity_to_house(_t)
            + GridElectricityFlowVariables.get_grid_electricity_to_house(_t)
        ) - cls.demand[_t] == 0, f"Demand {_t}"

        cls.problem += (
            RenewableElectricityFlowVariables.get_renewable_electricity_to_battery(_t)
            + GridElectricityFlowVariables.get_grid_electricity_to_battery(_t)
            - BatteryElectricityFlowVariables.get_battery_electricity_to_grid(_t)
        ) - BatteryElectricityFlowVariables.get_electricity_to_battery(
            _t
        ) == 0, f"Electricity flow constraint {_t}"

    @classmethod
    def _define_renewable_production_constraints(cls, _t):
        """
        Method that defines the renewable production constraints.
        :param _t:
        :return:
        """
        cls.problem += (
            RenewableElectricityFlowVariables.get_renewable_electricity_to_house(_t)
            + RenewableElectricityFlowVariables.get_renewable_electricity_to_battery(_t)
        ) - RenewableElectricityFlowVariables.get_total_renewable_generation(
            _t
        ) == 0, f"Total renewable generation {_t}"

        cls.problem += (
            RenewableElectricityFlowVariables.get_total_renewable_generation(_t)
            <= OptimiserConstants.MAX_RENEWABLE_GENERATION,
            f"Maximum renewable generation {_t}",
        )

    @classmethod
    def _define_battery_constraints(cls, _t):
        """
        Method that defines the battery constraints.
        :param _t:
        :return:
        """
        if _t == 1:
            cls.problem += (
                BatteryStateOfChargeVariables.get_battery_state_of_charge(_t) == 0,
                f"Battery state of charge {_t}",
            )
        else:
            cls.problem += (
                BatteryStateOfChargeVariables.get_battery_state_of_charge(_t - 1)
                + BatteryElectricityFlowVariables.get_electricity_to_battery(_t)
                - BatteryElectricityFlowVariables.get_battery_electricity_to_house(_t)
                - BatteryElectricityFlowVariables.get_battery_electricity_to_grid(_t)
                - BatteryStateOfChargeVariables.get_battery_degradation(_t)
            ) - BatteryStateOfChargeVariables.get_battery_state_of_charge(
                _t
            ) == 0, f"Battery state of charge {_t}"

        cls.problem += (
            (
                BatteryElectricityFlowVariables.get_battery_electricity_to_house(_t)
                + BatteryElectricityFlowVariables.get_battery_electricity_to_grid(_t)
            )
            <= OptimiserConstants.MAX_BATTERY_DISCHARGE_RATE
            * OptimiserConstants.TIMESLICE_SIZE,
            f"Battery discharge rate {_t}",
        )

        cls.problem += (
            BatteryElectricityFlowVariables.get_electricity_to_battery(_t)
            <= OptimiserConstants.MAX_BATTERY_CHARGE_RATE
            * OptimiserConstants.TIMESLICE_SIZE,
            f"Battery charge rate {_t}",
        )

        cls.problem += (
            BatteryStateOfChargeVariables.get_battery_state_of_charge(_t)
            <= OptimiserConstants.MAX_BATTERY_CAP,
            f"Battery capacity {_t}",
        )

        cls.problem += (
            BatteryStateOfChargeVariables.get_battery_state_of_charge(_t) >= 0,
            f"Battery minimum state of charge {_t}",
        )

    @classmethod
    def _define_financial_constraints(cls, _t):
        """
        Method that defines the financial constraints.
        :param _t:
        :return:
        """
        cls.problem += (
            (
                GridElectricityFlowVariables.get_grid_electricity_to_house(_t)
                + GridElectricityFlowVariables.get_grid_electricity_to_battery(_t)
            )
            * OptimiserConstants.unit_price_grid_electricity
        ) - FuelCostVariables.get_grid_electricity_costs(
            _t
        ) == 0, f"Grid electricity costs {_t}"

        cls.problem += (
            BatteryElectricityFlowVariables.get_battery_electricity_to_house(_t)
            * OptimiserConstants.unit_price_battery_electricity
        ) - FuelCostVariables.get_battery_electricity_costs(
            _t
        ) == 0, f"Battery electricity costs {_t}"

        cls.problem += (
            RenewableElectricityFlowVariables.get_renewable_electricity_to_house(_t)
            * OptimiserConstants.unit_price_renewable_electricity
        ) - FuelCostVariables.get_renewable_electricity_costs(
            _t
        ) == 0, f"Renewable electricity costs {_t}"

        cls.problem += (
            BatteryElectricityFlowVariables.get_battery_electricity_to_grid(_t)
            * OptimiserConstants.unit_price_battery_sale_price
        ) - FuelCostVariables.get_battery_to_grid_sales(
            _t
        ) == 0, f"Battery to grid sales {_t}"


def main():
    """
    Main function
    :return:
    """

    # print(pl.LpStatus[problem.status])
    #
    # print("---- Costs ----")
    # print("Total Cost = £", pl.value(problem.objective))
    # print(
    #     "Total Battery Costs = ",
    #     sum([pl.value(battery_electricity_costs[t]) for t in time_slices]),
    # )
    # print(
    #     "Total Grid Costs = ",
    #     sum([pl.value(grid_electricity_costs[t]) for t in time_slices]),
    # )
    # print(
    #     "Total Renewable Costs = ",
    #     sum([pl.value(renewable_eletricity_costs[t]) for t in time_slices]),
    # )
    #
    # print("---- Energy Flows ----")
    # print(
    #     f"Total Electricity Sent from Battery to Grid = "
    #     f"{sum([pl.value(battery_to_grid_sales[t]) for t in time_slices])} kWh"
    # )
    # print(
    #     f"Total Renewable Generation = "
    #     f"{sum([pl.value(total_renewable_generation[t]) for t in time_slices])} kWh"
    # )
    # print(
    #     f"Total Electricity Sent from Renewables to House = "
    #     f"{sum([pl.value(renewable_electricity_to_house[t]) for t in time_slices])} kWh"
    # )
    # print(
    #     f"Total Electricity Sent from Renewables to Battery = "
    #     f"{sum([pl.value(renewable_electricity_to_battery[t]) for t in time_slices])} kWh"
    # )
    # print(
    #     f"Total Electricity Sent from Battery to House = "
    #     f"{sum([pl.value(battery_electricity_to_house[t]) for t in time_slices])} kWh"
    # )
    # print(
    #     f"Total Electricity Sent from Grid to House = "
    #     f"{sum([pl.value(grid_electricity_to_house[t]) for t in time_slices])} kWh"
    # )
