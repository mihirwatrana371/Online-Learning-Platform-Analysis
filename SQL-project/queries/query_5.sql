-- Student Performance Tiers (Using Window Functions)
-- Categorize students based on their overall average quiz score across all completed courses.

WITH StudentOverallScores AS (
    SELECT
        s.student_id,
        s.first_name,
        s.last_name,
        AVG(qa.score) AS overall_average_quiz_score
    FROM Students s
    JOIN Enrollments e ON s.student_id = e.student_id
    JOIN Quiz_Attempts qa ON e.enrollment_id = qa.enrollment_id
    WHERE e.status = 'Completed' -- Only consider scores from completed courses for overall performance
    GROUP BY s.student_id, s.first_name, s.last_name
)
SELECT
    sos.student_id,
    sos.first_name,
    sos.last_name,
    sos.overall_average_quiz_score,
    NTILE(4) OVER (ORDER BY sos.overall_average_quiz_score DESC) AS performance_tier, -- Divides students into 4 performance tiers
    CASE
        WHEN NTILE(4) OVER (ORDER BY sos.overall_average_quiz_score DESC) = 1 THEN 'Top Performer'
        WHEN NTILE(4) OVER (ORDER BY sos.overall_average_quiz_score DESC) = 2 THEN 'Above Average'
        WHEN NTILE(4) OVER (ORDER BY sos.overall_average_quiz_score DESC) = 3 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM StudentOverallScores sos
ORDER BY sos.overall_average_quiz_score DESC;