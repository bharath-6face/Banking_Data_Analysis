Create database banking_system;
use banking_system;
show databases;
CREATE TABLE banking_transactions (
    Transaction_ID VARCHAR(20) PRIMARY KEY,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Occupation VARCHAR(100),
    Monthly_Income DECIMAL(12,2),
    Account_Type VARCHAR(50),
    Account_Status VARCHAR(20),
    Customer_Segment VARCHAR(50),
    Relationship_Years INT,
    Loan_Customer VARCHAR(10),
    Credit_Score INT,
    Transaction_Type VARCHAR(20),
    Transaction_Channel VARCHAR(50),
    Payment_Method VARCHAR(50),
    Merchant_Category VARCHAR(100),
    Transaction_Amount DECIMAL(15,2),
    Account_Balance DECIMAL(15,2),
    Currency VARCHAR(10),
    Branch VARCHAR(100),
    IFSC_Code VARCHAR(20),
    City VARCHAR(100),
    State VARCHAR(100),
    Transaction_Date DATE,
    Transaction_Time TIME,
    Day_of_Week VARCHAR(20),
    Device_Type VARCHAR(50),
    Login_Location VARCHAR(100),
    Transaction_Status VARCHAR(20),
    Fraud_Flag VARCHAR(10),
    Remarks VARCHAR(255)
);

select * from banking_transactions;
select count(*) from banking_transactions;
SELECT * 
FROM banking_transactions
LIMIT 10;
DESCRIBE banking_transactions;
SELECT AVG(Transaction_Amount)
FROM banking_transactions;
SELECT YEAR(Transaction_Date)
FROM banking_transactions;
SELECT Customer_Name
FROM banking_transactions;
SELECT
Customer_Name,
Transaction_Amount,
Payment_Method
FROM banking_transactions;

SELECT
Customer_Name,
Occupation,
Monthly_Income,
Credit_Score
FROM banking_transactions;

SELECT *
FROM banking_transactions
WHERE City = 'Chennai';

SELECT *
FROM banking_transactions
WHERE Transaction_Amount > 50000;

select * from banking_transactions
where Relationship_Years > 15;

select Customer_Name, Transaction_Amount, Payment_Method
from banking_transactions;

select * from banking_transactions
where City = 'chennai';

select Customer_Name, City, Transaction_Amount
from banking_transactions
where City = 'chennai' and Transaction_Amount > 50000;

select * from banking_transactions
where city = 'chennai' or city = 'madurai';

select customer_name, Transaction_amount
from banking_transactions
order by Transaction_Amount DESC;

select sum(Transaction_Amount) from banking_transactions;

select avg(transaction_amount) from banking_transactions;

select city, count(transaction_amount) from banking_transactions
group by city ;

select city,  sum(transaction_amount) from banking_transactions
group by city;

select sum(transaction_amount) from banking_transactions
group by city
having sum(transaction_amount) > 5000 limit 1;

select customer_name from banking_transactions
order by Transaction_Amount DESC limit 10;
SELECT
    City,
    COUNT(*) AS Total_Transactions
FROM banking_transactions
GROUP BY City
HAVING COUNT(*) > 5000;

select customer_name, city, transaction_amount
from banking_transactions
where city in ( 'chennai', 'madurai', 'coimbatore');

select customer_name, transaction_amount
from banking_transactions
where transaction_amount between 10000 and 50000;

select customer_name
from banking_transactions
where customer_name like 'a%';

select customer_name, occupation
from banking_transactions
where Occupation like '%manager%';

SELECT
    Customer_Name,
    Transaction_Amount,
    CASE
        WHEN Transaction_Amount >= 50000 THEN 'High'
        WHEN Transaction_Amount BETWEEN 10000 AND 49999 THEN 'Medium'
        ELSE 'Low'
    END AS Transaction_Size
FROM banking_transactions;

select customer_name, age,
   case
       when age >59 then 'senir_citizen'
      when age >30 then 'Ruling_citizen'
      else 'Future_citizen'
   end as Age_definiction
from banking_transactions;

