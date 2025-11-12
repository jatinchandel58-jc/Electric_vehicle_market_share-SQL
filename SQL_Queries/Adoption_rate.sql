-- Compare EV adoption in California vs. other large states (e.g., Texas, Florida, New York).

WITH EV_adoption_other_state AS (
SELECT State,
electric,
(electric+phev+ hev+ Biodiesel+ e85+ cng+ Propane+Hydrogen+ Methanol+ Gasoline+ Diesel+ Unknown_Fuel) AS total_vehicles
FROM vehicle_data
),
cali_adoption AS (SELECT State,
electric,
ROUND((electric*1.0/total_vehicles)*100,2) AS ca_ev_adoption
FROM EV_adoption_other_state
WHERE State = "California")
SELECT e.State,
e.electric,
ROUND((e.electric*1.0/total_vehicles)*100,2) AS ev_percentage,
ca_ev_adoption
FROM EV_adoption_other_state e
CROSS JOIN cali_adoption c
WHERE e.State IN ('Texas',"Florida","New York");