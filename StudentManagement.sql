-- Student Management Database (Microsoft SQL Server)

CREATE DATABASE StudentManagement;
GO

USE StudentManagement;
GO

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);
GO

INSERT INTO Students
(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Amit','Male',15,'10A',85,78,90),
('Priya','Female',14,'9A',92,88,95),
('Rahul','Male',15,'10A',76,81,72),
('Sneha','Female',14,'9B',89,93,91),
('Arjun','Male',16,'10B',95,97,94),
('Neha','Female',15,'10A',68,75,80),
('Karan','Male',14,'9A',82,79,85),
('Pooja','Female',16,'10B',91,89,87),
('Vikas','Male',15,'9B',73,70,78),
('Anjali','Female',14,'9A',88,92,90);
GO

-- Show all students
SELECT * FROM Students;

-- Average score in each subject
SELECT AVG(MathScore) AS Avg_Math,
       AVG(ScienceScore) AS Avg_Science,
       AVG(EnglishScore) AS Avg_English
FROM Students;

-- Top performer
SELECT TOP 1 Name,
(MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC;

-- Count students per grade
SELECT Grade, COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

-- Average score by gender
SELECT Gender,
AVG((MathScore + ScienceScore + EnglishScore)/3.0) AS AverageScore
FROM Students
GROUP BY Gender;

-- Students with Math > 80
SELECT *
FROM Students
WHERE MathScore > 80;

-- Update student's grade
UPDATE Students
SET Grade='10B'
WHERE Name='Amit';
