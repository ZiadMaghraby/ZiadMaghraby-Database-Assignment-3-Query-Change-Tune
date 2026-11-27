# Database Assignment 3

## Evidence files

- [Measured results and comparisons](evidence/MEASUREMENTS.md)
- [Task 6 operator properties explained](evidence/TASK06_PROPERTIES.md)
- [Checks that the tuning rewrites return the same rows](evidence/VALIDATION.txt)
- [Task 6 plan and measurements](evidence/task06.png)
- [Task 8 spill before and after](evidence/task08.png)
- [Task 9 DISTINCT plans](evidence/task09.png)

Task 7 screenshots are named `task07_1.png` through `task07_8.png`. All screenshots are rendered views of actual captured execution-plan XML, not SSMS screenshots. The original `.sqlplan` files are included and can be opened in SSMS. If the mentor specifically requires the SSMS interface, take those screenshots from the included plans before submission.

## Running the files

The database supplied locally is named `StudentDB`. Its tables match the LMS tables in the assignment. The scripts were tested on a separate restored copy, `Assignment3_Practice_20261127`. Select your own practice copy in SSMS before running any file. Run the numbered files in order, once. Task 10 is answered below. Save the Task 8 and 9 evidence before Task 11 removes their practice table.

The files do not create a replacement LMS database. They need the supplied tables and data. Task 2 uses DSAI, DSAI-101 and Summer 2027; if those already exist, use a different code/name consistently in the later tasks too.

## 1–4

The finance list uses a local temporary table, so editing its priority does not edit the invoices. StudentNumber identifies who owes the money. Task 1 uses calendar months because the question says months; Task 6 uses 60 days because its given query says 60 days.

The department, course, term, announcement and role are inserted together in a transaction. A NULL SectionId makes the announcement general. The example uses an existing user as its author.

