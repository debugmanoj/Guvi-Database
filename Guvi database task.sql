-- Create the 'guvi' database
CREATE DATABASE IF NOT EXISTS guvi;
USE guvi;

-- Create the 'students' table
CREATE TABLE students (
    studentID INT PRIMARY KEY,
    studentName VARCHAR(20) NOT NULL,
    studentContact VARCHAR(10) UNIQUE,
    studentEmail VARCHAR(30) UNIQUE,
    studentDOB DATE
);

-- Create the 'courses' table
CREATE TABLE courses (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(30) NOT NULL,
    courseDescription VARCHAR(200) NOT NULL,
    courseFee VARCHAR(10) NOT NULL,
    courseDuration VARCHAR(30) NOT NULL
);

-- Create the 'admissions' table
CREATE TABLE admissions (
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES students (studentID),
    FOREIGN KEY (CourseID) REFERENCES courses (courseID)
);

-- Create the 'studentsAttendance' table
CREATE TABLE studentsAttendance (
    s_ID INT,
    s_Attendance DATE NOT NULL,
    s_Score VARCHAR(5) PRIMARY KEY,
    FOREIGN KEY (s_ID) REFERENCES students (studentID)
);

-- Create the 'leaderboards' table
CREATE TABLE leaderboards (
    Student_id INT,
    Studentscore VARCHAR(5) NOT NULL,
    Studentattendance VARCHAR(20) NOT NULL,
    FOREIGN KEY (Student_id) REFERENCES students (studentID),
    FOREIGN KEY (Studentscore) REFERENCES studentsAttendance (s_Score)
);

-- Create the 'fees' table
CREATE TABLE fees (
    stu_id INT,
    cou_id INT,
    fees VARCHAR(10) NOT NULL,
    phone_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (stu_id) REFERENCES students (studentID),
    FOREIGN KEY (cou_id) REFERENCES courses (courseID)
);
