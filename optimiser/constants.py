"""
Module for constants used in the optimiser.
"""
# pylint: disable=too-few-public-methods
from aenum import Constant  # pylint: disable=import-error # type: ignore


class OptimiserConstants(Constant):
    """
    Enum for constants used in the optimiser.
    """

    timeslice_size = 0.5  # hours

    # Renewable Generation Constants
    max_renewable_generation = 10  # kWh

    # Battery Constants
    max_battery_discharge_rate = 5  # kW
    max_battery_charge_rate = 5  # kW
    max_battery_cap = 100  # kWh

    # Costs Constants
    unit_price_grid_electricity = 0.3  # £/kWh
    unit_price_battery_electricity = 0  # £/kWh
    unit_price_renewable_electricity = 0  # £/kWh
    unit_price_battery_sale_price = 0.1  # £/kWh
