# Measured results

Measured on a restored copy of StudentDB using SQL Server 2025. Logical reads below are summed from the actual operators; complete STATISTICS IO output is also included.

## Task 6

Logical reads: 3,007 | CPU: 74 ms | Elapsed: 17 ms | Granted memory: 11712 KB

The plan returned 15 rows. My lookup/scan/sort prediction was broadly right, but I did not predict parallel execution (DOP 8), per-worker top-N sorts, or the ordered Gather Streams. Filtering is inside the invoice scan rather than a separate Filter node. The student lookup happens after each worker has reduced its invoice candidates. Compute Scalar evaluation is deferred.

Actual worker output is not the same as final output: the parallel sort and student lookup together produced 111 rows, while the outer TOP consumed 15. The invoice scan returned 50,427 qualifying rows. ActualRowsRead in the XML records all rows examined.

STATISTICS TIME reports coarse, separately measured counters; its 0 ms CPU is not proof that no CPU was used. QueryTimeStats and per-operator timers are separate instrumentation and should not be added together.

## Task 7

| Task | Reads before | Reads after | CPU ms before/after | Elapsed ms before/after | Rows before/after |
|---|---:|---:|---|---|---|
|7.1|1,006|13|12 / 0|25 / 6|1054 / 1054|
|7.2|599|76|19 / 5|23 / 13|15548 / 15548|
|7.3|1,267|20|9 / 0|9 / 1|839 / 839|
|7.4|130,937|4|3775 / 0|525 / 0|1 / 1|
|7.5|728|6|18 / 0|18 / 0|1 / 1|
|7.6|1,009|3|11 / 0|11 / 0|1 / 1|
|7.7|1,267|18|9 / 0|9 / 1|839 / 839|
|7.8|599|45|28 / 3|32 / 6|8916 / 8916|

## Task 8

- Compile for one row: estimated 1 rows, actual 1; grant 1024 KB; max used 0 KB; spill level none.
- Reuse for 100,000 rows: spill: estimated 1 rows, actual 100,000; grant 1024 KB; max used 1024 KB; spill level 2.
- Recompile for 100,000 rows: fixed: estimated 100000 rows, actual 100,000; grant 35408 KB; max used 24984 KB; spill level none.

The final practice table uses fixed-width CHAR(200), so the row width is known. Recompiling fixes the row-count underestimate. The corrected actual plan has no SpillToTempDb warning.

## Task 9

- DISTINCT Category: Hash Match (Aggregate), Clustered Index Scan (Clustered Index Scan).
- DISTINCT Id: Clustered Index Scan (Clustered Index Scan).

## Task 13

First sync: 201 inserts. After test edits: 2 updates. Third sync: 0 rows. The source edits were rolled back.

## Reading the screenshots

The PNG files are browser screenshots of the HTML evidence pages rendered directly from the actual .sqlplan XML. They are not screenshots of SSMS. Open the .sqlplan files in SSMS to inspect the native graphical plans and all tooltips. The HTML and raw messages remain available for verification.
