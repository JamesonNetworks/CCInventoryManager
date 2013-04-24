select 
	o.*,
	oi.*,
	i.*
from [dbo].[Order] as o
join [dbo].[OrderItems] as oi on o.ID = oi.Order_ID
join [dbo].[Item] as i on oi.Item_ID = i.ID