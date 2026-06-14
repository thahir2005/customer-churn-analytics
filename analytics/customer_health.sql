CREATE OR REPLACE VIEW customer_health AS

WITH usage_summary AS (

    SELECT
        customer_id,
        SUM(minutes_used) AS total_usage
    FROM usage_logs
    GROUP BY customer_id

),

payment_summary AS (

    SELECT
        customer_id,

        SUM(
            CASE
                WHEN payment_status='Failed'
                THEN 1
                ELSE 0
            END
        ) AS failed_payments

    FROM payments
    GROUP BY customer_id

)

SELECT

    c.customer_id,
    c.city,

    COALESCE(u.total_usage,0) AS total_usage,

    COALESCE(p.failed_payments,0) AS failed_payments

FROM customers c

LEFT JOIN usage_summary u
ON c.customer_id=u.customer_id

LEFT JOIN payment_summary p
ON c.customer_id=p.customer_id;