A sequence is shared by all applications using this database. Rolling back does not return a number to the sequence. Gaps are normal. The setup starts above existing numeric suffixes to avoid the supplied invoice numbers, and it must only be run once. Six digits are the minimum width, not a limit that wraps back to zero. See [Microsoft's sequence explanation](https://learn.microsoft.com/en-us/sql/relational-databases/sequence-numbers/sequence-numbers).

Task 4 chooses the term with the latest start date, excluding the newly inserted Summer 2027 term. INSERT...SELECT copies its sections in one statement. The task asks for sections, so it does not copy enrollment or instructor assignments.

## 5

- 5.3: SQL string equality can ignore trailing spaces. DATALENGTH compares actual bytes before and after TRIM. TRIM here means ordinary spaces, not every possible whitespace character.
- 5.4: The database is case-insensitive. A binary collation detects uppercase characters.
- 5.5: These are the three requested checks, not a complete email validator.
- 5.8: October is treated as the UTC month stored in PaidAtUtc. The exclusive November boundary includes all times on 31 October.
- 5.9: Convert UTC to Egypt Standard Time, then filter from 00:00 inclusive to 05:00 exclusive. This uses the installed time-zone rules rather than assuming the same offset all year.
- 5.10: DATEFIRST is set explicitly so Friday does not depend on the connection's previous setting.
- 5.11: The accepted prefixes are 010, 011, 012 and 015. The query accepts local, +20 and 0020 forms without internal separators. Prefixes identify eligible mobile number formats, not a guaranteed current carrier.
- 5.12: Short, malformed values are fully masked instead of causing a negative REPLICATE length.
- 5.16: WITH TIES uses amount alone, so equal fifth-place amounts are included.
- 5.17: TOP PERCENT rounds up to a whole row. Id makes equal-amount selection repeatable; the question does not ask for ties here.
- 5.19: NULLIF protects division by zero. A missing due date is treated as not known to be overdue.
- 5.20: Page 3 skips 40 rows. Id breaks ties in the creation time.
- 5.21: The client supplies its last displayed Id. Seeking after that Id avoids skipping thousands of previous pages.
- 5.22: Without ORDER BY, TOP does not promise the latest rows.
- 5.23: One normalized title can belong to several lessons with different estimates. I use the largest known estimate for that title; if all are NULL, the label is Not set. This gives exactly one row per trimmed uppercase title without a subquery.
- 5.24: Payment state, currency and due month together define each group. The extra ordering columns make the choice of 12 rows repeatable.

## 6: Reading the plan

Before running, I expected an invoice scan, filtering, a scalar calculation, a student primary-key lookup, a top-N sort and TOP. The actual observations and properties are in the evidence files.

There is a conflict in the PDF: the supplied Task 6 query uses an explicit table combination, but the instructions say answers must not use JOIN. My submitted SQL uses a scalar subquery for StudentNumber. StudentId is a required foreign key, and StudentProfiles.Id is unique, so it returns the same pairs. SQL Server can still choose a join operator internally. That is an execution-plan choice, not a JOIN in the submitted SQL.

## 7: Why the rewrites help

7.1: YEAR and MONTH calculate a value for each row. A half-open date range can seek in CreatedAtUtc.

7.2: DATEDIFF counts date boundaries. Subtracting 30 days from the current timestamp would change the answer. The equivalent lower bound is midnight 30 days ago. The original includes future dates, so I did not add an upper bound. Both versions use one saved timestamp. See [DATEDIFF documentation](https://learn.microsoft.com/en-us/sql/t-sql/functions/datediff-transact-sql).

7.3: LEFT wraps the indexed column. A prefix LIKE pattern can seek to the matching range.

7.4: Move the arithmetic to the constant: Id = 50000.

7.5: InvoiceNumber is varchar, but the N-prefixed literal is nvarchar. Matching the types avoids converting the indexed column. The actual effect depends on the collation and plan.

7.6: SQL_Latin1_General_CP1_CI_AS already compares without case sensitivity. UPPER is unnecessary in this database. Removing it would not be equivalent in every case-sensitive database.

7.7: RECOMPILE lets SQL Server simplify the optional condition for the current value. This costs compilation CPU. Newer versions can also optimize some optional predicates automatically, so the measured improvement is not guaranteed for every server or parameter.

7.8: Converting the payment timestamp to a string hides the indexed date value. A date range keeps it searchable.

An index seek is not automatically cheaper than a scan. If most rows qualify, a scan can be reasonable. The recorded logical reads and returned row counts matter more than the operator name alone. Timings are one local run, not a production benchmark.

## 8: Sort spill

The practice procedure first compiles for one row. Its next call asks for 100,000 rows and reuses that estimate. Ordering by Padding needs a sort because the clustered key is Id. The small estimate leads to too little sorting memory, and SQL Server writes intermediate runs to tempdb. Extra disk work makes this slower.

Spill level describes the merge passes used to complete the spilled sort. It is not the number of rows or the number of megabytes. A higher level means more passes. Recompiling the call uses the large parameter value and requests a suitable grant. Memory-grant feedback is disabled only for this demonstration so it does not silently repair the reused grant before the comparison. Statistics are already current; this example's cause is parameter-dependent plan reuse.

The evidence records the actual warning, grant and row estimates before and after. See [Microsoft's memory-grant guide](https://learn.microsoft.com/en-us/troubleshoot/sql/database-engine/performance/troubleshoot-memory-grant-issues).

## 9: DISTINCT

Category has no index. A hash aggregate can keep one entry per encountered category without requiring sorted input. A stream aggregate can remove adjacent duplicates using less working memory when rows already arrive ordered by Category, for example from an index beginning with Category. Adding a sort just to use a stream aggregate might cost more than hashing.

Id is a primary key, so it is already unique. DISTINCT on Id needs no duplicate-removal work; the optimizer can read the key directly. The evidence states the operators actually chosen on this copy.

## 10: Numbers or GUIDs?

An int uses 4 bytes and a bigint uses 8. They are small, easy to read, and make smaller indexes and foreign keys. An IDENTITY is simple when one database creates the rows. A shared sequence also works when several tables need numbers. Increasing keys usually have good locality, but heavy concurrent inserts can contend on the last index page. Neither IDENTITY nor a sequence guarantees no gaps.

A uniqueidentifier uses 16 bytes. Applications can create GUIDs before contacting the database, which helps with offline clients and merging independently created data. Random GUIDs make wider indexes and, as clustered keys, can cause page splits and poor locality. NEWSEQUENTIALID reduces random insertion, but should not be treated as a secret or as globally increasing across restarts and machines.

For this LMS, I would normally use int/bigint internally. If public URLs need opaque identifiers, a separate GUID can be added. An identifier is never a replacement for authorization checks.

## 11–13

11.2: Completed and failed enrollments with final scores get grades. Withdrawn and dropped enrollments are not graded just because their status is final.

11.3: Role assignments are removed before the role so the foreign key is respected. This runs on the practice database.

11.4: TRUNCATE deallocates the staging table's data pages instead of deleting every row individually. It also resets its identity counter. It is appropriate for this disposable table without incoming foreign keys.

11.5: Cleanup removes only the named disposable practice objects. The numbering sequence and the later audit/archive/catalog objects have continuing uses.

12.1: OUTPUT gives both deleted.PassingScore and inserted.PassingScore from the same UPDATE. ORIGINAL_LOGIN records the database login doing the change. A real application using a shared service account would also need to pass its authenticated user identity.

12.2: DELETE...OUTPUT moves every deleted column into an archive in the same statement. A row with no expiry is not deleted. Six months means calendar months.

13: MERGE inserts active new courses, updates changed values and visibility, and hides missing source courses without deleting catalog rows. All courses remain in the source so deactivation can be detected. The update condition excludes unchanged rows. A second run after the two test edits should output two updates, and the third should output no rows. The edits and those two test runs are rolled back afterwards. HOLDLOCK protects the target matching step during the statement.

## Submission

Put this folder under `submission/assignment/` in the existing repository. The screenshot specifies branch `assignment/1-13` and PR title `[S1-A13] Database-Assignment-3-Query-Change-Tune`. No GitHub push or pull request was made as part of preparing these local files.
