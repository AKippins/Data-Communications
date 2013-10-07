--Question 1 
select city from agents a
where a.aid in(select o.aid from orders o
	where o.cid = 'c002' )
--Question 2
select a.city
from agents a, orders o
where a.aid=o.aid and o.cid = 'c002'

--Question 3
select pid from orders 
where aid in(select aid from orders
	where cid in(select cid from customers
		where city = 'Kyoto'))
		
--Question 4
select o.pid
from orders o, customers c
where o.cid = c.cid and c.city = 'Kyoto'

--Question 5
select distinct c.name
from customers c, orders o
where c.cid not in (select o.cid from orders o)

--Question 6 **** Come Back To This ****
select *
from customers c 
left join orders o on c.cid = o.cid
where ordno is null


--Question 7
select c.name, a.name
from customers c  
full outer join agents a on c.city = a.city
where c.city = a.city

--Question 8
select c.name , a.name, c.city
from customers c 
full outer join agents a on c.city = a.city
where c.city = a.city

--Question 9 
select p.name, p.city
from customers c
full outer join products p on c.city = p.city
where p.quantity in (select min(quantity) from products p)

--Question 10 ******
select *
from customers c
full outer join products p on c.city = p.city

--Question 11 *****
select *
from customers c 
full outer join products p on c.city = p.city

--Question 12
select * 
from products p 
where p.priceUSD > (select avg(priceUSD)
		    from products p)

--Question 13 ********
select c.name, o.pid, o.dollars
from customers c, orders o
where 

--Question 14 
select *
from 
