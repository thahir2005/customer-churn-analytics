SELECT
issue_type,
COUNT(*) total_tickets
FROM support_tickets
GROUP BY issue_type
ORDER BY total_tickets DESC;