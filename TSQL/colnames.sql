--Get column names for a table
--http://stackoverflow.com/questions/1054984/get-columns-of-a-table-sql-server

SELECT *
FROM Northwind.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Customers'
