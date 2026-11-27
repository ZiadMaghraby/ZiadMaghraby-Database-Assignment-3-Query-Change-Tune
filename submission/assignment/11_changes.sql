SET XACT_ABORT ON;
-- 11.1
UPDATE academic.Courses SET PassingScore = 65
WHERE DepartmentId = (SELECT Id FROM academic.Departments WHERE Code = 'DSAI');
-- 11.2
UPDATE delivery.Enrollments SET FinalGrade = CASE
    WHEN FinalScore >= 90 THEN 'A' WHEN FinalScore >= 80 THEN 'B'
    WHEN FinalScore >= 70 THEN 'C' WHEN FinalScore >= 60 THEN 'D' ELSE 'F' END
WHERE FinalScore IS NOT NULL AND EnrollmentStatusId IN
    (SELECT Id FROM ref.EnrollmentStatuses WHERE Code IN ('COMPLETED', 'FAILED'));
-- 11.3
BEGIN TRANSACTION;
DELETE FROM [identity].UserRoles WHERE RoleId IN
    (SELECT Id FROM [identity].Roles WHERE Code = 'TEACHING_ASSISTANT');
DELETE FROM [identity].Roles WHERE Code = 'TEACHING_ASSISTANT';
COMMIT;
-- 11.4
CREATE TABLE dbo.AssignmentPaymentStaging
(
    Id int IDENTITY PRIMARY KEY,
    InvoiceId bigint NOT NULL,
    Amount decimal(18,2) NOT NULL,
    PaidAtUtc datetime2 NOT NULL
);
DECLARE @InvoiceId bigint = (SELECT MIN(Id) FROM finance.Invoices);
INSERT INTO dbo.AssignmentPaymentStaging (InvoiceId, Amount, PaidAtUtc)
VALUES (@InvoiceId, 100, SYSUTCDATETIME()), (@InvoiceId, 200, SYSUTCDATETIME()),
       (@InvoiceId, 300, SYSUTCDATETIME());
SELECT * FROM dbo.AssignmentPaymentStaging;
TRUNCATE TABLE dbo.AssignmentPaymentStaging;
SELECT COUNT(*) AS RowsAfterTruncate FROM dbo.AssignmentPaymentStaging;
-- 11.5: Only disposable objects created for these exercises.
DROP PROCEDURE IF EXISTS dbo.AssignmentSortReport;
DROP TABLE IF EXISTS dbo.AssignmentSortLab;
DROP TABLE IF EXISTS dbo.AssignmentPaymentStaging;
-- Keep the numbering sequence, audit/archive tables and website catalog: they have a continuing purpose.
