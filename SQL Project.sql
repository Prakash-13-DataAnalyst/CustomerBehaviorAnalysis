
Q1. SELECT gender,
       SUM(purchase_amount) AS revenue
FROM customer
GROUP BY gender

Q2. SELECT customer_id,
           ROUND
		   (AVG(purchase_amount),2)
FROM customer
WHERE lower(discount_applied) = 'yes'
GROUP BY customer_id
HAVING SUM(purchase_amount) > (SELECT AVG(purchase_amount) 
                              FROM customer)
    
Q3. SELECT item_purchased,
           ROUND
		   (AVG(review_rating :: int),2) AS average
FROM customer
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5

Q4. SELECT shipping_type,
           ROUND(
		   AVG(purchase_amount),2) AS average
FROM customer
WHERE lower(shipping_type) = 'standard' OR 
     lower(shipping_type) = 'express'
GROUP BY shipping_type

Q5. SELECT subscription_status,
           COUNT(customer_id) AS total_customers,
           ROUND(
		   AVG(purchase_amount),2) AS average,
           SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY subscription_status DESC

Q6. SELECT item_purchased,
           ROUND(100* SUM(CASE WHEN discount_applied = 'Yes' 
		   THEN 1 ELSE 0 END)/ COUNT(*),2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5

Q7. 
WITH CTE AS 
			(SELECT customer_id,
			           CASE 
					       WHEN previous_purchases = 1 THEN 'New'
						   WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
						   ELSE 'loyal'
						   END AS customer_segment
			FROM customer)
SELECT customer_segment,
       COUNT(*) AS Total_customers
FROM CTE
GROUP BY customer_segment
ORDER BY Total_customers DESC

Q8. SELECT *