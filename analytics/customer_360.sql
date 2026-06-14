CREATE OR REPLACE VIEW customer_360 AS

SELECT

c.customer_id,
c.customer_name,
c.city,

s.plan_name,
s.monthly_fee,

ch.total_usage,
ch.failed_payments,

cc.churned

FROM customers c

LEFT JOIN subscriptions s
ON c.customer_id=s.customer_id

LEFT JOIN customer_health ch
ON c.customer_id=ch.customer_id

LEFT JOIN customer_churn cc
ON c.customer_id=cc.customer_id;