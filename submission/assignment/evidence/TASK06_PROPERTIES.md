# Task 6: every operator and its recorded properties

Values below are extracted without changing them from 06_plan_1.sqlplan. Properties repeated for different workers are separate counters. Child operators get their own sections.

## Node 0: Compute Scalar

Calculates the remaining amount or the displayed CASE expression. A deferred scalar may have no separate runtime counters.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 0 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Compute Scalar | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Compute Scalar | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 15 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateIO | 0 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 1.5e-06 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 64 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 2.38096 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 0 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | Expr1003 | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1005 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Column | Expr1005 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/ScalarString | CASE WHEN [Assignment3_Practice_20261127].[finance].[Invoices].[DueAtUtc] as [i].[DueAtUtc]<dateadd(day,(-60),sysutcdatetime()) THEN 'Urgent' ELSE 'Normal' END | Readable scalar expression or predicate. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/CompareOp | LT | Comparison such as EQ, LT or GT. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Intrinsic[0]/FunctionName | dateadd | Built-in scalar function. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Intrinsic[0]/ScalarOperator[0]/Const[0]/ConstValue | (4) | Literal constant used by an expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Intrinsic[0]/ScalarOperator[1]/Const[0]/ConstValue | (-60) | Literal constant used by an expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Intrinsic[0]/ScalarOperator[2]/Identifier[0]/ColumnReference[0]/Column | ConstExpr1007 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Condition[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Intrinsic[0]/ScalarOperator[2]/Identifier[0]/ColumnReference[0]/ScalarOperator[0]/Intrinsic[0]/FunctionName | sysutcdatetime | Built-in scalar function. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Then[1]/ScalarOperator[0]/Const[0]/ConstValue | 'Urgent' | Literal constant used by an expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/IF[0]/Else[2]/ScalarOperator[0]/Const[0]/ConstValue | 'Normal' | Literal constant used by an expression. |
## Node 1: Compute Scalar

Calculates the remaining amount or the displayed CASE expression. A deferred scalar may have no separate runtime counters.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 1 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Compute Scalar | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Compute Scalar | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 15 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateIO | 0 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 1.5e-06 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 65 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 2.38096 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 0 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | Expr1003 | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Column | Expr1003 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/ScalarString | [Assignment3_Practice_20261127].[identity].[StudentProfiles].[StudentNumber] as [sp].[StudentNumber] | Readable scalar expression or predicate. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Schema | [identity] | Object schema. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Table | [StudentProfiles] | Referenced table. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Alias | [sp] | Query alias. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Column | StudentNumber | Referenced column or internal expression. |
## Node 2: Top

Stops after 15 final rows. The optimizer can use this row goal to avoid unnecessary work.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 2 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Top | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Top | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 15 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateIO | 0 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 1.5e-06 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 65 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 2.38096 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 0 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[2]/Schema | [identity] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[2]/Table | [StudentProfiles] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[2]/Alias | [sp] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | StudentNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Thread | 0 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRows | 15 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualElapsedms | 9 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualCPUms | 0 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/Top[2]/RowCount | 0 | Whether this TOP operator implements SET ROWCOUNT; zero means it does not. |
| RelOp/Top[2]/IsPercent | 0 | Whether TOP is specified as a percentage. |
| RelOp/Top[2]/WithTies | 0 | Whether TOP includes equal ordering values at the boundary. |
| RelOp/Top[2]/TopExpression[0]/ScalarOperator[0]/ScalarString | (15) | Readable scalar expression or predicate. |
| RelOp/Top[2]/TopExpression[0]/ScalarOperator[0]/Const[0]/ConstValue | (15) | Literal constant used by an expression. |
## Node 3: Parallelism

Gather Streams combines worker output, preserving the requested order for the final TOP.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 3 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Parallelism | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Gather Streams | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 15 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateRowsWithoutRowGoal | 43531.7 | Estimated output without the TOP row goal. |
| RelOp/EstimateIO | 0 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 0.0286019 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 65 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 2.38096 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 1 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[2]/Schema | [identity] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[2]/Table | [StudentProfiles] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[2]/Alias | [sp] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | StudentNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Thread | 0 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRows | 15 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualElapsedms | 9 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualCPUms | 0 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/Parallelism[2]/OrderBy[0]/OrderByColumn[0]/Ascending | 0 | True means ascending order; false means descending. |
| RelOp/Parallelism[2]/OrderBy[0]/OrderByColumn[0]/ColumnReference[0]/Column | Expr1004 | Referenced column or internal expression. |
## Node 4: Nested Loops

For each selected invoice, looks up the student primary key. Few rows survive TOP, making repeated key seeks reasonable.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 4 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Nested Loops | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Left Outer Join | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 15 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateRowsWithoutRowGoal | 43531.7 | Estimated output without the TOP row goal. |
| RelOp/EstimateIO | 0 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 0.0227453 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 65 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 2.35236 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 1 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[2]/Schema | [identity] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[2]/Table | [StudentProfiles] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[2]/Alias | [sp] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | StudentNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Thread | 8 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRows | 13 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualElapsedms | 9 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualCPUms | 8 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/Thread | 7 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualElapsedms | 8 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualCPUms | 8 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/Thread | 6 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualElapsedms | 8 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualCPUms | 8 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/Thread | 5 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/Thread | 4 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/Thread | 3 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualElapsedms | 8 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualCPUms | 8 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/Thread | 2 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualElapsedms | 8 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualCPUms | 8 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/Thread | 1 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/Thread | 0 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualRows | 0 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualElapsedms | 0 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualCPUms | 0 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualExecutions | 0 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/NestedLoops[2]/Optimized | 0 | Whether an optimized nested-loops implementation is used. |
| RelOp/NestedLoops[2]/WithOrderedPrefetch | 1 | Whether ordered prefetch is enabled for inner lookups. |
| RelOp/NestedLoops[2]/OuterReferences[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/NestedLoops[2]/OuterReferences[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/NestedLoops[2]/OuterReferences[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/NestedLoops[2]/OuterReferences[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/NestedLoops[2]/OuterReferences[0]/ColumnReference[0]/Column | StudentId | Referenced column or internal expression. |
| RelOp/NestedLoops[2]/OuterReferences[0]/ColumnReference[1]/Column | Expr1008 | Referenced column or internal expression. |
## Node 6: Sort

Top-N sorting keeps the largest remaining amounts. No existing key provides this calculated ordering.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 6 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Sort | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Sort | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 15 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateRowsWithoutRowGoal | 43531.7 | Estimated output without the TOP row goal. |
| RelOp/EstimateIO | 0.00140766 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 0.384892 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 56 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 2.30021 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 1 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | StudentId | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[2]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[2]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[2]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/MemoryFractions[1]/Input | 1 | Fraction of the query memory grant needed during input processing. |
| RelOp/MemoryFractions[1]/Output | 1 | Fraction of the query memory grant needed during output processing. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/Thread | 8 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualRows | 13 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/UsedMemoryGrant | 632 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[0]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/Thread | 7 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/UsedMemoryGrant | 688 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[1]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/Thread | 6 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualCPUms | 6 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/UsedMemoryGrant | 712 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[2]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/Thread | 5 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualElapsedms | 5 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualCPUms | 5 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/UsedMemoryGrant | 424 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[3]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/Thread | 4 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualElapsedms | 6 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualCPUms | 6 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/UsedMemoryGrant | 512 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[4]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/Thread | 3 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/UsedMemoryGrant | 560 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[5]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/Thread | 2 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualElapsedms | 7 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualCPUms | 7 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/UsedMemoryGrant | 584 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[6]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/Thread | 1 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualElapsedms | 5 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualCPUms | 5 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualRebinds | 1 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/InputMemoryGrant | 1368 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/OutputMemoryGrant | 984 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/UsedMemoryGrant | 600 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[7]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/Thread | 0 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualRows | 0 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualElapsedms | 0 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualCPUms | 0 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualRebinds | 0 | Actual reinitializations with changed correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualRewinds | 0 | Actual reinitializations with unchanged correlated values. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualExecutions | 0 | Number of executions on this thread. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/InputMemoryGrant | 0 | Memory granted for this operator input phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/OutputMemoryGrant | 0 | Memory granted for this operator output phase, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/UsedMemoryGrant | 0 | Memory actually used by this operator, KB. |
| RelOp/RunTimeInformation[2]/RunTimeCountersPerThread[8]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/Sort[3]/Distinct | 0 | Whether sorting also removes duplicates. |
| RelOp/Sort[3]/OrderBy[0]/OrderByColumn[0]/Ascending | 0 | True means ascending order; false means descending. |
| RelOp/Sort[3]/OrderBy[0]/OrderByColumn[0]/ColumnReference[0]/Column | Expr1004 | Referenced column or internal expression. |
## Node 7: Compute Scalar

Calculates the remaining amount or the displayed CASE expression. A deferred scalar may have no separate runtime counters.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 7 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Compute Scalar | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Compute Scalar | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 43531.7 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimateIO | 0 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 0.001835 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 74 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 1.89776 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/Parallel | 1 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | StudentId | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[2]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[2]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[2]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Column | Expr1004 | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/ScalarString | [Assignment3_Practice_20261127].[finance].[Invoices].[TotalAmount] as [i].[TotalAmount]-[Assignment3_Practice_20261127].[finance].[Invoices].[PaidAmount] as [i].[PaidAmount] | Readable scalar expression or predicate. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/Operation | SUB | Scalar arithmetic operation. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Column | TotalAmount | Referenced column or internal expression. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/ComputeScalar[1]/DefinedValues[0]/DefinedValue[0]/ScalarOperator[1]/Arithmetic[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Column | PaidAmount | Referenced column or internal expression. |
## Node 8: Clustered Index Scan

Reads invoice data and evaluates the overdue/unpaid predicate. There is no covering ordered index for this expression.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 8 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Clustered Index Scan | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Clustered Index Scan | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 43531.7 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimatedRowsRead | 146800 | Estimated rows accessed before residual filtering. |
| RelOp/EstimateIO | 1.87572 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 0.0202046 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 65 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 1.89592 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/TableCardinality | 146800 | Base table row-count estimate. |
| RelOp/Parallel | 1 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 0 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[1]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[1]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[1]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[1]/Column | StudentId | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[2]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[2]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[2]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[2]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[2]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[3]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[3]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[3]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[3]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[3]/Column | TotalAmount | Referenced column or internal expression. |
| RelOp/OutputList[0]/ColumnReference[4]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[4]/Schema | [finance] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[4]/Table | [Invoices] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[4]/Alias | [i] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[4]/Column | PaidAmount | Referenced column or internal expression. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Thread | 8 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRows | 6811 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualElapsedms | 4 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLogicalReads | 324 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRowsRead | 19126 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/Thread | 7 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualRows | 7409 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualElapsedms | 3 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLogicalReads | 399 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualRowsRead | 21535 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/Thread | 6 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualRows | 7586 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualElapsedms | 3 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLogicalReads | 399 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualRowsRead | 21497 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/Thread | 5 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualRows | 4421 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualElapsedms | 3 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLogicalReads | 261 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualRowsRead | 14735 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/Thread | 4 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualRows | 5544 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualElapsedms | 3 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLogicalReads | 263 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualRowsRead | 15015 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/Thread | 3 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualRows | 6035 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualElapsedms | 4 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLogicalReads | 322 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualRowsRead | 17302 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/Thread | 2 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualRows | 6328 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualElapsedms | 4 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualCPUms | 4 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLogicalReads | 331 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualRowsRead | 17333 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/Thread | 1 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualRows | 6293 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualElapsedms | 3 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualCPUms | 3 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLogicalReads | 352 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualRowsRead | 20257 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualEndOfScans | 1 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualExecutions | 1 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/Thread | 0 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualRows | 0 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualElapsedms | 0 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualCPUms | 0 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualScans | 1 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLogicalReads | 23 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualExecutions | 0 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/IndexScan[2]/Ordered | 0 | Whether the access operator must return index-key order. |
| RelOp/IndexScan[2]/ForcedIndex | 0 | Whether a query hint forced an index. |
| RelOp/IndexScan[2]/ForceScan | 0 | Whether a hint forced a scan. |
| RelOp/IndexScan[2]/NoExpandHint | 0 | Whether an indexed-view NOEXPAND hint was used. |
| RelOp/IndexScan[2]/Storage | RowStore | Row-store or column-store storage. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Column | InvoiceNumber | Referenced column or internal expression. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[1]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[1]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[1]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[1]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[1]/ColumnReference[0]/Column | StudentId | Referenced column or internal expression. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[2]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[2]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[2]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[2]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[2]/ColumnReference[0]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[3]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[3]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[3]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[3]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[3]/ColumnReference[0]/Column | TotalAmount | Referenced column or internal expression. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[4]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[4]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[4]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[4]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[4]/ColumnReference[0]/Column | PaidAmount | Referenced column or internal expression. |
| RelOp/IndexScan[2]/Object[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/Object[1]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/Object[1]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/Object[1]/Index | [PK_Invoices] | Referenced index. |
| RelOp/IndexScan[2]/Object[1]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/Object[1]/IndexKind | Clustered | Clustered/nonclustered index category. |
| RelOp/IndexScan[2]/Object[1]/Storage | RowStore | Row-store or column-store storage. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/ScalarString | [Assignment3_Practice_20261127].[finance].[Invoices].[DueAtUtc] as [i].[DueAtUtc]<sysutcdatetime() AND [Assignment3_Practice_20261127].[finance].[Invoices].[PaidAmount] as [i].[PaidAmount]<[Assignment3_Practice_20261127].[finance].[Invoices].[TotalAmount] as [i].[TotalAmount] | Readable scalar expression or predicate. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/Operation | AND | Scalar arithmetic operation. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/CompareOp | LT | Comparison such as EQ, LT or GT. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Column | DueAtUtc | Referenced column or internal expression. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Column | ConstExpr1006 | Referenced column or internal expression. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[0]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/ScalarOperator[0]/Intrinsic[0]/FunctionName | sysutcdatetime | Built-in scalar function. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/CompareOp | LT | Comparison such as EQ, LT or GT. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Column | PaidAmount | Referenced column or internal expression. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/Predicate[2]/ScalarOperator[0]/Logical[0]/ScalarOperator[1]/Compare[0]/ScalarOperator[1]/Identifier[0]/ColumnReference[0]/Column | TotalAmount | Referenced column or internal expression. |
## Node 9: Clustered Index Seek

Uses the student primary key to find the matching StudentNumber.

| Property path | Recorded value | Meaning |
|---|---|---|
| RelOp/NodeId | 9 | Identifier of this operator, not an execution order. |
| RelOp/PhysicalOp | Clustered Index Seek | Algorithm SQL Server executes. |
| RelOp/LogicalOp | Clustered Index Seek | Relational operation implemented by that algorithm. |
| RelOp/EstimateRows | 1 | Optimizer estimate of output rows for the operator. |
| RelOp/EstimatedRowsRead | 1 | Estimated rows accessed before residual filtering. |
| RelOp/EstimateIO | 0.003125 | Estimated I/O cost in optimizer cost units, not a count of reads. |
| RelOp/EstimateCPU | 0.0001581 | Estimated CPU cost in optimizer cost units, not milliseconds. |
| RelOp/AvgRowSize | 26 | Estimated average row size in bytes. |
| RelOp/EstimatedTotalSubtreeCost | 0.0521449 | Estimated cost of this operator and its descendants; do not sum overlapping subtrees. |
| RelOp/TableCardinality | 85000 | Base table row-count estimate. |
| RelOp/Parallel | 1 | Whether this operator runs in the parallel region. |
| RelOp/EstimateRebinds | 14.9994 | Estimated repeated initializations when correlated input changes. |
| RelOp/EstimateRewinds | 0.000344576 | Estimated repeated initializations reusing unchanged correlated input. |
| RelOp/EstimatedExecutionMode | Row | Planned row or batch execution. |
| RelOp/OutputList[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/OutputList[0]/ColumnReference[0]/Schema | [identity] | Object schema. |
| RelOp/OutputList[0]/ColumnReference[0]/Table | [StudentProfiles] | Referenced table. |
| RelOp/OutputList[0]/ColumnReference[0]/Alias | [sp] | Query alias. |
| RelOp/OutputList[0]/ColumnReference[0]/Column | StudentNumber | Referenced column or internal expression. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Thread | 8 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRows | 13 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLogicalReads | 39 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualRowsRead | 13 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutions | 13 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[0]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/Thread | 7 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[1]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/Thread | 6 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[2]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/Thread | 5 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[3]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/Thread | 4 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[4]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/Thread | 3 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[5]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/Thread | 2 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[6]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/Thread | 1 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualRows | 14 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualElapsedms | 1 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualCPUms | 1 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLogicalReads | 42 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualRowsRead | 14 | Rows examined by this thread before filtering. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualExecutions | 14 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[7]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/Thread | 0 | Worker identifier; thread 0 is the coordinating thread in a parallel plan. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualRows | 0 | Rows emitted by this thread across its executions. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/Batches | 0 | Number of execution batches in this runtime counter. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualElapsedms | 0 | Measured wall-clock milliseconds; overlaps with other operators/threads. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualCPUms | 0 | Measured CPU milliseconds for this thread; do not sum parent and child time blindly. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualScans | 0 | Runtime scan starts on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLogicalReads | 0 | 8 kb page accesses in the buffer cache on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualPhysicalReads | 0 | 8 kb pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualReadAheads | 0 | Pages fetched ahead of demand on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLobLogicalReads | 0 | Logical accesses for large object pages on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLobPhysicalReads | 0 | Large object pages read from storage on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualLobReadAheads | 0 | Large object pages read ahead on this thread; zero means none recorded. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualEndOfScans | 0 | Number of times this thread reached the end of its input. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualExecutions | 0 | Number of executions on this thread. |
| RelOp/RunTimeInformation[1]/RunTimeCountersPerThread[8]/ActualExecutionMode | Row | Observed row or batch execution. |
| RelOp/IndexScan[2]/Ordered | 1 | Whether the access operator must return index-key order. |
| RelOp/IndexScan[2]/ScanDirection | FORWARD | Forward or backward traversal. |
| RelOp/IndexScan[2]/ForcedIndex | 0 | Whether a query hint forced an index. |
| RelOp/IndexScan[2]/ForceSeek | 0 | Whether a hint forced a seek. |
| RelOp/IndexScan[2]/ForceScan | 0 | Whether a hint forced a scan. |
| RelOp/IndexScan[2]/NoExpandHint | 0 | Whether an indexed-view NOEXPAND hint was used. |
| RelOp/IndexScan[2]/Storage | RowStore | Row-store or column-store storage. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Schema | [identity] | Object schema. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Table | [StudentProfiles] | Referenced table. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Alias | [sp] | Query alias. |
| RelOp/IndexScan[2]/DefinedValues[0]/DefinedValue[0]/ColumnReference[0]/Column | StudentNumber | Referenced column or internal expression. |
| RelOp/IndexScan[2]/Object[1]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/Object[1]/Schema | [identity] | Object schema. |
| RelOp/IndexScan[2]/Object[1]/Table | [StudentProfiles] | Referenced table. |
| RelOp/IndexScan[2]/Object[1]/Index | [PK_StudentProfiles] | Referenced index. |
| RelOp/IndexScan[2]/Object[1]/Alias | [sp] | Query alias. |
| RelOp/IndexScan[2]/Object[1]/IndexKind | Clustered | Clustered/nonclustered index category. |
| RelOp/IndexScan[2]/Object[1]/Storage | RowStore | Row-store or column-store storage. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/ScanType | EQ | Seek comparison kind, such as EQ for equality. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeColumns[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeColumns[0]/ColumnReference[0]/Schema | [identity] | Object schema. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeColumns[0]/ColumnReference[0]/Table | [StudentProfiles] | Referenced table. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeColumns[0]/ColumnReference[0]/Alias | [sp] | Query alias. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeColumns[0]/ColumnReference[0]/Column | Id | Referenced column or internal expression. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeExpressions[1]/ScalarOperator[0]/ScalarString | [Assignment3_Practice_20261127].[finance].[Invoices].[StudentId] as [i].[StudentId] | Readable scalar expression or predicate. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeExpressions[1]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Database | [Assignment3_Practice_20261127] | Database containing the referenced object. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeExpressions[1]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Schema | [finance] | Object schema. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeExpressions[1]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Table | [Invoices] | Referenced table. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeExpressions[1]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Alias | [i] | Query alias. |
| RelOp/IndexScan[2]/SeekPredicates[2]/SeekPredicateNew[0]/SeekKeys[0]/Prefix[0]/RangeExpressions[1]/ScalarOperator[0]/Identifier[0]/ColumnReference[0]/Column | StudentId | Referenced column or internal expression. |

## Other plan-level numbers

MemoryGrantInfo values are KB, except GrantWaitTime (milliseconds). RequiredMemory is the minimum for execution, DesiredMemory is the target for in-memory processing, RequestedMemory is what was requested, GrantedMemory is what was received, and MaxUsedMemory is the peak observed use. Serial values describe a serial version of the plan. MaxQueryMemory is the applicable grant limit.

DegreeOfParallelism is the number of parallel workers used. ReservedThreads and UsedThreads describe thread allocation. CompileTime and CompileCPU are milliseconds; CompileMemory and CachedPlanSize are KB. StatementSubTreeCost is an optimizer comparison cost, not seconds. StatementEstRows is the estimated final output.

WaitStats records wait category, number of waits and cumulative milliseconds. StatisticsInfo records the statistics object, last update, sampled percentage and modifications since update. MissingIndexes/Impact is an optimizer suggestion with estimated benefit, not a measured speedup; it is not applied by this solution.

The SQL Server build and cardinality-estimation version identify the environment. QueryHash and QueryPlanHash are fingerprints, not performance scores. Session SET options explain compilation semantics. The complete statement text and raw XML remain in the original file.
