-- Instructor Performance by Student Outcomes
-- Analyze the average grades of students who completed courses taught by each instructor.

SELECT
    i.first_name AS instructor_first_name,
    i.last_name AS instructor_last_name,
    i.specialty,
    COUNT(DISTINCT e.student_id) AS total_students_taught,
    COUNT(e.enrollment_id) AS total_course_enrollments,
    AVG(e.grade) AS average_grade_across_courses
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.status = 'Completed' AND e.grade IS NOT NULL
GROUP BY i.instructor_id, i.first_name, i.last_name, i.specialty
ORDER BY average_grade_across_courses DESC;