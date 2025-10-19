select * from bank_loan_data

--BANK LOAN REPORT SUMMARY
--KPI'S:
-- Total Loan Application
select count(id) as mid_lone_applications from bank_loan_data

--PPMTD Loan Application
select count(id) as pmtd_lone_application from bank_loan_data
where month(issue_date) =11 and year(issue_date)=2021

--MTD Total Funded Amount
select sum(loan_amount) as mtd_total_funded_amount from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

--PMTD Total Funded Amount
select sum(loan_amount) as mtd_total_funded_amount from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

--Total  Amount Received--
select sum(total_payment) as total_amount_received from bank_loan_data

--MTD Total Amount Recived
select sum(total_payment) as mtd_total_amount_received from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

---PMTD Total Amount Recived
select sum(total_payment) as pmtd_total_amount_received from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

--Average Interest Rate--
select avg(int_rate)*100 as avg_interest_rate from bank_loan_data
select round(avg(int_rate),4)*100 as avg_interest_rate from bank_loan_data

select round(avg(int_rate),4)*100 as mtd_avg_interest_rate from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

--PMTD Average Interest Rate
select round(avg(int_rate),4)*100 as mtd_avg_interest_rate from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021

--Avg DIT to income ratio--
select avg(dti) as avg_dti from bank_loan_data
select round(avg(dti),4)*100 as avg_dti from bank_loan_data

--MTD Average DIT
select round(avg(dti),4)*100 as mtd_avg_dti from bank_loan_data
where month(issue_date)= 12 and year(issue_date)=2021

--PMTD Avgerage DIT
select round(avg(dti),4)*100 as pmtd_avg_dti from bank_loan_data
where month(issue_date)= 11 and year(issue_date)=2021

--good lone or bad lone
select loan_status from bank_loan_data
select (count(case when loan_status ='fully paid' or loan_status='current' then id end)*100)
/count(id) as good_lone_data
from bank_loan_data

--Good Lone Applications
--Good Loan Percentage
select (count(case when loan_status ='fully paid' or loan_status='current' then id end)*100)
/count(id) as good_lone_data
from bank_loan_data

--Good Loan Application
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Funded Amount
select sum(loan_amount) as good_loan_funded_amount from bank_loan_data where
loan_status= 'fully paid' or loan_status= 'current'

--Good Loan Amount Recived
select sum(total_payment)  as good_loan_recived_amount from bank_loan_data where
loan_status= 'fully paid' or loan_status= 'current'

--Bad Loan--
--BAd Loan Application
select (count(case when loan_status ='charged off' then id end)*100)
/count(id) as good_lone_data
from bank_loan_data

--Bad Loan Applicaton
select count(id) as total_bad_loan_application from bank_loan_data
where loan_status='charged off'

--Bad Loan Funded Amount
select sum(loan_amount) as bad_loan_funded_amount from bank_loan_data where
loan_status= 'charged off'

--Bad Loan Amount Recived
select sum(total_payment)  as bad_loan_recived_amount from bank_loan_data where
loan_status= 'charged off'

--loan status--
	SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Application,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

-- MTD Loan Status Total Amount Recived VS Total Funded Amount  
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


--Months Wise Total Loan Application ,Total Funded Amount And Total Amount Recived
SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date) 

--Total Loan Application ,Total Funded Amount And Total Amount Recived By Address_State 
SELECT 
	address_state, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC

--Term Wise Total Loan Application ,Total Funded Amount And Total Amount Recived
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

--Employee_Length Wise Total Loan Application ,Total Funded Amount And Total Amount Recived
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC

--Purpose Wise Total Loan Application ,Total Funded Amount And Total Amount Recived
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

--Home_Owenership Wise Total Loan Application ,Total Funded Amount And Total Amount Recived
SELECT 
	Home_ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY  COUNT(id) DESC

SELECT 
	Home_ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
where grade='A' and address_state='ca'
GROUP BY home_ownership
ORDER BY  COUNT(id) DESC