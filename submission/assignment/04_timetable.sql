-- 4
DECLARE @SummerId int = (SELECT Id FROM delivery.AcademicTerms WHERE Name = N'Summer 2027');
DECLARE @SourceTermId int = (SELECT TOP (1) Id FROM delivery.AcademicTerms
    WHERE Id <> @SummerId
    ORDER BY StartDate DESC, Id DESC);
INSERT INTO delivery.Sections (CourseId, TermId, SectionCode, Capacity, Location, DeliveryMode, Status)
SELECT CourseId, @SummerId, SectionCode, Capacity, Location, DeliveryMode, Status
FROM delivery.Sections WHERE TermId = @SourceTermId;
SELECT * FROM delivery.Sections WHERE TermId = @SummerId ORDER BY Id;
