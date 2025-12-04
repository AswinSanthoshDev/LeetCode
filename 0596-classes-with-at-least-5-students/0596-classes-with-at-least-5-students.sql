-- Write your PostgreSQL query statement
select class
from courses 
group by class
having count(*) >= 5;