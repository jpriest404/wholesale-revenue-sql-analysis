#Project: Wholesale Revenue & Product Line Analysis
#Database: PostgreSQL
#Description: Evaluates wholesale net revenue across product lines, months, 
#and regional warehouses by deducting payment processing fees from gross transaction totals.

SELECT
	product_line,
	CASE
		WHEN DATE_PART('month', date) = 6 THEN 'June'
	  WHEN DATE_PART('month', date) = 7 THEN 'July'
		WHEN DATE_PART('month', date) = 8 THEN 'August'
	END AS month,
	warehouse,
	ROUND(SUM(total) -SUM(payment_fee),2) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line, month, net_revenue DESC;
