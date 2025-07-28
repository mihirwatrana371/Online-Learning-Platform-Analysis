-- Students Table: Stores information about registered students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL,
    country VARCHAR(50),
    age INT
) ENGINE=InnoDB;

-- Instructors Table: Stores information about course instructors
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialty VARCHAR(100)
) ENGINE=InnoDB;

-- Courses Table: Stores information about available courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    instructor_id INT NOT NULL,
    difficulty_level VARCHAR(20) CHECK (difficulty_level IN ('Beginner', 'Intermediate', 'Advanced')) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    duration_hours INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
) ENGINE=InnoDB;

-- Enrollments Table: Tracks student enrollments in courses
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    completion_date DATE, -- NULL if not completed
    grade DECIMAL(5, 2),  -- NULL if not completed or graded
    status VARCHAR(20) CHECK (status IN ('In Progress', 'Completed', 'Dropped', 'Pending')) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE (student_id, course_id) -- A student can enroll in a course only once
) ENGINE=InnoDB;

-- Lessons Table: Details about individual lessons within a course
CREATE TABLE Lessons (
    lesson_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    lesson_name VARCHAR(255) NOT NULL,
    lesson_order INT NOT NULL, -- Order of lessons within a course
    lesson_type VARCHAR(50) CHECK (lesson_type IN ('Video', 'Quiz', 'Reading Material', 'Project')) NOT NULL,
    duration_minutes INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE (course_id, lesson_order)
) ENGINE=InnoDB;

-- Quizzes Table: Information about quizzes (which are a type of lesson)
CREATE TABLE Quizzes (
    quiz_id INT PRIMARY KEY,
    lesson_id INT NOT NULL,
    quiz_name VARCHAR(255) NOT NULL,
    max_score INT NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES Lessons(lesson_id)
) ENGINE=InnoDB;

-- Quiz_Attempts Table: Records each attempt a student makes on a quiz
CREATE TABLE Quiz_Attempts (
    attempt_id INT PRIMARY KEY,
    enrollment_id INT NOT NULL, -- Links to the specific enrollment
    quiz_id INT NOT NULL,
    attempt_date DATETIME NOT NULL, -- Changed from TIMESTAMP for broader MySQL compatibility and common practice
    score DECIMAL(5, 2) NOT NULL,
    time_taken_minutes INT,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id),
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(quiz_id)
) ENGINE=InnoDB;
