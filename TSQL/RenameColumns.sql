-- Script to rename columns in SQL Server
-- Check out http://technet.microsoft.com/en-us/library/ms188617.aspx

USE AdventureWorks2012;
GO
EXEC sp_rename 'Sales.SalesTerritory.TerritoryID', 'TerrID', 'COLUMN';
GO
