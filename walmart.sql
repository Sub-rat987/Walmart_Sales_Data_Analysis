-- Exploratory Data Analysis

-- Different payment methods, number of transactions and quantity sold for each

SELECT 
	payment_method,
    COUNT(*) as no_payments,
    SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Identifying highest-rated category in each branch, displaying the branch, category and AVG RATING
SELECT *
FROM(SELECT 
		Branch,
		category,
		AVG(rating) AS average_rating,
		RANK() OVER (PARTITION BY Branch ORDER BY AVG(rating) DESC) AS Rnk
	FROM walmart
	GROUP BY 1, 2)  as rnkt
WHERE rnk = 1
;

-- Identifying busiest day for each branch based on the number of transactions

SELECT *
FROM(
SELECT branch,
	DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
    COUNT(*) as no_transactions,
    RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
FROM walmart
GROUP BY 1,2
ORDER BY 1,3 DESC) AS t1
WHERE rnk =1;


-- Determining the average, minimum and maximum rating of products for each city.


SELECT 
	city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM walmart
GROUP BY city, category;

-- Calculating total profit for each category

SELECT
	category,
    SUM(total) AS total_revenue,
    SUM(total*profit_margin) AS profit
FROM walmart
GROUP BY 1;

-- Determining the preferred method for each branch

WITH cte 
AS
(SELECT 
	branch,
    payment_method,
    COUNT(invoice_id) AS total_trans,
    RANK() OVER (PARTITION BY branch ORDER BY COUNT(invoice_id) DESC) AS rnk
FROM walmart
GROUP BY 1, 2)
SELECT *
FROM cte
WHERE rnk = 1;

-- Categorizing sales in shifts and number of invoices in each branch

SELECT  branch,
	CASE 
		WHEN 
			HOUR(TIME(time)) < 12 THEN 'Morning'
		WHEN
			HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE
			'Evening'
		END AS shift,
COUNT(*) AS no_of_invoices
FROM Walmart
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- Indentifying 5 branches with highest decrease ratio in revenue compared to last year, ie decrease in 2023 revenue as compared to 2022

SELECT 
	lst.branch AS branch,
    lst.revenue AS last_year_revenue,
    curr.revenue AS current_year_revenue,
    ROUND((lst.revenue - curr.revenue)/lst.revenue*100,2)  AS percentage_decrease
FROM
(SELECT
	branch,
    SUM(total) AS revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2022
GROUP BY 1) AS lst
JOIN
(SELECT
	branch,
    SUM(total) AS revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2023
GROUP BY 1) AS curr
ON lst.branch = curr.branch
WHERE lst.revenue > curr.revenue
ORDER BY 4 DESC
LIMIT 5;



