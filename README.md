# Customer Churn & Revenue Risk Analytics

## Overview

This project is an end-to-end SQL analytics solution built using PostgreSQL and Tableau to analyze customer behavior, subscription activity, product usage, payment history, support interactions, and churn risk.

The objective is to identify customers at risk of leaving, estimate revenue exposure, and provide actionable insights that help business stakeholders improve customer retention and recurring revenue.

---

## Business Problem

Customer churn directly impacts revenue and long-term business growth.

Business stakeholders need answers to critical questions such as:

- Which customers are most likely to churn?
- How much revenue is at risk?
- Which subscription plans have the highest risk?
- Which cities contain the highest concentration of risky customers?
- Which customers should retention teams prioritize?
- What operational factors contribute to churn?

---

## Project Metrics

| Metric | Value |
|----------|----------|
| Customers | 10,000 |
| Subscriptions | 10,000 |
| Payments | 100,000 |
| Usage Logs | 300,000 |
| Support Tickets | 50,000 |
| Total Records Analyzed | 480,000+ |
| Churn Rate | 20.69% |
| Revenue Generated | ₹80M+ |
| Revenue from Churned Customers | ₹16M+ |

---

## Dashboard Preview

### Executive Dashboard

![Executive Dashboard](screenshots/executive-dashboard.png)

### Customer Health Dashboard

![Customer Health](screenshots/customer-health.png)

### Revenue At Risk Dashboard

![Revenue At Risk](screenshots/revenue-at-risk.png)

### Entity Relationship Diagram

![ERD](screenshots/erd.png)

---

## Project Architecture

```text
Raw Data Layer
│
├── customers
├── subscriptions
├── payments
├── usage_logs
├── support_tickets
└── customer_churn
        │
        ▼
Data Quality Layer
        │
        ▼
Analytics Views
│
├── customer_health
├── customer_360
└── executive_dashboard
        │
        ▼
KPI Reporting Layer
│
├── Revenue KPIs
├── Churn KPIs
├── Customer Health KPIs
└── Support Ticket Analytics
        │
        ▼
Tableau Dashboards
        │
        ▼
Business Recommendations
```

---

## Database Design

The project uses a relational database design implemented in PostgreSQL.

### Core Tables

#### customers

Stores customer demographic and account information.

| Column |
|----------|
| customer_id |
| customer_name |
| email |
| age |
| gender |
| city |
| country |
| join_date |

---

#### subscriptions

Stores subscription plans and pricing information.

| Column |
|----------|
| subscription_id |
| customer_id |
| plan_name |
| monthly_fee |
| start_date |
| end_date |

---

#### payments

Stores customer payment history.

| Column |
|----------|
| payment_id |
| customer_id |
| payment_date |
| amount |
| payment_status |

---

#### usage_logs

Stores customer product engagement data.

| Column |
|----------|
| usage_id |
| customer_id |
| activity_date |
| login_count |
| minutes_used |

---

#### support_tickets

Stores customer support interactions.

| Column |
|----------|
| ticket_id |
| customer_id |
| ticket_date |
| issue_type |
| ticket_status |

---

#### customer_churn

Stores churn labels.

| Column |
|----------|
| customer_id |
| churned |

---

## Analytics Layer

### customer_health View

A reusable analytics view that aggregates:

- Total product usage
- Failed payment count
- Customer engagement metrics

Purpose:

- Customer health monitoring
- Retention analysis
- Risk classification

---

### customer_360 View

Creates a complete customer profile by combining:

- Customer information
- Subscription data
- Usage behavior
- Payment performance
- Churn status

Purpose:

- Customer-level analytics
- Executive reporting
- Segmentation

---

### executive_dashboard View

Central reporting layer used by Tableau dashboards.

Includes:

- Risk level
- Usage metrics
- Failed payments
- Subscription plan
- Revenue contribution
- Churn information

---

## SQL Concepts Demonstrated

This project demonstrates:

### SQL Fundamentals

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING

### Intermediate SQL

- INNER JOIN
- LEFT JOIN
- CASE Statements
- Aggregate Functions
- Subqueries

### Advanced SQL

