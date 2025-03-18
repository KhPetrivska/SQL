--Використовуючи Triggers / Views або Updatable Views / Stored procedures / Functions реалізуйте наступну функціональність: 

-- Return the full names of all barbers in the salon. 
DROP VIEW IF EXISTS barbersFullNames
GO

CREATE VIEW barbersFullNames AS 
SELECT FirstName + ' ' + LastName AS FullName
FROM Barbers
GO

SELECT * FROM barbersFullNames

-- Return information about all senior barbers. 
DROP VIEW IF EXISTS seniorBarbersInfo
GO
CREATE VIEW  seniorBarbersInfo AS
SELECT * 
FROM Barbers
WHERE [Position]= 'Master Barber'
GO
SELECT * FROM seniorBarbersInfo

-- Return information about all barbers who can provide a traditional beard shave.  
-- Procedure??

DROP VIEW IF EXISTS shavingSpecialists
GO
CREATE VIEW  shavingSpecialists AS
SELECT  Services.Name AS Service, Barbers.FirstName, Barbers.LastName 
FROM Barbers
LEFT JOIN BarberServices ON BarberServices.BarberID=Barbers.ID
JOIN Services ON BarberServices.ServiceID= Services.ID
WHERE Services.Name = 'Shaving'
GO
SELECT * FROM shavingSpecialists

-- Return information about all barbers who can provide a specific service. The required service information is provided as a parameter.  
DROP PROCEDURE IF EXISTS getBarbersOnServise
GO
CREATE PROCEDURE getBarbersOnServise
@service VARCHAR(250)
AS 
BEGIN 
SELECT  Services.Name AS Service, Barbers.FirstName, Barbers.LastName 
FROM Barbers
LEFT JOIN BarberServices ON BarberServices.BarberID=Barbers.ID
JOIN Services ON BarberServices.ServiceID= Services.ID
WHERE Services.Name LIKE '%' + @service + '%'
END 
GO

EXEC getBarbersOnServise 'Styling'

-- Return information about all barbers who have been working for more than a specified number of years. The number of years is passed as a parameter. 
DROP PROCEDURE IF EXISTS workingMoreThan
GO

CREATE PROCEDURE workingMoreThan
@yearsNum INT
AS
BEGIN 
DECLARE @currdate AS DATE
SET @currdate = GETDATE()
SELECT * 
FROM Barbers
WHERE DATEDIFF(YEAR, HireDate, @currdate) >= @yearsNum
END
GO

EXEC workingMoreThan 1

-- Return the number of senior barbers and the number of junior barbers.  


-- Return information about regular clients. A regular client is defined as someone who has visited the salon a specified number of times. The number is passed as a parameter.  

-- Prevent the deletion of a chief barber's information unless a second chief barber has been added.  

-- Prevent adding barbers younger than 21 years old.  



-- Write the following TRIGGERS:  

-- TRIGGER 1:  When adding a record to the archive (which contains a rating), adjust the overall rating in the barbers' table accordingly.  
DROP TRIGGER IF EXISTS updateTotalScore 
GO
CREATE TRIGGER updateTotalScore
ON Scores
AFTER INSERT, UPDATE
AS
BEGIN
UPDATE Barbers
 SET Rating = ( SELECT AVG(CASE 
  WHEN Score = 'Great' THEN 5
  WHEN Score = 'Good' THEN 4
  WHEN Score = 'Okay' THEN 3
  WHEN Score = 'Bad' THEN 2
  WHEN Score = 'Very bad' THEN 1
  ELSE 0
  END)
  FROM Scores
  WHERE BarberID = Barbers.ID
)
    WHERE ID IN (SELECT DISTINCT BarberID FROM inserted);
END
GO

-- Querry to check the trigger
SELECT * FROM Barbers
GO
INSERT INTO Scores (Score, ClientID, BarberID)
VALUES ('Bad', 1, 4);
SELECT * FROM Barbers
GO


-- TRIGGER 2: Prevent adding an appointment for a barber who is unavailable or already booked at the specified time.  
DROP TRIGGER IF EXISTS onTimeComflict 
GO

CREATE TRIGGER onTimeComflict 
ON Schedule
INSTEAD OF INSERT
AS
  BEGIN
  DECLARE @BarberID INT, @Time DATETIME;
  SELECT @BarberID = BarberID, @Time = Time FROM INSERTED;
    IF EXISTS (SELECT 1 
    FROM Schedule 
    WHERE BarberID = @BarberID 
    AND Time = @Time)
        BEGIN
        PRINT ('The time slot is not avilable');
        END
    ELSE
        BEGIN
        INSERT INTO Schedule (BarberID, ClientID, ServiceID, Time)
        SELECT BarberID, ClientID, ServiceID, Time FROM INSERTED;
        END
END;
GO

--Query to check the trigger above: 

--already taken timedate
INSERT INTO dbo.Schedule  (BarberID, ClientID, ServiceID, Time)
VALUES
(2,4,1,'2025-04-01 09:00:00')
--free timedate
INSERT INTO dbo.Schedule  (BarberID, ClientID, ServiceID, Time)
VALUES
(1,4,1,'2025-04-01 11:00:00')
SELECT * FROM Schedule

-- Prevent scheduling the same person multiple times with the same barber on the same day.  
DROP TRIGGER IF EXISTS onAddingSameClient 
GO

CREATE TRIGGER onAddingSameClient
ON Schedule 
INSTEAD OF INSERT 
AS 
BEGIN 
DECLARE @clientIDNew INT
DECLARE @barberIDNew INT
DECLARE @dateNew DATE
SELECT @clientIDNew = ClientID, @barberIDNew = BarberID, @dateNew = Time FROM INSERTED 
 IF EXISTS (SELECT 1 
    FROM Schedule 
    WHERE @clientIDNew = Schedule.ClientID
    AND @barberIDNew = Schedule.BarberID
    AND CONVERT(DATE, @dateNew) = CONVERT(DATE, Schedule.Time))
    BEGIN
    PRINT 'Client have already booked a time with this barber'
    END
  ELSE 
   BEGIN
        INSERT INTO Schedule (BarberID, ClientID, ServiceID, Time)
        SELECT BarberID, ClientID, ServiceID, Time FROM INSERTED;
        END
END
GO


--Query to check the trigger above (for insert with 1 row only)
--will add a record
INSERT INTO dbo.Schedule  (BarberID, ClientID, ServiceID, Time)
VALUES
(1,1,1,'2025-05-29 13:00:00')
GO
--will NOT add a record
INSERT INTO dbo.Schedule  (BarberID, ClientID, ServiceID, Time)
VALUES
(1,1,1,'2025-05-29 14:00:00')

SELECT * FROM Schedule
