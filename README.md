# Home-Battery-Optimiser

## Optimisation Model
The optimisation model is a linear program (LP) that minimises the cost of electricity consumption over
a given time horizon based on optimal dispatch of a battery. The model is formulated as follows:


[//]: # (read the optimisation problem)
$$
\begin{aligned}
& \underset{Cost_{t}^{battery} + Cost_{t}^{grid} + Cost_{t}^{renewable} - Sales_{t}^{grid}}{\text{minimise}}
& & \sum_{t=1}^{T} \left(Cost_{t}^{battery} + Cost_{t}^{grid} + Cost_{t}^{renewable} - Sales_{t}^{grid} \right) \\
& \text{subject to}
& & E_{t}^{battery} = E_{t-1}^{battery} + \eta_{t}^{charge} P_{t}^{charge} - \frac{1}{\eta_{t}^{discharge}} P_{t}^{discharge} \\
& & & E_{t}^{battery} \leq E_{t}^{battery, max} \\
& & & E_{t}^{battery} \geq E_{t}^{battery, min} \\
& & & P_{t}^{charge} \leq P_{t}^{charge, max} \\
& & & P_{t}^{discharge} \leq P_{t}^{discharge, max} \\
& & & P_{t}^{charge} \geq P_{t}^{charge, min} \\
& & & P_{t}^{discharge} \geq P_{t}^{discharge, min} \\
& & & \eta_{t}^{charge} \leq \eta_{t}^{charge, max} \\
& & & \eta_{t}^{discharge} \leq \eta_{t}^{discharge, max} \\
& & & \eta_{t}^{charge} \geq \eta_{t}^{charge, min} \\
& & & \eta_{t}^{discharge} \geq \eta_{t}^{discharge, min} \\
& & & \forall t \in \{1, \dots, T\} \\
\end{aligned}

Where $Cost_{t}^{battery}$ is the unit cost of electricity from the battery, $Cost_{t}^{grid}$ is the unit cost of
electricity from the grid, $Cost_{t}^{renewable}$ is the unit cost of electricity from renewable sources,
$Sales_{t}^{grid}$ is the unit revenue from selling electricity to the grid,
