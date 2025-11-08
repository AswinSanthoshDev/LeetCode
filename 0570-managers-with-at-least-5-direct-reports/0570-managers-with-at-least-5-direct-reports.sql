# Write your MySQL query statement below
select name 
from employee
join(
    select managerid
    from employee
    where managerid is not null
    group by managerid
    having count(*) >= 5
) managers on id = managers.managerid;