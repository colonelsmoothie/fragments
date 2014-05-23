-- code to change column type in SQL Server
-- check out http://stackoverflow.com/questions/5136013/how-to-change-column-datatype-in-sql-server-database-without-losing-data

ALTER TABLE dbo.YourTable
	ALTER COLUMN YourColumnName BIT
