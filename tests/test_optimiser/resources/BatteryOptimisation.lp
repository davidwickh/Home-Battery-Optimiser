\* BatteryOptimisation *\
Minimize
Objective___minimise_fuel_costs: battery_electricity_costs_{t}_1
 + battery_electricity_costs_{t}_10 + battery_electricity_costs_{t}_11
 + battery_electricity_costs_{t}_12 + battery_electricity_costs_{t}_13
 + battery_electricity_costs_{t}_14 + battery_electricity_costs_{t}_15
 + battery_electricity_costs_{t}_16 + battery_electricity_costs_{t}_17
 + battery_electricity_costs_{t}_18 + battery_electricity_costs_{t}_19
 + battery_electricity_costs_{t}_2 + battery_electricity_costs_{t}_20
 + battery_electricity_costs_{t}_21 + battery_electricity_costs_{t}_22
 + battery_electricity_costs_{t}_23 + battery_electricity_costs_{t}_24
 + battery_electricity_costs_{t}_3 + battery_electricity_costs_{t}_4
 + battery_electricity_costs_{t}_5 + battery_electricity_costs_{t}_6
 + battery_electricity_costs_{t}_7 + battery_electricity_costs_{t}_8
 + battery_electricity_costs_{t}_9 + grid_electricity_costs_{t}_1
 + grid_electricity_costs_{t}_10 + grid_electricity_costs_{t}_11
 + grid_electricity_costs_{t}_12 + grid_electricity_costs_{t}_13
 + grid_electricity_costs_{t}_14 + grid_electricity_costs_{t}_15
 + grid_electricity_costs_{t}_16 + grid_electricity_costs_{t}_17
 + grid_electricity_costs_{t}_18 + grid_electricity_costs_{t}_19
 + grid_electricity_costs_{t}_2 + grid_electricity_costs_{t}_20
 + grid_electricity_costs_{t}_21 + grid_electricity_costs_{t}_22
 + grid_electricity_costs_{t}_23 + grid_electricity_costs_{t}_24
 + grid_electricity_costs_{t}_3 + grid_electricity_costs_{t}_4
 + grid_electricity_costs_{t}_5 + grid_electricity_costs_{t}_6
 + grid_electricity_costs_{t}_7 + grid_electricity_costs_{t}_8
 + grid_electricity_costs_{t}_9 + renewable_eletricity_costs_{t}_1
 + renewable_eletricity_costs_{t}_10 + renewable_eletricity_costs_{t}_11
 + renewable_eletricity_costs_{t}_12 + renewable_eletricity_costs_{t}_13
 + renewable_eletricity_costs_{t}_14 + renewable_eletricity_costs_{t}_15
 + renewable_eletricity_costs_{t}_16 + renewable_eletricity_costs_{t}_17
 + renewable_eletricity_costs_{t}_18 + renewable_eletricity_costs_{t}_19
 + renewable_eletricity_costs_{t}_2 + renewable_eletricity_costs_{t}_20
 + renewable_eletricity_costs_{t}_21 + renewable_eletricity_costs_{t}_22
 + renewable_eletricity_costs_{t}_23 + renewable_eletricity_costs_{t}_24
 + renewable_eletricity_costs_{t}_3 + renewable_eletricity_costs_{t}_4
 + renewable_eletricity_costs_{t}_5 + renewable_eletricity_costs_{t}_6
 + renewable_eletricity_costs_{t}_7 + renewable_eletricity_costs_{t}_8
 + renewable_eletricity_costs_{t}_9
Subject To
Battery_capacity_1: battery_state_of_charge_{t}_1 <= 100
Battery_capacity_10: battery_state_of_charge_{t}_10 <= 100
Battery_capacity_11: battery_state_of_charge_{t}_11 <= 100
Battery_capacity_12: battery_state_of_charge_{t}_12 <= 100
Battery_capacity_13: battery_state_of_charge_{t}_13 <= 100
Battery_capacity_14: battery_state_of_charge_{t}_14 <= 100
Battery_capacity_15: battery_state_of_charge_{t}_15 <= 100
Battery_capacity_16: battery_state_of_charge_{t}_16 <= 100
Battery_capacity_17: battery_state_of_charge_{t}_17 <= 100
Battery_capacity_18: battery_state_of_charge_{t}_18 <= 100
Battery_capacity_19: battery_state_of_charge_{t}_19 <= 100
Battery_capacity_2: battery_state_of_charge_{t}_2 <= 100
Battery_capacity_20: battery_state_of_charge_{t}_20 <= 100
Battery_capacity_21: battery_state_of_charge_{t}_21 <= 100
Battery_capacity_22: battery_state_of_charge_{t}_22 <= 100
Battery_capacity_23: battery_state_of_charge_{t}_23 <= 100
Battery_capacity_24: battery_state_of_charge_{t}_24 <= 100
Battery_capacity_3: battery_state_of_charge_{t}_3 <= 100
Battery_capacity_4: battery_state_of_charge_{t}_4 <= 100
Battery_capacity_5: battery_state_of_charge_{t}_5 <= 100
Battery_capacity_6: battery_state_of_charge_{t}_6 <= 100
Battery_capacity_7: battery_state_of_charge_{t}_7 <= 100
Battery_capacity_8: battery_state_of_charge_{t}_8 <= 100
Battery_capacity_9: battery_state_of_charge_{t}_9 <= 100
Battery_charge_rate_1: electricity_to_battery_{t}_1 <= 2.5
Battery_charge_rate_10: electricity_to_battery_{t}_10 <= 2.5
Battery_charge_rate_11: electricity_to_battery_{t}_11 <= 2.5
Battery_charge_rate_12: electricity_to_battery_{t}_12 <= 2.5
Battery_charge_rate_13: electricity_to_battery_{t}_13 <= 2.5
Battery_charge_rate_14: electricity_to_battery_{t}_14 <= 2.5
Battery_charge_rate_15: electricity_to_battery_{t}_15 <= 2.5
Battery_charge_rate_16: electricity_to_battery_{t}_16 <= 2.5
Battery_charge_rate_17: electricity_to_battery_{t}_17 <= 2.5
Battery_charge_rate_18: electricity_to_battery_{t}_18 <= 2.5
Battery_charge_rate_19: electricity_to_battery_{t}_19 <= 2.5
Battery_charge_rate_2: electricity_to_battery_{t}_2 <= 2.5
Battery_charge_rate_20: electricity_to_battery_{t}_20 <= 2.5
Battery_charge_rate_21: electricity_to_battery_{t}_21 <= 2.5
Battery_charge_rate_22: electricity_to_battery_{t}_22 <= 2.5
Battery_charge_rate_23: electricity_to_battery_{t}_23 <= 2.5
Battery_charge_rate_24: electricity_to_battery_{t}_24 <= 2.5
Battery_charge_rate_3: electricity_to_battery_{t}_3 <= 2.5
Battery_charge_rate_4: electricity_to_battery_{t}_4 <= 2.5
Battery_charge_rate_5: electricity_to_battery_{t}_5 <= 2.5
Battery_charge_rate_6: electricity_to_battery_{t}_6 <= 2.5
Battery_charge_rate_7: electricity_to_battery_{t}_7 <= 2.5
Battery_charge_rate_8: electricity_to_battery_{t}_8 <= 2.5
Battery_charge_rate_9: electricity_to_battery_{t}_9 <= 2.5
Battery_discharge_rate_1: battery_electricity_to_grid_{t}_1
 + battery_electricity_to_house_{time_slices}_1 <= 2.5
