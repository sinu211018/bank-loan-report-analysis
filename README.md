# Bank-Loan-Report-Analysis



### Introduction to the Financial Loan Dataset

This dataset provides a comprehensive look at personal loans, containing **38,576 records** and **24 distinct features**. It offers a rich source of information for understanding lending patterns, borrower demographics, and loan outcomes. The data encompasses various aspects of each loan, including borrower details, loan characteristics, and repayment status, making it ideal for a wide range of financial analyses, from credit risk assessment to predictive modeling.

-----

### Data Composition and Key Features

The dataset is structured with a mix of numerical and categorical features, providing both quantitative and qualitative insights.

#### Borrower Information

  * **Demographics**: The dataset includes basic demographic information such as the borrower's **address state**, **home ownership** status (the majority either `RENT` or have a `MORTGAGE`), and **employment length**. A significant number of borrowers have **10+ years of employment**, suggesting a stable employment base.
  * **Financial Profile**: Key financial metrics include **annual income**, with a mean of approximately **$69,644**, and a **debt-to-income (DTI) ratio**. The annual income is right-skewed, with a few high-earning individuals.

#### Loan Characteristics

  * **Loan Amount and Terms**: Loan amounts range from **$500 to $35,000**, with an average of **$11,296**. The loans are offered with two primary terms: **36 months** (the most common) and **60 months**.
  * **Purpose of Loan**: The primary reason for borrowing is **debt consolidation**, followed by **credit card** refinancing. Other significant purposes include **home improvement**, **major purchases**, and **small business** loans.
  * **Interest Rates and Grades**: The interest rate on loans varies from **5.42% to 24.59%**, with an average of **12.05%**. Each loan is assigned a **grade** (A to G) and a **sub-grade**, which likely reflects the lender's assessment of risk, with Grade 'B' being the most common.

#### Loan Status and Repayment

  * **Loan Status**: The dataset tracks the status of each loan. A majority of the loans are **"Fully Paid,"** while a smaller but significant portion are **"Charged Off,"** indicating a default. A small number of loans are **"Current."**
  * **Payment Information**: The dataset also contains details about the total amount paid by the borrower (`total_payment`).

-----

### Analytical Approach and Potential Uses

This dataset is well-suited for a variety of analytical projects:

  * **Credit Risk Modeling**: The `loan_status` column can be used as a target variable to build models that predict the likelihood of a borrower defaulting on a loan. Features like `grade`, `dti`, `annual_income`, and `emp_length` would be crucial for such a model.
  * **Exploratory Data Analysis (EDA)**: The data can be explored to uncover relationships between different variables. For example, one could analyze how interest rates vary with loan purpose or how loan grades are distributed across different states.
  * **Customer Segmentation**: Borrowers could be segmented into different groups based on their demographic and financial profiles. This can help in understanding the customer base better and in tailoring financial products.

### Data Quality

The dataset is generally clean, with one notable exception: the **`emp_title`** column has **1,438 missing values**. This should be addressed during any data preprocessing phase. All other columns are complete, and the data types are consistent.

This detailed overview provides a solid foundation for anyone looking to understand and work with this financial loan dataset.


#	ANALYZING THE DATA USNING SQL SERVER MANAGEMENT

