# US household Income data cleaning 

SELECT * FROM us_house_hold_income;
#alter column name so is easier to work with
ALTER TABLE us_project.us_household_income_statistics rename column `ï»¿id` to `id`;

SELECT * FROM us_household_income_statistics;


SELECT COUNT(id)
FROM us_house_hold_income;

SELECT COUNT(id)
from us_household_income_statistics;

#Identify duplicates
SELECT id, COUNT(id)
FROM us_house_hold_income
GROUP BY id 
HAVING COUNT(id) > 1;

#where the duplicates are by row_id
SELECT * 
FROM (
SELECT row_id, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_project.us_house_hold_income
) duplicates
WHERE row_num  > 1
;





#deleting duplicates
DELETE FROM us_house_hold_income
WHERE row_id IN (
SELECT row_id
FROM (
SELECT row_id, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_house_hold_income
) duplicates
WHERE row_num  > 1 )
;

# checking if the other table has duplicates
SELECT id, COUNT(id)
FROM  us_household_income_statistics
GROUP BY id
HAVING count(id) > 1 
;

#checking if states are correct 	
SELECT State_name, COUNT(State_name)
FROM us_house_hold_income
GROUP BY State_name
;

#more precise 
SELECT DISTINCT State_name 
FROM us_house_hold_income
ORDER BY 1
;

#got a result where was wrong so changed to correct
UPDATE us_project.us_house_hold_income
set State_name = 'Georgia'
WHERE State_name = 'georia';

#Correcting alabama
UPDATE us_project.us_house_hold_income
set State_name = 'Alabama'
WHERE State_name = 'alabama';

#checking the states ab
SELECT DISTINCT State_ab
FROM us_house_hold_income
ORDER BY 1
;

#checking if there is any space with no value
SELECT *
FROM us_house_hold_income
WHERE Place = ''
ORDER BY 1
;
#looking for the missing placee
SELECT *
FROM us_house_hold_income
WHERE County = 'Autauga County'
ORDER BY 1
;	

#correcting the value on the place column that had no value
UPDATE us_house_hold_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

#checking if the data is correct on the type column
SELECT Type, COUNT(Type)
FROM us_project.us_house_hold_income
GROUP BY Type;

#updating the value to the correct one
UPDATE  us_house_hold_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

#chegking any missing values in water or land 
SELECT ALand, AWater
FROM us_house_hold_income
WHERE (AWater = 0 OR AWater = '' OR AWater  IS NULL)
AND (ALand = 0 OR ALand = '' OR ALand  IS NULL)
;




