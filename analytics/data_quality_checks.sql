-- Duplicate Emails

SELECT
email,
COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Missing Customer Names

SELECT *
FROM customers
WHERE customer_name IS NULL;

-- Negative Payments

SELECT *
FROM payments
WHERE amount < 0;

-- Invalid Subscription Fees

SELECT *
FROM subscriptions
WHERE monthly_fee <= 0;