SELECT
ROUND(
100.0 *
SUM(CASE WHEN churned THEN 1 ELSE 0 END)
/
COUNT(*),
2
) AS churn_rate
FROM customer_churn;