Battery_discharge_rate_10: battery_electricity_to_grid_{t}_10
 + battery_electricity_to_house_{time_slices}_10 <= 2.5
Battery_discharge_rate_11: battery_electricity_to_grid_{t}_11
 + battery_electricity_to_house_{time_slices}_11 <= 2.5
Battery_discharge_rate_12: battery_electricity_to_grid_{t}_12
 + battery_electricity_to_house_{time_slices}_12 <= 2.5
Battery_discharge_rate_13: battery_electricity_to_grid_{t}_13
 + battery_electricity_to_house_{time_slices}_13 <= 2.5
Battery_discharge_rate_14: battery_electricity_to_grid_{t}_14
 + battery_electricity_to_house_{time_slices}_14 <= 2.5
Battery_discharge_rate_15: battery_electricity_to_grid_{t}_15
 + battery_electricity_to_house_{time_slices}_15 <= 2.5
Battery_discharge_rate_16: battery_electricity_to_grid_{t}_16
 + battery_electricity_to_house_{time_slices}_16 <= 2.5
Battery_discharge_rate_17: battery_electricity_to_grid_{t}_17
 + battery_electricity_to_house_{time_slices}_17 <= 2.5
Battery_discharge_rate_18: battery_electricity_to_grid_{t}_18
 + battery_electricity_to_house_{time_slices}_18 <= 2.5
Battery_discharge_rate_19: battery_electricity_to_grid_{t}_19
 + battery_electricity_to_house_{time_slices}_19 <= 2.5
Battery_discharge_rate_2: battery_electricity_to_grid_{t}_2
 + battery_electricity_to_house_{time_slices}_2 <= 2.5
Battery_discharge_rate_20: battery_electricity_to_grid_{t}_20
 + battery_electricity_to_house_{time_slices}_20 <= 2.5
Battery_discharge_rate_21: battery_electricity_to_grid_{t}_21
 + battery_electricity_to_house_{time_slices}_21 <= 2.5
Battery_discharge_rate_22: battery_electricity_to_grid_{t}_22
 + battery_electricity_to_house_{time_slices}_22 <= 2.5
Battery_discharge_rate_23: battery_electricity_to_grid_{t}_23
 + battery_electricity_to_house_{time_slices}_23 <= 2.5
Battery_discharge_rate_24: battery_electricity_to_grid_{t}_24
 + battery_electricity_to_house_{time_slices}_24 <= 2.5
Battery_discharge_rate_3: battery_electricity_to_grid_{t}_3
 + battery_electricity_to_house_{time_slices}_3 <= 2.5
Battery_discharge_rate_4: battery_electricity_to_grid_{t}_4
 + battery_electricity_to_house_{time_slices}_4 <= 2.5
Battery_discharge_rate_5: battery_electricity_to_grid_{t}_5
 + battery_electricity_to_house_{time_slices}_5 <= 2.5
Battery_discharge_rate_6: battery_electricity_to_grid_{t}_6
 + battery_electricity_to_house_{time_slices}_6 <= 2.5
Battery_discharge_rate_7: battery_electricity_to_grid_{t}_7
 + battery_electricity_to_house_{time_slices}_7 <= 2.5
Battery_discharge_rate_8: battery_electricity_to_grid_{t}_8
 + battery_electricity_to_house_{time_slices}_8 <= 2.5
Battery_discharge_rate_9: battery_electricity_to_grid_{t}_9
 + battery_electricity_to_house_{time_slices}_9 <= 2.5
