# Customer Purchase Behavior Analysis (SQL)

SQL analysis of a customer shopping trends dataset, exploring revenue by
category, discount behavior, shipping preferences, subscription impact on
spend, and customer segmentation.

## Questions Answered

1. Total revenue by product category
2. Customers who used a discount but still spent above the average
3. Top 5 products by average review rating
4. Standard vs. Express shipping — average purchase comparison
5. Subscribers vs. non-subscribers — average spend and total revenue
6. Top 5 products by discount usage rate
7. Customer segmentation (New / Returning / Loyal) by purchase history

## Tech

- PostgreSQL syntax (CTEs, `CASE`, aggregate functions, type casting)

## Dataset

`customer` table with columns including `customer_id`, `category`,
`item_purchased`, `purchase_amount`, `review_rating`, `discount_applied`,
`shipping_type`, `subscription_status`, `previous_purchases`.

## File Structure

```
├── queries.sql   -- all 7 analysis queries with comments
└── README.md
```

## Notes

- Percentage calculations use explicit `NUMERIC` casts to avoid integer
  division truncation in PostgreSQL.
- `review_rating` is cast to `NUMERIC` (not `INT`) to preserve decimal
  precision when averaging.
