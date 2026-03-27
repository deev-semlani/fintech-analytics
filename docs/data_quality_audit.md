FATAKPAY DATA QUALITY AUDIT



Audited by: Deev

Date: 08-03-2026

Tool used: Microsoft Excel



TABLE: users\.csv (200 rows, 10 columns)

----------------------------------------

Issue 1: Missing Values

&nbsp; Column     → credit\_score

&nbsp; Count      → 27 out of 200 (13.5%)

&nbsp; Action     → Impute with median grouped by employment\_type



Issue 2: Inconsistent City Names

&nbsp; Column     → city

&nbsp; Dirty vals → Bombay, Bangalore, NEW DELHI

&nbsp; Count      → 6 out of 200 (3%)

&nbsp; Action     → Standardise to Mumbai, Bengaluru, Delhi



Issue 3: Wrong Data Type in Age

&nbsp; Column     → age

&nbsp; Dirty vals → "twenty three", "forty two" and two more

&nbsp; Count      → 4 out of 200 (2%)

&nbsp; Action     → Convert text to integer



TABLE: loans.csv — to be audited in Python

TABLE: repayments.csv — to be audited in Python

TABLE: collections.csv — to be audited in Python

-----------------------------------------------------------

Travel and Electronics Purchase loans have the highest default rates (27 and 16 respectively) as they are non-productive expenditures with zero financial return. Education loans have the lowest default rate as borrowers have strong motivation to maintain good credit for future opportunities

Kolkata has the highest default rate at 61.1% despite having the lowest loan volume (18 loans), suggesting high-risk borrower profiles in that market. Mumbai despite highest volume (66 loans) has the lowest default rate at 31.8% — indicating a more creditworthy customer base.

UPI dominates payments at 26.7% reflecting FatakPay's digital-first customer base. However 34.5% of all EMIs remain unpaid — a critical risk signal. Cash payments at 9.3% suggest a segment of financially underserved customers who lack digital payment access
