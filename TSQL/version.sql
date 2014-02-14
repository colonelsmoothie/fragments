-- I had trouble today getting a script with a CTE to execute, despite my sytanx being seemingly correct. After much searching I found out that CTEs are not supported in SQL Server prior to 2005.

--The following script checks the version:

SELECT @@VERSION;

--It turned out the server I was using had SQL Sever 2000, which didn't support CTEs. I had to import the tables into another server to get my script to work.
