-- Quiz Difficulty Analysis
-- Determine the average score and time taken for each quiz, to identify potentially difficult or time-consuming quizzes.

SELECT
    q.quiz_name,
    l.lesson_name,
    c.course_name,
    AVG(qa.score) AS average_score,
    AVG(qa.time_taken_minutes) AS average_time_taken_minutes,
    COUNT(qa.attempt_id) AS total_attempts
FROM Quizzes q
JOIN Lessons l ON q.lesson_id = l.lesson_id
JOIN Courses c ON l.course_id = c.course_id
JOIN Quiz_Attempts qa ON q.quiz_id = qa.quiz_id
GROUP BY q.quiz_id, q.quiz_name, l.lesson_name, c.course_name
ORDER BY average_score ASC, average_time_taken_minutes DESC;
