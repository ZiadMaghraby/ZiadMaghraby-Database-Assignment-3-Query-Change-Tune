-- 6
-- Prediction BEFORE execution: invoice scan, filter, scalar calculation,
-- student primary-key lookup for each matching invoice, top-N sort, top.
-- The supplied query was expressed with a scalar lookup to follow the no-JOIN rule.
-- StudentId is a required foreign key, so the same invoice/student pairs are returned.
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SET STATISTICS XML ON;
SELECT TOP (15) i.InvoiceNumber,
    (SELECT sp.StudentNumber FROM [identity].StudentProfiles AS sp WHERE sp.Id = i.StudentId) AS StudentNumber,
    i.TotalAmount - i.PaidAmount AS Remaining,
    CASE WHEN i.DueAtUtc < DATEADD(DAY, -60, SYSUTCDATETIME()) THEN 'Urgent' ELSE 'Normal' END AS Urgency
FROM finance.Invoices AS i
WHERE i.PaidAmount < i.TotalAmount AND i.DueAtUtc < SYSUTCDATETIME()
ORDER BY Remaining DESC;
SET STATISTICS XML OFF;
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
