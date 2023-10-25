"""
Module defines the variables used in the battery state of charge optimisation.
"""
# pylint: disable=import-error
import pulp as pl  # type: ignore

from optimiser.constants import OptimiserConstants


class BatteryStateOfChargeVariables:
    """
    Class that defines the variables used in the battery state of charge optimisation.
    """

    @classmethod
    def get_battery_state_of_charge_variables(cls, time_slices: range):
        """
        Method that returns the battery state of charge variables.
        :param time_slices:
        :return:
        """
        return {
            time_slice: pl.LpVariable(
                name=f"battery_state_of_charge_{time_slice}",
                lowBound=0,
                upBound=OptimiserConstants.BATTERY_CAPACITY,
                cat=pl.LpContinuous,
            )
            for time_slice in time_slices
        }

    @classmethod
    def get_battery_degradation_variables(cls, time_slices: range):
        """
        Method that returns the battery degradation variables.
        :param time_slices:
        :return:
        """
        return {
            time_slice: pl.LpVariable(
                name=f"battery_degradation_{time_slice}",
                lowBound=0,
                cat=pl.LpContinuous,
            )
            for time_slice in time_slices
        }
