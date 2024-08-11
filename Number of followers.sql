-- HERE WE ARE FETCHING CUSTOMERS HAVING NO OF FOLLOWERS GREATER THAN 650
SELECT * FROM project.profile;
select p.profilename, count(p.profileID) as totalcustomers, p.profileid
from profile as p
where p.followers > 650
group by p.ProfileID
order by totalcustomers desc