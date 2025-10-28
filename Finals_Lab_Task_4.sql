-- Created by Loraine Alonzo
-- BSIT 3C – Finals Lab Task 4: Transforming ER Model to Relational Tables

-- Create Student table
CREATE TABLE student (
    username VARCHAR(50) PRIMARY KEY
);

-- Create Assignment table
CREATE TABLE assignment (
    shortname VARCHAR(50) PRIMARY KEY,
    due_date DATE NOT NULL,
    url VARCHAR(255)
);

-- Create Submission table
CREATE TABLE submission (
    username VARCHAR(50),
    shortname VARCHAR(50),
    version INT,
    submit_date DATE NOT NULL,
    data TEXT,
    PRIMARY KEY (username, shortname, version),
    FOREIGN KEY (username) REFERENCES student(username)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (shortname) REFERENCES assignment(shortname)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Sample Data
INSERT INTO student (username) VALUES ('loraine123');

INSERT INTO assignment (shortname, due_date, url)
VALUES ('IT101_Lab4', '2025-11-05', 'https://example.com/lab4');

INSERT INTO submission (username, shortname, version, submit_date, data)
VALUES ('loraine123', 'IT101_Lab4', 1, '2025-10-28', 'My first submission');
