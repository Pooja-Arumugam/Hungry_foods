-- 1.
-- SELECTING SUPNR, SUPNAME , SUPADDRESS OF THOSE WHERE R1.SUPRNR< R2.SUPNR-
-- THEREBY FETCHING MORE EXPERIENCED SUPPLIERS , SINCE SUPPLIERS WITH SMALL SUPNR 
-- WLD HAVE REGISTERED EARLIER AND WILL HAVE MORE EXPERIENCE
use project;
select r1.SUPNR,r2.SUPNAME,r1.SUPADDRESS
from SUPPLIER r1, supplier r2
where r1.prodnr=r2.prodnr
and (r1.supnr<r2.supnr);

-- 2.
-- HERE WE ARE TRYING TO DISPLAY LIMIT AND ORDER BY FUNCTION WHERE 
-- WE ARE DISPLAYING PRODUCT QUANTITY IS DESCENDING ORDER
select s.supnr,s.supname,p.prodname,p.prodquantity
from product as p, supplier s
where p.prodnr = s.prodnr
order by p.prodquantity desc
limit 13;

-- 3.

-- HERE WE ARE FETCHING CUSTOMERS HAVING NO OF FOLLOWERS GREATER THAN 650
SELECT * FROM project.profile;
select p.profilename, count(p.profileID) as totalcustomers, p.profileid
from profile as p
where p.followers > 650
group by p.ProfileID
order by totalcustomers desc;
-- 4.
-- DISPLAYING HAVING SJ=KILL LEVEL GREATER THAN TWO AND CONTAING MAIL_ID WITH @GOOGLE
with hungryfoods as (SELECT l.userid,l.username ,l.mail_id,s.changeskilllevel
FROM login l,skilllevel s
where l.userid=s.userid and s.changeskilllevel>=2)
select mail_id ,userid,username
from login
where mail_id like "%google%";

-- 5.
-- SELECTING PRODUCT NAMES WHERE THE SUPPLIER IS " DUCKERING "
SELECT P.PRODNR,P.PRODNAME, R.SUPNR, R.SUPNAME, R.SUPADDRESS
From SUPPLIER AS R INNER JOIN PRODUCT AS P
ON (P.PRODNR = R.PRODNR)
    WHERE R.SUPNAME ="Duckering";

-- 6.
-- DISPLAYING CUSTOMERS HAVING NUMBER OF FOLLOWERS LESSER THAN THE NUMBER OF FOLLOWING
SELECT p1.profileid,p1.profilename,p2.followers,p2.following
FROM profile p1,profile p2
WHERE p1.profileid = p2.profileid
AND (p1.followers < p2.following);

-- 7.
-- This part defines a Common Table Expression (CTE) named HUNGRYFOODS. -- 
-- It selects the recipe name (as RECIPENAME), rating ID (as RATING), and 
-- feedback text (as FEEDBACK) from the tables RECIPE (aliased as R), RATINGS (aliased as RA), 
-- and FEEDBACK (aliased as F). 
-- IT BASICALLY FINDS THE TOTAL_RATINGS FOR EACH RECIPENAME
WITH HUNGRYFOODS AS(SELECT R.FOODNAME AS RECIPENAME,RA.RATINGID AS RATING, F.FEEDBACKTEXT AS FEEDBACK
FROM RECIPE R, RATINGS RA, FEEDBACK f
WHERE RA.RECIPEID=R.RECIPEID AND 
R.RECIPEID=F.RECIPEID)
SELECT RECIPENAME,SUM(RATING) AS TOTAL_RATINGS
FROM HUNGRYFOODS
GROUP BY RECIPENAME;

-- 8.
-- COUNTING THE TOTAL QUANTITY OF PRODUCT NAMES ACCORDING TO THE AVAILABLE PRODNR
SELECT P.PRODNR, P.PRODNAME,
SUM(P.prodquantity) as totalquantity
FROM PRODUCT P, supplier s
WHERE P.PRODNR = s.PRODNR
GROUP BY P.PRODNR;

-- 9.
-- SELECTING FOODNAME , FOODTEXT WITH FEEDBACK TEXT AS "UNPLEASANT"

select  r.foodname,f.feedbacktext, r.recipeid
from recipe r, feedback f
where r.recipeid=f.recipeid
and f.feedbacktext="unpleasant";

-- 10.
-- FINDING ALL THE SUPPLIERS STAYING IN BURROWS STREET
SELECT SUPNR, SUPNAME,SUPADDRESS
FROM SUPPLIER WHERE SUPADDRESS LIKE "%BURROWS%"
ORDER BY PRODNR DESC;


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
    RECIPE R;


-- 12.
-- Update the PRODQUANTITY in PRODUCT based on the total quantity supplied by a specific supplier
UPDATE PRODUCT P
SET PRODQUANTITY = (
    SELECT SUM(p.PRODQUANTITY)
    FROM SUPPLIER S
    WHERE S.PRODNR = P.PRODNR
)
WHERE EXISTS (
    SELECT 1
    FROM SUPPLIER S
    WHERE S.PRODNR = P.PRODNR
);

-- Display the updated results
SELECT * FROM PRODUCT;

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





















