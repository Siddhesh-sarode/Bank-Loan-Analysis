create database loan;
use loan;
select * from bank;

alter table bank
change column ï»¿id id int(10);

                      -- Total Loan Applications--
-- Total Loan Applications
select count(id) from bank;

-- MTD Loan Applications
select count(id) as total_applications from bank
where month(issue_date)= 2021;

-- PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank
WHERE MONTH(issue_date) = 01;

						-- Total Funded Amount--

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank;

-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank
WHERE MONTH(issue_date) = 12;

-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank
WHERE MONTH(issue_date) = 11;
 
                             -- Average Interest Rate --
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank;

								-- Avg DTI--
SELECT AVG(dti)*100 AS Avg_DTI FROM bank;


							--  GOOD LOAN ISSUED--
-- Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank;

-- Good Loan Applications
select count(id) as good_loan from bank
where loan_status="Fully Paid" or loan_status="Current";

-- Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Funded_amount FROM bank
where loan_status="Fully Paid" or loan_status="Current";

-- Good Loan Amount Received
select sum(total_payment) as Good_Loan_Funded_amount FROM bank
where loan_status="Fully Paid" or loan_status="Current";

                          -- Bad Loan --
-- Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank;

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank
WHERE loan_status = 'Charged Off';

				        -- LOAN STATUS --
 SELECT  loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank
    GROUP BY
        loan_status;

                        -- STATE-- 
	SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY address_state
ORDER BY address_state;

                     -- TERM --
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY term
ORDER BY term;

                        -- EMPLOYEE LENGTH  --
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY emp_length
ORDER BY emp_length;

                              -- PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY purpose
ORDER BY purpose;

                -- HOME OWNERSHIP-- 
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank
GROUP BY home_ownership
ORDER BY home_ownership;

 SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;


select * from bank;