select d.name as Department, e.name as Employee, e.salary as Salary
from(
    select *,
    rank() over(partition by departmentId order by salary desc) as rank
    from employee
)e
left join Department d
on d.id = e.departmentId
where rank = 1;