SELECT
risk_level,
COUNT(*)
FROM executive_dashboard
GROUP BY risk_level;