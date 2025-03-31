WITH
SalesOrderHeader 
AS
(SELECT [CustomerID]
      ,[SalesOrderID]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CreditCardID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[ModifiedDate]
  FROM [AdventureWorks].[Sales].[SalesOrderHeader]
)
SELECT CUST.*
      ,[SalesOrderID]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CreditCardID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
  FROM SalesOrderHeader AS SOH 
  JOIN 
  {{ ref('customer_360') }} AS CUST 
  on CUST.BusinessEntityID = SOH.CustomerID
  
