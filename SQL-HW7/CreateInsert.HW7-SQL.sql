CREATE DATABASE BarberShop
GO
-- Create tables with no foreing key
CREATE TABLE Barbers
( ID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Gender VARCHAR(10),
  PhoneNumber VARCHAR(50),
  Email VARCHAR(80),
  BirthDate DATE,
  HireDate DATE,
  Position VARCHAR(50),
  Rating VARCHAR(255)
)
GO
SELECT * FROM Barbers

CREATE TABLE Services
(ID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
Price DECIMAL(8,2)
)
GO
SELECT * FROM Services

CREATE TABLE Clients 
 (ID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  PhoneNumber VARCHAR(50),
  Email VARCHAR(80)
)
GO

-- Create tables with foreing key
CREATE TABLE Visits
(ID INT IDENTITY(1,1) PRIMARY KEY,
 ClientID INT  FOREIGN KEY REFERENCES Clients(ID),
 BarberID INT FOREIGN KEY REFERENCES Barbers(ID),
 ServiceID INT FOREIGN KEY REFERENCES Services(ID),
 Date DATE
)
GO

CREATE TABLE Reviews(
ID INT IDENTITY(1,1) PRIMARY KEY,
Message VARCHAR(MAX),
VisitID INT FOREIGN KEY REFERENCES Visits(ID),
AuthorID INT FOREIGN KEY REFERENCES Clients(ID),
ReviewedBarberID INT FOREIGN KEY REFERENCES Barbers(ID),
Date DATE
)
GO
 

CREATE TABLE Scores (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Score VARCHAR(10) NOT NULL CHECK (Score IN ('Great', 'Good', 'Okay', 'Bad', 'Very bad')),
  ClientID INT FOREIGN KEY REFERENCES Clients(ID),
  BarberID INT FOREIGN KEY REFERENCES Barbers(ID),
  VisitID INT FOREIGN KEY REFERENCES Visits(ID)
)
GO

CREATE TABLE BarberServices (
      ID INT IDENTITY(1,1) PRIMARY KEY,
       ServiceID INT FOREIGN KEY REFERENCES Services(ID),
       BarberID INT FOREIGN KEY REFERENCES Barbers(ID),

)

CREATE TABLE Schedule (
   ID INT IDENTITY(1,1) PRIMARY KEY,
   BarberID INT FOREIGN KEY REFERENCES Barbers(ID),
   ClientID INT FOREIGN KEY REFERENCES Clients(ID),
   ServiceID INT FOREIGN KEY REFERENCES Services(ID),
   Time DATE
)
GO
ALTER TABLE Schedule
ALTER COLUMN Time DATETIME

SELECT * FROM Schedule


-- Insert data - Barbers table
INSERT dbo.Barbers ( FirstName, LastName, Gender, PhoneNumber , Email,  BirthDate , HireDate, Position ) 
VALUES 
('Bob', 'Sims','Male', '+1 (234) 2344-234', 'bsims@gmail.com', '2000-12-12', '2025-01-30', 'Intern Barber'),
('Alice', 'Johnson', 'Female', '+1 (987) 654-3210', 'alice.johnson@gmail.com', '1995-06-24', '2023-09-15', 'Stylist'),  
('Mike', 'Taylor', 'Male', '+1 (555) 789-1234', 'mike.taylor@gmail.com', '1988-03-10', '2021-04-22', 'Master Barber'),  
('Sophie', 'Brown', 'Female', '+1 (777) 888-9999', 'sophie.brown@gmail.com', '1992-11-05', '2024-02-01', 'Barber') 


-- Insert data - Services table
INSERT dbo.Services (Name,Price) 
VALUES 
( 'Haircut', 105.00),
('Beard Trim', 50.00),  
('Shampoo & Styling', 75.00),  
('Shaving', 80.00)
Go 

ALTER TABLE Services
ADD TimeNeeded TIME;

UPDATE Services
SET TimeNeeded = '1:30:00'
WHERE ID = 1
UPDATE Services
SET TimeNeeded = '00:30:00'
WHERE ID = 2
UPDATE Services
SET TimeNeeded = '1:00:00'
WHERE ID = 3
UPDATE Services
SET TimeNeeded = '00:30:00'
WHERE ID = 4
Go


-- Insert data - Clients 
INSERT dbo.Clients ( FirstName, LastName, PhoneNumber , Email) 
VALUES 
('Tom', 'Grey', '+1 (777) 388-9999', 'tommyGr@gmail.com' ),
('Daniel', 'Brown', '+1 (666) 777-8888', 'daniel.brown@gmail.com'),
('James', 'Smith', '+1 (555) 432-6789', 'james.smith@gmail.com'),  
('Lucas', 'Miller', '+1 (222) 987-6543', 'lucas.miller@egmail.com')
SELECT * FROM Clients 

-- Insert data - Visits
INSERT INTO dbo.Visits (ClientID, BarberID, ServiceID, Date)  
VALUES  
(1, 2, 1, '2025-03-10'),  
(2, 1, 3, '2024-03-12'),  
(3, 4, 1, '2024-03-15'),  
(4, 3, 2, '2024-03-18'),  
(2, 1, 4, '2024-03-20');


SELECT * FROM Visits
SELECT * FROM Reviews


-- Insert data into Reviews
INSERT INTO dbo.Reviews (Message, VisitID, AuthorID, ReviewedBarberID, Date)  
VALUES  
('Good job. I am happy with my new haircut.', 1, 1, 2, '2025-03-10'),
('Also service was amazing. I even got a set of hairstyle product samples as a gift. Thanks a lot guys', 1, 1, 2, '2025-03-10'),
('Great service, would come back again!', 2, 2, 1, '2024-03-12' ),
('The barber was rude, I did not like the cut.', 3, 3, 4, '2024-03-15'),
('Highly recommended!',4, 4, 3, '2024-03-18');
SELECT * FROM Reviews

-- Insert data into Scores 
INSERT INTO dbo.Scores (Score, ClientID, BarberID, VisitID)  
VALUES  
('Great', 1, 2, 1),
('Great', 1, 2, 1),
('Good', 2, 1, 2),
('Bad', 3, 4, 3),
('Great', 4, 3, 4);
SELECT * FROM Scores

-- Insert data into Scores BarberServices 

INSERT INTO dbo.BarberServices  (ServiceID, BarberID)
VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,3),
(2,4),
(3,1),
(3,2),
(3,3),
(3,4),
(4,1),
(4,2)


INSERT INTO dbo.Schedule  (BarberID, ClientID, ServiceID, Time)
VALUES
(2,4,1,'2025-04-01')


SELECT * FROM Barbers
SELECT * FROM Schedule


