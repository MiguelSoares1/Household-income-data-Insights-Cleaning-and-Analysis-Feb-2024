# US Household Income Analysis

## Table of Contents

1. [Project Background](#project-background)

2. [Executive Summary](#Executive-Summary)

3. [Challenges and Solutions](#Challenges-and-Solutions)

4. [Recommendations](#Recommendations)



### Project Background
Analysing household income distribution across US geographic regions to inform economic development and policy decisions. Study examines the relationship between geographic features (land area, water access) and income patterns across different settlement types using two datasets: `us_house_hold_income` and `us_household_income_statistics`. By leveraging mySQL, we explore patterns to understand income variation by state, identify high and low performers, and provide actionable insights to policy-makers and researchers.


### Goals and Objectives

1. Analyse income patterns and trends at the state and city levels.

2. Identify states with the highest and lowest average incomes.

3. Explore the relationship between land/water area and income.

4. Examine income distribution by type and remove low-quality data.

5. Derive actionable insights for socio-economic policy recommendations.

### Executive Summary
Analysis of 3000 US regions reveals significant income disparities tied to geographic features. Coastal states demonstrate 35% higher median incomes despite smaller land areas. Key findings include:

Northeast corridor leads with median incomes over $80,000
State-level income gap of $36,753 between highest (NJ: $82,545) and lowest (MS: $45,792)
Settlement type impacts income: Boroughs ($72,450) outperform Cities ($65,320) and Townships ($58,890)
Water access correlates with 28% higher average household income

![house income diagram](https://github.com/user-attachments/assets/3c219d58-91e8-4458-9e77-fde6f13f8adf)




### Deep dive analysis
1. Income Disparity: States like California and New York have significantly higher average incomes than states like Mississippi and Arkansas.

2. Land and Water Analysis: States with larger water areas tend to have higher average incomes, possibly due to urban density and economic opportunities.

3. Income by Type: Income type analysis revealed that employment income dominates, but investment income contributes significantly in higher-income regions.

4. Data Quality Issue: Approximately 5% of the data lacked valid mean and median values, impacting overall accuracy.


### Challenges and Solutions


**Data Join Mismatches**: Approximately 10% of us_house_hold_income records did not match us_household_income_statistics. We resolved this by using:

SELECT * FROM us_house_hold_income u

RIGHT JOIN us_household_income_statistics us ON u.id = us.id

WHERE u.id IS NULL;



Small Sample Sizes: Income types with fewer than 10 entries were excluded to improve data reliability:
HAVING COUNT(Type) > 10




### Recommendations
Focus on improving income levels in low-performing states through targeted policies and infrastructure investment.

Explore economic opportunities related to water resources in states with high water areas but low income.
Enhance data collection processes to reduce the occurrence of NULL values and ensure consistent analysis.
