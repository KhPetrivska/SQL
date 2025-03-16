-- create a new db ContriesDataBase
CREATE DATABASE ContriesDataBase
GO
--use ContriesDataBase
USE ContriesDataBase
GO 

-- create tables with no foreing key

-- create Continent table
CREATE TABLE Continent 
(ContinentID INT IDENTITY(1,1) PRIMARY KEY, 
Name NVARCHAR(30))

-- Data for Continent table
INSERT [dbo].[Continent] ([Name]) VALUES
(N'Європа'),
(N'Африка'),
(N'Азія'),
(N'Південна Америка'),
(N'Центральна Америка'),
(N'Північна Америка'),
(N'Австралія')

-- create Currency table
CREATE TABLE Currency
( CurrencyID int IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(30))

-- Data for [dbo].[Currency]
INSERT [dbo].[Currency] ([Name]) VALUES
(N'євро'),
(N'костариканський колон'),
(N'злотий'),
(N'долар США'),
(N'фунт стерлінгів'),
(N'гуарані'),
(N'долар Тринідад і Тобаго'),
(N'шведська крона'),
(N'аргентинський песо'),
(N'франк'),
(N'дінар'),
(N'мексиканський песо'),
(N'ріал'),
(N'кванза'),
(N'чеді'),
(N'чеська крона'),
(N'бразильський реал'),
(N'швейцарський франк'),
(N'куна'),
(N'австралійський долар'),
(N'єна'),
(N'вона'),
(N'гривня'),
(N'туніський динар'),
(N'саудівський ріал')

-- Create [dbo].[Language]
CREATE TABLE Language 
( LanguageID int IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(30))

-- Data for [dbo].[Language]
INSERT [dbo].[Language] ([Name]) VALUES
(N'український'),
(N'французька'),
(N'арабська'),
(N'англійська'),
(N'німецька'),
(N'португальська'),
(N'японський'),
(N'іспанська'),
(N'італійська'),
(N'корейська'),
(N'польська'),
(N'шведський'),
(N'сербська'),
(N'нідерландська'),
(N'персидський'),
(N'чеський'),
(N'хорватська')

SELECT * FROM Language

---- create tables with foreing key

-- Create Country table 

CREATE TABLE Country
(CountryID int IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(30),
Capital NVARCHAR(30),
Territory NVARCHAR(30),
Debut INT NOT NULL DEFAULT 0,
Champion INT NOT NULL DEFAULT 0,
ContinentID INT FOREIGN KEY REFERENCES Continent(ContinentID),
CurrencyID INT FOREIGN KEY REFERENCES Currency(CurrencyID))



-- Дані для [dbo].[Country]
INSERT [dbo].[Country] ([Name], [ContinentId], [Capital], [Territory], [CurrencyId], [Debut], [Champion]) VALUES
(N'Україна', 1, N'Київ', 603.7, 23, 1, 0),
(N'Франція', 1, N'Париж', 545.63, 1, 0, 1),
(N'Туніс', 2, N'Туніс', 155.36, 24, 0, 0),
(N'Ангола', 2, N'Луанда', 1246.7, 14, 1, 0),
(N'Японія', 3, N'Токіо', 374.744, 21, 0, 0),
(N'Бразилія', 4, N'Бразилія', 8456.51, 17, 0, 5),
(N'Іспанія', 1, N'Мадрид', 499.542, 1, 0, 0),
(N'Італія', 1, N'Рим', 294.02, 1, 0, 4),
(N'Трінідад і Тобаго', 5, N'Порт-оф-Спейн', 5.1, 7, 1, 0),
(N'Німеччина', 1, N'Берлін', 349.223, 1, 0, 3),
(N'Аргентина', 4, N'Буенос-Айрес', 2736.69, 9, 0, 2),
(N'Парагвай', 4, N'Асунсьйон', 397.3, 6, 0, 0),
(N'Південна Корея', 3, N'Сеул', 98.19, 22, 0, 0),
(N'Коста-Ріка', 5, N'Сан-Хосе', 50.66, 2, 0, 0),
(N'Польща', 1, N'Варшава', 304.465, 3, 0, 0),
(N'США', 6, N'Вашингтон', 9158.96, 4, 0, 0),
(N'Португалія', 1, N'Лісабон', 91.951, 1, 0, 0),
(N'Саудівська Аравія', 3, N'Ер-Ріяд', 1960.582, 25, 0, 0),
(N'Англія', 1, N'Лондон', 129.634, 5, 0, 1),
(N'Швеція', 1, N'Стокгольм', 410.934, 8, 0, 0),
(N'Еквадор', 4, N'Кіто', 276.84, 4, 0, 0),
(N'Хорватія', 1, N'Загреб', 56.414, 19, 0, 0),
(N'Мексика', 5, N'Мехіко', 1923.04, 12, 0, 0),
(N'Кот-д''Івуар', 2, N'Ямусукро', 322.5, 10, 1, 0),
(N'Нідерланди', 1, N'Амстердам', 41.5, 1, 0, 0),
(N'Швейцарія', 1, N'Берн', 41.3, 18, 0, 0),
(N'Того', 2, N'Лом', 56.6, 10, 1, 0),
(N'Іран', 3, N'Тегеран', 1650, 13, 0, 0),
(N'Австралія', 7, N'Канберра', 7700, 20, 0, 0),
(N'Сербія та Чорногорія', 1, N'Бєлград', 102.2, 11, 0, 0),
(N'Гана', 2, N'Аккра', 238.5, 15, 1, 0),
(N'Чехія', 1, N'Прага', 78.9, 16, 0, 0)

