-- ANALYSIS QUERIES
-- Description: Key metrics for delivery reliabilty 
-- All analysis is limited to 2015–2017 (2018 excluded due to incomplete data)

-- 1.Analyze delivery performance and profitability by product category

SELECT 
    Category_name,

    COUNT(*) AS total_orders,

    ROUND(AVG(Days_for_shipping_real), 2) AS avg_shipping_days,

    ROUND(
        COUNTIF(delivery_status = 'LATE DELIVERY') * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate,

    ROUND(AVG(Benefit_per_order), 2) AS avg_profit

FROM 
    `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`

WHERE EXTRACT(YEAR FROM Order_date_DateOrders) BETWEEN 2015 AND 2017

GROUP BY 
    category_name

ORDER BY 
    late_delivery_rate DESC;




-- 2. Late Delivery Rate by Month (Trend Analysis)
-- Analyze monthly delivery performance over time

SELECT 
    DATE_TRUNC(order_date_Orders, MONTH) AS order_month,

    COUNT(order_id) AS total_orders,

    SUM(CASE WHEN delivery_status = 'LATE DELIVERY' THEN 1 ELSE 0 END) AS late_orders,

    ROUND(
        SAFE_DIVIDE(
            SUM(CASE WHEN delivery_status = 'LATE DELIVERY' THEN 1 ELSE 0 END), 
            COUNT(order_id)
        ) * 100,
        2
    ) AS late_delivery_rate

FROM 
    `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`

WHERE EXTRACT(YEAR FROM Order_date_DateOrders) BETWEEN 2015 AND 2017

GROUP BY 
    order_month

ORDER BY 
    order_month;



-- 3. Shipping Mode Performance Analysis
-- Compare actual vs scheduled delivery time and delay rate by shipping mode

SELECT 
    Shipping_Mode,
    COUNT(*) AS total_orders,
    ROUND(AVG(Days_for_shipping_real), 2) AS avg_actual_days,
    ROUND(AVG(Days_for_shipment_scheduled), 2) AS avg_scheduled_days,
    ROUND(COUNTIF(Delivery_Status = 'LATE DELIVERY') * 100 / COUNT(*), 2) AS late_rate_percent
FROM 
    `supply-chain-analysis-capstone.supply_chain_data.cleaned_logistics_data`

    WHERE EXTRACT(YEAR FROM Order_date_DateOrders) BETWEEN 2015 AND 2017
GROUP BY 
    Shipping_Mode
ORDER BY 
    late_rate_percent DESC;





