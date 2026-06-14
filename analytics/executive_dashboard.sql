CREATE OR REPLACE VIEW executive_dashboard AS

WITH risk_scores AS (

SELECT

    ch.customer_id,
    ch.city,
    ch.total_usage,
    ch.failed_payments,

    CASE

        WHEN ch.total_usage < 2500
             AND ch.failed_payments >= 3
        THEN 'High Risk'

        WHEN ch.total_usage < 3500
        THEN 'Medium Risk'

        ELSE 'Low Risk'

    END AS risk_level

FROM customer_health ch

)

SELECT

    r.customer_id,
    r.city,
    r.risk_level,
    r.total_usage,
    r.failed_payments,

    s.plan_name,
    s.monthly_fee,

    c.churned

FROM risk_scores r

JOIN subscriptions s
ON r.customer_id=s.customer_id

LEFT JOIN customer_churn c
ON r.customer_id=c.customer_id;