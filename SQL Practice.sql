---Easy

1. select min(id), max(name), max(location)
from Q4_data
order by id asc


2. select test_id, marks from
(select test_id, marks, 
lag(marks,1,0) over() as flag from student_tests)
where marks > flag

3. select dates, cast(product_id as varchar)
from orders
UNION
select dates, string_agg(cast(product_id as varchar), ',') as flag
from orders
group by dates, customer_id
order by dates

4. select e.name, count(ee.manager)
from employee_managers e
join employee_managers ee
on e.id = ee.manager
group by e.name
order by count(ee.manager) desc

5. select * from feedback ---(video 24)

6. select store_id, 
Sum(Case when ltrim(lower(product_1)) like 'apple%' then 1 else 0 end) as product_1,
Sum(Case when ltrim(lower(product_2)) like 'apple%' then 1 else 0 end) as product_2
from product_demo
group by store_id
order by store_id asc

7. select token_num from
(select distinct  * from tokens)
group by token_num
having count(token_num) < 2
limit 1

--Medium

1. select min(car)
from footer
 