Battery_electricity_costs_1: - battery_electricity_costs_{t}_1 = 0
Battery_electricity_costs_10: - battery_electricity_costs_{t}_10 = 0
Battery_electricity_costs_11: - battery_electricity_costs_{t}_11 = 0
Battery_electricity_costs_12: - battery_electricity_costs_{t}_12 = 0
Battery_electricity_costs_13: - battery_electricity_costs_{t}_13 = 0
Battery_electricity_costs_14: - battery_electricity_costs_{t}_14 = 0
Battery_electricity_costs_15: - battery_electricity_costs_{t}_15 = 0
Battery_electricity_costs_16: - battery_electricity_costs_{t}_16 = 0
Battery_electricity_costs_17: - battery_electricity_costs_{t}_17 = 0
Battery_electricity_costs_18: - battery_electricity_costs_{t}_18 = 0
Battery_electricity_costs_19: - battery_electricity_costs_{t}_19 = 0
Battery_electricity_costs_2: - battery_electricity_costs_{t}_2 = 0
Battery_electricity_costs_20: - battery_electricity_costs_{t}_20 = 0
Battery_electricity_costs_21: - battery_electricity_costs_{t}_21 = 0
Battery_electricity_costs_22: - battery_electricity_costs_{t}_22 = 0
Battery_electricity_costs_23: - battery_electricity_costs_{t}_23 = 0
Battery_electricity_costs_24: - battery_electricity_costs_{t}_24 = 0
Battery_electricity_costs_3: - battery_electricity_costs_{t}_3 = 0
Battery_electricity_costs_4: - battery_electricity_costs_{t}_4 = 0
Battery_electricity_costs_5: - battery_electricity_costs_{t}_5 = 0
Battery_electricity_costs_6: - battery_electricity_costs_{t}_6 = 0
Battery_electricity_costs_7: - battery_electricity_costs_{t}_7 = 0
Battery_electricity_costs_8: - battery_electricity_costs_{t}_8 = 0
Battery_electricity_costs_9: - battery_electricity_costs_{t}_9 = 0
Battery_minimum_state_of_charge_1: battery_state_of_charge_{t}_1 >= 0
Battery_minimum_state_of_charge_10: battery_state_of_charge_{t}_10 >= 0
Battery_minimum_state_of_charge_11: battery_state_of_charge_{t}_11 >= 0
Battery_minimum_state_of_charge_12: battery_state_of_charge_{t}_12 >= 0
Battery_minimum_state_of_charge_13: battery_state_of_charge_{t}_13 >= 0
Battery_minimum_state_of_charge_14: battery_state_of_charge_{t}_14 >= 0
Battery_minimum_state_of_charge_15: battery_state_of_charge_{t}_15 >= 0
Battery_minimum_state_of_charge_16: battery_state_of_charge_{t}_16 >= 0
Battery_minimum_state_of_charge_17: battery_state_of_charge_{t}_17 >= 0
Battery_minimum_state_of_charge_18: battery_state_of_charge_{t}_18 >= 0
Battery_minimum_state_of_charge_19: battery_state_of_charge_{t}_19 >= 0
Battery_minimum_state_of_charge_2: battery_state_of_charge_{t}_2 >= 0
Battery_minimum_state_of_charge_20: battery_state_of_charge_{t}_20 >= 0
Battery_minimum_state_of_charge_21: battery_state_of_charge_{t}_21 >= 0
Battery_minimum_state_of_charge_22: battery_state_of_charge_{t}_22 >= 0
Battery_minimum_state_of_charge_23: battery_state_of_charge_{t}_23 >= 0
Battery_minimum_state_of_charge_24: battery_state_of_charge_{t}_24 >= 0
Battery_minimum_state_of_charge_3: battery_state_of_charge_{t}_3 >= 0
Battery_minimum_state_of_charge_4: battery_state_of_charge_{t}_4 >= 0
Battery_minimum_state_of_charge_5: battery_state_of_charge_{t}_5 >= 0
Battery_minimum_state_of_charge_6: battery_state_of_charge_{t}_6 >= 0
Battery_minimum_state_of_charge_7: battery_state_of_charge_{t}_7 >= 0
Battery_minimum_state_of_charge_8: battery_state_of_charge_{t}_8 >= 0
Battery_minimum_state_of_charge_9: battery_state_of_charge_{t}_9 >= 0
Battery_state_of_charge_1: battery_state_of_charge_{t}_1 = 0
Battery_state_of_charge_10: - battery_degradation_{t}_10
 - battery_electricity_to_grid_{t}_10
 - battery_electricity_to_house_{time_slices}_10
 - battery_state_of_charge_{t}_10 + battery_state_of_charge_{t}_9
 + electricity_to_battery_{t}_10 = 0
Battery_state_of_charge_11: - battery_degradation_{t}_11
 - battery_electricity_to_grid_{t}_11
 - battery_electricity_to_house_{time_slices}_11
 + battery_state_of_charge_{t}_10 - battery_state_of_charge_{t}_11
 + electricity_to_battery_{t}_11 = 0
Battery_state_of_charge_12: - battery_degradation_{t}_12
 - battery_electricity_to_grid_{t}_12
 - battery_electricity_to_house_{time_slices}_12
 + battery_state_of_charge_{t}_11 - battery_state_of_charge_{t}_12
 + electricity_to_battery_{t}_12 = 0
Battery_state_of_charge_13: - battery_degradation_{t}_13
 - battery_electricity_to_grid_{t}_13
 - battery_electricity_to_house_{time_slices}_13
 + battery_state_of_charge_{t}_12 - battery_state_of_charge_{t}_13
 + electricity_to_battery_{t}_13 = 0
Battery_state_of_charge_14: - battery_degradation_{t}_14
 - battery_electricity_to_grid_{t}_14
 - battery_electricity_to_house_{time_slices}_14
 + battery_state_of_charge_{t}_13 - battery_state_of_charge_{t}_14
 + electricity_to_battery_{t}_14 = 0
Battery_state_of_charge_15: - battery_degradation_{t}_15
 - battery_electricity_to_grid_{t}_15
 - battery_electricity_to_house_{time_slices}_15
 + battery_state_of_charge_{t}_14 - battery_state_of_charge_{t}_15
 + electricity_to_battery_{t}_15 = 0
Battery_state_of_charge_16: - battery_degradation_{t}_16
 - battery_electricity_to_grid_{t}_16
 - battery_electricity_to_house_{time_slices}_16
 + battery_state_of_charge_{t}_15 - battery_state_of_charge_{t}_16
 + electricity_to_battery_{t}_16 = 0
Battery_state_of_charge_17: - battery_degradation_{t}_17
 - battery_electricity_to_grid_{t}_17
 - battery_electricity_to_house_{time_slices}_17
 + battery_state_of_charge_{t}_16 - battery_state_of_charge_{t}_17
 + electricity_to_battery_{t}_17 = 0
Battery_state_of_charge_18: - battery_degradation_{t}_18
 - battery_electricity_to_grid_{t}_18
 - battery_electricity_to_house_{time_slices}_18
 + battery_state_of_charge_{t}_17 - battery_state_of_charge_{t}_18
 + electricity_to_battery_{t}_18 = 0