- Common Table Expressions (CTEs)
- Views
- Window Functions
- RANK()
- Business KPI Calculations

### Data Engineering Concepts

- Relational Modeling
- Foreign Key Relationships
- Data Quality Validation
- Analytics Layer Design
- Data Mart Creation

---

## Data Quality Checks

The project includes data validation scripts for:

- Duplicate customers
- Missing values
- Invalid payment amounts
- Invalid subscription fees
- Data consistency checks

Purpose:

- Improve reporting accuracy
- Ensure reliable analytics

---

## KPI Reporting

### Revenue KPIs

Measures:

- Total Revenue
- Successful Payment Revenue
- Revenue by Plan
- Revenue by Customer Segment

---

### Churn KPIs

Measures:

- Churn Rate
- Churned Customers
- Revenue from Churned Customers

---

### Customer Health KPIs

Measures:

- High Risk Customers
- Medium Risk Customers
- Low Risk Customers
- Customer Engagement Levels

---

### Support Analytics

Measures:

- Most Common Customer Issues
- Ticket Volume by Issue Type
- Support Trends

---

## Tableau Dashboards

### Executive Dashboard

Provides:

- Revenue Overview
- Churn Overview
- Revenue by City
- Revenue by Risk Level

---

### Customer Health Dashboard

Provides:

- Customer Risk Distribution
- Usage Analysis
- Failed Payment Analysis
- High Risk Customer Identification

---

### Revenue At Risk Dashboard

Provides:

- Revenue Exposure
- Revenue at Risk by City
- High Risk Customer Segments
- Retention Prioritization

---

## Key Business Findings

### Finding 1

Customer churn rate is approximately 20.69%.

Business Impact:

A significant portion of customers leave the platform, affecting recurring revenue.

---

### Finding 2

Failed payments are associated with elevated customer risk levels.

Business Impact:

Improving payment recovery processes may reduce churn.

---

### Finding 3

Customer engagement levels vary significantly.

Business Impact:

Declining product usage can be used as an early churn indicator.

---

### Finding 4

Revenue exposure can be quantified by identifying high-risk customers.

Business Impact:

Retention efforts can be prioritized toward customers with the highest revenue contribution.

---

## Business Recommendations

### Recommendation 1

Target High-Risk Customers

- Create retention campaigns
- Offer incentives
- Increase engagement outreach

---

### Recommendation 2

Improve Payment Recovery

- Automated payment retries
- Customer payment reminders
- Alternative payment methods

---

### Recommendation 3

Monitor Product Usage

- Track declining engagement
- Trigger proactive interventions
- Improve onboarding experiences

---

### Recommendation 4

Improve Customer Support

- Faster ticket resolution
- Better issue tracking
- Root-cause analysis

---

## Project Structure

```text
customer-churn-analytics/
│
├── schema/
│   └── create_tables.sql
│
├── data_generation/
│   └── generate_data.sql
│
├── analytics/
│   ├── customer_health.sql
│   ├── customer_360.sql
│   ├── executive_dashboard.sql
│   ├── data_quality_checks.sql
│   ├── support_ticket_analysis.sql
│   ├── kpi_revenue.sql
│   ├── kpi_churn.sql
│   └── kpi_customer_health.sql
│
├── docs/
│   ├── architecture.md
│   ├── data_dictionary.md
│   ├── business_case_study.md
│   ├── executive_summary.md
│   ├── project_summary.md
│   ├── recommendations.md
│   └── erd.md
│
├── screenshots/
│   ├── executive-dashboard.png
│   ├── customer-health.png
│   ├── revenue-at-risk.png
│   └── erd.png
│
└── README.md
```

---

## Technologies Used

- PostgreSQL
- SQL
- Tableau Public
- Git
- GitHub

---

## Future Enhancements

- Python-based churn prediction
- Customer Lifetime Value (CLV) analysis
- Automated ETL pipelines
- Real-time dashboard refresh
- Machine Learning risk scoring
- Cloud deployment

---

## Author

Built as an end-to-end analytics portfolio project demonstrating SQL, PostgreSQL, business intelligence, data modeling, customer analytics, churn analysis, KPI reporting, dashboard development, and business case study documentation.