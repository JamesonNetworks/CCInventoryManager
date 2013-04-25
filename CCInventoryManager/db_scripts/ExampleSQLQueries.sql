                                                                     
                                                                     
                                                                     
                                             
--customer name function (used in some things below)
USE [CCINV]
GO

/****** Object:  UserDefinedFunction [dbo].[CUSTOMER_NAME]    Script Date: 04/24/2013 22:06:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CUSTOMER_NAME] (@CUST_ID int)
RETURNS varchar(100)
AS 
begin
RETURN (
	SELECT LastName +', '+ FirstName 
	FROM CCINV.dbo.Customer
	WHERE dbo.Customer.ID = @CUST_ID
);
end;

GO


--order history for a customer (table valued function)
USE [CCINV]
GO

/****** Object:  UserDefinedFunction [dbo].[ORDER_HISTORY]    Script Date: 04/24/2013 22:06:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ORDER_HISTORY] (@CUST_ID int)
RETURNS TABLE
AS 
RETURN (
	select 
		Customer_id,
		dbo.Customer_name(@CUST_ID) as customer_name,
		Ord.ID,
		DateOrdered,
		DateArrived,
		item_id,
		I.Name,
		quantity,
		Cost,
		RetailCost,
		(RetailCost-cost)*quantity as profit
	from CCINV.DBO."Order" Ord
	join CCINV.DBO.OrderItems OI on (OI.Order_ID = ord.ID)
	join CCINV.DBO.ITEM I on (I.id=OI.item_id)
	where ord.customer_id=@CUST_ID
);

GO



--mailing list (table valued function)
USE [CCINV]
GO

/****** Object:  UserDefinedFunction [dbo].[MAILING_LIST]    Script Date: 04/24/2013 22:06:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[MAILING_LIST] ()
RETURNS TABLE
AS
RETURN (
	select customer_id,
		DBO.customer_name(CUSTOMER.ID) as customer_name,
		city+', '+state+' '+zip as address
	from customer
	join PaymentInfo on customer_id = customer.id
);

GO




select * from dbo.order_history(0)

SELECT * FROM dbo.MAILING_LIST()

--ORDER ITEMS BY PROFITABILITY
select I.ID AS ITEM_ID,
	SUM(Quantity*(RetailCost-Cost)) AS PROFIT
from DBO."Order" O
join DBO.orderitemS OI on (OI.order_id=O.id)
join DBO.item I on (I.id = OI.ITEM_id)
GROUP BY I.ID
order by 2 DESC

--ORDER ITEMS BY # SOLD
select I.ID AS ITEM_ID,
	SUM(Quantity) AS NUM_SOLD
from DBO."Order" O
join DBO.orderitemS OI on (OI.order_id=O.id)
join DBO.item I on (I.id = OI.ITEM_id)
GROUP BY I.ID
order by 2 DESC

--ORDERS AND SHIPPERS BY LONGEST SHIPPING DELAY TO SHORTEST
select
	o.id,
	o.dateOrdered,
	SH.Name,
	DateArrived,
	o.dateOrdered - o.dateArrived as Shipping_Delay
from DBO."Order" O
inner join DBO.orderitemS OI on (O.id=OI.order_id)
inner join dbo.Shipper SH on SH.ID=Shipper_ID
order by 5 desc



--Report on orders and profit in last month

select 
	customer_id,
	dbo.customer_name(O.Customer_ID) as customer_name,
	order_id,
	item_id,
	I.Name,
	Quantity,
	cost,
	RetailCost,
	(RETAILCOST-cost)*QUANTITY as profit
from DBO."order" O
inner join DBO.OrderItems OI ON OI.Order_ID=O.ID
inner join dbo.Item I on I.ID=OI.Item_ID
where o.DateOrdered > dateadd(month, -1, GETDATE())


--aggregate profit and num sold in past month
select 
	sum(Quantity) as num_items_sold,
	sum((RetailCost-cost)*Quantity) as total_profit
from dbo."Order" O
inner join OrderItems OI on OI.Order_ID=O.ID
inner join item I on I.ID=OI.Item_ID
where O.DateOrdered > dateadd(month, -1, GETDATE())