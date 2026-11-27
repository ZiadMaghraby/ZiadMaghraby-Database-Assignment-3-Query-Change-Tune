-- 8: A separate practice table. No LMS rows are changed.
CREATE TABLE dbo.AssignmentSortLab
(
    Id int NOT NULL PRIMARY KEY,
    Category int NOT NULL,
    Padding char(200) NOT NULL
);
;WITH Numbers AS
(
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 100000
)
INSERT INTO dbo.AssignmentSortLab (Id, Category, Padding)
SELECT n, n % 100, CONCAT(RIGHT('000000' + CONVERT(varchar(6), 100001 - n), 6), REPLICATE('x', 194))
FROM Numbers OPTION (MAXRECURSION 0);
UPDATE STATISTICS dbo.AssignmentSortLab WITH FULLSCAN;
GO
CREATE PROCEDURE dbo.AssignmentSortReport @Limit int
AS
SELECT Id, Category, Padding FROM dbo.AssignmentSortLab
WHERE Id <= @Limit ORDER BY Padding, Id
OPTION (MAXDOP 1, USE HINT('DISABLE_ROW_MODE_MEMORY_GRANT_FEEDBACK', 'DISABLE_BATCH_MODE_MEMORY_GRANT_FEEDBACK'));
GO
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SET STATISTICS XML ON;
-- Compile for one row, then reuse that plan for 100,000 rows.
EXEC dbo.AssignmentSortReport @Limit = 1;
EXEC dbo.AssignmentSortReport @Limit = 100000;
-- Recompile for the actual parameter value. Same rows and ordering.
EXEC dbo.AssignmentSortReport @Limit = 100000 WITH RECOMPILE;
SET STATISTICS XML OFF;
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
