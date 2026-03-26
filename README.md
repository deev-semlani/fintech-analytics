# FatakPay Fintech Analytics Dashboard

## Overview
An end-to-end fintech analytics project analyzing loan disbursement, 
repayment behavior and default risk to identify high-risk customer segments 
and improve lending decisions for a fintech lending company (FY 2024-25).

## Dashboard Preview
<img width="1553" height="801" alt="page1_executive_overview png" src="https://github.com/user-attachments/assets/877ee369-5424-49b0-ba4c-5ef92c2b6c1b" />
1. Executive Overview
<img width="1559" height="800" alt="page2_risk_analysis png" src="https://github.com/user-attachments/assets/f24e4951-d72a-46c7-b8fa-0a84c3e6829d" />
2. Risk Analysis
<img width="1553" height="802" alt="page3_business_analysis png" src="https://github.com/user-attachments/assets/c9c7fbca-0e2a-4bec-9c09-6a8f8ad24538" />
3. Business Analysis
<img width="1540" height="805" alt="page4_customer_analysis png" src="https://github.com/user-attachments/assets/cc859fee-48f3-481e-a858-a25ebb183479" />
4. Customer Analysis

## What I Did
- Cleaned and transformed raw loan data using Python
- Performed EDA to identify trends and anomalies
- Built SQL database for structured analysis
- Designed Power BI dashboard
 
## Tech Stack
- Python (Pandas, NumPy, Seaborn, Matplotlib)
- SQL (SQLite)
- Power BI
- Excel
- Git & GitHub

## Project Structure
- `notebooks/` — Jupyter notebooks for ETL, EDA, Analysis
- `data/processed/` — Cleaned datasets
- `sql/` — SQL queries and database
- `docs/` — Project documentation
- `Fintech_analysis.pbix` — Power BI dashboard

## Key Findings
- 41.4% overall default rate across 338 loans
- Kolkata has highest default rate (61.1%)
- Travel loans default most (27 cases)
- Daily Wage Workers have highest risk (57.63%)
- 3-month tenure loans default most (44.79%)
- UPI is dominant payment mode (26.7%)

## How to Run
1. Clone repository
2. Run `03_sql_analysis.ipynb` to create SQLite database
3. Run notebooks in order: 01 → 02 → 03
4. Open `Fintech_analysis.pbix` in Power BI Desktop

## Author
Deev Semlani
[LinkedIn](https://in.linkedin.com/in/deev-semlani-6523541b5) | [GitHub](https://github.com/deev-semlani)
