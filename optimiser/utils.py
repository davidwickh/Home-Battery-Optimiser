"""
Module for utility functions associated with the optimiser.
"""
import logging
import sys


def set_up_logging():
    """
    Function to set up logging.
    :return:
    """
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(levelname)s %(message)s",
        handlers=[logging.StreamHandler(sys.stdout)],
    )
