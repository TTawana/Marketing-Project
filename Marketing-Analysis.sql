--Retrieve all data
SELECT * FROM `marketing-project2.Market_New.Market`;


-- Create categories for 5 caterories for household income - 5 buckets: < 20k, 20k and 50k, 50k and 100k, 100k and 170k + >170k

SELECT Income, 
CASE 
WHEN Income < 20000 THEN 'Less than 20k Household Income'
WHEN Income BETWEEN 20000 AND 50000 THEN 'Income Between 20k and 50k'
WHEN Income BETWEEN 50000 AND 100000 THEN 'Income Between 50k and 100k'
WHEN Income BETWEEN 100000 AND 170000 THEN 'Income Between 100k and 170k'
WHEN Income > 170000 THEN 'Earns above 170k'
END AS IncomeBucket
FROM `marketing-project2.Market_New.Market`;


--Average spent wine per household income bucket 

SELECT 
CASE 
WHEN Income < 20000 THEN 'Household income below 20k'
WHEN Income BETWEEN 20000 AND 50000 THEN 'Household income between 20k and 50k'
WHEN Income BETWEEN 50000 AND 100000 THEN 'Household income between 50k and 100k'
WHEN Income BETWEEN 100000 AND 170000 THEN 'Household income between 100k and 170k'
ELSE 'Income Unknown'
END AS IncomeBucket,
ROUND(AVG(Wines),2) AS AvgWineSpend
FROM `marketing-project2.Market_New.Market`
GROUP BY IncomeBucket
ORDER BY AvgWineSpend DESC;


--Total spent on wine per household income bucket

SELECT 
CASE 
WHEN Income <= 20000 THEN 'Household income below 20k'
WHEN Income BETWEEN 20000 AND 50000 THEN 'Household income between 20k and 50k'
WHEN Income BETWEEN 50000 AND 100000 THEN 'Household income between 50k and 100k'
WHEN Income BETWEEN 100000 AND 170000 THEN 'Income Between 100k and 170k'
WHEN Income > 170000 THEN 'Earns above 170k'
ELSE 'Income Unknown'
END AS IncomeBucket,
SUM(Wines) AS TotalWineSpend
FROM `marketing-project2.Market_New.Market`
GROUP BY IncomeBucket
ORDER BY TotalWineSpend DESC;


--Create age buckets

SELECT Age,
CASE 
WHEN Age BETWEEN 20 AND 30 THEN 'Age 20-30'
WHEN Age BETWEEN 30 AND 40 THEN 'Age 30-40'
WHEN Age BETWEEN 40 AND 50 THEN 'Age 40-50'
WHEN Age BETWEEN 50 AND 60 THEN 'Age 50-60'
WHEN Age BETWEEN 60 AND 70 THEN 'Age 60-70'
WHEN Age BETWEEN 70 AND 80 THEN 'Age 70-80'
WHEN Age BETWEEN 80 AND 90 THEN 'Age 80-90'
ELSE 'OTHER'
END AS AgeBucket
FROM `marketing-project2.Market_New.Market`;


--Average wine spend by age buckets

SELECT
CASE 
WHEN Age BETWEEN 20 AND 30 THEN 'Age 20-30'
WHEN Age BETWEEN 30 AND 40 THEN 'Age 30-40'
WHEN Age BETWEEN 40 AND 50 THEN 'Age 40-50'
WHEN Age BETWEEN 50 AND 60 THEN 'Age 50-60'
WHEN Age BETWEEN 60 AND 70 THEN 'Age 60-70'
WHEN Age BETWEEN 70 AND 80 THEN 'Age 70-80'
WHEN Age BETWEEN 80 AND 90 THEN 'Age 80-90'
ELSE 'OTHER'
END AS AgeBucket, 
ROUND(AVG(Wines),2) as AvgWinePerAgeGroup
FROM `marketing-project2.Market_New.Market`
GROUP BY AgeBucket
ORDER BY AvgWinePerAgeGroup DESC;


--Total wine spend per age bucket

SELECT
CASE 
WHEN Age BETWEEN 20 AND 30 THEN 'Age 20-30'
WHEN Age BETWEEN 30 AND 40 THEN 'Age 30-40'
WHEN Age BETWEEN 40 AND 50 THEN 'Age 40-50'
WHEN Age BETWEEN 50 AND 60 THEN 'Age 50-60'
WHEN Age BETWEEN 60 AND 70 THEN 'Age 60-70'
WHEN Age BETWEEN 70 AND 80 THEN 'Age 70-80'
WHEN Age BETWEEN 80 AND 90 THEN 'Age 80-90'
ELSE 'OTHER'
END AS AgeBucket, 
SUM(Wines) as TotalWinePerAgeGroup
FROM `marketing-project2.Market_New.Market`
GROUP BY AgeBucket
ORDER BY TotalWinePerAgeGroup DESC;


--Average amount spent in store by age buckets 
SELECT
CASE 
WHEN Age BETWEEN 20 AND 30 THEN 'Age 20-30'
WHEN Age BETWEEN 30 AND 40 THEN 'Age 30-40'
WHEN Age BETWEEN 40 AND 50 THEN 'Age 40-50'
WHEN Age BETWEEN 50 AND 60 THEN 'Age 50-60'
WHEN Age BETWEEN 60 AND 70 THEN 'Age 60-70'
WHEN Age BETWEEN 70 AND 80 THEN 'Age 70-80'
WHEN Age BETWEEN 80 AND 90 THEN 'Age 80-90'
ELSE 'OTHER'
END AS AgeBucket, 
ROUND(AVG(StorePurchases),2) as AvgStoreSpendPerAgeGroup
FROM `marketing-project2.Market_New.Market`
GROUP BY AgeBucket
ORDER BY AvgStoreSpendPerAgeGroup DESC;


--Total Spent in store by age buckets 
SELECT
CASE 
WHEN Age BETWEEN 20 AND 30 THEN 'Age 20-30'
WHEN Age BETWEEN 30 AND 40 THEN 'Age 30-40'
WHEN Age BETWEEN 40 AND 50 THEN 'Age 40-50'
WHEN Age BETWEEN 50 AND 60 THEN 'Age 50-60'
WHEN Age BETWEEN 60 AND 70 THEN 'Age 60-70'
WHEN Age BETWEEN 70 AND 80 THEN 'Age 70-80'
WHEN Age BETWEEN 80 AND 90 THEN 'Age 80-90'
ELSE 'OTHER'
END AS AgeBucket, 
SUM(StorePurchases) as TotalStoreSpendPerAgeGroup
FROM `marketing-project2.Market_New.Market`
GROUP BY AgeBucket
ORDER BY TotalStoreSpendPerAgeGroup DESC;

