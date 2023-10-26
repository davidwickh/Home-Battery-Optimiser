"""
Module serves as the entry point for running the optimiser.
"""

from optimiser.utils import set_up_logging
from optimiser.optimisation_problem import Optimiser


def run_optimiser():
    """
    Function that runs the optimiser.

    Sets up logging and calls the
    :return:
    """
    set_up_logging()
    Optimiser.build_optimiser()
