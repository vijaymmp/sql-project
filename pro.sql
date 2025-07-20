CREATE DATABASE LearningProductivityDB;
USE LearningProductivityDB;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    education_level VARCHAR(50)
);

INSERT INTO Users (name, age, education_level) VALUES
('Vijay', 21, 'B.Tech'),
('Anita', 22, 'B.Sc'),
('Rahul', 23, 'MBA'),
('Sneha', 20, 'BCA');

CREATE TABLE Study_Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    subject VARCHAR(50),
    hours_spent DECIMAL(3,1),
    session_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Study_Sessions (user_id, subject, hours_spent, session_date) VALUES
(1, 'Math', 2.5, '2025-07-10'),
(1, 'Science', 1.8, '2025-07-11'),
(1, 'English', 1.2, '2025-07-12'),
(2, 'Biology', 3.0, '2025-07-10'),
(2, 'Chemistry', 2.2, '2025-07-11'),
(3, 'Finance', 2.0, '2025-07-10'),
(3, 'Marketing', 1.5, '2025-07-11'),
(4, 'Computer Science', 3.5, '2025-07-10'),
(4, 'Math', 2.0, '2025-07-11');

CREATE TABLE Productivity_Log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    task_name VARCHAR(100),
    task_type VARCHAR(50),
    duration_hours DECIMAL(3,1),
    focus_level INT,
    log_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Productivity_Log (user_id, task_name, task_type, duration_hours, focus_level, log_date) VALUES
(1, 'Reading', 'Learning', 1.5, 8, '2025-07-10'),
(1, 'Exercise', 'Health', 1.0, 7, '2025-07-10'),
(1, 'Project Work', 'Academic', 2.0, 9, '2025-07-11'),
(2, 'Group Study', 'Learning', 2.0, 8, '2025-07-10'),
(3, 'Presentation Prep', 'Academic', 1.5, 6, '2025-07-11'),
(4, 'Coding Practice', 'Learning', 3.0, 9, '2025-07-10'),
(4, 'Gaming', 'Leisure', 1.5, 5, '2025-07-12');

CREATE TABLE Academic_Scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    subject VARCHAR(50),
    score INT,
    test_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Academic_Scores (user_id, subject, score, test_date) VALUES
(1, 'Math', 85, '2025-07-05'),
(1, 'Science', 78, '2025-07-05'),
(2, 'Biology', 88, '2025-07-05'),
(2, 'Chemistry', 82, '2025-07-05'),
(3, 'Finance', 90, '2025-07-05'),
(3, 'Marketing', 84, '2025-07-05'),
(4, 'Computer Science', 95, '2025-07-05'),
(4, 'Math', 88, '2025-07-05');
CREATE TABLE Daily_Reflections (
    reflection_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    reflection_date DATE,
    mood_score INT,
    energy_level INT,
    sleep_hours DECIMAL(3,1),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Daily_Reflections (user_id, reflection_date, mood_score, energy_level, sleep_hours) VALUES
(1, '2025-07-10', 7, 8, 7.5),
(1, '2025-07-11', 8, 7, 6.5),
(1, '2025-07-12', 6, 6, 5.0),
(2, '2025-07-10', 8, 9, 8.0),
(2, '2025-07-11', 7, 8, 7.0),
(3, '2025-07-10', 6, 7, 6.5),
(3, '2025-07-11', 7, 7, 7.0),
(4, '2025-07-10', 9, 9, 8.0),
(4, '2025-07-11', 8, 8, 7.5);

SELECT * FROM Users;
SELECT * FROM Study_Sessions;
SELECT * FROM Productivity_Log;
SELECT * FROM Academic_Scores;
SELECT * FROM Daily_Reflections;

-- User Name, Subject, and Study Hours
SELECT u.name, s.subject, s.hours_spent
FROM Users u
JOIN Study_Sessions s ON u.user_id = s.user_id;

-- User Name, Subject, and Academic Score
SELECT u.name, a.subject, a.score
FROM Users u
JOIN Academic_Scores a ON u.user_id = a.user_id;

-- Total Study Hours Per Subject
SELECT subject, SUM(hours_spent) AS total_hours
FROM Study_Sessions
GROUP BY subject;

-- Average Focus Level per User
SELECT user_id, AVG(focus_level) AS avg_focus
FROM Productivity_Log
GROUP BY user_id;

-- Total Study Sessions Per User
SELECT user_id, COUNT(*) AS total_sessions
FROM Study_Sessions
GROUP BY user_id;

-- Users Who Scored More than 85
SELECT name FROM Users WHERE user_id IN (
    SELECT user_id FROM Academic_Scores WHERE score > 85
);

-- total study hrs
SELECT subject, SUM(hours_spent) AS total_study_hours
FROM Study_Sessions
GROUP BY subject;

-- focus level 
SELECT task_type, AVG(focus_level) AS average_focus
FROM Productivity_Log
GROUP BY task_type;

-- mood score
SELECT reflection_date, mood_score
FROM Daily_Reflections
ORDER BY reflection_date;

-- User Name, Subject, and Score
SELECT Users.name, Academic_Scores.subject,Academic_Scores.score
FROM Academic_Scores
JOIN Users ON Academic_Scores.user_id = Users.user_id;

-- Study Details for 'Vijay'
SELECT name, subject, hours_spent
FROM Study_Sessions
WHERE user_id = (
    SELECT user_id
    FROM Users
    WHERE name = 'Vijay'
);

-- Ranking Students by Total Marks
SELECT 
    Users.name,
    SUM(Academic_Scores.score) AS Total_Mark, 
    RANK() OVER(ORDER BY SUM(Academic_Scores.score) DESC) AS place
FROM Academic_Scores
JOIN Users ON Academic_Scores.user_id = Users.user_id
GROUP BY Users.name;

 -- Sleep Hours vs Average Energy
SELECT sleep_hours, AVG(energy_level) AS average_energy
FROM Daily_Reflections
GROUP BY sleep_hours
ORDER BY sleep_hours;

-- Date-wise Average Energy Level:
SELECT reflection_date, AVG(energy_level) AS average_energy
FROM Daily_Reflections
GROUP BY reflection_date
ORDER BY reflection_date;

-- Total Productivity Hours per User per Day
SELECT 
    u.name,
    p.log_date,
    SUM(p.duration_hours) AS total_productivity
FROM Productivity_Log p
JOIN Users u ON p.user_id = u.user_id
GROUP BY u.name, p.log_date;

-- Highest Scoring Subject per User
WITH RankedScores AS (
    SELECT 
        u.name,
        a.subject,
        a.score,
        ROW_NUMBER() OVER(PARTITION BY a.user_id ORDER BY a.score DESC) AS rn
    FROM Academic_Scores a
    JOIN Users u ON a.user_id = u.user_id
)
SELECT name, subject, score
FROM RankedScores
WHERE rn = 1;

-- Sleep Hours vs Average Academic Score:
SELECT d.sleep_hours, AVG(a.score) AS avg_score
FROM Daily_Reflections d
JOIN Academic_Scores a ON d.user_id = a.user_id
GROUP BY d.sleep_hours
ORDER BY d.sleep_hours;

-- User-wise Average Focus Level:
SELECT u.name, AVG(p.focus_level) AS avg_focus_level
FROM Users u
JOIN Productivity_Log p ON u.user_id = p.user_id
GROUP BY u.name
ORDER BY avg_focus_level DESC;
