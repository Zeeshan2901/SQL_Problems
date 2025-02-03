select salary as second_highest_salary
from  (
  select employee_id
    , salary
    , row_number() over(order by salary desc) as row_num
    from employee
) as emp 
where row_num = 2;
