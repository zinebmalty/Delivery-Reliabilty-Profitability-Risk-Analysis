# Delivery-Reliabilty-Profitability-Risk-Analysis
Delivery performance analysis exploring late deliveries, shipping efficiency, and profitability risk using SQL and Tableau.

## Project Overview

This project is part of the Google Data Analytics Capstone and focuses on analyzing key delivery-related metrics using a real world supply chain dataset.

The objective is to examine patterns of late deliveries, identify the worst-performing by shipping modes and explore the relationship between delivery reliability and profitability.

It covers three years (2015–2017) and includes an interactive dashboard with a year filter for time based trend analysis.
Data from 2018 was excluded as it only contains one month of records.

## Ask Phase

### Business Objective

The objective of this analysis is to:

- Identify patterns of late deliveries  
- Detect the worst-performing by shipping modes   
- Compare planned vs actual delivery performance  
- Evaluate the relationship between delivery reliability and profitability  


### Key Questions
 
- Which shipping modes are most associated with delays?  
- How has late delivery performance evolved over time (2015–2017)?  
- What is the gap between scheduled and actual shipping duration?  
- How does profitability relate to delivery risk across categories?  


### Stakeholders

- Operations Manager  
- Logistics Team  
- Inventory Manager  


### Target Audience

- Business decision-makers  
- Supply chain and operations teams  



## Prepare Phase

### Data Source

The dataset used in this project is the **DataCo Global Supply Chain Dataset**, obtained from Kaggle.


### Data Description

The dataset contains real-world supply chain operations data across multiple business areas, including:

- Provisioning  
- Production  
- Sales  
- Distribution  


### Data Structure

- Format: CSV  
- Records: 180,000+ rows  
- Columns: 50+ variables  

A new working table was created using SQL by selecting and transforming only the relevant columns required for the analysis.


### Key Variables

- order_id  
- days_for_shipping_real  
- days_for_shipment_scheduled  
- late_delivery_risk  
- delivery_status  
- shipping_mode  
- category_name  
- order_region  
- order_country / customer_country  
- order_date  
- shipping_date  


### Data Scope

- Time period analyzed: 2015–2017  

The dataset includes data for 2018; however, it contains only one month of records.  
Therefore, the analysis focuses on the years 2015–2017 to ensure consistent and comparable insights.


### Data Credibility (ROCCC)

- **Reliable:** Large dataset suitable for analysis  
- **Original:** Sourced from a recognized data repository (Kaggle / Mendeley)  
- **Comprehensive:** Covers multiple aspects of supply chain operations  
- **Current:** Contains sufficient historical data for trend analysis  
- **Cited:** Widely used in supply chain research  


### Data Limitations

- The dataset represents a single company (DataCo Global)  
- Some variables may not fully capture operational complexity  
- The dataset is historical and may not reflect current conditions

## Process Phase

Data cleaning and transformation were performed using SQL (BigQuery) to prepare the dataset for analysis.

### Data Preparation Steps

- Created a new working table by selecting and retaining only the relevant columns  
- Checked for missing values in key fields and confirmed data completeness  
- Standardized categorical fields using TRIM() and UPPER() to ensure formatting consistency  
- Verified that date and numeric fields were correctly formatted using the schema  
- Reviewed shipping duration fields (real vs scheduled) to ensure logical values  

- Verified duplicate records:
  - Several records were identified with the same order_id  
  - Upon investigation, these records represent multiple items within a single order rather than duplicate errors  
  - Therefore, they were retained to preserve data accuracy  

**Result:** The final dataset is clean, structured, and ready for analysis.  

**Note:** SQL queries used for data cleaning and analysis are available in the `/sql` folder.
## Analyze Phase

The analysis focuses on key delivery-related metrics to identify patterns of late deliveries and evaluate performance over the period 2015–2017.

### Shipping Performance Gap

Significant gaps exist between scheduled and actual delivery times across shipping modes:

- **Second Class:** Scheduled for 2 days, actual delivery averages ~3.99 days, resulting in a high late rate (~85.56%)  
- **Same Day:** Scheduled for 0 days, actual average ~0.48 days, but the target is missed 72.57% of the time  
- **Standard Class:** The only mode where scheduled (4 days) aligns with actual delivery time, resulting in the lowest delay rate  

**Insight:** This indicates inefficiencies in delivery planning and execution.  
**Insight:** The logistics system is optimized for high-volume, low-speed delivery, while faster shipping options are not reliably supported.