Battery_state_of_charge_19: - battery_degradation_{t}_19
 - battery_electricity_to_grid_{t}_19
 - battery_electricity_to_house_{time_slices}_19
 + battery_state_of_charge_{t}_18 - battery_state_of_charge_{t}_19
 + electricity_to_battery_{t}_19 = 0
Battery_state_of_charge_2: - battery_degradation_{t}_2
 - battery_electricity_to_grid_{t}_2
 - battery_electricity_to_house_{time_slices}_2
 + battery_state_of_charge_{t}_1 - battery_state_of_charge_{t}_2
 + electricity_to_battery_{t}_2 = 0
Battery_state_of_charge_20: - battery_degradation_{t}_20
 - battery_electricity_to_grid_{t}_20
 - battery_electricity_to_house_{time_slices}_20
 + battery_state_of_charge_{t}_19 - battery_state_of_charge_{t}_20
 + electricity_to_battery_{t}_20 = 0
Battery_state_of_charge_21: - battery_degradation_{t}_21
 - battery_electricity_to_grid_{t}_21
 - battery_electricity_to_house_{time_slices}_21
 + battery_state_of_charge_{t}_20 - battery_state_of_charge_{t}_21
 + electricity_to_battery_{t}_21 = 0
Battery_state_of_charge_22: - battery_degradation_{t}_22
 - battery_electricity_to_grid_{t}_22
 - battery_electricity_to_house_{time_slices}_22
 + battery_state_of_charge_{t}_21 - battery_state_of_charge_{t}_22
 + electricity_to_battery_{t}_22 = 0
Battery_state_of_charge_23: - battery_degradation_{t}_23
 - battery_electricity_to_grid_{t}_23
 - battery_electricity_to_house_{time_slices}_23
 + battery_state_of_charge_{t}_22 - battery_state_of_charge_{t}_23
 + electricity_to_battery_{t}_23 = 0
Battery_state_of_charge_24: - battery_degradation_{t}_24
 - battery_electricity_to_grid_{t}_24
 - battery_electricity_to_house_{time_slices}_24
 + battery_state_of_charge_{t}_23 - battery_state_of_charge_{t}_24
 + electricity_to_battery_{t}_24 = 0
Battery_state_of_charge_3: - battery_degradation_{t}_3
 - battery_electricity_to_grid_{t}_3
 - battery_electricity_to_house_{time_slices}_3
 + battery_state_of_charge_{t}_2 - battery_state_of_charge_{t}_3
 + electricity_to_battery_{t}_3 = 0
Battery_state_of_charge_4: - battery_degradation_{t}_4
 - battery_electricity_to_grid_{t}_4
 - battery_electricity_to_house_{time_slices}_4
 + battery_state_of_charge_{t}_3 - battery_state_of_charge_{t}_4
 + electricity_to_battery_{t}_4 = 0
Battery_state_of_charge_5: - battery_degradation_{t}_5
 - battery_electricity_to_grid_{t}_5
 - battery_electricity_to_house_{time_slices}_5
 + battery_state_of_charge_{t}_4 - battery_state_of_charge_{t}_5
 + electricity_to_battery_{t}_5 = 0
Battery_state_of_charge_6: - battery_degradation_{t}_6
 - battery_electricity_to_grid_{t}_6
 - battery_electricity_to_house_{time_slices}_6
 + battery_state_of_charge_{t}_5 - battery_state_of_charge_{t}_6
 + electricity_to_battery_{t}_6 = 0
Battery_state_of_charge_7: - battery_degradation_{t}_7
 - battery_electricity_to_grid_{t}_7
 - battery_electricity_to_house_{time_slices}_7
 + battery_state_of_charge_{t}_6 - battery_state_of_charge_{t}_7
 + electricity_to_battery_{t}_7 = 0
Battery_state_of_charge_8: - battery_degradation_{t}_8
 - battery_electricity_to_grid_{t}_8
 - battery_electricity_to_house_{time_slices}_8
 + battery_state_of_charge_{t}_7 - battery_state_of_charge_{t}_8
 + electricity_to_battery_{t}_8 = 0
Battery_state_of_charge_9: - battery_degradation_{t}_9
 - battery_electricity_to_grid_{t}_9
 - battery_electricity_to_house_{time_slices}_9
 + battery_state_of_charge_{t}_8 - battery_state_of_charge_{t}_9
 + electricity_to_battery_{t}_9 = 0
Battery_to_grid_sales_1: - 0.9 battery_to_grid_sales_{t}_1 = 0
Battery_to_grid_sales_10: - 0.9 battery_to_grid_sales_{t}_10 = 0
Battery_to_grid_sales_11: - 0.9 battery_to_grid_sales_{t}_11 = 0
Battery_to_grid_sales_12: - 0.9 battery_to_grid_sales_{t}_12 = 0
Battery_to_grid_sales_13: - 0.9 battery_to_grid_sales_{t}_13 = 0
Battery_to_grid_sales_14: - 0.9 battery_to_grid_sales_{t}_14 = 0
Battery_to_grid_sales_15: - 0.9 battery_to_grid_sales_{t}_15 = 0
Battery_to_grid_sales_16: - 0.9 battery_to_grid_sales_{t}_16 = 0
Battery_to_grid_sales_17: - 0.9 battery_to_grid_sales_{t}_17 = 0
Battery_to_grid_sales_18: - 0.9 battery_to_grid_sales_{t}_18 = 0
Battery_to_grid_sales_19: - 0.9 battery_to_grid_sales_{t}_19 = 0
Battery_to_grid_sales_2: - 0.9 battery_to_grid_sales_{t}_2 = 0
Battery_to_grid_sales_20: - 0.9 battery_to_grid_sales_{t}_20 = 0
Battery_to_grid_sales_21: - 0.9 battery_to_grid_sales_{t}_21 = 0
Battery_to_grid_sales_22: - 0.9 battery_to_grid_sales_{t}_22 = 0
Battery_to_grid_sales_23: - 0.9 battery_to_grid_sales_{t}_23 = 0
Battery_to_grid_sales_24: - 0.9 battery_to_grid_sales_{t}_24 = 0
Battery_to_grid_sales_3: - 0.9 battery_to_grid_sales_{t}_3 = 0
Battery_to_grid_sales_4: - 0.9 battery_to_grid_sales_{t}_4 = 0
Battery_to_grid_sales_5: - 0.9 battery_to_grid_sales_{t}_5 = 0
Battery_to_grid_sales_6: - 0.9 battery_to_grid_sales_{t}_6 = 0
Battery_to_grid_sales_7: - 0.9 battery_to_grid_sales_{t}_7 = 0
Battery_to_grid_sales_8: - 0.9 battery_to_grid_sales_{t}_8 = 0
Battery_to_grid_sales_9: - 0.9 battery_to_grid_sales_{t}_9 = 0
Demand_1: battery_electricity_to_house_{time_slices}_1
 + grid_electricity_to_house_{t}_1 + renewable_electricity_to_house_{t}_1
 = 100
