-- Calculate the percentage of EVs, PHEVs, HEVs, and Gasoline vehicles for each state.

WITH sum_calc AS (SELECT State,
electric,
phev,
hev,
Gasoline,
(electric+phev+ hev+ Biodiesel+ e85+ cng+ Propane+Hydrogen+ Methanol+ Gasoline+ Diesel+ Unknown_Fuel) AS total_vehicles
FROM vehicle_data)
SELECT State,
electric,
ROUND((electric*1.0/total_vehicles)*100,2) AS EVs_percentage,
phev,
ROUND((phev*1.0/total_vehicles)*100,2) AS PHEVs_percentage,
hev,
ROUND((hev*1.0/total_vehicles)*100,2) AS HEVs_percentage,
Gasoline,
ROUND((Gasoline*1.0/total_vehicles)*100,2) AS Gasoline_percentage
FROM sum_calc
;

SELECT * 
FROM percentage_per_share;