SELECT
    Customer_Name AS Customer,
    Transaction_Amount AS Amount,
    City AS Location
FROM banking_transactions;

SELECT
    UPPER(Customer_Name) AS Customer_Name
FROM banking_transactions;

SELECT
    LOWER(Customer_Name) AS Customer_Name
FROM banking_transactions;

select customer_name, length(customer_name) as name_length
from banking_transactions;

SELECT
    Transaction_Date,
    MONTHNAME(Transaction_Date) AS Month_Name
FROM banking_transactions;

SELECT
    Transaction_Date,
    MONTH(Transaction_Date) AS Month
FROM banking_transactions;

select 
   case 
      when transaction_status = 'success' then 'succes'
      else 'failed'
	end as T_status,
    count(*) as Total_transactions
from banking_transactions
group by T_status;

SELECT
    CASE
        WHEN Fraud_Flag = 'Yes' THEN 'Fraud'
        ELSE 'Normal'
    END AS Fraud_Status,
    COUNT(*) AS Total
FROM banking_transactions
GROUP BY Fraud_Status;

SELECT
    City,
    SUM(Transaction_Amount) AS Total_Transaction_Amount
FROM banking_transactions
GROUP BY City
ORDER BY Total_Transaction_Amount DESC
LIMIT 5;

SELECT
    Customer_Name,
    Transaction_Amount
FROM banking_transactions
ORDER BY Transaction_Amount DESC
LIMIT 10;

SELECT
    Branch,
    SUM(Transaction_Amount) AS Total_Amount
FROM banking_transactions
GROUP BY Branch
ORDER BY Total_Amount DESC;

SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM banking_transactions
GROUP BY Payment_Method
ORDER BY Total_Transactions DESC;

SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers
FROM banking_transactions
GROUP BY Customer_Segment;

SELECT
    Account_Type,
    COUNT(*) AS Total_Customers
FROM banking_transactions
GROUP BY Account_Type;

select customer_name, Transaction_amount
from banking_transactions
where transaction_amount > (select avg(Transaction_Amount) from banking_transactions);


select customer_name, Transaction_amount, city
from banking_transactions
where transaction_amount > (select avg(Transaction_Amount) from banking_transactions) and city = 'chennai';

SELECT
    bt1.Customer_Name,
    bt1.City,
    bt1.Transaction_Amount
FROM banking_transactions bt1
WHERE bt1.Transaction_Amount >
(
    SELECT AVG(bt2.Transaction_Amount)
    FROM banking_transactions bt2
    WHERE bt2.City = bt1.City
);

WITH High_Value_Transactions AS (
    SELECT
        Customer_Name,
        City,
        Transaction_Amount
    FROM banking_transactions
    WHERE Transaction_Amount > 50000
)

SELECT *
FROM High_Value_Transactions;

SELECT
    Customer_Name,
    Transaction_Amount
FROM banking_transactions
WHERE Transaction_Amount >
(
    SELECT AVG(Transaction_Amount)
    FROM banking_transactions
);

SELECT
    Customer_Name,
    Transaction_Amount,
    ROW_NUMBER() OVER
    (
        ORDER BY Transaction_Amount DESC
    ) AS Row_No
FROM banking_transactions;
SELECT
    Customer_Name,
    Transaction_Amount,
    RANK() OVER
    (
        ORDER BY Transaction_Amount DESC
    ) AS Customer_Rank
FROM banking_transactions;

;

SELECT
    Customer_Name,
    Transaction_Amount,
    LAG(Transaction_Amount)
    OVER
    (
        ORDER BY Transaction_Date
    ) AS Previous_Transaction
FROM banking_transactions;

SELECT
    Customer_Name,
    Transaction_Amount,
    LEAD(Transaction_Amount)
    OVER
    (
        ORDER BY Transaction_Date
    ) AS Next_Transaction
FROM banking_transactions;

SELECT
    Customer_Name,
    City,
    Transaction_Amount,
    RANK() OVER
    (
        PARTITION BY City
        ORDER BY Transaction_Amount DESC
    ) AS City_Rank
FROM banking_transactions;