
-- Database: student_submissions_db

CREATE DATABASE IF NOT EXISTS student_submissions_db;
USE student_submissions_db;

-- ===============================
-- 1. STUDENT TABLE
-- ===============================
CREATE TABLE student (
    username VARCHAR(50) PRIMARY KEY
);

-- ===============================
-- 2. ASSIGNMENT TABLE
-- ===============================
CREATE TABLE assignment (
    shortname VARCHAR(50) PRIMARY KEY,
    due_date DATE NOT NULL,
    url VARCHAR(255)
);

-- ===============================
-- 3. SUBMISSION TABLE
-- ===============================
CREATE TABLE submission (
    username VARCHAR(50),
    shortname VARCHAR(50),
    version INT,
    submit_date DATE NOT NULL,
    data TEXT,
    PRIMARY KEY (username, shortname, version),
    FOREIGN KEY (username) REFERENCES student(username)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (shortname) REFERENCES assignment(shortname)
        ON UPDATE CASCADE ON DELETE CASCADE
);