Demand_10: battery_electricity_to_house_{time_slices}_10
 + grid_electricity_to_house_{t}_10 + renewable_electricity_to_house_{t}_10
 = 100
Demand_11: battery_electricity_to_house_{time_slices}_11
 + grid_electricity_to_house_{t}_11 + renewable_electricity_to_house_{t}_11
 = 100
Demand_12: battery_electricity_to_house_{time_slices}_12
 + grid_electricity_to_house_{t}_12 + renewable_electricity_to_house_{t}_12
 = 100
Demand_13: battery_electricity_to_house_{time_slices}_13
 + grid_electricity_to_house_{t}_13 + renewable_electricity_to_house_{t}_13
 = 100
Demand_14: battery_electricity_to_house_{time_slices}_14
 + grid_electricity_to_house_{t}_14 + renewable_electricity_to_house_{t}_14
 = 100
Demand_15: battery_electricity_to_house_{time_slices}_15
 + grid_electricity_to_house_{t}_15 + renewable_electricity_to_house_{t}_15
 = 100
Demand_16: battery_electricity_to_house_{time_slices}_16
 + grid_electricity_to_house_{t}_16 + renewable_electricity_to_house_{t}_16
 = 100
Demand_17: battery_electricity_to_house_{time_slices}_17
 + grid_electricity_to_house_{t}_17 + renewable_electricity_to_house_{t}_17
 = 100
Demand_18: battery_electricity_to_house_{time_slices}_18
 + grid_electricity_to_house_{t}_18 + renewable_electricity_to_house_{t}_18
 = 100
Demand_19: battery_electricity_to_house_{time_slices}_19
 + grid_electricity_to_house_{t}_19 + renewable_electricity_to_house_{t}_19
 = 100
Demand_2: battery_electricity_to_house_{time_slices}_2
 + grid_electricity_to_house_{t}_2 + renewable_electricity_to_house_{t}_2
 = 100
Demand_20: battery_electricity_to_house_{time_slices}_20
 + grid_electricity_to_house_{t}_20 + renewable_electricity_to_house_{t}_20
 = 100
Demand_21: battery_electricity_to_house_{time_slices}_21
 + grid_electricity_to_house_{t}_21 + renewable_electricity_to_house_{t}_21
 = 100
Demand_22: battery_electricity_to_house_{time_slices}_22
 + grid_electricity_to_house_{t}_22 + renewable_electricity_to_house_{t}_22
 = 100
Demand_23: battery_electricity_to_house_{time_slices}_23
 + grid_electricity_to_house_{t}_23 + renewable_electricity_to_house_{t}_23
 = 100
Demand_24: battery_electricity_to_house_{time_slices}_24
 + grid_electricity_to_house_{t}_24 + renewable_electricity_to_house_{t}_24
 = 100
Demand_3: battery_electricity_to_house_{time_slices}_3
 + grid_electricity_to_house_{t}_3 + renewable_electricity_to_house_{t}_3
 = 100
Demand_4: battery_electricity_to_house_{time_slices}_4
 + grid_electricity_to_house_{t}_4 + renewable_electricity_to_house_{t}_4
 = 100
Demand_5: battery_electricity_to_house_{time_slices}_5
 + grid_electricity_to_house_{t}_5 + renewable_electricity_to_house_{t}_5
 = 100
Demand_6: battery_electricity_to_house_{time_slices}_6
 + grid_electricity_to_house_{t}_6 + renewable_electricity_to_house_{t}_6
 = 100
Demand_7: battery_electricity_to_house_{time_slices}_7
 + grid_electricity_to_house_{t}_7 + renewable_electricity_to_house_{t}_7
 = 100
Demand_8: battery_electricity_to_house_{time_slices}_8
 + grid_electricity_to_house_{t}_8 + renewable_electricity_to_house_{t}_8
 = 100
Demand_9: battery_electricity_to_house_{time_slices}_9
 + grid_electricity_to_house_{t}_9 + renewable_electricity_to_house_{t}_9
 = 100
Electricity_flow_constraint_1: - battery_electricity_to_grid_{t}_1
 - electricity_to_battery_{t}_1 + grid_electricity_to_battery_{t}_1
 + renewable_electricity_to_battery_{t}_1 = 0
Electricity_flow_constraint_10: - battery_electricity_to_grid_{t}_10
 - electricity_to_battery_{t}_10 + grid_electricity_to_battery_{t}_10
 + renewable_electricity_to_battery_{t}_10 = 0
Electricity_flow_constraint_11: - battery_electricity_to_grid_{t}_11
 - electricity_to_battery_{t}_11 + grid_electricity_to_battery_{t}_11
 + renewable_electricity_to_battery_{t}_11 = 0
Electricity_flow_constraint_12: - battery_electricity_to_grid_{t}_12
 - electricity_to_battery_{t}_12 + grid_electricity_to_battery_{t}_12
 + renewable_electricity_to_battery_{t}_12 = 0
