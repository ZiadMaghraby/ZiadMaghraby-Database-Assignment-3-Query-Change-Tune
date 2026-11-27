SET XACT_ABORT ON;
BEGIN TRANSACTION;
-- 2.1
INSERT INTO academic.Departments (Code, Name)
VALUES ('DSAI', N'Data Science & Artificial Intelligence');
DECLARE @DepartmentId int = SCOPE_IDENTITY();

-- 2.2
INSERT INTO academic.Courses (DepartmentId, Code, Title, CreditHours, PassingScore)
VALUES (@DepartmentId, 'DSAI-101', N'Introduction to Data Analysis', 3, 60);

-- 2.3
INSERT INTO delivery.AcademicTerms
    (AcademicYear, TermCode, Name, StartDate, EndDate, RegistrationStartDate, RegistrationEndDate)
VALUES (2027, 'SUMMER', N'Summer 2027', '20270615', '20270831', '20270501', '20270610');

-- 2.4
DECLARE @AuthorId bigint = (SELECT MIN(Id) FROM [identity].Users);
INSERT INTO communication.Announcements
    (SectionId, Title, Body, PublishedAtUtc, CreatedByUserId, Status)
VALUES (NULL, N'Summer 2027 registration',
    N'Summer 2027 registration opens on 1 May 2027.', SYSUTCDATETIME(), @AuthorId, 2);

-- 2.5
INSERT INTO [identity].Roles (Code, Name)
VALUES ('TEACHING_ASSISTANT', N'Teaching Assistant');
COMMIT;