### KEY PERFORMANCE INDICATORS 
   1.	TOTAL LAON APPLICATIONS
   
      select count(id)as Total_Loan_Applications from financial_loan

   
   <img width="275" height="105" alt="image" src="https://github.com/user-attachments/assets/bb5f829b-eb6e-4f3b-ba18-9769d348e789" />

   2.	TOTAL LOAN APPLICATION MONTHS TO DATE, 12TH MONTHS

      select count(id)as MTD_Total_Loan_Applications from financial_loan
      where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

   <img width="327" height="70" alt="image" src="https://github.com/user-attachments/assets/2e476452-da26-4619-aa7f-6ef60c90fe96" />

   3.	TOTAL LOAN APPLICATION MONTHS TO DATE, 12TH MONTHS
      
      select count(id)as PMTD_Total_Loan_Applications from financial_loan – NOVEMBER
      where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021


   <img width="334" height="73" alt="image" src="https://github.com/user-attachments/assets/a664a00f-10da-4fa8-82bc-557aab525a1d" />

   4.	TOTAL FUNDED AMOUNT

      SELECT SUM(loan_amount) AS Total_funded_amount FROM financial_loan


   <img width="263" height="83" alt="image" src="https://github.com/user-attachments/assets/c52ebf7e-15e2-4a1d-9ffe-81bd332b73f3" />

   5.TOTAL FUNDED AMOUNT MTD 
       
     SELECT SUM(loan_amount) AS MTD_Total_funded_amount FROM financial_loan 
     where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


   <img width="253" height="75" alt="image" src="https://github.com/user-attachments/assets/ffd16651-561b-4e08-b181-bb4890919086" />
   
  6.	TOTAL FUNDED AMOUNT PREVIOUS MONTHS , PMTD, (NOV)

    SELECT SUM(loan_amount) AS PMTD_Total_funded_amount FROM financial_loan 
    where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021
  <img width="316" height="69" alt="image" src="https://github.com/user-attachments/assets/012e0818-7c76-4033-8301-93488e3bbb57" />

   7. TOTAL AMOUNT RECEIVED BY BANK THORUGH USERS

    SELECT SUM(total_payment) AS Total_Amount_recieved FROM financial_loan

   <img width="283" height="80" alt="image" src="https://github.com/user-attachments/assets/6cda7079-d9bc-4ceb-be38-87f5ac493699" />
   
   8.	TOTAL AMOUNT RECEIVED BY BANK THORUGH USERS  MTD

    SELECT SUM(total_payment) AS MTD_Total_Amount_recieved FROM financial_loan
    where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021
   <img width="280" height="80" alt="image" src="https://github.com/user-attachments/assets/a2c30f25-5ad2-41ad-8dac-368f965b82c9" />

   9. TOTAL AMOUNT RECEIVED BY BANK THORUGH USERS  PMTD
       
    SELECT SUM(total_payment) AS PMTD_Total_Amount_recieved FROM financial_loan
    where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021 
   <img width="319" height="64" alt="image" src="https://github.com/user-attachments/assets/17b3f43c-4b2b-4dc5-9839-d5da0f2841a3" />

   10. AVG_INTREST_RATE  OF BANK
       
    SELECT ROUND(AVG(int_rate),4) * 100 AS Avg_Intrest_Rate FROM financial_loan
   <img width="219" height="64" alt="image" src="https://github.com/user-attachments/assets/dfe3e5a3-459c-4edb-95b4-d8486fba406f" />
   
   11. AVG_INTREST_RATE  OF BANK   MTD

    SELECT ROUND(AVG(int_rate),4) * 100 AS MTD_Avg_Intrest_Rate FROM financial_loan 
    where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021
   <img width="263" height="72" alt="image" src="https://github.com/user-attachments/assets/af2dc8f9-ab6a-4d04-a33e-7e3eb5121a06" />

   12.AVG_INTREST_RATE  OF BANK PMTD 

    SELECT ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_Intrest_Rate FROM financial_loan 
    where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021
   <img width="292" height="80" alt="image" src="https://github.com/user-attachments/assets/fd15ea8c-b551-4d8c-95f4-ad24e7ca355d" />
   
   13. AVG_DTI
       
    SELECT ROUND(AVG(dti),4) * 100 AS Average_DTI FROM financial_loan
   <img width="203" height="77" alt="image" src="https://github.com/user-attachments/assets/49dda2ce-7611-4e5f-83b1-cc1127e93b93" />

   14. AVG_DTI MTD

    SELECT ROUND(AVG(dti),4) * 100 AS MTD_Average_DTI FROM financial_loan
    WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
   <img width="231" height="75" alt="image" src="https://github.com/user-attachments/assets/5f59db79-03cb-4554-85eb-0c902acd3f73" />
   
   15 . AVG_DTI PMTD

    SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Average_DTI FROM financial_loan
    WHERE MONTH(issue_date) = 11  AND YEAR(issue_date) = 2021
   <img width="258" height="73" alt="image" src="https://github.com/user-attachments/assets/12924068-b043-4812-a613-510c0de94bd0" />
   
   16. GOOD LOAN PERCENTAGE
       
    SELECT  
    ( COUNT (CASE WHEN loan_status = 'Fully Paid' OR loan_status  = 'Current' THEN id END)* 100)
    /
    COUNT(id) AS Good_loan_percentage
    FROM financial_loan
   <img width="270" height="80" alt="image" src="https://github.com/user-attachments/assets/eb94e29e-8a48-47ce-809a-c425b1c6082a" />

   17. GOOD LOAN APPLICATION
       
    SELECT COUNT(id)  AS Good_Loan_Applications FROM financial_loan
    WHERE loan_status  = 'Fully Paid' OR loan_status = 'Current'
    
   <img width="263" height="48" alt="image" src="https://github.com/user-attachments/assets/82b2410d-6db3-4577-890e-5979e55db861" />

   18. GOOD LOAN FUNDED AMOUNT
       
    SELECT SUM(loan_amount)  AS Good_Loan_FUNDED_Amount FROM financial_loan -- GOOD LOAN FUNDED AMOUNT
    WHERE loan_status  = 'Fully Paid' OR loan_status = 'Current'
   <img width="333" height="69" alt="image" src="https://github.com/user-attachments/assets/9b801503-2faa-4773-b8cf-e7da94db6d1b" />

   19. GOOD LOAN TOTAL AMOUNT REICEVED
   

    SELECT SUM(total_payment)  AS Good_Loan_Amount_RECIVED FROM financial_loan 
    WHERE loan_status  = 'Fully Paid' OR loan_status = 'Current'

   <img width="333" height="77" alt="image" src="https://github.com/user-attachments/assets/03364f59-36f4-41e4-9be7-c32c2778ac96" />

   20. BAD LOAN PERCENTAGE


    SELECT 
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100)/
    COUNT(id) AS Bad_Loan_Percentage
    FROM financial_loan
   <img width="259" height="69" alt="image" src="https://github.com/user-attachments/assets/0bca3ad1-20aa-41db-b461-2e765f7ab0d3" />

   21. BAD LOAN APPLICATIONS
       
       
    SELECT COUNT(id)  AS BAD_Loan_Applications FROM financial_loan 
    WHERE loan_status  = 'Charged Off'
   <img width="277" height="73" alt="image" src="https://github.com/user-attachments/assets/143f0670-45d9-41fd-b066-63a4e0d9cb53" />

   22.BAD LOAN FUNDED AMOUNT

    SELECT SUM(loan_amount)  AS BAD_Loan_FUNDED_Amount FROM financial_loan 
    WHERE loan_status  = 'Charged Off'
   <img width="308" height="69" alt="image" src="https://github.com/user-attachments/assets/45ffe029-cfa0-42eb-ad5a-da236d7d8455" />

   23. BAD LOAN TOTAL AMOUNT


    SELECT SUM(total_payment)  AS BAD_Loan_Amount_Recived FROM financial_loan 
    WHERE loan_status  = 'Charged off'
   <img width="309" height="86" alt="image" src="https://github.com/user-attachments/assets/8db9c182-2afe-44e6-b0b0-57d803e594da" />


   24.    LOAN STATUS

       SELECT 
       loan_status, 
       COUNT(id) AS Total_Loan_Applications,
       SUM(total_payment) AS Total_Amount_Received,
       SUM(loan_amount) AS Total_Funded_Amount,
       AVG(int_rate * 100) AS Intrest_Rate,
       AVG(dti * 100) as DTI

    FROM
      financial_loan
    GROUP BY
      loan_status
   <img width="940" height="150" alt="image" src="https://github.com/user-attachments/assets/b5967808-53de-4240-96ad-e2d5b4fb9b59" />
   
   25.  LOAN STATUS BY MTD
       
    SELECT 
    loan_status,
    SUM(total_payment) AS MTD_Total_amount_received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
    FROM financial_loan
    WHERE MONTH(issue_date) = 12
    GROUP BY loan_status
   <img width="667" height="130" alt="image" src="https://github.com/user-attachments/assets/fdfc3995-5549-4498-87f8-7914990ee245" />

   26. LOAN amount by months
       


    SELECT  
    MONTH(issue_date) AS order_no,
    DATENAME(MONTH , issue_date) AS month_name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY MONTH(issue_date) , DATENAME(MONTH, issue_date)
    ORDER BY MONTH(issue_date)
   <img width="883" height="400" alt="image" src="https://github.com/user-attachments/assets/5072f989-0ab5-40a9-99f6-6e4b326d3e89" />

   27. loan by address_state
       

    SELECT
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY address_state
    ORDER BY address_state
   <img width="797" height="836" alt="image" src="https://github.com/user-attachments/assets/38f654c8-7fee-4fe5-96f0-a6d0d0ca3726" />

   27. LOAN BY STATE
       

    SELECT -- loan by address_state, 
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY address_state
    ORDER BY SUM(loan_amount) DESC
   <img width="783" height="863" alt="image" src="https://github.com/user-attachments/assets/a06a3c3c-514d-4de0-a74a-3995bca8febf" />
   

   28. LOAN ADRESS STATE BY COUNT(ID)


           
    SELECT
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY address_state
    ORDER BY  COUNT(id) DESC

   <img width="783" height="403" alt="image" src="https://github.com/user-attachments/assets/aa8cc770-ae7e-4473-9dce-1b4f0028aa93" />

   29. term wise

    SELECT -- loan by address_state, by term, 
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY term
    ORDER BY term
   <img width="783" height="117" alt="image" src="https://github.com/user-attachments/assets/dabb72bb-fb87-4e65-8e7d-a5f90c65ee59" />

   30. LOAN ADRESS BY STATE

    SELECT -- loan by address_state, by emp_length, 
    emp_length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY emp_length
    ORDER BY emp_length
   <img width="769" height="356" alt="image" src="https://github.com/user-attachments/assets/0613ca25-a4b4-486d-bab5-628489ef473c" />

   31. loan by address_state, by emp_length , COUNT(id)

    SELECT , 
    emp_length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY emp_length
    ORDER BY COUNT(id) DESC

   <img width="767" height="361" alt="image" src="https://github.com/user-attachments/assets/ac8184c5-31e6-4f54-9afd-cad82eeaea05" />
   
   31. LOAN AMOUNT BY PURPOSE

    SELECT, 
    purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY purpose
    ORDER BY COUNT(id) DESC
   <img width="842" height="469" alt="image" src="https://github.com/user-attachments/assets/47b4c353-4c45-4be3-a714-1ca10f04ebeb" />
   
   32. LOAN AMOUNT BY HOME OWNERHIP

    SELECT -- loan by address_state, by emp_length, 
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    GROUP BY home_ownership
    ORDER BY COUNT(id) DESC
   <img width="836" height="211" alt="image" src="https://github.com/user-attachments/assets/4f73d51d-5c48-4515-9c6f-fe3d12832f4f" />

   33. by filter grade

    SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    WHERE grade = 'A' -- by grade filter
    GROUP BY home_ownership
    ORDER BY COUNT(id) DESC
   <img width="803" height="178" alt="image" src="https://github.com/user-attachments/assets/13cbc32d-a2b9-4f04-bb6c-ab5339fc98d2" />

   33. by GRDE AND STATE FILTER

    SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    Sum(total_payment) AS Total_Received_Amount
    FROM financial_loan
    WHERE grade = 'A' AND address_state = 'CA' -- by grade filter
    GROUP BY home_ownership
    ORDER BY COUNT(id) DESC

   <img width="819" height="159" alt="image" src="https://github.com/user-attachments/assets/e79cd423-4463-4337-9549-6b76c3504d28" />

