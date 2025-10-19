# 🏦 Bank Loan Analysis (SQL + Power BI Project)

## 📘 Project Overview
The **Bank Loan Analysis Project** focuses on analyzing real-world loan data to extract meaningful business insights using **SQL** and visualizing them through **Power BI dashboards**.  
This project highlights data-driven decision-making by identifying trends in loan performance, borrower behavior, and financial risk patterns.

---

## 📂 Dataset Used
**Dataset Name:** `bank_loan_data`  
**Description:**  
The dataset contains detailed records of issued loans, including:
- Loan Amount, Interest Rate, Term  
- Borrower Employment Length, Home Ownership, Purpose  
- Loan Status, Payment Details, Issue Dates  

---

## 🧰 Tools Used
- 🗄️ **SQL Server** → for data analysis and querying  
- 📊 **Power BI** → for dashboard creation and visualization  
- 🧾 **Excel / CSV Dataset** → provided raw dataset  

---

## 🎯 Project Objectives
The main goals of this project are to:
- Analyze loan performance metrics using SQL queries  
- Identify **Good vs Bad loans** and repayment trends  
- Evaluate monthly loan trends and borrower profiles  
- Build **interactive Power BI dashboards** for better insights  

---

## 🧮 SQL Data Analysis

### 🔹 Key Performance Indicators (KPIs)
- Total Loan Applications  
- Total Funded Amount  
- Total Amount Received  
- Average Interest Rate  
- Average DTI (Debt-to-Income Ratio)  
- Good Loan vs Bad Loan Percentage  

### 🔹 Example Queries
```sql
-- Total Loan Applications
SELECT COUNT(id) AS total_loan_applications FROM bank_loan_data;

-- Total Funded Amount
SELECT SUM(loan_amount) AS total_funded_amount FROM bank_loan_data;

-- Good Loan Percentage
SELECT 
    (COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0) / COUNT(id) 
    AS good_loan_percentage
FROM bank_loan_data;
