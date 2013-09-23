-- SQL Queries 2
-- Aaron Kippins
-- Question 1 
select city from agents
where aid in(select aid from orders 
	where cid = 'c002' )
-- Question 2
select pid from orders 
where aid in(select aid from orders
	where cid in(select cid from customers
		where city = 'Kyoto'))
		--I Don't think this is right check this again later
-- Question 3
select cid, name from customers
where cid not in (select aid from orders
	where aid = 'a03')
-- Question 4 
select cid, name from customers 
where cid in (select cid from orders 
	where pid = 'p01' and cid in (select cid from products 
		where pid = 'p07'))
-- Question 5
select pid from orders
where aid in (select aid from orders
	where aid = 'a03')
-- Question 6 
select name, discount from customers
where cid in (select cid from orders 
	where aid in (select aid from agents 
		where city = 'Dallas' or city = 'Daluth'))
-- Question 7 
select cid, discount from customers 
where ((discount = 12 or discount = 8) and (city = 'Dallas')) or ((discount = 0) and (city = 'Kyoto'))