Electricity_flow_constraint_13: - battery_electricity_to_grid_{t}_13
 - electricity_to_battery_{t}_13 + grid_electricity_to_battery_{t}_13
 + renewable_electricity_to_battery_{t}_13 = 0
Electricity_flow_constraint_14: - battery_electricity_to_grid_{t}_14
 - electricity_to_battery_{t}_14 + grid_electricity_to_battery_{t}_14
 + renewable_electricity_to_battery_{t}_14 = 0
Electricity_flow_constraint_15: - battery_electricity_to_grid_{t}_15
 - electricity_to_battery_{t}_15 + grid_electricity_to_battery_{t}_15
 + renewable_electricity_to_battery_{t}_15 = 0
Electricity_flow_constraint_16: - battery_electricity_to_grid_{t}_16
 - electricity_to_battery_{t}_16 + grid_electricity_to_battery_{t}_16
 + renewable_electricity_to_battery_{t}_16 = 0
Electricity_flow_constraint_17: - battery_electricity_to_grid_{t}_17
 - electricity_to_battery_{t}_17 + grid_electricity_to_battery_{t}_17
 + renewable_electricity_to_battery_{t}_17 = 0
Electricity_flow_constraint_18: - battery_electricity_to_grid_{t}_18
 - electricity_to_battery_{t}_18 + grid_electricity_to_battery_{t}_18
 + renewable_electricity_to_battery_{t}_18 = 0
Electricity_flow_constraint_19: - battery_electricity_to_grid_{t}_19
 - electricity_to_battery_{t}_19 + grid_electricity_to_battery_{t}_19
 + renewable_electricity_to_battery_{t}_19 = 0
Electricity_flow_constraint_2: - battery_electricity_to_grid_{t}_2
 - electricity_to_battery_{t}_2 + grid_electricity_to_battery_{t}_2
 + renewable_electricity_to_battery_{t}_2 = 0
Electricity_flow_constraint_20: - battery_electricity_to_grid_{t}_20
 - electricity_to_battery_{t}_20 + grid_electricity_to_battery_{t}_20
 + renewable_electricity_to_battery_{t}_20 = 0
Electricity_flow_constraint_21: - battery_electricity_to_grid_{t}_21
 - electricity_to_battery_{t}_21 + grid_electricity_to_battery_{t}_21
 + renewable_electricity_to_battery_{t}_21 = 0
Electricity_flow_constraint_22: - battery_electricity_to_grid_{t}_22
 - electricity_to_battery_{t}_22 + grid_electricity_to_battery_{t}_22
 + renewable_electricity_to_battery_{t}_22 = 0
Electricity_flow_constraint_23: - battery_electricity_to_grid_{t}_23
 - electricity_to_battery_{t}_23 + grid_electricity_to_battery_{t}_23
 + renewable_electricity_to_battery_{t}_23 = 0
Electricity_flow_constraint_24: - battery_electricity_to_grid_{t}_24
 - electricity_to_battery_{t}_24 + grid_electricity_to_battery_{t}_24
 + renewable_electricity_to_battery_{t}_24 = 0
Electricity_flow_constraint_3: - battery_electricity_to_grid_{t}_3
 - electricity_to_battery_{t}_3 + grid_electricity_to_battery_{t}_3
 + renewable_electricity_to_battery_{t}_3 = 0
Electricity_flow_constraint_4: - battery_electricity_to_grid_{t}_4
 - electricity_to_battery_{t}_4 + grid_electricity_to_battery_{t}_4
 + renewable_electricity_to_battery_{t}_4 = 0
Electricity_flow_constraint_5: - battery_electricity_to_grid_{t}_5
 - electricity_to_battery_{t}_5 + grid_electricity_to_battery_{t}_5
 + renewable_electricity_to_battery_{t}_5 = 0
Electricity_flow_constraint_6: - battery_electricity_to_grid_{t}_6
 - electricity_to_battery_{t}_6 + grid_electricity_to_battery_{t}_6
 + renewable_electricity_to_battery_{t}_6 = 0
Electricity_flow_constraint_7: - battery_electricity_to_grid_{t}_7
 - electricity_to_battery_{t}_7 + grid_electricity_to_battery_{t}_7
 + renewable_electricity_to_battery_{t}_7 = 0
Electricity_flow_constraint_8: - battery_electricity_to_grid_{t}_8
 - electricity_to_battery_{t}_8 + grid_electricity_to_battery_{t}_8
 + renewable_electricity_to_battery_{t}_8 = 0
Electricity_flow_constraint_9: - battery_electricity_to_grid_{t}_9
 - electricity_to_battery_{t}_9 + grid_electricity_to_battery_{t}_9
 + renewable_electricity_to_battery_{t}_9 = 0
Grid_electricity_costs_1: - grid_electricity_costs_{t}_1
 + 0.3 grid_electricity_to_battery_{t}_1 + 0.3 grid_electricity_to_house_{t}_1
 = 0
Grid_electricity_costs_10: - grid_electricity_costs_{t}_10
 + 0.3 grid_electricity_to_battery_{t}_10
 + 0.3 grid_electricity_to_house_{t}_10 = 0
Grid_electricity_costs_11: - grid_electricity_costs_{t}_11
 + 0.3 grid_electricity_to_battery_{t}_11
 + 0.3 grid_electricity_to_house_{t}_11 = 0
Grid_electricity_costs_12: - grid_electricity_costs_{t}_12
 + 0.3 grid_electricity_to_battery_{t}_12
 + 0.3 grid_electricity_to_house_{t}_12 = 0
Grid_electricity_costs_13: - grid_electricity_costs_{t}_13
 + 0.3 grid_electricity_to_battery_{t}_13
 + 0.3 grid_electricity_to_house_{t}_13 = 0
Grid_electricity_costs_14: - grid_electricity_costs_{t}_14
 + 0.3 grid_electricity_to_battery_{t}_14
 + 0.3 grid_electricity_to_house_{t}_14 = 0
Grid_electricity_costs_15: - grid_electricity_costs_{t}_15
 + 0.3 grid_electricity_to_battery_{t}_15
 + 0.3 grid_electricity_to_house_{t}_15 = 0
