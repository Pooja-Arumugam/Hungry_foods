-- DISPLAYING HAVING SKILL LEVEL GREATER THAN TWO AND CONTAING MAIL_ID WITH @GOOGLE
with hungryfoods as (SELECT l.userid,l.username ,l.mail_id,s.changeskilllevel
FROM login l,skilllevel s
where l.userid=s.userid and s.changeskilllevel>=2)
select mail_id ,userid,username
from login
where mail_id like "%google%"