# Data Dictionary

## customers

| Column | Description |
|----------|-------------|
| customer_id | Unique customer identifier |
| customer_name | Customer name |
| email | Customer email |
| age | Customer age |
| city | Customer city |
| join_date | Customer signup date |

## subscriptions

| Column | Description |
|----------|-------------|
| subscription_id | Unique subscription identifier |
| customer_id | Customer reference |
| plan_name | Subscription plan |
| monthly_fee | Monthly revenue |

## payments

| Column | Description |
|----------|-------------|
| payment_id | Payment identifier |
| amount | Payment amount |
| payment_status | Success or Failed |

## usage_logs

| Column | Description |
|----------|-------------|
| usage_id | Usage record |
| login_count | Number of logins |
| minutes_used | Product usage minutes |