-- 5.1
SELECT Code AS [Course Code], Title AS [Course Title], CreditHours AS [Credit Hours]
FROM academic.Courses ORDER BY CreditHours DESC, Title;
-- 5.2
SELECT TOP (5) Id, StudentNumber, UserId FROM [identity].StudentProfiles ORDER BY NEWID();
-- 5.3
SELECT Id, Email FROM [identity].Users
WHERE DATALENGTH(Email) <> DATALENGTH(TRIM(Email));
-- 5.4
SELECT Id, Email FROM [identity].Users
WHERE Email COLLATE Latin1_General_100_BIN2 <> LOWER(Email) COLLATE Latin1_General_100_BIN2;
-- 5.5
SELECT Id, Email FROM [identity].Users
WHERE CHARINDEX('@', Email) <= 1
   OR CHARINDEX('.', Email, CHARINDEX('@', Email) + 1) = 0;
-- 5.6
SELECT DISTINCT LOWER(TRIM(SUBSTRING(Email, CHARINDEX('@', Email) + 1, 320))) AS Provider
FROM [identity].Users WHERE CHARINDEX('@', Email) > 1
ORDER BY Provider;
-- 5.7
SELECT Id, FirstName, LastName, LastLoginAtUtc FROM [identity].Users
ORDER BY CASE WHEN LastLoginAtUtc IS NULL THEN 1 ELSE 0 END, LastLoginAtUtc DESC, Id;
-- 5.8
SELECT * FROM finance.Payments WHERE PaidAtUtc >= '20261001' AND PaidAtUtc < '20261101';
-- 5.9
SELECT Id, Amount, PaidAtUtc AT TIME ZONE 'UTC' AT TIME ZONE 'Egypt Standard Time' AS CairoTime
FROM finance.Payments
WHERE CONVERT(time, PaidAtUtc AT TIME ZONE 'UTC' AT TIME ZONE 'Egypt Standard Time') >= '00:00:00'
  AND CONVERT(time, PaidAtUtc AT TIME ZONE 'UTC' AT TIME ZONE 'Egypt Standard Time') < '05:00:00';
-- 5.10
SET DATEFIRST 1;
SELECT * FROM attendance.AttendanceSessions WHERE DATEPART(WEEKDAY, SessionDate) = 5;
-- 5.11
-- Stored as local digits (01...), +20..., or 0020..., without separators.
SELECT Id, FirstName, PhoneNumber FROM [identity].Users
WHERE (LEN(TRIM(PhoneNumber)) = 11 AND TRIM(PhoneNumber) LIKE '01[0125]%'
       AND TRIM(PhoneNumber) NOT LIKE '%[^0-9]%')
   OR (LEN(TRIM(PhoneNumber)) = 13 AND TRIM(PhoneNumber) LIKE '+201[0125]%'
       AND SUBSTRING(TRIM(PhoneNumber), 2, 30) NOT LIKE '%[^0-9]%')
   OR (LEN(TRIM(PhoneNumber)) = 14 AND TRIM(PhoneNumber) LIKE '00201[0125]%'
       AND TRIM(PhoneNumber) NOT LIKE '%[^0-9]%');
-- 5.12
SELECT Id, CASE WHEN PhoneNumber IS NULL THEN NULL
    WHEN LEN(TRIM(PhoneNumber)) <= 5 THEN REPLICATE('*', LEN(TRIM(PhoneNumber)))
    ELSE LEFT(TRIM(PhoneNumber), 3) + REPLICATE('*', LEN(TRIM(PhoneNumber)) - 5)
         + RIGHT(TRIM(PhoneNumber), 2) END AS MaskedPhone
FROM [identity].Users;
-- 5.13
SELECT InvoiceNumber, TRY_CONVERT(bigint, RIGHT(InvoiceNumber,
    CASE WHEN CHARINDEX('-', REVERSE(InvoiceNumber)) > 0
    THEN CHARINDEX('-', REVERSE(InvoiceNumber)) - 1 ELSE 0 END)) AS RunningNumber
FROM finance.Invoices ORDER BY RunningNumber;
-- 5.14
SELECT Title, CASE WHEN EstimatedMinutes IS NULL THEN 'Not set'
    ELSE CONCAT(EstimatedMinutes / 60, ' h ', EstimatedMinutes % 60, ' min') END AS Duration
FROM content.Lessons;
-- 5.15
SELECT * FROM communication.Announcements WHERE Title LIKE '%[%]%' OR Body LIKE '%[%]%';
-- 5.16
SELECT TOP (5) WITH TIES * FROM finance.Invoices ORDER BY TotalAmount DESC;
-- 5.17
SELECT TOP (10) PERCENT * FROM finance.Payments ORDER BY Amount DESC, Id;
-- 5.18
SELECT * FROM delivery.Sections WHERE Location <> N'Hall A' OR Location IS NULL;
-- 5.19
SELECT InvoiceNumber, TotalAmount - PaidAmount AS Remaining,
    CASE WHEN PaidAmount > 0 THEN 'Partially paid' ELSE 'Not paid' END AS PaymentState,
    CASE WHEN DueAtUtc < SYSUTCDATETIME() THEN 'Overdue' ELSE 'Not overdue' END AS DueState,
    CAST(PaidAmount * 100.0 / NULLIF(TotalAmount, 0) AS decimal(6,1)) AS PercentPaid
FROM finance.Invoices WHERE PaidAmount < TotalAmount ORDER BY Remaining DESC, Id;
-- 5.20
SELECT Id, FirstName, LastName, Email, CreatedAtUtc FROM [identity].Users
ORDER BY CreatedAtUtc DESC, Id DESC OFFSET 40 ROWS FETCH NEXT 20 ROWS ONLY;
-- 5.21
DECLARE @LastSeenId bigint = 0; -- Replace with the last id returned to the screen.
SELECT TOP (50) * FROM operations.AuditLogs WHERE Id > @LastSeenId ORDER BY Id;
-- 5.22
-- TOP without ORDER BY does not mean latest.
SELECT TOP (10) * FROM finance.Payments ORDER BY PaidAtUtc DESC, Id DESC;
-- 5.23
-- If a title is repeated, use its longest available estimate for one consistent label.
SELECT TOP (10) UPPER(TRIM(Title)) AS Title, LEN(TRIM(Title)) AS TitleLength,
    CASE WHEN MAX(EstimatedMinutes) IS NULL THEN 'Not set'
         WHEN MAX(EstimatedMinutes) <= 15 THEN 'Quick'
         WHEN MAX(EstimatedMinutes) <= 45 THEN 'Standard' ELSE 'Long' END AS DurationType
FROM content.Lessons WHERE IsPublished = 1 AND LEN(TRIM(Title)) > 40
GROUP BY UPPER(TRIM(Title)), LEN(TRIM(Title)) ORDER BY TitleLength DESC, Title;
-- 5.24
SELECT TOP (12) CONVERT(char(7), DueAtUtc, 126) AS DueMonth, CurrencyCode,
    CASE WHEN PaidAmount > 0 THEN 'Partially paid' ELSE 'Not paid' END AS PaymentState,
    COUNT(*) AS InvoiceCount, SUM(TotalAmount - PaidAmount) AS Remaining
FROM finance.Invoices WHERE DueAtUtc < SYSUTCDATETIME() AND PaidAmount < TotalAmount
GROUP BY CONVERT(char(7), DueAtUtc, 126), CurrencyCode,
    CASE WHEN PaidAmount > 0 THEN 'Partially paid' ELSE 'Not paid' END
ORDER BY DueMonth DESC, CurrencyCode, PaymentState;
