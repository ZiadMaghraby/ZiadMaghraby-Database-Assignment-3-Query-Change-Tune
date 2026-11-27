-- 12.1
CREATE TABLE dbo.CoursePassMarkHistory
(
    Id bigint IDENTITY PRIMARY KEY,
    CourseId int NOT NULL,
    OldMark decimal(5,2) NOT NULL,
    NewMark decimal(5,2) NOT NULL,
    ChangedAtUtc datetime2 NOT NULL,
    ChangedBy nvarchar(128) NOT NULL
);
UPDATE academic.Courses SET PassingScore = 70
OUTPUT inserted.Id, deleted.PassingScore, inserted.PassingScore, SYSUTCDATETIME(), ORIGINAL_LOGIN()
INTO dbo.CoursePassMarkHistory (CourseId, OldMark, NewMark, ChangedAtUtc, ChangedBy)
WHERE DepartmentId = (SELECT Id FROM academic.Departments WHERE Code = 'DSAI') AND PassingScore <> 70;
SELECT * FROM dbo.CoursePassMarkHistory;
-- 12.2
CREATE TABLE dbo.AnnouncementArchive
(
    Id bigint NOT NULL,
    SectionId bigint NULL,
    Title nvarchar(200) NOT NULL,
    Body nvarchar(max) NOT NULL,
    PublishedAtUtc datetime2 NULL,
    ExpiresAtUtc datetime2 NULL,
    CreatedByUserId bigint NOT NULL,
    CreatedAtUtc datetime2 NOT NULL,
    UpdatedAtUtc datetime2 NOT NULL,
    Status tinyint NOT NULL,
    ArchivedAtUtc datetime2 NOT NULL
);
DELETE FROM communication.Announcements
OUTPUT deleted.Id, deleted.SectionId, deleted.Title, deleted.Body, deleted.PublishedAtUtc,
    deleted.ExpiresAtUtc, deleted.CreatedByUserId, deleted.CreatedAtUtc, deleted.UpdatedAtUtc,
    deleted.Status, SYSUTCDATETIME()
INTO dbo.AnnouncementArchive
WHERE ExpiresAtUtc < DATEADD(MONTH, -6, SYSUTCDATETIME());
SELECT * FROM dbo.AnnouncementArchive;
