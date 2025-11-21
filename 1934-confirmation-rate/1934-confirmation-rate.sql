# Write your MySQL query statement below
select s.user_id, round(coalesce(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id),0),2) as confirmation_rate
from signups s
left join confirmations c
on s.user_id = c.user_id
group by user_id;