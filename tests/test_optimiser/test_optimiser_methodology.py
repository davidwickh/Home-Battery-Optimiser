"""
Module to test the optimiser methodology. This may change if the optimiser itself changes.
"""
from pathlib import Path

from optimiser.optimisation_problem import main
from tests.test_optimiser.conftest import OPTIMISER_TESTS_RESOURCES_DIR

OPTIMISATION_MODEL_NAME = "BatteryOptimisation.lp"
ROOT_DIR = Path(__file__).parent.parent.parent


def test_optimiser_methodology():
    """
    When optimiser is run, the following should happen:
    1. A new .lp file is created in the optimiser directory
    2. This new .lp file should be the same as the .lp file in the tests directory
    3. The optimiser should return a solution
    :return:
    """
    main()
    with open(
        f"{ROOT_DIR}/{OPTIMISER_TESTS_RESOURCES_DIR}/{OPTIMISATION_MODEL_NAME}",
        "r",
        encoding="utf-8",
    ) as test_lp_file:
        test_lp_file_contents = test_lp_file.read()
    with open(f"{OPTIMISATION_MODEL_NAME}", "r", encoding="utf-8") as optimiser_lp_file:
        optimiser_lp_file_contents = optimiser_lp_file.read()
    assert test_lp_file_contents == optimiser_lp_file_contents
