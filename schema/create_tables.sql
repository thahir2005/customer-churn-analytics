CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    age INT,
    gender VARCHAR(20),
    city VARCHAR(100),
    country VARCHAR(100),
    join_date DATE NOT NULL
);

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    plan_name VARCHAR(50),
    monthly_fee NUMERIC(10,2),
    start_date DATE,
    end_date DATE,

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    payment_date DATE,
    amount NUMERIC(10,2),
    payment_status VARCHAR(20),

    CONSTRAINT fk_payment_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE usage_logs (
    usage_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    activity_date DATE,
    login_count INT,
    minutes_used INT,

    CONSTRAINT fk_usage_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE support_tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    ticket_date DATE,
    issue_type VARCHAR(100),
    ticket_status VARCHAR(20),

    CONSTRAINT fk_ticket_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE customer_churn (
    customer_id INT PRIMARY KEY,
    churned BOOLEAN NOT NULL,

    CONSTRAINT fk_churn_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);