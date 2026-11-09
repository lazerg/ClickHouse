-- WITH FILL STALENESS over a Nullable(UInt64) key with a NULL row must pass the NULL row through, like for the
-- other Nullable integer types, instead of throwing BAD_GET.

SELECT x FROM (SELECT if(number = 1, NULL, number * 3)::Nullable(UInt64) AS x FROM numbers(4)) ORDER BY x WITH FILL STALENESS 2;
SELECT '---';
SELECT x FROM (SELECT if(number = 1, NULL, number * 3)::Nullable(UInt64) AS x FROM numbers(4)) ORDER BY x DESC WITH FILL STALENESS -2;
SELECT '---';
SELECT x FROM (SELECT if(number = 1, NULL, number * 3)::Nullable(UInt64) AS x FROM numbers(4)) ORDER BY x NULLS FIRST WITH FILL STALENESS 2;
SELECT '---';
SELECT x FROM (SELECT if(number = 1, NULL, number * 3)::Nullable(UInt64) AS x FROM numbers(4)) ORDER BY x WITH FILL STEP 2 STALENESS 3;
