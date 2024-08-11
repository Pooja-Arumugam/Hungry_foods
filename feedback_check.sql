-- 9.
-- SELECTING FOODNAME , FOODTEXT WITH FEEDBACK TEXT AS "UNPLEASANT"

select  r.foodname,f.feedbacktext, r.recipeid
from recipe r, feedback f
where r.recipeid=f.recipeid
and f.feedbacktext="unpleasant"