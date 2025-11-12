-- Identify the top 5 states with the highest EV adoption rate (EVs as a % of all registered vehicles). 

WITH EV_adoption_rate AS (SELECT State,
electric,
(electric+phev+ hev+ Biodiesel+ e85+ cng+ Propane+Hydrogen+ Methanol+ Gasoline+ Diesel+ Unknown_Fuel) AS total_vehicles
FROM vehicle_data)
SELECT State,
electric,
ROUND((electric*1.0/total_vehicles)*100,2) AS percentage_share
FROM EV_adoption_rate 
ORDER BY percentage_share DESC
LIMIT 5
;
