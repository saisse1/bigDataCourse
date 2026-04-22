Просмотр 5 случайных строк 
SELECT * FROM user_logs 
ORDER BY RANDOM() 
LIMIT 5;

1. Замена запятых на точки во ВСЕХ колонках с _avg
UPDATE user_logs SET s_all_avg = REPLACE(s_all_avg, ',', '.') WHERE s_all_avg LIKE '%,%';
UPDATE user_logs SET s_course_viewed_avg = REPLACE(s_course_viewed_avg, ',', '.') WHERE s_course_viewed_avg LIKE '%,%';
UPDATE user_logs SET s_q_attempt_viewed_avg = REPLACE(s_q_attempt_viewed_avg, ',', '.') WHERE s_q_attempt_viewed_avg LIKE '%,%';
UPDATE user_logs SET s_a_course_module_viewed_avg = REPLACE(s_a_course_module_viewed_avg, ',', '.') WHERE s_a_course_module_viewed_avg LIKE '%,%';
UPDATE user_logs SET s_a_submission_status_viewed_avg = REPLACE(s_a_submission_status_viewed_avg, ',', '.') WHERE s_a_submission_status_viewed_avg LIKE '%,%';

2. Изменение типа колонок с TEXT на REAL
ALTER TABLE user_logs ALTER COLUMN s_all_avg TYPE REAL USING s_all_avg::REAL;
ALTER TABLE user_logs ALTER COLUMN s_course_viewed_avg TYPE REAL USING s_course_viewed_avg::REAL;
ALTER TABLE user_logs ALTER COLUMN s_q_attempt_viewed_avg TYPE REAL USING s_q_attempt_viewed_avg::REAL;
ALTER TABLE user_logs ALTER COLUMN s_a_course_module_viewed_avg TYPE REAL USING s_a_course_module_viewed_avg::REAL;
ALTER TABLE user_logs ALTER COLUMN s_a_submission_status_viewed_avg TYPE REAL USING s_a_submission_status_viewed_avg::REAL;

3. Среднее значение
SELECT AVG(s_all_avg) AS FROM user_logs;

Проверка данных
SELECT 
    COUNT(*) AS total_rows,
    AVG(s_all_avg) AS average_activity,
    MIN(s_all_avg) AS min_activity,
    MAX(s_all_avg) AS max_activity
FROM user_logs;