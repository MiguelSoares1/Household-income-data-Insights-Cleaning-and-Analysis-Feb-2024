# US HOUSEHOLD INCOME DATA EXPLATORY

select * from us_house_hold_income;

SELECT * FROM us_household_income_statistics;	

#see how much water and land it has by state 
SELECT State_name, SUM(Aland), SUM(AWater)
FROM us_house_hold_income
group by state_name
ORDER BY 2 desc;



#top 10 by with most land 	
SELECT State_name, SUM(Aland), SUM(AWater)
FROM us_house_hold_income
group by state_name
ORDER BY 2 desc
limit 10;

SELECT * 
FROM us_house_hold_income u
JOIN us_household_income_statistics us 
	on u.id = us.id;

#checking where data is null with right join
SELECT * 
FROM us_house_hold_income u
RIGHT JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE u.id IS NULL;

# there is some data with  nothing on the mean, meadian, stdev, and sum_w
SELECT * 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id;
    
    #same as the last one but we only take what has value 
    SELECT * 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0;


# 
    SELECT u.State_name, County, type, `Primary`, Mean, median 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0;

#lowest avg income
    SELECT u.State_name, ROUND(AVG(Mean),1), ROUND(AVG(median),1) 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0
group by u.state_name
order by 2 
limit 5
;

#High avg income 
    SELECT u.State_name, ROUND(AVG(Mean),1), ROUND(AVG(median),1) 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0
group by u.state_name
order by 3 DESC	
limit 5
;

#checking income by type and make a count so we can understand how is it working "behind the scenes"2
    SELECT type, COUNT(Type),  ROUND(AVG(Mean),1), ROUND(AVG(median),1) 
FROM us_house_hold_income u
INNER JOIN us_household_income_statistics us 
	on u.id = us.id
WHERE Mean <> 0
group by type
order by 2 desc 
;

# notice where is types with less then 10 on count type we dont want that so we fix by doing the one under
SELECT type, COUNT(Type),ROUND(AVG(MEAN),1), ROUND(AVG(MEDIAN),1)
FROM us_house_hold_income u
INNER join us_project.us_household_income_statistics us
	on u.id = us.id
where mean <> 0 
group by 1 
order by 4 desc;

#now we only have values above 100
SELECT type, COUNT(Type),ROUND(AVG(MEAN),1), ROUND(AVG(MEDIAN),1)
FROM us_house_hold_income u
INNER join us_project.us_household_income_statistics us
	on u.id = us.id
where mean <> 0 
group by 1 
having count(type) > 100 
order by 4 desc;

SELECT u.State_Name, city, ROUND(AVG(MEAN),1)
FROM us_house_hold_income u
JOIN us_household_income_statistics us 
	on u.id = us.id
group by u.State_Name, city;


#avg by state and their respective cities 
SELECT u.State_Name, city, ROUND(AVG(MEAN),1)
FROM us_house_hold_income u
JOIN us_household_income_statistics us 
	on u.id = us.id
group by u.State_Name, city
ORDER BY ROUND(AVG(MEAN),1) DESC	