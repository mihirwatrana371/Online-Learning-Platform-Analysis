# Online-Learning-Platform-Analysis
This project, "Online Education Analytics: Driving Student Success &amp; Course Optimization," is a pure SQL project designed to analyze student engagement and course effectiveness within a online learning platform.

### 🚀 Project Overview ##
---
This project showcases a pure SQL solution for analyzing key performance indicators (KPIs) and gaining actionable insights within a hypothetical online learning platform. As data analysts, understanding student engagement, course effectiveness, and instructor performance is paramount for making informed business decisions. This repository provides a robust SQL database design, a rich dataset, and a suite of advanced queries to address critical analytical questions.

---

### 🎯 Problem Statement
Online education platforms face challenges in:

- Identifying at-risk students who might disengage.

- Understanding which courses are most effective and profitable.

- Evaluating instructor performance.

- Monitoring overall platform health and user engagement.

This project addresses these challenges by transforming raw transactional data into meaningful insights, empowering stakeholders to optimize learning experiences and improve student retention.

---
### ✨ Features & Technologies
Database Design: A well-normalized relational schema (5 tables) designed to capture core entities like Students, Instructors, Courses, Enrollments, Lessons, Quizzes, and Quiz Attempts.

Advanced SQL Queries: Utilizes Common Table Expressions (CTEs), Window Functions (e.g., NTILE, ROW_NUMBER), Conditional Aggregation (CASE WHEN), and various JOIN types (INNER JOIN, LEFT JOIN) to perform complex data analysis.

- Real-World Data: Populated with a diverse and extensive dataset to simulate realistic online learning scenarios.

- Actionable Insights: Queries are designed to answer specific business questions, providing data-driven recommendations.

- Technology Stack:

- SQL (Primary)

- MySQL

---

### 📊 Database Schema

Our database is structured to efficiently store and retrieve information about the online learning platform. Below is the relational schema diagram illustrating the tables and their relationships.

<img width="1448" height="1018" alt="Online Learning Platform Analysis Schema" src="https://github.com/user-attachments/assets/5a3c632e-a4c1-422f-bace-9d6946464874" />

---

### 📈 Key Analyses & Insights

The queries.sql file contains a variety of queries designed to extract valuable insights. Here are some examples of the analytical questions answered:

1. Student Engagement & Retention:

- Identifying at-risk students based on low quiz scores or incomplete lessons.
- Calculating average quiz scores per course and overall student progress.
- Determining course completion rates.
- Insight: Pinpoints students needing intervention and courses requiring content review.

2. Course Performance & Profitability:

- Ranking courses by total enrollment and total revenue.
- Analyzing average grade per course.
- Insight: Highlights top-performing courses and areas for marketing focus or course improvement.

3. Instructor Effectiveness:

- Calculating average quiz scores for students taught by each instructor.
- Identifying instructors with the highest course completion rates.
- Insight: Supports performance reviews and identifies best practices.

4. Platform Overview:

- Total number of active students, courses, and completed enrollments.
- Distribution of students across different countries/demographics.
- Insight: Provides a high-level snapshot of platform growth and user base.
