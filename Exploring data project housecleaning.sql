# US HOUSEHOLD INCOME DATA EXPLATORY

select * from us_house_hold_income;

SELECT * FROM us_household_income_statistics;	

SELECT State_name, SUM(Aland), SUM(AWater)
FROM us_house_hold_income
group by state_name
ORDER BY 2 desc
limit 10;




SELECT * 
FROM us_house_hold_income u
JOIN us_household_income_statistics us 
	on u.id = us.id;


SELECT * 
FROM us_house_hold_income u
RIGHT JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE u.id IS NULL;

SELECT * 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id;
    
    
    SELECT * 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0;



    SELECT u.State_name, County, type, `Primary`, Mean, median 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0;


    SELECT u.State_name, ROUND(AVG(Mean),1), ROUND(AVG(median),1) 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0
group by u.state_name
order by 3 DESC	
limit 5
;


    SELECT type, COUNT(Type),  ROUND(AVG(Mean),1), ROUND(AVG(median),1) 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0
group by type
order by 2 desc 
;


SELECT u.State_Name, city, ROUND(AVG(MEAN),1)
FROM us_house_hold_income u
JOIN us_household_income_statistics us 
	on u.id = us.id
group by u.State_Name, city;



SELECT u.State_Name, city, ROUND(AVG(MEAN),1)
FROM us_house_hold_income u
JOIN us_household_income_statistics us 
	on u.id = us.id
group by u.State_Name, city
ORDER BY ROUND(AVG(MEAN),1) DESC	