### System-Wide Observation

- The overall late delivery rate reaches 54.81%, and most categories perform close to this level  

**Insight:** This indicates that delays are not limited to specific categories but are widespread across the system.  


### Profitability vs Performance

- Profitability shows a slight increase, while delivery performance remains unchanged  

**Insight:** This indicates a misalignment between business growth and operational efficiency.  


### Overall Conclusion

The consistently high delay rates across shipping modes indicate that the issue is systemic rather than localized.

## Share Phase

An interactive dashboard was developed using Tableau to present delivery performance insights and highlight operational risks across regions, shipping modes, and product categories for the period 2015–2017.

The dashboard is structured to guide decision-makers from high-level KPIs to detailed performance breakdowns.

### Dashboard Overview 

![Dashboard](https://github.com/user-attachments/assets/b0b2a013-6550-4f3b-a14b-ad601bd3dcd7)

### Key Performance Indicators (KPIs)

At the top level, key performance indicators provide a quick summary of overall performance:

- Total Orders: 178K  
- Average Benefit per Order: 22.05   
- Overall Late Delivery Rate: 54.81%  

**Insight:** These KPIs reveal a high delay rate despite stable profitability.

  
## Dashboard Insights


### Shipping Mode Analysis
- The Late Delivery Rate by Shipping Mode chart shows that:
  - First Class has the highest delay rate  
  - Followed by Second Class and Same Day  
  - Standard Class performs relatively better  

**Insight:** Faster shipping options underperform compared to expectations.


### Category Performance
- The Late Delivery Rate by Category vs Orders Volume chart highlights:
  - High delay rates even in low-volume categories (e.g., Golf Bags & Carts)  
  - High delay rates in high-volume categories (e.g., Cameras)  

**Insight:** This indicates both specialized handling issues and capacity limitations.


### Time Trend Analysis
- The Late Delivery Trend by Year shows that delay rates remain stable across 2015–2017, with no significant improvement.

**Insight:** The issue is persistent rather than temporary.


### Delivery Time Efficiency
- The Scheduled vs Actual Shipping Duration chart shows:
  - Second Class significantly exceeds planned delivery time  
  - Same Day frequently misses its target  
  - Standard Class aligns closely with planned delivery  

**Insight:** This highlights inefficiencies in delivery planning and execution.


### Profitability vs Delivery Risk
- The Category Profitability vs Delivery Risk chart shows that:
  - Most categories fall within the high-risk zone, including the most profitable ones  
  - A threshold (20%) distinguishes acceptable vs high-risk performance  

**Insight:** High profitability is associated with higher delivery risk.

**Insight:** These design choices enhance usability and support dynamic exploration.
 
## Act Phase

Based on the analysis, several recommendations can be made to improve delivery performance and reduce operational risk.

### Optimize Handling of High-Risk Categories

- Implement specialized handling processes for bulky or non-standard items (eg Golf Bags & Carts)
- Improve internal processing for high-volume categories (eg Cameras)
	
**Result:** This reduces delays caused by packaging and capacity limitations

### Improve Planning and Scheduling Accuracy

- Review the execution of First Class, Second Class, and Same Day shipping  
- Align promised delivery times with actual operational capacity  
- Improve demand forecasting and resource allocation  

**Result:** This enhances delivery time accuracy and operational efficiency  


### Balance Profitability and Delivery Risk

- Monitor high profit categories that also show high delivery risk  
- Ensure that revenue growth is not achieved at the expense of service reliability  

**Result:** This protects long-term customer satisfaction and business sustainability  


### Implement Performance Monitoring

- Track key KPIs:
  - Late delivery rate  
  - Shipping duration gap  
- Use dashboards to monitor performance continuously and support decision-making  

**Result:** This enables proactive management of delivery performance

##  Conclusion

Despite stable profitability, delivery performance remains poor, with more than half of orders delivered late and no significant improvement over time.
The findings highlight a clear misalignment between operational efficiency and business performance, emphasizing the need for improvements in planning, execution, and service reliability and addressing these issues is essential to enhance customer satisfaction and ensure sustainable business growth.


## 🔗 Project Resources

- 📊 Interactive Dashboard:  
  [View on Tableau Public](https://public.tableau.com/views/DeliveryReliabilityProfitRiskAnalysis20152017/Dashboard8)

- 📁 Dataset:  
  [View Dataset on Kaggle](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis/data)

- 💻 SQL Queries:  
  Available in the `/sql` folder




