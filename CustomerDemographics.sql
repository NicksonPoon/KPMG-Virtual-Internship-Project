-- Cleansed CustomerDemographics Table --
SELECT 
  cd.[customer_id], 
  cd.[first_name] AS [First Name], 
  ISNULL(cd.[last_name], 'Name not given') AS [Last Name], 
  cd.first_name + ' ' + ISNULL(cd.[last_name], ' ') AS [Full Name], 
  CASE when upper(cd.gender) = 'F' THEN 'F' WHEN upper(cd.gender) = 'M' THEN 'M' WHEN upper(cd.gender) = 'Female' THEN 'F' when upper(cd.gender) = 'Male' THEN 'M' ELSE '' END AS Gender,
  cd.[past_3_years_bike_related_purchases] AS [Bike Related Purchases Past 3 Years], 
  ISNULL(2021 - RIGHT(Format([DOB], 'dd/MM/yyyy '), 5), ' ') AS [Age], 
  ISNULL(cd.[job_title], ' ') AS [Job Title], 
  cd.[job_industry_category] AS [Job Industry], 
  cd.[wealth_segment], 
  cd.[deceased_indicator], 
  --      ,[default]
  cd.[owns_car] AS [Owns Car], 
  --  cd.[tenure]
  ISNULL(ca.postcode, '') AS [Zipcode] -- Joined in from the CustomerAdress table
FROM 
  [KPMG Project].[dbo].CustomerDemographics AS cd 
  LEFT JOIN [KPMG Project].[dbo].CustomerAddress AS ca ON ca.customer_id = cd.customer_id 
WHERE 
  cd.deceased_indicator = 'N'
ORDER BY 
  cast(cd.customer_id as int) -- Results were being ordered as strings, rather by ints
