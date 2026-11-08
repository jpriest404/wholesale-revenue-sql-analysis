# Wholesale Revenue & Product Line Analysis (PostgreSQL)

## 📊 Executive Summary
This project evaluates wholesale transaction data across three regional distribution warehouses (`North`, `Central`, and `West`) to determine true net revenue performance by product line, month, and payment processing method. By isolating payment processing fees from gross sales, this analysis provides finance and supply chain leadership with visibility into net margin performance across B2B wholesale product categories.

## 🎯 Business Problem
Finance and operations leadership required a granular breakdown of wholesale revenue to answer three core business questions:
1. Which product lines generate the highest net wholesale revenue across each regional warehouse?
2. How do monthly summer trends (June, July, and August) impact wholesale order volume across product tiers?
3. How much gross revenue is lost to payment processing fees across `Credit card`, `Bank transfer`, and `Cash` transactions?

## 🛠️ SQL Methodology & Technical Approach
Using **PostgreSQL**, transaction records from the `sales` table were filtered, transformed, and aggregated using the following techniques:
* **B2B Scope Filtering:** Isolated `Wholesale` client transactions from retail point-of-sale logs using `WHERE client_type = 'Wholesale'`.
* **Date-Part Transformation:** Used `EXTRACT('month' FROM date)` inside a `CASE WHEN` statement (or `TO_CHAR(date, 'Month')`) to standardize transaction timestamps into summer monthly reporting cohorts (`June`, `July`, `August`).
* **Net Revenue & Fee Calculation:** Computed true net revenue after deducting payment processor fees:
  $$\text{Net Revenue} = \sum(\text{total} \times (1 - \text{payment\_fee}))$$
* **Multi-Dimensional Grouping:** Grouped and ordered results by `product_line`, `warehouse`, and `month` (`ORDER BY product_line, month, net_revenue DESC`) to surface top-performing segments.

## 📂 Repository Structure
* `sql/wholesale_revenue_analysis.sql` — Production PostgreSQL query calculating monthly net wholesale revenue by product line and warehouse.

## 💡 Key Findings & Strategic Recommendations
* **High-Margin Product Lines:** *Frame & Accessories* and *Engine* product categories drive the highest net wholesale revenue volume, particularly within the Central and North distribution hubs.
* **Payment Processing Fee Optimization:** Credit card transactions incur a **3% processing fee drag** compared to **1% for Bank Transfers** on large B2B wholesale orders. Incentivizing wholesale accounts to transition from credit cards to ACH/Bank Transfer immediately recovers up to 2% in net margin without altering product pricing.
