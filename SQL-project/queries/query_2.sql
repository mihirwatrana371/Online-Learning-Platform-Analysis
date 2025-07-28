-- Identifying At-Risk students
-- Find students who are "In Progress" for a course but have a low average quiz score (e.g., below 70%) or have dropped a course.
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    c.course_name,
    e.status AS enrollment_status,
    AVG(qa.score) AS average_quiz_score,
    COUNT(qa.attempt_id) AS total_quiz_attempts
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
LEFT JOIN Quiz_Attempts qa ON e.enrollment_id = qa.enrollment_id
WHERE e.status = 'In Progress' OR e.status = 'Dropped'
GROUP BY s.student_id, s.first_name, s.last_name, s.email, c.course_name, e.status
HAVING AVG(qa.score) < 70 OR e.status = 'Dropped' -- Flag if avg score is low or if dropped
ORDER BY average_quiz_score ASC, e.status DESC;