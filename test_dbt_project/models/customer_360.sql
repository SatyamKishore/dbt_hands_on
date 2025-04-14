{{
      config(
            materialized='incremental',
            unique_key='BusinessEntityID'
      )
}}
WITH Person
AS
(
SELECT [BusinessEntityID]
	  ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
	  ,CONCAT([FirstName] , ' ',  [LastName]) as FullName 
FROM [AdventureWorks].[Person].[Person]
)
,
Email
AS
(
SELECT [BusinessEntityID]
      ,[EmailAddress] 
FROM [AdventureWorks].[Person].[EmailAddress]
)
,
Employee 
AS 
(
SELECT [BusinessEntityID]
      ,[NationalIDNumber]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[ModifiedDate]
FROM [AdventureWorks].[HumanResources].[Employee]
)
Select 
P.BusinessEntityID, 
CASE WHEN Title IS NULL THEN
	CASE WHEN Gender = 'M' THEN 'Mr.' 
		 ELSE 'Ms.' 
		 END 
	ELSE Title
	END as Title,
FullName, EmailAddress, NationalIDNumber , JobTitle, BirthDate , MaritalStatus , Gender , HireDate , ModifiedDate , current_timestamp as ETL_LoadTimestamp
from 
	Person as P
join
	Employee as E
on P.BusinessEntityID = E.BusinessEntityID
join
	Email as M
on P.BusinessEntityID = M.BusinessEntityID

{% if is_incremental() %}
WHERE ModifiedDate > (SELECT MAX(ModifiedDate) FROM {{ this }}) or P.BusinessEntityID > (SELECT MAX(BusinessEntityID) FROM {{ this }})

{% endif %}