Grid_electricity_costs_16: - grid_electricity_costs_{t}_16
 + 0.3 grid_electricity_to_battery_{t}_16
 + 0.3 grid_electricity_to_house_{t}_16 = 0
Grid_electricity_costs_17: - grid_electricity_costs_{t}_17
 + 0.3 grid_electricity_to_battery_{t}_17
 + 0.3 grid_electricity_to_house_{t}_17 = 0
Grid_electricity_costs_18: - grid_electricity_costs_{t}_18
 + 0.3 grid_electricity_to_battery_{t}_18
 + 0.3 grid_electricity_to_house_{t}_18 = 0
Grid_electricity_costs_19: - grid_electricity_costs_{t}_19
 + 0.3 grid_electricity_to_battery_{t}_19
 + 0.3 grid_electricity_to_house_{t}_19 = 0
Grid_electricity_costs_2: - grid_electricity_costs_{t}_2
 + 0.3 grid_electricity_to_battery_{t}_2 + 0.3 grid_electricity_to_house_{t}_2
 = 0
Grid_electricity_costs_20: - grid_electricity_costs_{t}_20
 + 0.3 grid_electricity_to_battery_{t}_20
 + 0.3 grid_electricity_to_house_{t}_20 = 0
Grid_electricity_costs_21: - grid_electricity_costs_{t}_21
 + 0.3 grid_electricity_to_battery_{t}_21
 + 0.3 grid_electricity_to_house_{t}_21 = 0
Grid_electricity_costs_22: - grid_electricity_costs_{t}_22
 + 0.3 grid_electricity_to_battery_{t}_22
 + 0.3 grid_electricity_to_house_{t}_22 = 0
Grid_electricity_costs_23: - grid_electricity_costs_{t}_23
 + 0.3 grid_electricity_to_battery_{t}_23
 + 0.3 grid_electricity_to_house_{t}_23 = 0
Grid_electricity_costs_24: - grid_electricity_costs_{t}_24
 + 0.3 grid_electricity_to_battery_{t}_24
 + 0.3 grid_electricity_to_house_{t}_24 = 0
Grid_electricity_costs_3: - grid_electricity_costs_{t}_3
 + 0.3 grid_electricity_to_battery_{t}_3 + 0.3 grid_electricity_to_house_{t}_3
 = 0
Grid_electricity_costs_4: - grid_electricity_costs_{t}_4
 + 0.3 grid_electricity_to_battery_{t}_4 + 0.3 grid_electricity_to_house_{t}_4
 = 0
Grid_electricity_costs_5: - grid_electricity_costs_{t}_5
 + 0.3 grid_electricity_to_battery_{t}_5 + 0.3 grid_electricity_to_house_{t}_5
 = 0
Grid_electricity_costs_6: - grid_electricity_costs_{t}_6
 + 0.3 grid_electricity_to_battery_{t}_6 + 0.3 grid_electricity_to_house_{t}_6
 = 0
Grid_electricity_costs_7: - grid_electricity_costs_{t}_7
 + 0.3 grid_electricity_to_battery_{t}_7 + 0.3 grid_electricity_to_house_{t}_7
 = 0
Grid_electricity_costs_8: - grid_electricity_costs_{t}_8
 + 0.3 grid_electricity_to_battery_{t}_8 + 0.3 grid_electricity_to_house_{t}_8
 = 0
Grid_electricity_costs_9: - grid_electricity_costs_{t}_9
 + 0.3 grid_electricity_to_battery_{t}_9 + 0.3 grid_electricity_to_house_{t}_9
 = 0
Maximum_renewable_generation_1: total_renewable_generation_{t}_1 <= 10
Maximum_renewable_generation_10: total_renewable_generation_{t}_10 <= 10
Maximum_renewable_generation_11: total_renewable_generation_{t}_11 <= 10
Maximum_renewable_generation_12: total_renewable_generation_{t}_12 <= 10
Maximum_renewable_generation_13: total_renewable_generation_{t}_13 <= 10
Maximum_renewable_generation_14: total_renewable_generation_{t}_14 <= 10
Maximum_renewable_generation_15: total_renewable_generation_{t}_15 <= 10
Maximum_renewable_generation_16: total_renewable_generation_{t}_16 <= 10
Maximum_renewable_generation_17: total_renewable_generation_{t}_17 <= 10
Maximum_renewable_generation_18: total_renewable_generation_{t}_18 <= 10
Maximum_renewable_generation_19: total_renewable_generation_{t}_19 <= 10
Maximum_renewable_generation_2: total_renewable_generation_{t}_2 <= 10
Maximum_renewable_generation_20: total_renewable_generation_{t}_20 <= 10
Maximum_renewable_generation_21: total_renewable_generation_{t}_21 <= 10
Maximum_renewable_generation_22: total_renewable_generation_{t}_22 <= 10
Maximum_renewable_generation_23: total_renewable_generation_{t}_23 <= 10
Maximum_renewable_generation_24: total_renewable_generation_{t}_24 <= 10
Maximum_renewable_generation_3: total_renewable_generation_{t}_3 <= 10
Maximum_renewable_generation_4: total_renewable_generation_{t}_4 <= 10
Maximum_renewable_generation_5: total_renewable_generation_{t}_5 <= 10
Maximum_renewable_generation_6: total_renewable_generation_{t}_6 <= 10
Maximum_renewable_generation_7: total_renewable_generation_{t}_7 <= 10
Maximum_renewable_generation_8: total_renewable_generation_{t}_8 <= 10
Maximum_renewable_generation_9: total_renewable_generation_{t}_9 <= 10
Renewable_electricity_costs_1: - renewable_eletricity_costs_{t}_1 = 0
Renewable_electricity_costs_10: - renewable_eletricity_costs_{t}_10 = 0
Renewable_electricity_costs_11: - renewable_eletricity_costs_{t}_11 = 0
Renewable_electricity_costs_12: - renewable_eletricity_costs_{t}_12 = 0
Renewable_electricity_costs_13: - renewable_eletricity_costs_{t}_13 = 0
Renewable_electricity_costs_14: - renewable_eletricity_costs_{t}_14 = 0
Renewable_electricity_costs_15: - renewable_eletricity_costs_{t}_15 = 0
Renewable_electricity_costs_16: - renewable_eletricity_costs_{t}_16 = 0
Renewable_electricity_costs_17: - renewable_eletricity_costs_{t}_17 = 0
Renewable_electricity_costs_18: - renewable_eletricity_costs_{t}_18 = 0
Renewable_electricity_costs_19: - renewable_eletricity_costs_{t}_19 = 0
Renewable_electricity_costs_2: - renewable_eletricity_costs_{t}_2 = 0
Renewable_electricity_costs_20: - renewable_eletricity_costs_{t}_20 = 0
Renewable_electricity_costs_21: - renewable_eletricity_costs_{t}_21 = 0
Renewable_electricity_costs_22: - renewable_eletricity_costs_{t}_22 = 0
Renewable_electricity_costs_23: - renewable_eletricity_costs_{t}_23 = 0
Renewable_electricity_costs_24: - renewable_eletricity_costs_{t}_24 = 0
Renewable_electricity_costs_3: - renewable_eletricity_costs_{t}_3 = 0
Renewable_electricity_costs_4: - renewable_eletricity_costs_{t}_4 = 0
Renewable_electricity_costs_5: - renewable_eletricity_costs_{t}_5 = 0
Renewable_electricity_costs_6: - renewable_eletricity_costs_{t}_6 = 0
Renewable_electricity_costs_7: - renewable_eletricity_costs_{t}_7 = 0
Renewable_electricity_costs_8: - renewable_eletricity_costs_{t}_8 = 0
Renewable_electricity_costs_9: - renewable_eletricity_costs_{t}_9 = 0
Total_renewable_generation_1: renewable_electricity_to_battery_{t}_1
 + renewable_electricity_to_house_{t}_1 - total_renewable_generation_{t}_1 = 0
