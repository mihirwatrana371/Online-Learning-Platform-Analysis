-- Overall Course Performance & Completion Rates
-- Find the average grade and completion rate for each course.

SELECT
    c.course_name,
    i.first_name AS instructor_first_name,
    i.last_name AS instructor_last_name,
    COUNT(e.enrollment_id) AS total_enrollments,
    COUNT(CASE WHEN e.status = 'Completed' THEN e.enrollment_id END) AS completed_enrollments,
    CAST(COUNT(CASE WHEN e.status = 'Completed' THEN e.enrollment_id END) AS DECIMAL(5,2)) * 100.0 / COUNT(e.enrollment_id) AS completion_rate_percentage, -- Explicit DECIMAL cast
    AVG(e.grade) AS average_grade_of_completed_students
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name, i.first_name, i.last_name
ORDER BY completion_rate_percentage DESC, average_grade_of_completed_students DESC;course_name