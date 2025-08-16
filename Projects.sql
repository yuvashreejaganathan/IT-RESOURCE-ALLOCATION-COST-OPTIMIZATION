drop table if exists Projects;
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    ClientName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget INT
);

INSERT INTO Projects (ProjectID, ProjectName, ClientName, StartDate, EndDate, Budget) 
VALUES
(1, 'AI Automation', 'TechNova', '2024-01-10', '2024-06-30', 50000),
(2, 'Cloud Migration', 'InnoSoft', '2024-03-01', '2024-12-31', 60000),
(3, 'Data Analytics', 'DataWave', '2024-02-15', '2024-09-15', 150000),
(4, 'Cybersecurity Upgrade', 'SecureLink', '2024-05-01', '2024-11-30', 300000),
(5, 'ERP Implementation', 'FutureWorks', '2024-06-01', '2025-01-31', 180000);