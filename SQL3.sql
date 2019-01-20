USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO
uspGetAddress 

CREATE PROCEDURE dbo.uspGetAddressOne @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO
EXEC dbo.uspGetAddressOne @City = 'Calgary'

SELECT * FROM person.person
INNER JOIN person.BusinessEntityAddress
ON BusinessEntityAddress.BusinessEntityID = Person.BusinessEntityID
JOIN Person.Address
ON Address.AddressID = BusinessEntityAddress.AddressID

SELECT * FROM Person.Person
INNER JOIN Person.Password
ON Password.BusinessEntityID = Person.BusinessEntityID