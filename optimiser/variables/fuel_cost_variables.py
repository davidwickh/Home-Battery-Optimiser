"""
Module contains the definition of the fuel cost variables.
"""
# pylint: disable=import-error
import pulp as pl  # type: ignore


class FuelCostVariables:
    """
    Class contains the definition of the fuel cost variables.
    """

    @classmethod
    def get_fuel_costs(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the fuel costs variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="fuel_costs_{t}", indices=time_slices, lowBound=0, cat="Continuous"
        )

    @classmethod
    def get_battery_electricity_costs(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the battery electricity costs variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="battery_electricity_costs_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_grid_electricity_costs(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the grid electricity costs variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="grid_electricity_costs_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_renewable_electricity_costs(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the renewable electricity costs variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="renewable_electricity_costs_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_battery_to_grid_sales(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the battery to grid sales variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="battery_to_grid_sales_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )
