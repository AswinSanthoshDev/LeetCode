-- Write your PostgreSQL query statement below
SELECT
 to_char(trans_date, 'YYYY-MM') as month,
 country,
 count(*) as trans_count, 
 SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
 SUM(amount) AS trans_total_amount, 
 SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
from transactions
group by to_char(trans_date, 'YYYY-MM'), country;
