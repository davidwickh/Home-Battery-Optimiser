"""
Module contains the definition of the electricity flow variables.
"""
# pylint: disable=import-error
import pulp as pl  # type: ignore


class RenewableElectricityFlowVariables:
    """
    Class contains the definition of the renewable electricity flow variables.

    This represents the electricity flow from the renewable energy sources to the house and battery.
    """

    @classmethod
    def get_renewable_electricity_to_house(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the renewable electricity to house variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="renewable_electricity_to_house_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_renewable_electricity_to_battery(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the renewable electricity to battery variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="renewable_electricity_to_battery_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_total_renewable_generation(cls, time_slices: range) -> pl.LpVariable:
        """
        Method that returns the total renewable generation variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="total_renewable_generation_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )


class BatteryElectricityFlowVariables:
    """
    Class contains the definition of the battery electricity flow variables.

    This represents the electricity flow from the battery to the house and grid.
    """

    @classmethod
    def get_battery_electricity_to_house(cls, time_slices: float) -> pl.LpVariable:
        """
        Method that returns the battery electricity to house variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="battery_electricity_to_house_{time_slices}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_battery_electricity_to_grid(cls, time_slices: float) -> pl.LpVariable:
        """
        Method that returns the battery electricity to grid variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="battery_electricity_to_grid_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_electricity_to_battery(cls, time_slices: float) -> pl.LpVariable:
        """
        Method that returns the electricity to battery variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="electricity_to_battery_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )


class GridElectricityFlowVariables:
    """
    Class contains the definition of the grid electricity flow variables.

    This represents the electricity flow from the grid to the house and battery.
    """

    @classmethod
    def get_grid_electricity_to_house(cls, time_slices: float) -> pl.LpVariable:
        """
        Method that returns the grid electricity to house variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="grid_electricity_to_house_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )

    @classmethod
    def get_grid_electricity_to_battery(cls, time_slices: float) -> pl.LpVariable:
        """
        Method that returns the grid electricity to battery variable.
        :param time_slices:
        :return:
        """
        return pl.LpVariable.dicts(
            name="grid_electricity_to_battery_{t}",
            indices=time_slices,
            lowBound=0,
            cat="Continuous",
        )
