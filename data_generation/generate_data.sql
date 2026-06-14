-- Customers

INSERT INTO customers (
    customer_name,
    email,
    age,
    gender,
    city,
    country,
    join_date
)
SELECT
    'Customer_' || gs,
    'customer' || gs || '@company.com',
    FLOOR(RANDOM()*42 + 18)::INT,
    (ARRAY['Male','Female'])[FLOOR(RANDOM()*2 + 1)],
    (ARRAY[
        'Hyderabad',
        'Bangalore',
        'Mumbai',
        'Delhi',
        'Chennai',
        'Pune'
    ])[FLOOR(RANDOM()*6 + 1)],
    'India',
    CURRENT_DATE - (RANDOM()*1000)::INT
FROM generate_series(1,10000) gs;

-- Subscriptions

INSERT INTO subscriptions (
    customer_id,
    plan_name,
    monthly_fee,
    start_date
)
SELECT
    customer_id,
    (ARRAY['Basic','Standard','Premium'])
    [FLOOR(RANDOM()*3 + 1)],
    0,
    join_date
FROM customers;

UPDATE subscriptions
SET monthly_fee =
CASE
    WHEN plan_name = 'Basic' THEN 499
    WHEN plan_name = 'Standard' THEN 999
    WHEN plan_name = 'Premium' THEN 1499
END;

-- Payments

INSERT INTO payments (
    customer_id,
    payment_date,
    amount,
    payment_status
)
SELECT
    FLOOR(RANDOM()*10000 + 1)::INT,
    CURRENT_DATE - FLOOR(RANDOM()*730)::INT,
    (ARRAY[499,999,1499])
    [FLOOR(RANDOM()*3 + 1)],
    (ARRAY[
        'Success',
        'Success',
        'Success',
        'Success',
        'Failed'
    ])
    [FLOOR(RANDOM()*5 + 1)]
FROM generate_series(1,100000);

-- Usage Logs

INSERT INTO usage_logs (
    customer_id,
    activity_date,
    login_count,
    minutes_used
)
SELECT
    FLOOR(RANDOM()*10000 + 1)::INT,
    CURRENT_DATE - FLOOR(RANDOM()*365)::INT,
    FLOOR(RANDOM()*10 + 1)::INT,
    FLOOR(RANDOM()*180 + 10)::INT
FROM generate_series(1,300000);

-- Churn Labels

INSERT INTO customer_churn (
    customer_id,
    churned
)
SELECT
    customer_id,
    CASE
        WHEN RANDOM() < 0.20 THEN TRUE
        ELSE FALSE
    END
FROM customers;