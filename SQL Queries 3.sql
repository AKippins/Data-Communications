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

--Question 6 
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

--Question 9 *******
select c.city, count(p.city)
from products p, customers c 
where c.city = p.city
group by p.city


--Question 10 ******
select p.name, p.city
from customers c
full outer join products p on c.city = p.city
where p.quantity in (select max(quantity) from products p)

--Question 11 *****
select *
from customers c 
full outer join products p on c.city = p.city

--Question 12
select * 
from products p 
where p.priceUSD > (select avg(priceUSD)
		    from products p)

--Question 13 
select c.name, o.pid, o.dollars
from customers c, orders o
where c.cid = o.cid
order by o.dollars desc

--Question 14 
select c.name, coalesce(sum(o.dollars), 0.00)
from orders o
left outer join customers c on c.cid = o.cid
group by c.name	
order by c.name

--Question 15 
select c.name, p.name, a.name
from agents a, customers c, orders o, products p
where a.aid = o.aid and c.cid = o.cid and p.pid = o.pid and a.city = 'New York'

--Question 16
select o.pid, o.qty * p.priceusd, o.dollars
from orders o, products p
where o.pid = p.pid

--Question 17 
select 
from
where 