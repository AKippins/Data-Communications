-- SQL Queries 1
-- Aaron Kippins
-- Question 1 
SELECT * FROM customers
-- Question 2
SELECT name, city FROM agents
WHERE name = 'Smith'
-- Question 3
SELECT pid, name, quantity FROM products
WHERE priceusd > '1.25'
-- Question 4 
SELECT ordno, aid FROM orders
-- Question 5
SELECT name, city FROM customers 
WHERE city <> 'Dallas'
-- Question 6
SELECT name FROM agents
WHERE (city = 'New York') OR (city = 'Newark')
-- Question 7
SELECT pid, name, city, quantity, priceUSD FROM products
WHERE (city <> 'New York') OR (city <> 'Newark')
-- Question 8
SELECT ordno, mon, cid, aid, pid, qty, dollars FROM orders
WHERE (mon = 'jan') OR (mon = 'mar')
-- Question 9 
SELECT ordno, mon, cid, aid, pid, qty, dollars FROM orders
WHERE (mon = 'feb') AND (dollars < '100')
-- Question 10
SELECT ordno FROM orders
WHERE cid = 'c005'