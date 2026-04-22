-- Проверим, что данные исправились корректно
SELECT 
    COUNT(*) AS total_rows,
    AVG(s_all_avg) AS average_activity,
    MIN(s_all_avg) AS min_activity,
    MAX(s_all_avg) AS max_activity
FROM user_logs;