
select * from financial_loan -- GRID VIEW

select count(id)as Total_Loan_Applications from financial_loan

select count(id)as MTD_Total_Loan_Applications from financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

select count(id)as PMTD_Total_Loan_Applications from financial_loan -- NOVEMBER, PMTD
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS MTD_Total_funded_amount FROM financial_loan --- total funded amount
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_funded_amount FROM financial_loan --- total funded amount PMTD
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS Total_Amount_recieved FROM financial_loan -- total payment to bank by users

SELECT SUM(total_payment) AS MTD_Total_Amount_recieved FROM financial_loan -- total payment to bank by users
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021 --MTD

SELECT SUM(total_payment) AS PMTD_Total_Amount_recieved FROM financial_loan -- total payment to bank by users
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021 --MTD

SELECT ROUND(AVG(int_rate),4) * 100 AS Avg_Intrest_Rate FROM financial_loan  -- avg intrest rate

SELECT ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_Intrest_Rate FROM financial_loan -- AVG INTREST RATE MTD
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Average_DTI FROM financial_loan -- AVG DTI MTD 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT loan_status FROM financial_loan

SELECT  -- to find good loan percentage
   ( COUNT (CASE WHEN loan_status = 'Fully Paid' OR loan_status  = 'Current' THEN id END)* 100)
   /
   COUNT(id) AS Good_loan_percentage
FROM financial_loan

SELECT COUNT(id)  AS Good_Loan_Applications FROM financial_loan -- GOOD LOAN APPLICATIONS
WHERE loan_status  = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount)  AS Good_Loan_FUNDED_Amount FROM financial_loan -- GOOD LOAN FUNDED AMOUNT
WHERE loan_status  = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment)  AS Good_Loan_Amount_Recived FROM financial_loan -- GOOD LOAN TOTAL AMOUNT
WHERE loan_status  = 'Fully Paid' OR loan_status = 'Current'


SELECT -- bad loan percentage
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100)/
    COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

SELECT COUNT(id)  AS BAD_Loan_Applications FROM financial_loan -- BAD LOAN APPLICATIONS
WHERE loan_status  = 'Charged Off' 

SELECT SUM(loan_amount)  AS BAD_Loan_FUNDED_Amount FROM financial_loan -- BAD LOAN FUNDED AMOUNT
WHERE loan_status  = 'Charged Off' 

SELECT SUM(total_payment)  AS BAD_Loan_Amount_Recived FROM financial_loan -- BAD LOAN TOTAL AMOUNT
WHERE loan_status  = 'Charged Off' 

SELECT 
       loan_status, -- loan status
       COUNT(id) AS Total_Loan_Applications,
       SUM(total_payment) AS Total_Amount_Received,
       SUM(loan_amount) AS Total_Funded_Amount,
       AVG(int_rate * 100) AS Intrest_Rate,
       AVG(dti * 100) as DTI

  FROM
      financial_loan
  GROUP BY
      loan_status

        SELECT -- loan_status by MTD
    loan_status,
    SUM(total_payment) AS MTD_Total_amount_received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
    FROM financial_loan
WHERE MONTH(issue_date) = 12
GROUP BY loan_status


SELECT -- loan by months, 
    MONTH(issue_date) AS order_no,
    DATENAME(MONTH , issue_date) AS month_name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY MONTH(issue_date) , DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


SELECT -- loan by address_state, by emp_length, 
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY COUNT(id) DESC


SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
FROM financial_loan
WHERE grade = 'A' -- by grade filter
GROUP BY home_ownership
ORDER BY COUNT(id) DESC

SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
FROM financial_loan
WHERE grade = 'A' AND address_state = 'CA' -- by grade filter
GROUP BY home_ownership
ORDER BY COUNT(id) DESC

select * from financial_loan