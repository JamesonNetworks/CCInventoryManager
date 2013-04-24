SELECT o.*, oi.*
FROM [dbo].[Order] as o
	JOIN [dbo].[OrderItems] as oi 
ON o.ID = oi.Order_ID
WHERE
	o.DateOrdered > dateadd(month, -1, GETDATE())