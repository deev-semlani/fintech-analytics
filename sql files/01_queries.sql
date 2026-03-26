--Q1: Customer count by city

SELECT city, COUNT(user_id) AS total_customers
FROM users
GROUP BY city
ORDER BY total_customers DESC

-- Q2: Users with multiple loans
SELECT u.user_id, name, city, COUNT (loan_id) AS no_of_loans
FROM users AS u
JOIN loans AS l ON u.user_id = l.user_id
GROUP BY u.user_id
HAVING COUNT (l.loan_id) > 1
ORDER BY no_of_loans DESC

-- Q3: Total amount disbursed per loan purpose
SELECT loan_purpose, SUM(loan_amount) AS total_amount
FROM loans
GROUP BY loan_purpose
ORDER BY total_amount DESC;

-- Q4: Average credit score of defaulted vs closed loans per city
SELECT city,
ROUND(AVG(CASE WHEN loan_status IN ('Defaulted', 'NPA') THEN credit_score END)) AS avg_bad_loans,
ROUND(AVG(CASE WHEN loan_status IN ('Closed') THEN credit_score END)) AS avg_closed,
((ROUND(AVG(CASE WHEN loan_status IN ('Defaulted', 'NPA') THEN credit_score END))) - 
(ROUND(AVG(CASE WHEN loan_status IN ('Closed') THEN credit_score END)))) AS Difference
FROM users u
JOIN loans l on u.user_id = l.user_id
GROUP BY city;

-- Q5: Number of loans disbursed per month
SELECT count(loan_id) AS no_of_loans, 
strftime('%m', disbursement_date) AS Month, 
strftime('%Y', disbursement_date) AS Year
FROM loans
GROUP BY strftime('%Y', disbursement_date), strftime('%m', disbursement_date)
ORDER BY strftime('%Y', disbursement_date), strftime('%m', disbursement_date) ASC;

-- Q6: Top 3 users by total amount paid back
SELECT u.name, u.city, u.employment_type, SUM(r.amount_paid) AS total_paid
FROM users u
JOIN loans l ON u.user_id = l.user_id
JOIN repayments r ON l.loan_id = r.loan_id
GROUP BY u.user_id
ORDER BY total_paid DESC
LIMIT 3;

-- Q7: Male vs female borrower count
SELECT gender, COUNT(gender)
FROM users
GROUP BY gender;

-- Q8: Hidden risk loans (Active but missing EMIs)
-- Note: No Active loans in FY2024-25 dataset
SELECT DISTINCT l.loan_id, l.loan_status, u.name
FROM loans l
JOIN users u ON l.user_id = u.user_id
JOIN repayments r ON l.loan_id = r.loan_id
WHERE l.loan_status = 'Active'
AND EXISTS (
    SELECT 1 FROM repayments r2 
    WHERE r2.loan_id = l.loan_id 
    AND r2.amount_paid = 0
);

-- Q9: Average interest rate by employment type (risk based pricing)
SELECT employment_type, ROUND(AVG(interest_rate)) AS avg_interest_rate
FROM users u
JOIN loans l ON u.user_id = l.user_id
GROUP BY employment_type
ORDER BY avg_interest_rate DESC;

--Q10: Most popular loan purpose per city
SELECT city, loan_purpose, MAX (total) AS Total 
FROM( 
	SELECT u.city, l.loan_purpose, COUNT(*) AS total
	FROM users u
	JOIN loans l ON u.user_id = l.user_id
	GROUP BY city, loan_purpose
	ORDER BY city, total DESC
	)
GROUP BY city
ORDER BY total DESC