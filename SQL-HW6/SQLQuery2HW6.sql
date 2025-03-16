-- Create the following user functions (Functions):
-- A user function that returns a greeting in the style "Hello, NAME!" where NAME is passed as a parameter. For example, if "Nick" is passed, the result will be "Hello, Nick!".
CREATE FUNCTION dbo.greet(@name varchar(10))
	RETURNS  varchar(30) AS 
	BEGIN
	DECLARE @greetingmessage varchar(30) =  'Hello, ' + @name+ '!'
	RETURN @greetingmessage
	END;
GO 
SELECT  dbo.greet('Nick') AS GreetingMessage


-- A user function that returns the current number of minutes.
DROP FUNCTION IF EXISTS dbo.showCurMinutes
GO 
CREATE FUNCTION dbo.showCurMinutes()
	RETURNS INT AS
	BEGIN 
	DECLARE @minutes AS INT
	SET @minutes  =  DATEPART(MINUTE,GETDATE())
	RETURN @minutes
	END;
GO
SELECT dbo.showCurMinutes() AS CurrentMinutes


-- A user function that returns the current year.
DROP FUNCTION IF EXISTS dbo.showCurYear
GO

CREATE FUNCTION dbo.showCurYear()
	RETURNS INT AS
	BEGIN 
	DECLARE @year AS INT
	SET @year  =  DATEPART(YEAR,GETDATE())
	RETURN @year
	END;
GO
SELECT  dbo.showCurYear() AS CurrentYear


-- A user function that returns information about whether the current year is even or odd.
DROP FUNCTION IF EXISTS dbo.checkYearParity
GO

CREATE FUNCTION dbo.checkYearParity()
	RETURNS VARCHAR(4) AS 
		BEGIN
		DECLARE @year AS INT
		SET @year  =  DATEPART(YEAR,GETDATE())
		DECLARE @parity AS varchar(10)
			BEGIN
			IF (@year%2>0)
				SET @parity  = 'odd'
			ELSE IF(@year%2=0)
				SET @parity  = 'even'
			ELSE 
				SET @parity  = 'N/a'
			END
			RETURN  @parity
		END
GO


SELECT  dbo.checkYearParity() AS CurrentYear


-- A user function that takes a number and returns "yes" if the number is prime and "no" if the number is not prime.
DROP FUNCTION IF EXISTS dbo.checkPrime;
GO

CREATE FUNCTION dbo.checkPrime(@num INT)
RETURNS VARCHAR(30) AS
    BEGIN
    DECLARE @i AS INT = 2
    DECLARE @result AS VARCHAR(10) = 'Prime'
	IF @num < 2
     RETURN 'Not Prime';
WHILE (@i * @i) <= @num
    BEGIN
         IF (@num % @i = 0)
         BEGIN
             SET @result = 'Not Prime';
             RETURN @result;
         END
         SET @i = @i + 1;
    END
    
    RETURN @result;
	END
GO

SELECT dbo.checkPrime(67)


-- A user function that accepts five numbers as parameters and returns the sum of the minimum and maximum values of the five numbers.

-- A user function that displays all even or odd numbers in a given range. The function accepts three parameters: the start of the range, the end of the range, and whether to show even or odd numbers.

-- Create the following stored procedures (Stored procedures):



--PROCEDURES

-- A stored procedure that outputs "Hello, world!".
GO
CREATE PROCEDURE sayHello 
AS  
BEGIN  
    PRINT 'Hello, world!'  
END  
GO  
EXEC sayHello

-- A stored procedure that returns the current time.
DROP PROCEDURE IF EXISTS GetCurrentTime 
GO
CREATE PROCEDURE GetCurrentTime 
AS  
BEGIN  
 DECLARE @Currentd DATETIME 
 SET @Currentd = GETDATE() 
 SELECT CONVERT(varchar , @Currentd, 108) AS CurrentTime  
END  
GO  

EXEC GetCurrentTime;
 

-- A stored procedure that returns the current date.
DROP PROCEDURE IF EXISTS GetCurrentDate
GO
CREATE PROCEDURE GetCurrentDate  
AS  
BEGIN  
 SELECT CAST( GETDATE() AS DATE) AS CurrentDate  
END  
GO

EXEC GetCurrentDate

--A stored procedure that takes three numbers and returns their sum.
DROP PROCEDURE IF EXISTS GetSumP
GO
CREATE PROCEDURE GetSumP @Num1 INT, @Num2 INT, @Num3 INT
AS
BEGIN
 SELECT @Num1 + @Num2 + @Num3 AS SumResult;
END
GO

EXEC GetSumP 1,2,3

--A stored procedure that takes three numbers and returns the arithmetic mean of the three numbers.
DROP PROCEDURE IF EXISTS getArithmeticMean 
GO
CREATE PROCEDURE getArithmeticMean 
    @Number1 FLOAT, 
    @Number2 FLOAT, 
    @Number3 FLOAT
AS
BEGIN
    DECLARE @result As FLOAT
	SET @result = (@Number1 + @Number2 + @Number3) / 3 
    SELECT ROUND(@result,2)  AS ArithmeticMean
END
GO

EXEC getArithmeticMean 2,4,5 

--A stored procedure that takes three numbers and returns the maximum value.
DROP PROCEDURE IF EXISTS getMaxValue 
GO
CREATE PROCEDURE getMaxValue
 @Num1 INT,
 @Num2 INT,
 @Num3 INT
AS
BEGIN
SELECT (SELECT MAX(Number)
FROM (VALUES (@Num1), (@Num2), (@Num3)) AS Numbers(Number)) AS MaxValue;
END
GO

EXEC getMaxValue 1,2,3

/*
Additional
A stored procedure that takes three numbers and returns the minimum value.

A stored procedure that takes a number and a symbol as parameters. The result of the stored procedure is a line of length equal to the number, built with the symbol provided as the second parameter.

For example, if 5 and "#" are passed, the output will be: #####.

A stored procedure that takes a number as a parameter and returns its factorial.

Formula for calculating the factorial:
n! = 1 * 2 * ... * n.
For example, 3! = 1 * 2 * 3 = 6.

A stored procedure that takes two numeric parameters:

The first parameter is a number.
The second parameter is an exponent. The procedure returns the number raised to the given exponent.
For example, if the parameters are 2 and 3, the result will be 2 raised to the third power, which is 8.*/
 