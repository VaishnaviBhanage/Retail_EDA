# Retail Sales EDA (2014–2017)

> **SQL-based exploratory analysis of 4 years of retail e-commerce data, focusing on revenue drivers, profitability gaps, customer behavior, and regional performance.**

---

##  Project Overview

This project analyzes four years of retail sales data to evaluate revenue performance, uncover profitability inefficiencies, understand customer behavior, and identify regional growth opportunities.

| Metric | Value |
|--------|-------|
| Total Orders | 9,994 |
| Unique Customers | 793 |
| Total Products | 1,862 |
| Total Revenue | $2.29M |
| Time Period | 2014 – 2017 |

---

## Tools & Techniques

- **SQL** — CTEs, Window Functions, Aggregations, Subqueries
- **RFM Analysis** — Customer segmentation by Recency, Frequency, Monetary value
- **Profitability Analysis** — Margin comparison across categories
- **Trend & Seasonality Analysis** — Monthly and quarterly revenue patterns

---

##  Key Findings

### 1. Revenue vs. Profitability Gap

Revenue is distributed relatively evenly across categories — but profitability tells a very different story:

| Category | Revenue Share | Profit Margin |
|----------|--------------|---------------|
| Technology | 36% | 17.4% |
| Office Supplies | 31% | 17.0% |
| Furniture | 32% | **2.5%**  |

> **Insight:** Furniture generates nearly one-third of total revenue but contributes almost nothing to profit — a classic revenue-strong, margin-weak problem.

**Recommendations:**
- Reassess discount strategies on Furniture products
- Optimize logistics and shipping costs for bulky items
- Renegotiate supplier pricing
- Shift marketing focus toward higher-margin categories

---

### 2. Seasonal Sales Trends

Monthly analysis reveals strong Q4 dependency:

-  **Revenue peaks in November and December**
-  **January and February are the lowest-performing months**
- Annual performance is heavily influenced by year-end demand

**Recommendations:**
- Increase marketing spend ahead of Q4
- Improve inventory planning before peak months
- Launch promotions in slow months (Jan–Feb) to smooth revenue fluctuations

---

### 3. Customer Segmentation — RFM Analysis

| Segment | Finding |
|---------|---------|
| At-Risk Customers | 357 customers showing declining engagement |
| Loyal Customers | Highest average lifetime value |
| Overall Trend | Significant portion of customers disengaging over time |

> **Insight:** Customer churn represents a measurable revenue risk given the relatively small base of 793 customers.

**Recommendations:**
- Launch targeted reactivation campaigns for at-risk customers
- Introduce loyalty and retention programs
- Personalize offers for high-frequency buyers

---

### 4. Product & Regional Performance

**Products:**
- Revenue is concentrated in high-ticket, low-volume items
- Creates dependency risk if premium product inventory is disrupted

**Regions:**

| Region | Performance |
|--------|-------------|
| West & East | Highest revenue contribution |
| South | Lower revenue but **higher average order value** |

**Recommendations:**
- Protect and prioritize inventory of high-value products
- Offer extended warranties and bundled services on premium items
- Expand marketing in underperforming regions
- Explore South region's high AOV as a premium upsell opportunity

---

##  Conclusion

The business demonstrates strong top-line performance but faces significant profitability challenges — primarily in the Furniture category. Combined with customer retention risk and regional concentration, the largest opportunities lie in:

1. **Improving Furniture margins** through cost and discount optimization
2. **Retaining at-risk customers** through targeted engagement
3. **Leveraging regional AOV differences** for strategic growth

Addressing these areas could substantially improve overall profitability without requiring revenue growth.

---

##  File Structure

```
 Retail_EDA
 ┣ retail_eda.sql        # Full SQL analysis script
 ┣ README.md             # Project documentation
 ┗ screenshots/          # Query output snapshots 
```
