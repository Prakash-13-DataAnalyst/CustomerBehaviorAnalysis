-- ============================================================
-- Customer Purchase Behavior Analysis


-- Q1. What is the total revenue generated in terms of category?

SELECT category,
       SUM(purchase_amount) AS revenue
FROM customer
GROUP BY category
ORDER BY revenue DESC;


-- Q2. Which customers used a discount but still spent more than the
--     average purchase amount (across all customers)?

SELECT customer_id,
       SUM(purchase_amount) AS total_spent
FROM customer
WHERE lower(discount_applied) = 'yes'
GROUP BY customer_id
HAVING SUM(purchase_amount) > (SELECT AVG(purchase_amount) FROM customer)
ORDER BY total_spent DESC;


-- Q3. What are the top 5 products with the highest average review rating?

SELECT item_purchased,
       ROUND(AVG(review_rating::numeric), 2) AS average_rating
FROM customer
GROUP BY item_purchased
ORDER BY average_rating DESC
LIMIT 5;


-- Q4. Compare the average purchase amounts between Standard and Express shipping.

SELECT shipping_type,
       ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer
WHERE lower(shipping_type) IN ('standard', 'express')
GROUP BY shipping_type;


-- Q5. Do subscribed customers spend more? Compare average spend and
--     total revenue between subscribers and non-subscribers.

SELECT subscription_status,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(purchase_amount), 2) AS average_purchase,
       SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY subscription_status DESC;


-- Q6. Which 5 products have the highest percentage of purchases
--     made with a discount applied?

SELECT item_purchased,
       ROUND(
           100.0 * SUM(CASE WHEN lower(discount_applied) = 'yes' THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS discount_rate_pct
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate_pct DESC
LIMIT 5;


-- Q7. Segment customers into New, Returning, and Loyal based on
--     their number of previous purchases.

WITH customer_segments AS (
    SELECT customer_id,
           CASE
               WHEN previous_purchases <= 1 THEN 'New'
               WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
               ELSE 'Loyal'
           END AS customer_segment
    FROM customer
)
SELECT customer_segment,
       COUNT(*) AS total_customers
FROM customer_segments
GROUP BY customer_segment
ORDER BY total_customers DESC;
