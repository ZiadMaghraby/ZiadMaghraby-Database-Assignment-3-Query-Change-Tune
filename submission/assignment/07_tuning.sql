-- 7: Run once on the practice copy.
CREATE INDEX IX_Users_Email ON [identity].Users (Email) INCLUDE (FirstName, LastName);
CREATE INDEX IX_Users_LastName ON [identity].Users (LastName) INCLUDE (FirstName, Email);
CREATE INDEX IX_Users_CreatedAtUtc ON [identity].Users (CreatedAtUtc) INCLUDE (Email);
CREATE INDEX IX_Payments_PaidAtUtc ON finance.Payments (PaidAtUtc) INCLUDE (InvoiceId, Amount);
CREATE INDEX IX_Invoices_Number ON finance.Invoices (InvoiceNumber);
GO
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SET STATISTICS XML ON;
-- 7.1 Before
SELECT Id, Email FROM [identity].Users WHERE YEAR(CreatedAtUtc) = 2026 AND MONTH(CreatedAtUtc) = 3;
-- 7.1 After
SELECT Id, Email FROM [identity].Users WHERE CreatedAtUtc >= '20260301' AND CreatedAtUtc < '20260401';

-- 7.2 Before: freeze the time so both versions use the same boundary.
DECLARE @Now datetime2 = SYSUTCDATETIME();
SELECT Id, InvoiceId, Amount FROM finance.Payments WHERE DATEDIFF(DAY, PaidAtUtc, @Now) <= 30;
-- 7.2 After: DATEDIFF counts midnight boundaries, not elapsed 24-hour periods.
-- The original also includes future payments, so this version does too.
SELECT Id, InvoiceId, Amount FROM finance.Payments
WHERE PaidAtUtc >= DATEADD(DAY, -30, CONVERT(datetime2, CONVERT(date, @Now)));

-- 7.3 Before
SELECT Id, FirstName, LastName FROM [identity].Users WHERE LEFT(LastName, 3) = N'Abd';
-- 7.3 After
SELECT Id, FirstName, LastName FROM [identity].Users WHERE LastName LIKE N'Abd%';

-- 7.4 Before
SELECT * FROM operations.AuditLogs WHERE Id + 1 = 50001;
-- 7.4 After
SELECT * FROM operations.AuditLogs WHERE Id = 50000;

-- 7.5 Before
SELECT Id, TotalAmount, PaidAmount FROM finance.Invoices WHERE InvoiceNumber = N'LAB-INV-2026-000001';
-- 7.5 After: InvoiceNumber is varchar(30).
SELECT Id, TotalAmount, PaidAmount FROM finance.Invoices WHERE InvoiceNumber = 'LAB-INV-2026-000001';

-- 7.6 Before
DECLARE @Email nvarchar(320) = N'it.admin@northbridge.edu';
SELECT Id, FirstName, LastName FROM [identity].Users WHERE UPPER(Email) = UPPER(@Email);
-- 7.6 After: this database has SQL_Latin1_General_CP1_CI_AS collation.
SELECT Id, FirstName, LastName FROM [identity].Users WHERE Email = @Email;

-- 7.7 Before
DECLARE @LastName nvarchar(100) = N'Hassan';
SELECT Id, FirstName, Email FROM [identity].Users WHERE @LastName IS NULL OR LastName = @LastName;
-- 7.7 After
SELECT Id, FirstName, Email FROM [identity].Users
WHERE @LastName IS NULL OR LastName = @LastName OPTION (RECOMPILE);

-- 7.8 Before
SELECT Id, InvoiceId, Amount FROM finance.Payments WHERE CONVERT(char(8), PaidAtUtc, 112) = '20261029';
-- 7.8 After
SELECT Id, InvoiceId, Amount FROM finance.Payments WHERE PaidAtUtc >= '20261029' AND PaidAtUtc < '20261030';
SET STATISTICS XML OFF;
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
