-- 3.1
-- One shared sequence, independent of a table. Do not reset it after use.
CREATE SEQUENCE finance.AssignmentInvoiceSequence AS bigint START WITH 1 INCREMENT BY 1;
GO
-- Skip existing suffixes so the example does not clash with imported invoices.
DECLARE @Start bigint = (SELECT ISNULL(MAX(TRY_CONVERT(bigint,
    RIGHT(InvoiceNumber, CHARINDEX('-', REVERSE(InvoiceNumber)) - 1))), 0) + 1
    FROM finance.Invoices WHERE InvoiceNumber LIKE 'LAB-INV-%-[0-9]%');
EXEC ('ALTER SEQUENCE finance.AssignmentInvoiceSequence RESTART WITH ' + @Start);
GO
ALTER TABLE finance.Invoices ADD CONSTRAINT DF_AssignmentInvoiceNumber
DEFAULT (CONCAT('LAB-INV-', DATEPART(YEAR, SYSUTCDATETIME()), '-',
    FORMAT(NEXT VALUE FOR finance.AssignmentInvoiceSequence, '000000'))) FOR InvoiceNumber;
GO
-- 3.2
DECLARE @StudentId bigint = (SELECT MIN(Id) FROM [identity].StudentProfiles);
DECLARE @TermId int = (SELECT Id FROM delivery.AcademicTerms WHERE Name = N'Summer 2027');
INSERT INTO finance.Invoices
    (StudentId, TermId, CurrencyCode, IssuedAtUtc, DueAtUtc, TotalAmount, PaidAmount)
OUTPUT inserted.InvoiceNumber
VALUES (@StudentId, @TermId, 'EGP', SYSUTCDATETIME(),
    DATEADD(DAY, 30, SYSUTCDATETIME()), 4500, 0);

-- 3.3
BEGIN TRANSACTION;
SELECT NEXT VALUE FOR finance.AssignmentInvoiceSequence AS CancelledNumber;
ROLLBACK;
SELECT NEXT VALUE FOR finance.AssignmentInvoiceSequence AS NextNumber;
-- The cancelled number is consumed. A sequence is not gap-free.