Total_renewable_generation_10: renewable_electricity_to_battery_{t}_10
 + renewable_electricity_to_house_{t}_10 - total_renewable_generation_{t}_10
 = 0
Total_renewable_generation_11: renewable_electricity_to_battery_{t}_11
 + renewable_electricity_to_house_{t}_11 - total_renewable_generation_{t}_11
 = 0
Total_renewable_generation_12: renewable_electricity_to_battery_{t}_12
 + renewable_electricity_to_house_{t}_12 - total_renewable_generation_{t}_12
 = 0
Total_renewable_generation_13: renewable_electricity_to_battery_{t}_13
 + renewable_electricity_to_house_{t}_13 - total_renewable_generation_{t}_13
 = 0
Total_renewable_generation_14: renewable_electricity_to_battery_{t}_14
 + renewable_electricity_to_house_{t}_14 - total_renewable_generation_{t}_14
 = 0
Total_renewable_generation_15: renewable_electricity_to_battery_{t}_15
 + renewable_electricity_to_house_{t}_15 - total_renewable_generation_{t}_15
 = 0
Total_renewable_generation_16: renewable_electricity_to_battery_{t}_16
 + renewable_electricity_to_house_{t}_16 - total_renewable_generation_{t}_16
 = 0
Total_renewable_generation_17: renewable_electricity_to_battery_{t}_17
 + renewable_electricity_to_house_{t}_17 - total_renewable_generation_{t}_17
 = 0
Total_renewable_generation_18: renewable_electricity_to_battery_{t}_18
 + renewable_electricity_to_house_{t}_18 - total_renewable_generation_{t}_18
 = 0
Total_renewable_generation_19: renewable_electricity_to_battery_{t}_19
 + renewable_electricity_to_house_{t}_19 - total_renewable_generation_{t}_19
 = 0
Total_renewable_generation_2: renewable_electricity_to_battery_{t}_2
 + renewable_electricity_to_house_{t}_2 - total_renewable_generation_{t}_2 = 0
Total_renewable_generation_20: renewable_electricity_to_battery_{t}_20
 + renewable_electricity_to_house_{t}_20 - total_renewable_generation_{t}_20
 = 0
Total_renewable_generation_21: renewable_electricity_to_battery_{t}_21
 + renewable_electricity_to_house_{t}_21 - total_renewable_generation_{t}_21
 = 0
Total_renewable_generation_22: renewable_electricity_to_battery_{t}_22
 + renewable_electricity_to_house_{t}_22 - total_renewable_generation_{t}_22
 = 0
Total_renewable_generation_23: renewable_electricity_to_battery_{t}_23
 + renewable_electricity_to_house_{t}_23 - total_renewable_generation_{t}_23
 = 0
Total_renewable_generation_24: renewable_electricity_to_battery_{t}_24
 + renewable_electricity_to_house_{t}_24 - total_renewable_generation_{t}_24
 = 0
Total_renewable_generation_3: renewable_electricity_to_battery_{t}_3
 + renewable_electricity_to_house_{t}_3 - total_renewable_generation_{t}_3 = 0
Total_renewable_generation_4: renewable_electricity_to_battery_{t}_4
 + renewable_electricity_to_house_{t}_4 - total_renewable_generation_{t}_4 = 0
Total_renewable_generation_5: renewable_electricity_to_battery_{t}_5
 + renewable_electricity_to_house_{t}_5 - total_renewable_generation_{t}_5 = 0
Total_renewable_generation_6: renewable_electricity_to_battery_{t}_6
 + renewable_electricity_to_house_{t}_6 - total_renewable_generation_{t}_6 = 0
Total_renewable_generation_7: renewable_electricity_to_battery_{t}_7
 + renewable_electricity_to_house_{t}_7 - total_renewable_generation_{t}_7 = 0
Total_renewable_generation_8: renewable_electricity_to_battery_{t}_8
 + renewable_electricity_to_house_{t}_8 - total_renewable_generation_{t}_8 = 0
Total_renewable_generation_9: renewable_electricity_to_battery_{t}_9
 + renewable_electricity_to_house_{t}_9 - total_renewable_generation_{t}_9 = 0
End
