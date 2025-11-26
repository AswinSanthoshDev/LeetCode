-- Write your PostgreSQL query statement below
SELECT 
    ROUND(
        COUNT(CASE WHEN next_day.event_date IS NOT NULL THEN 1 END) * 1.0 / 
        COUNT(DISTINCT first_login.player_id), 
        2
    ) AS fraction
FROM (
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
) AS first_login
LEFT JOIN Activity next_day 
    ON first_login.player_id = next_day.player_id 
    AND next_day.event_date = first_login.first_login_date + INTERVAL '1 day';