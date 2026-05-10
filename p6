PRACTICAL 6 — Aggregate Functions & Grouping: Student Performance Report
```sql
-- Create Table
CREATE TABLE Marks (
mark_id INT PRIMARY KEY,
student_name VARCHAR(50),
subject VARCHAR(50),
marks INT
);
-- Insert Records
INSERT INTO Marks VALUES
(1, 'Amit', 'Maths', 85),
(2, 'Priya', 'Maths', 72),
(3, 'Ravi', 'Science', 90),
(4, 'Sneha', 'Science', 65),
(5, 'Neha', 'English', 78),
(6, 'Raj', 'English', 55),
(7, 'Amit', 'Science', 80),
(8, 'Priya', 'English', 74);
-- 1. Highest, Lowest, Average marks
SELECT
MAX(marks) AS highest,
MIN(marks) AS lowest,
AVG(marks) AS average
FROM Marks;
-- 2. Count of students per subject
SELECT subject, COUNT(
*) AS student_count
FROM Marks
GROUP BY subject;
-- 3. Subjects with average marks > 70 (HAVING)
SELECT subject, AVG(marks) AS avg_marks
FROM Marks
GROUP BY subject
HAVING AVG(marks) > 70;
