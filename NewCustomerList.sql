-- Cleansed NewCustomerList Table --
SELECT 
  [first_name] AS [First Name], 
  ISNULL([last_name], 'Name not given') AS [Last Name], 
  first_name + ' ' + ISNULL([last_name], ' ') AS [Full Name], 
  [past_3_years_bike_related_purchases] AS [Bike Related Purchases Past 3 Years], 
  ISNULL(2021 - LEFT([DOB], 4), ' ') AS [Age], 
  [job_title],
  [job_industry_category] AS [Job Industry], 
  --      ,[wealth_segment]
  --      [deceased_indicator],
  CASE when [owns_car] = '1' THEN 'True' when [owns_car] = '0' THEN 'False' END AS [Owns Car], 
  --      ,[tenure]
  --      ,[address]
  [postcode], 
  [state] 
  --      ,[country]
  --      ,[property_valuation]
  --      ,[column17]
  --      ,[column18]
  --      ,[column19]
  --      ,[column20]
  --      ,[column21]
        ,[Rank]
  --      ,[Value] 
FROM 
  [KPMG Project].dbo.NewCustomerList 
ORDER BY 
  4 DESC -- Sort by Most bike related purchases
