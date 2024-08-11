-- 11. -- a correlated subquery that retrieves information about
--  recipes along with the count of feedback received for each recipe
SELECT
    R.RECIPEID,
    R.FOODNAME,
    (
        SELECT COUNT(*)
        FROM FEEDBACK F
        WHERE F.RECIPEID = R.RECIPEID
    ) AS FEEDBACK_COUNT
FROM
    RECIPE R