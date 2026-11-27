-- Run all files on a practice copy of StudentDB, in file-number order.
-- 1.1
DECLARE @Now datetime2 = SYSUTCDATETIME();
SELECT i.Id, i.InvoiceNumber,
       (SELECT StudentNumber FROM [identity].StudentProfiles WHERE Id = i.StudentId) AS StudentNumber,
       i.TotalAmount, i.PaidAmount,
       i.TotalAmount - i.PaidAmount AS Remaining,
       DATEDIFF(DAY, i.DueAtUtc, @Now) AS DaysLate,
       i.DueAtUtc
INTO #LateInvoices
FROM finance.Invoices AS i
WHERE i.DueAtUtc < @Now AND i.PaidAmount < i.TotalAmount;

-- 1.2
ALTER TABLE #LateInvoices ADD Priority varchar(10);
UPDATE #LateInvoices
SET Priority = CASE
    WHEN DueAtUtc < DATEADD(MONTH, -2, @Now) OR Remaining > 10000 THEN 'Urgent'
    WHEN DueAtUtc < DATEADD(MONTH, -1, @Now) THEN 'Medium'
    ELSE 'Low' END;

-- 1.3
SELECT InvoiceNumber, StudentNumber, TotalAmount, PaidAmount, Remaining, DaysLate, Priority
FROM #LateInvoices
ORDER BY CASE Priority WHEN 'Urgent' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END,
         Remaining DESC, Id;
DROP TABLE #LateInvoices;
