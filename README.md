# Household Income Data: Insights, Cleaning, and Analysis

## Table of Contents
1. [Project Background](#project-background)
2. [Executive Summary](#Executive-Summary)
3. [Challenges and Solutions](#Challenges-and-Solutions)
4. [Recommendations](#Recommendations)

### Project Background
Analysis of global life expectancy trends across countries to understand the impact
of economic development (GDP), health factors (BMI), and development status on
life expectancy outcomes between 2000-2015.

### Goals and Objectives
1. Identify countries with the highest and lowest life expectancies.
   
2. Analyze life expectancy trends over time and by economic status (developing vs.
developed).

3. Explore correlations between GDP, BMI, and life expectancy.
   
4. Handle data quality issues such as duplicates and missing values to ensure robust
analysis.

### Executive Summary
Analysis of worldwide life expectancy data reveals significant disparities between
developed and developing nations, with a strong correlation between GDP and life
outcomes. Key findings:
o 14.8 year gap between highest and lowest life expectancy countries

o Countries with GDP ≥$1,500 show 9.2 years higher life expectancy

o Developed nations average 7.4 years longer life expectancy than developing
ones
o Adult mortality trends show consistent decline in most regions

ADD DIAGRAM HERE

### Insights Deep-Dive
Life Expectancy Trends
1. Country-Level Changes (2000-2015)
o Maximum increase: 9.6 years
o Minimum increase: 1.2 years
o Average annual improvement: 0.32 years

2. Economic Impact
o High GDP (≥$1,500): 77.3 years average
o Low GDP (≤$1,500): 68.1 years average
o GDP correlation coefficient: 0.84

3. Development Status Impact
o Developed nations: 79.2 years
o Developing nations: 71.8 years

o Sample size: 32 developed, 161 developing countries

### Health Metrics
1. BMI Correlation
o High BMI countries show lower life expectancy
o Regional variations significant
o Strongest impact in developing nations
2. Adult Mortality
o Declining trend across 15 years
o Faster improvement in developing nations
o Significant regional variations

### Key Insights
1. Life Expectancy Trends
- Countries with higher GDP have significantly longer life expectancies.
- Developing nations exhibit greater variability in life expectancy growth over 15
years compared to developed nations.
2. Economic Status Analysis:
- Developed countries have an average life expectancy of 78 years, while
developing nations average 63 years.
3. BMI and Life Expectancy Correlation:
- Countries with lower average BMIs tend to have higher life expectancies,
suggesting health and nutrition disparities.
### Recommendations
1. Focus on Health Policies in Developing Nations:
Invest in healthcare infrastructure to address disparities in life expectancy.

2. Target Economic Growth:
Countries with higher GDP exhibit longer life expectancies; policies aimed at
economic development could improve overall health.

3. Address Nutrition and Obesity:
Encourage programs to manage BMI, as lower BMIs correlate with higher life
expectancy.

### Challenges and Solutions

Duplicate Records:
o Issue: Multiple records for the same country and year.
o Solution: Identified and removed duplicates using ROW_NUMBER().

Missing Life Expectancy Data:
o Issue: Blank Life_expectancy fields for some countries and years.
o Solution: Used interpolation based on neighboring years&#39; data.

Inconsistent Status Labels:
o Issue: Blank or incorrect status fields for some countries.
o Solution: Updated blank fields using the most frequent status for each country.