--Create CountryLanguage Table

CREATE TABLE CountryLanguage
(CountryLanguageID int IDENTITY(1,1)  PRIMARY KEY,
CountryID INT FOREIGN KEY REFERENCES Country(CountryID),
LanguageID INT FOREIGN KEY REFERENCES Language(LanguageID)
)

-- Data for [dbo]. [CountryLanguage]

INSERT [dbo].[CountryLanguage] ([CountryId], [LanguageId]) VALUES
(29, 4),
(19, 4),
(4, 6),
(11, 8),
(6, 6),
(31, 4),
(10, 5),
(28, 15),
(7, 8),
(8, 9),
(14, 8),
(24, 2),
(23, 8),
(25, 14),
(12, 8),
(15, 11),
(17, 6),
(18, 3),
(30, 13),
(16, 4),
(27, 2),
(9, 4),
(3, 2),
(3, 3),
(1, 1),
(2, 2),
(22, 17),
(32, 16),
(26, 9),
(26, 5),
(26, 2),
(20, 12),
(21, 8),
(13, 10),
(5, 7)

-- check tables
SELECT * FROM Continent 
SELECT * FROM Country
SELECT * FROM CountryLanguage
SELECT * FROM Language 
SELECT * FROM Currency

-- Queries 
-- 1. Display the country that has won the World Cup most frequently.
SELECT TOP 1 Name 
FROM Country
ORDER BY Territory DESC

-- 2. Display the number of countries represented by each continent in the World Cup.

SELECT (SELECT Name FROM Continent WHERE Continent.ContinentID=Country.ContinentID ) AS Continent, COUNT(CountryID) AS NumOfCountries
FROM Country
GROUP BY ContinentID

-- 3. Display European country that has won the World Cup most frequently.
SELECT Name AS MaxChampionships 
FROM Country 
WHERE Champion = (SELECT MAX(Champion) FROM Country )

-- 4. Display the country with the largest territory.
SELECT NAME AS LargestCountry
FROM Country
WHERE Territory = (SELECT MAX(Territory) FROM Country)

-- 5. Display the European country with the largest territory.
SELECT NAME AS LargestEuropianCountry
FROM Country
WHERE Territory = (SELECT MAX(Territory) FROM Country WHERE ContinentID = (SELECT ContinentID FROM Continent WHERE Name = N'Європа' ))

-- 6. Display the number of countries that have won the World Cup for each continent.
SELECT (SELECT Name FROM Continent WHERE Country.ContinentID = Continent.ContinentID), COUNT(CountryID)
FROM Country
WHERE Champion > 0
GROUP BY ContinentID

-- 7. Display the total number of championship titles for each continent.
SELECT (SELECT Name FROM Continent WHERE Country.ContinentID = Continent.ContinentID) AS Continent , SUM(Champion) AS TitlesNum
FROM Country
GROUP BY ContinentID

-- 8. Determine the average territory size of the countries within each continent.
SELECT (SELECT Name FROM Continent WHERE Continent.ContinentID = Country.ContinentID ), AVG(Territory) 
FROM Country
GROUP BY ContinentID

-- 9. Display the number of debutant countries for each continent.
SELECT (SELECT Name FROM Continent WHERE Continent.ContinentID = Country.ContinentID), COUNT(CountryID)
FROM Country
GROUP BY ContinentID

-- 10. Display the number of countries where each language is official.
SELECT
(SELECT Name FROM Language WHERE Language.LanguageID = CountryLanguage.LanguageID),
COUNT(CountryID)
FROM CountryLanguage
GROUP BY LanguageID

-- 11. Display the African country with the smallest territory.
SELECT Name FROM Country
WHERE ContinentID=(SELECT (ContinentID) FROM Continent WHERE Continent.ContinentID = Country.ContinentID)
AND Territory = (SELECT MIN(Territory)FROM Country)

-- 12.Display the number of countries where each currency is the national currency.
SELECT NAME, (SELECT COUNT(*) FROM Country WHERE Currency.CurrencyID=Country.CurrencyID)
FROM Currency 

-- 13.Display the most widely spoken language and indicate the number of countries where it is official.
-- 14. Display the continent with the highest total number of championship titles.
-- 15. Display the most widely spoken language among the countries of the European and African continents.



