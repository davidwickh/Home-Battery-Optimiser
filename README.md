# Home-Battery-Optimiser

## Optimisation Model
The optimisation model is a linear program (LP) that minimises the cost of electricity consumption over
a given time horizon based on optimal dispatch of a battery. The model is formulated as follows:

$$ \begin{aligned} & \underset{P_{b,t}^{+}, P_{b,t}^{-}, P_{g,t}, P_{l,t}}{\text{minimise}}
& & \sum_{t=1}^{T} \left( c_{b,t}^{+} P_{b,t}^{+} + c_{b,t}^{-} P_{b,t}^{-} + c_{g,t} P_{g,t} + c_{l,t} P_{l,t} \right) \\
& \text{subject to}
& & P_{b,t}^{+} - P_{b,t}^{-} = P_{g,t} - P_{l,t} & \forall t \in \{1, \dots, T\} \\
& & & P_{b,t}^{+} \leq P_{b,t}^{+,\text{max}} & \forall t \in \{1, \dots, T\} \\
& & & P_{b,t}^{-} \leq P_{b,t}^{-,\text{max}} & \forall t \in \{1, \dots, T\} \\
& & & P_{g,t} \leq P_{g,t}^{\text{max}} & \forall t \in \{1, \dots, T\} \\
& & & P_{l,t} \leq P_{l,t}^{\text{max}} & \forall t \in \{1, \dots, T\} \\
& & & P_{b,t}^{+}, P_{b,t}^{-}, P_{g,t}, P_{l,t} \geq 0 & \forall t \in \{1, \dots, T\}
\end{aligned}$$

where $P_{b,t}^{+}$ and $P_{b,t}^{-}$ are the charging and discharging power of the battery at time $t$,
$P_{g,t}$ and $P_{l,t}$ are the power consumption from the grid and the power consumption from the load at time $t$,
$c_{b,t}^{+}$ and $c_{b,t}^{-}$ are the charging and discharging cost of the battery at time $t$,
$c_{g,t}$ and $c_{l,t}$ are the cost of electricity from the grid and the cost of electricity from the load at time $t$,
$P_{b,t}^{+,\text{max}}$ and $P_{b,t}^{-,\text{max}}$ are the maximum charging and discharging power of the battery at time $t$,
$P_{g,t}^{\text{max}}$ and $P_{l,t}^{\text{max}}$ are the maximum power consumption from the grid and the maximum power consumption from the load at time $t$,
and $T$ is the number of time steps in the time horizon.
