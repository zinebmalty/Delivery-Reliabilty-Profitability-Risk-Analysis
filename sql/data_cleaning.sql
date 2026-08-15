-- DATA CLEANING & PREPARATION
-- Description: Cleaning and validating supply chain dataset

-- 1. Create cleaned table with selected and renamed columns

CREATE OR REPLACE TABLE `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data` AS
SELECT 
    `Order Id` AS Order_id,

    `Days for shipping _real_` AS Days_for_shipping_real,
    `Days for shipment _scheduled_` AS Days_for_shipment_scheduled,

    `Delivery Status` AS Delivery_status,
    Late_delivery_risk,

    `Benefit per order` AS Benefit_per_order,

    `Category Name` AS category_name,
    `Customer Country` AS Customer_country,
    `Order Region` AS Order_region,
    `Order Country` AS Order_country,

    `Shipping Mode` AS Shipping_mode,

    `order date _DateOrders_` AS Order_date_DateOrders,
    `shipping date _DateOrders_` AS Shipping_date_DateOrders

FROM 
    `supply-chain-analysis-capstone.supply_chain_data.supply_chain_row`;


-- 2. Standardize text fields (TRIM + UPPER)
-- Fix inconsistent formatting and encoding issues

CREATE OR REPLACE TABLE `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data` AS
SELECT 
    * EXCEPT (delivery_status, category_name, order_region, shipping_mode, order_country),

    TRIM(UPPER(Delivery_status)) AS Delivery_status,
    TRIM(UPPER(Category_name)) AS Category_name,
    TRIM(UPPER(Order_region)) AS Order_region,
    TRIM(UPPER(Shipping_mode)) AS Shipping_mode,

    -- Fix encoding issue (México → MEXICO)
    REPLACE(TRIM(UPPER(Order_country)), 'MÉXICO', 'MEXICO') AS order_country

FROM 
    `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`;


-- 3. Check for missing values (NULLs)

SELECT
    COUNTIF(Order_id IS NULL) AS null_order_ids,
    COUNTIF(Delivery_status IS NULL) AS null_delivery_status,
    COUNTIF(Days_for_shipping_real IS NULL) AS null_shipping_days,
    COUNTIF(Order_date IS NULL) AS null_order_dates,
    COUNTIF(Category_name IS NULL) AS null_categories,
    COUNTIF(Customer_country IS NULL) AS null_countries
FROM 
    `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`;


-- 4. Check for duplicate records

SELECT
    Order_id,
    Category_name,
    Order_region,
    COUNT(*) AS duplicate_count
FROM `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`
GROUP BY
    Order_id,
    Category_name,
    Order_region
HAVING COUNT(*) > 1;


-- 5. Check distribution of shipping duration (Outlier detection)
-- Identify potential extreme values

SELECT 
    MIN(Days_for_shipping_real) AS min_real,
    MAX(Days_for_shipping_real) AS max_real,
    AVG(Days_for_shipping_real) AS avg_real,

    MIN(Days_for_shipment_scheduled) AS min_scheduled,
    MAX(Days_for_shipment_scheduled) AS max_scheduled,
    AVG(Days_for_shipment_scheduled) AS avg_scheduled

FROM 
    `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`;



-- -----------------------------------------------------
-- 6. Identify extreme values (optional deeper
