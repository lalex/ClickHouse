SET partial_merge_join = 0;

SELECT number as n, j FROM numbers(4)
ANY LEFT JOIN (
    SELECT number * 2 AS n, number + 10 AS j
    FROM numbers(4000)
) js2
USING n;

SET max_rows_in_join = 1000;

SELECT number as n, j FROM numbers(4)
ANY LEFT JOIN (
    SELECT number * 2 AS n, number + 10 AS j
    FROM numbers(4000)
) js2
USING n; -- { serverError 191 }

SET partial_merge_join = 1;

SELECT number as n, j FROM numbers(4)
ANY LEFT JOIN (
    SELECT number * 2 AS n, number + 10 AS j
    FROM numbers(4000)
) js2
USING n;

SET partial_merge_join_optimizations = 1;

SELECT number as n, j FROM numbers(4)
ANY LEFT JOIN (
    SELECT number * 2 AS n, number + 10 AS j
    FROM numbers(4000)
) js2
USING n;
