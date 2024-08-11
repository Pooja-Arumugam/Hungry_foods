-- 13.
-- Find users with a skill level greater than the average skill level
SELECT
    L.USERNAME,
    S.CHANGESKILLLEVEL
FROM
    LOGIN L
JOIN
    SKILLLEVEL S ON L.USERID = S.USERID
WHERE
    S.CHANGESKILLLEVEL > (
        SELECT AVG(SL.CHANGESKILLLEVEL)
        FROM SKILLLEVEL SL
    );
