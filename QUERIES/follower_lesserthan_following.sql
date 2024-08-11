-- 6.
-- DISPLAYING CUSTOMERS HAVING NUMBER OF FOLLOWERS LESSER THAN THE NUMBER OF FOLLOWING
SELECT p1.profileid,p1.profilename,p2.followers,p2.following
FROM profile p1,profile p2
WHERE p1.profileid = p2.profileid
AND (p1.followers < p2.following)













