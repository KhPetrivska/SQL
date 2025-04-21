-- INSERT Fake data into Barbers table 
INSERT INTO Barbers (FirstName , LastName, Gender, PhoneNumber, Email, BirthDate, HireDate, Position,Rating )
SELECT TOP 1000000
'FirstName' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)),
'LastName' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)),
 CASE 
        WHEN (ABS(CHECKSUM(NEWID())) % 2) = 0 THEN 'Male'
        ELSE 'Female'
    END AS Gender,
'555-' + CAST(1000000 + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS PhoneNumber,
'user' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) + '@example.com' AS Email,
DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 36525), GETDATE()), -- generates random birthdates within the last 100 years
DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 7300), GETDATE()), -- generates random birthdates within the last 20 years
 CASE 
        WHEN (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3) = 0 THEN 'Chief Barber'
        WHEN (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3) = 1 THEN 'Senior Barber'
        ELSE 'Junior Barber'
    END AS Position,
(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 5) + 1
FROM sys.objects s1
CROSS JOIN sys.objects s2;

SELECT * FROM Barbers



-- Fake data for Clients
INSERT INTO Clients (FirstName, LastName, PhoneNumber, Email)
SELECT TOP 1000000
    'FirstNAme' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS FirstName,
    'LastName' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS LastName,
    '380-' + CAST(1000000 + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS PhoneNumber,
    'client' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) + '@client.com' AS Email
FROM sys.objects s1
CROSS JOIN sys.objects s2;


-- Fake data for Services
INSERT INTO Services (Name, Price)
SELECT TOP 10000 
    CASE 
        WHEN (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 5) = 0 THEN 'Service1'
        WHEN (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 5) = 1 THEN 'Service2'
        WHEN (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 5) = 2 THEN 'Service3'
        WHEN (ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 5) = 3 THEN 'Service4'
        ELSE 'Sevice5'
    END AS ServiceName,
    CAST((ABS(CHECKSUM(NEWID())) % 51 + 30) AS DECIMAL(8,2))
FROM sys.objects s1
CROSS JOIN sys.objects s2;

SELECT * FROM Services


--Fake data for Visits
INSERT INTO Visits (ClientID, BarberID, ServiceID, TotalCost, Date)
SELECT TOP 1000000
    c.ID AS ClientID,
    b.ID AS BarberID,
    s.ID AS ServiceID,
    (s.Price * (ABS(CHECKSUM(NEWID())) % 5 + 1)) AS TotalCost, -- Random total cost
    DATEADD(MINUTE, (ABS(CHECKSUM(NEWID())) % 1440), GETDATE()) AS Date
FROM sys.objects s1
CROSS JOIN sys.objects s2
CROSS JOIN Clients c
CROSS JOIN Barbers b
CROSS JOIN Services s;

SELECT * FROM Visits


INSERT INTO Visits (ClientID, BarberID, ServiceID, TotalCost, Date)
 VALUES
(1,10,10003,50.00,'2025-02-02'),
(2,10,10004,76.00,'2025-02-02'),
(2,10,10004,76.00,'2025-02-02')



----------------------------INDEX----------------------------------


-- Drop indexes
DROP INDEX IF EXISTS IX_Barbers_LastName ON Barbers;
DROP INDEX IF EXISTS IX_Barbers_HireDate ON Barbers;
DROP INDEX IF EXISTS IX_Visits_ID ON Visits;
DROP INDEX IF EXISTS IXTotalCostDate ON Visits;  



-- Clustered index

-- already created with primary key 
--1
CREATE CLUSTERED INDEX IX_Visits_ID
ON Visits(ID);
GO


--Non Clustered indexes
---2

CREATE  INDEX IX_Barbers_LastName
ON Barbers(LastName)
INCLUDE (FirstName, Email);
GO

SELECT FirstName,LastName, Email
FROM Barbers 
WHERE LastName = 'LastName100'


CREATE INDEX IX_Barbers_HireDate
ON Barbers(HireDate)
INCLUDE ( FirstName, LastName, Position, Rating);
GO

SELECT FirstName, LastName  Position, Rating , HireDate
FROM Barbers
ORDER BY HireDate


SELECT ID, FirstName, LastName, Email, HireDate, Position, Rating
FROM Barbers
WHERE LastName LIKE '%13%'
ORDER BY HireDate;

--3  Covering

CREATE NONCLUSTERED INDEX IX_Covering_Visits
ON Visits(ClientID, BarberID, ServiceID, TotalCost, Date); 
GO

--4

CREATE NONCLUSTERED INDEX IX_Covering_Visits_Client_Barber_Service_Date
ON Visits(ClientID, BarberID, ServiceID, Date)
INCLUDE (TotalCost); 
GO

SELECT ClientID, ServiceID, TotalCost
FROM Visits
WHERE BarberID = 10
  AND Date = '2025-02-02'
ORDER BY ClientID;

-- Querry Example: Return  contact information for all senior barbers. 
DROP VIEW IF EXISTS seniorBarbersInfo
GO
CREATE VIEW  seniorBarbersInfo AS
SELECT FirstName, LastName, Email, PhoneNumber
FROM Barbers
WHERE [Position]= 'Senior Barber'
GO
SELECT * FROM seniorBarbersInfo

IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Barbers_By_Position')
    DROP INDEX IX_Barbers_By_Position ON Barbers;
GO

CREATE  INDEX IX_Barbers_By_Position
ON Barbers(Position)
INCLUDE (FirstName, LastName, Email, PhoneNumber);
GO

