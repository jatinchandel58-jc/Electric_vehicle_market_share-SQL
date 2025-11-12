-- Highlight which alternative fuels (biodiesel, ethanol, hydrogen) have meaningful presence vs. niche usage. 

WITH alternative_fuels AS (
SELECT SUM(Biodiesel) AS biodiesel_total,
SUM(e85) AS ethanol_total,
SUM(Hydrogen) AS Hydrogen_total,
SUM(electric+phev+ hev+ Biodiesel+ e85+ cng+ Propane+Hydrogen+ Methanol+ Gasoline+ Diesel+ Unknown_Fuel) AS total_vehicles
FROM vehicle_data
)
SELECT biodiesel_total,
ROUND((biodiesel_total*1.0/total_vehicles)*100,2) AS biodiesel_percentage,
ethanol_total,
ROUND((ethanol_total*1.0/total_vehicles)*100,2) AS ethanol_percentage,
Hydrogen_total,
ROUND((Hydrogen_total*1.0/total_vehicles)*100,2) AS Hydrogen_percentage
FROM alternative_fuels;