-- Cleansed Transactions Table --
SELECT 
	t.[transaction_id] AS [Order Number],
	cd.first_name AS [First Name],
  ISNULL(cd.[last_name], 'Name not given') AS [Last Name], 
  cd.first_name + ' ' + ISNULL(cd.[last_name], ' ') AS [Full Name], 
      t.[product_id],
      t.[customer_id],
      FORMAT ([transaction_date], 'dd/MM/yyyy ') AS [Order Date],
      CASE WHEN t.[online_order] = '0' THEN 'Not Online Order' WHEN t.[online_order] = '1' THEN 'Online order' ELSE ' ' END AS [Online Order],
      t.[order_status],
      ISNULL(t.[brand], ' ') AS [Brand],
      ISNULL(t.[product_line], ' ')AS [Type of Bike],
--      ,[product_class]
--      .[product_size]
      t.[list_price],
      t.[standard_cost]
--      ,[product_first_sold_date]
  FROM [KPMG Project].[dbo].[Transactions] AS t
  LEFT JOIN [KPMG Project].[dbo].CustomerDemographics AS cd ON t.customer_id = cd.customer_id
  WHERE 
    order_status = 'Approved'
