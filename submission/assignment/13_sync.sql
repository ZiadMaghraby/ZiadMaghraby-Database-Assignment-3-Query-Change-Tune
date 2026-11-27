-- 13
CREATE TABLE dbo.WebCourseCatalog
(
    CourseId int NOT NULL PRIMARY KEY,
    Code varchar(30) NOT NULL,
    Title nvarchar(200) NOT NULL,
    CreditHours decimal(4,2) NOT NULL,
    IsVisible bit NOT NULL
);
GO
CREATE PROCEDURE dbo.SyncWebCourseCatalog
AS
MERGE dbo.WebCourseCatalog WITH (HOLDLOCK) AS target
USING academic.Courses AS source ON target.CourseId = source.Id
WHEN MATCHED AND
    (target.Code COLLATE Latin1_General_100_BIN2 <> source.Code COLLATE Latin1_General_100_BIN2
     OR DATALENGTH(target.Code) <> DATALENGTH(source.Code)
     OR target.Title COLLATE Latin1_General_100_BIN2 <> source.Title COLLATE Latin1_General_100_BIN2
     OR DATALENGTH(target.Title) <> DATALENGTH(source.Title)
     OR target.CreditHours <> source.CreditHours OR target.IsVisible <> source.IsActive)
THEN UPDATE SET Code = source.Code, Title = source.Title,
    CreditHours = source.CreditHours, IsVisible = source.IsActive
WHEN NOT MATCHED BY TARGET AND source.IsActive = 1
THEN INSERT (CourseId, Code, Title, CreditHours, IsVisible)
    VALUES (source.Id, source.Code, source.Title, source.CreditHours, 1)
WHEN NOT MATCHED BY SOURCE AND target.IsVisible = 1
THEN UPDATE SET IsVisible = 0
OUTPUT $action AS ChangeType, inserted.CourseId, deleted.Title AS OldTitle,
    inserted.Title AS NewTitle, inserted.IsVisible;
GO
-- First run: add active courses.
EXEC dbo.SyncWebCourseCatalog;
GO
-- Test inside a transaction so source changes can be undone afterwards.
BEGIN TRANSACTION;
DECLARE @RenameId int = (SELECT MIN(Id) FROM academic.Courses WHERE IsActive = 1);
DECLARE @HideId int = (SELECT MIN(Id) FROM academic.Courses WHERE IsActive = 1 AND Id <> @RenameId);
UPDATE academic.Courses SET Title = N'Updated course title - sync test' WHERE Id = @RenameId;
UPDATE academic.Courses SET IsActive = 0 WHERE Id = @HideId;
-- Second run: update the title and hide the other course.
EXEC dbo.SyncWebCourseCatalog;
-- Third run: no output rows and no changes.
EXEC dbo.SyncWebCourseCatalog;
ROLLBACK;
