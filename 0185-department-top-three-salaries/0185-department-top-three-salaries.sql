-- Write your PostgreSQL query statement below
select d.name as Department,
e.name as Employee,
salary
from employee e
left join department d 
on e.departmentid = d.id
where (select count(distinct e2.salary)from employee e2
where e2.departmentid = e.departmentid
and e2.salary >= e.salary) <= 3;