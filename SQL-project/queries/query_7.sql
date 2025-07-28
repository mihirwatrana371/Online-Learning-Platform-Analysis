-- Students with Multiple Attempts on Quizzes
-- Identify students who needed multiple attempts to pass a quiz, potentially indicating a need for more support or clearer lesson material.

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    q.quiz_name,
    COUNT(qa.attempt_id) AS number_of_attempts,
    MAX(qa.score) AS highest_score_achieved
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Quiz_Attempts qa ON e.enrollment_id = qa.enrollment_id
JOIN Quizzes q ON qa.quiz_id = q.quiz_id
GROUP BY s.student_id, s.first_name, s.last_name, q.quiz_name
HAVING COUNT(qa.attempt_id) > 1
ORDER BY number_of_attempts DESC, highest_score_achieved ASC;