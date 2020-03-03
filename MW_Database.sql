--To Find Total open/close product for each person
SELECT
	product,
	COUNT(product) AS total_open
FROM MW_Database
WHERE close_name LIKE 'Sut%'
GROUP BY product
HAVING close_name <>'';

--To Find Open_Ts in each month
SELECT
	open_name,
	COUNT(open_name) AS open_ts
FROM MW_Database
WHERE (open_date BETWEEN '2018-11-01' AND '2018-11-30') AND 
       open_name LIKE 'Sut%'
GROUP BY open_name
HAVING open_name <>'';

--To Find Close_Ts in each month
SELECT
	close_name,
	COUNT(close_name) AS close_ts
FROM MW_Database
WHERE (open_date BETWEEN '2018-10-01' AND '2018-10-31') AND 
       close_name LIKE 'Sut%'
GROUP BY close_name
HAVING close_name <>'';

--To Total EXP each person
SELECT
	close_name,
	SUM(net_pnl) AS total_exp
FROM MW_Database
WHERE close_name LIKE 'Sut%'
GROUP BY close_name
HAVING close_name <>'';

--To Find Price Distribution
SELECT
	product,
	open_date,
	open_price,
	close_date,
	close_price
FROM MW_Database
WHERE product = 'XAGUSD';

--To Open Order per product
SELECT
	product,
	COUNT(product)AS open_product
FROM MW_Database
WHERE close_date = ''
GROUP BY product
ORDER BY open_product DESC;

--To Find EXP in each product
SELECT
	product,
	ROUND(SUM(net_pnl),2)AS total_exp
FROM MW_Database
WHERE close_date <> ''
GROUP BY product
ORDER BY total_exp DESC;

--To Find Close order in each product
SELECT
	product,
	COUNT(product)AS n
FROM MW_Database
WHERE close_date <> ''
GROUP BY product
ORDER BY n DESC;

--To find EXP in daily trading
SELECT
	product,
	close_date,
	net_pnl
FROM MW_Database
WHERE close_date <> ''
ORDER BY close_date;

--To Total Transaction open/close in each product
SELECT
	product,
	COUNT(product)AS trading_product
FROM MW_Database
WHERE close_date <>''
GROUP BY product
ORDER BY trading_product DESC;

--To Find Each Product Transaction in Each Month
SELECT
	product,
	COUNT(product)AS trading_product
FROM MW_Database
WHERE open_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY product;


--To Find Monthly Transaction for each Trader
SELECT 
	open_name,
	STRFTIME('%m',open_date) AS month,
	COUNT(open_name) AS open_ts
FROM MW_Database
WHERE open_name <>'' AND open_name ='Kittipong'
GROUP BY month;

--To Find only one product transaction in each month
SELECT
	product,
	STRFTIME ('%m',open_date)AS month,
	COUNT(product) AS n
FROM MW_Database
WHERE open_date<>'' AND product ='AUDUSD'
GROUP BY month;