# TABLEAU DASHBOARD

###                             SUMMARY DASHBOARD

<img width="1203" height="677" alt="image" src="https://github.com/user-attachments/assets/c8878c9b-ff0e-4de6-aae5-7321ff7dad2c" />
<img width="1211" height="677" alt="image" src="https://github.com/user-attachments/assets/8de297df-8460-4e1e-aff0-6a0f3f7d1612" />
<img width="1207" height="681" alt="image" src="https://github.com/user-attachments/assets/f00b6ce3-824a-45cd-a343-7a718f1e375c" />
<img width="1206" height="682" alt="image" src="https://github.com/user-attachments/assets/64881d88-ef1f-45f6-b398-c52c224fba25" />
<img width="1207" height="682" alt="image" src="https://github.com/user-attachments/assets/9ad5807f-07a7-49ab-b490-c84fca0fdb9c" />





###                             OVERVIEW DASHBOARD

<img width="1209" height="681" alt="image" src="https://github.com/user-attachments/assets/010784b9-76c1-4df9-b32e-889fa7be91e8" />
<img width="1211" height="684" alt="image" src="https://github.com/user-attachments/assets/a2079c63-9923-4ef9-9f83-63a81b99358c" />
<img width="1205" height="679" alt="image" src="https://github.com/user-attachments/assets/5965de9d-b372-4606-9a08-1301834d661a" />












    





 





       













    





    




     

     






      





