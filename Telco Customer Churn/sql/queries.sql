-- 1. Tổng quan
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churn_Count,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Churn_Rate_Pct
FROM Staging_Orders;

-- 2. Churn Rate theo Contract
SELECT 
    Contract,
    COUNT(*) AS Customer_Count,
    ROUND(100.0 * AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END), 2) AS Churn_Rate_Pct
FROM Staging_Orders
GROUP BY Contract
ORDER BY Churn_Rate_Pct DESC;

-- 3. Churn theo Tenure Group
SELECT 
    TenureGroup,
    COUNT(*) AS Customer_Count,
    ROUND(100.0 * AVG(ChurnNumeric), 2) AS Churn_Rate_Pct
FROM Staging_Orders
GROUP BY TenureGroup
ORDER BY TenureGroup;

-- 4. Churn theo Internet Service
SELECT 
    InternetService,
    COUNT(*) AS Customer_Count,
    ROUND(100.0 * AVG(ChurnNumeric), 2) AS Churn_Rate_Pct
FROM Staging_Orders
GROUP BY InternetService
ORDER BY Churn_Rate_Pct DESC;

-- 5. Churn theo Payment Method
SELECT 
    PaymentMethod,
    COUNT(*) AS Customer_Count,
    ROUND(100.0 * AVG(ChurnNumeric), 2) AS Churn_Rate_Pct,
    AVG(MonthlyCharges) AS Avg_Monthly_Charge
FROM Staging_Orders
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Pct DESC;

-- 6. Average Tenure của khách churn vs không churn
SELECT 
    Churn,
    AVG(tenure) AS Avg_Tenure,
    AVG(MonthlyCharges) AS Avg_MonthlyCharges,
    AVG(TotalCharges) AS Avg_TotalCharges
FROM Staging_Orders
GROUP BY Churn;

-- 7. Senior Citizen & Partner
SELECT 
    SeniorCitizen,
    Partner,
    COUNT(*) AS Count,
    ROUND(100.0 * AVG(ChurnNumeric), 2) AS Churn_Rate
FROM Staging_Orders
GROUP BY SeniorCitizen, Partner;