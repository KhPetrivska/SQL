-- INSERT Fake data into Barbers table 


INSERT INTO Barbers (FirstName , LastName, Gender, PhoneNumber, Email, BirthDate, HireDate, Position,Rating )
SELECT TOP 1000000
'LastName' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)),
'FirstName' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)),
 CASE 
        WHEN (ABS(CHECKSUM(NEWID())) % 2) = 0 THEN 'Male'
        ELSE 'Female'
    END AS Gender,
'555-' + CAST(1000000 + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS PhoneNumber,
'user' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) + '@example.com' AS Email,
DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 36525), GETDATE()), -- Генерация случайных дат рождения в пределах 100 лет
DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 7300), GETDATE()), -- Генерация случайных дат найма в пределах 20 лет
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
INSERT INTO Clients (FirstName, LastName, PhoneNumber, Email, Duration)
SELECT TOP 1000000
    'Client' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS FirstName,
    'LastName' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS LastName,
    '555-' + CAST(1000000 + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) AS PhoneNumber,
    'client' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(10)) + '@client.com' AS Email
FROM sys.objects s1
CROSS JOIN sys.objects s2;

SELECT * FROM Clients




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
    CAST((RAND() * 50 + 30) AS DECIMAL(8,2)) 
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


INSERT INTO Visits (ClientID, BarberID, ServiceID, TotalCost, Date)
 VALUES
(1,10,3,50.00,'2025-02-02'),
(2,10,4,76.00,'2025-02-02'),
(2,10,4,76.00,'2025-02-02')



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


CREATE INDEX IX_Barbers_HireDate
ON Barbers(HireDate)
INCLUDE (Position, Rating);
GO


SELECT ID, FirstName, LastName, Email, HireDate, Position, Rating
FROM Barbers
WHERE LastName LIKE '%13%'
ORDER BY HireDate;

---3
SELECT ClientID, BarberID, ServiceID, TotalCost, Date
FROM Visits
WHERE TotalCost > 50
ORDER BY Date;

CREATE NONCLUSTERED INDEX IXTotalCostDate
ON Visits(TotalCost, Date)
GO


--4  Covering

CREATE NONCLUSTERED INDEX IX_Covering_Visits
ON Visits(ClientID, BarberID, ServiceID, TotalCost, Date); 
GO

--5

CREATE NONCLUSTERED INDEX IX_Covering_Visits_Client_Barber_Service_Date
ON Visits(ClientID, BarberID, ServiceID, Date)
INCLUDE (TotalCost); 
GO

SELECT ClientID, ServiceID, TotalCost
FROM Visits
WHERE BarberID = 10
  AND Date = '2025-02-02'
ORDER BY ClientID;
