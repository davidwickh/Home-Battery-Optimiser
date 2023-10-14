import pulp as pl
from aenum import Constant


class OptimisationObjective(Constant):
    MINIMISE_COST = "minimise_cost"


def objective_function(
    model: pl.LpProblem, variables, objective: OptimisationObjective
):
    """
    Objective function for the optimisation problem.

    Parameters
    ----------
    model : pulp.LpProblem
        The optimisation model.
    variables : dict
        Dictionary of variables.
    objective : OptimisationObjective
        The objective function to use.

    Returns
    -------
    None.

    """
    if objective == "minimise_cost":
        model += (
            pl.lpSum([variables["cost"][i] for i in variables["cost"]]),
            "Objective",
        )
    elif objective == "maximise_reliability":
        model += (
            pl.lpSum([variables["reliability"][i] for i in variables["reliability"]]),
            "Objective",
        )
    elif objective == "minimise_cost_reliability":
        model += (
            pl.lpSum([variables["cost"][i] for i in variables["cost"]])
            + pl.lpSum([variables["reliability"][i] for i in variables["reliability"]]),
            "Objective",
        )
    else:
        raise ValueError("Invalid objective function.")
