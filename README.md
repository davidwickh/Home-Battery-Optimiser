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
& & & P_{t}^{renewable_to_house} + P_{t}^{battery_to_house} + P_{t}^{grid_to_house} - D_{t}^{house} = 0 & \forall t \in \{1, \dots, T\} \\
& & & P_{t}^{renewable_to_battery} + P_{t}^{grid_to_battery} - P_{t}^{battery_to_grid} = 0 & \forall t \in \{1, \dots, T\} \\
\end{aligned}
$$

Where $Cost_{t}^{battery}$ is the unit cost of electricity from the battery, $Cost_{t}^{grid}$ is the unit cost of
electricity from the grid, $Cost_{t}^{renewable}$ is the unit cost of electricity from renewable sources,
$Sales_{t}^{grid}$ is the unit revenue from selling electricity to the grid,
