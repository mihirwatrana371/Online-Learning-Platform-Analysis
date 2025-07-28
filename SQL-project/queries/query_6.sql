-- Course Enrollment Trends by Country
-- Analyze which courses are popular in different countries.

SELECT
    s.country,
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.country, c.course_name
ORDER BY s.country, total_enrollments DESC;