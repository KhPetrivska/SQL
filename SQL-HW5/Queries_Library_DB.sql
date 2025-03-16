SELECT * FROM Authors
SELECT * FROM Books
SELECT * FROM Categories
SELECT * FROM Departments
SELECT * FROM Faculties
SELECT * FROM Groups
SELECT * FROM Libs
SELECT * FROM Press
SELECT * FROM Students
SELECT * FROM S_Cards
SELECT * FROM Teachers
SELECT * FROM Themes
SELECT * FROM T_Cards

-- 1. Display books with the minimum number of pages published by a particular publisher.
SELECT Press.Name AS Publisher, Books.Name AS BooksTitle, Books.Pages
FROM Books 
LEFT JOIN Press ON Books.Id_Press=Press.Id
WHERE Books.Pages = (
SELECT MIN(b2.Pages)
FROM Books b2
WHERE b2.Id_Press = Books.Id_Press
)

-- 2. Display the names of publishers that released books with an average number of pages greater than 100.

SELECT Press.Name, AVG(Books.Pages)
FROM Press
JOIN Books ON Books.Id_Press=Press.Id
GROUP BY Press.Name
HAVING AVG(Pages) > 100


--3.Display the total number of pages of all books released by XYZ and Starogo Leva publishers.
SELECT SUM(Pages) AS TotalPages FROM Books 
JOIN Press ON Books.Id_Press = Press.ID
WHERE Press.Name IN ('XYZ', N'Старого Лева')


--4. Select the first and last names of all students who borrowed books between January 1, 2019, and the current date.
SELECT FirstName, LastName
FROM Students 
JOIN S_Cards ON Students.Id=S_Cards.Id_Student
WHERE S_Cards.DateOut > '2019-01-01'

--5. Find all students who are currently working with the book "Java Head First" by Oleksii Bobryk.
SELECT FirstName, LastName,  S_Cards.Id_Book
FROM Students
JOIN S_Cards ON Students.Id=S_Cards.Id_Student
WHERE Id_Book = (SELECT Books.Id FROM Books WHERE Books.Name = 'Java Head First')
AND S_Cards.DateIn IS NULL

--6. Display information about authors whose average book length (in pages) exceeds 600 pages.
SELECT  a.ID, a.FirstName, a.LastName
FROM Authors AS a
JOIN Books ON Books.Id_Author=a.Id
GROUP BY a.ID, a.FirstName, a.LastName
HAVING AVG(Books.Pages) > 600;

--7. Display information about publishers that have a total number of pages in the books they published greater than 700.
SELECT p.Id, p.Name
FROM Press AS p
JOIN Books AS b ON p.Id=b.Id_Press
GROUP BY p.Id, p.Name
HAVING SUM(Pages)>700

--8. Display all library visitors (including students and professors) and the books they have borrowed.
SELECT (SELECT FirstName + ' ' + LastName FROM Teachers WHERE Teachers.Id=tc.Id_Teacher ) AS Reader, Name As BookTitle
FROM Books AS b
JOIN T_Cards AS tc ON b.Id=tc.Id_Book
UNION ALL
SELECT (SELECT FirstName + ' ' +  LastName FROM Students WHERE Students.Id=sc.Id_Student ) AS Reader, Name As BookTitle
FROM Books AS b
JOIN S_Cards AS sc ON b.Id=sc.Id_Book
ORDER BY Reader


--9. Display the most popular author among students and the number of books by that author borrowed from the library.
SELECT TOP 1 S_Cards.Id_Book, Authors.FirstName + ' ' + Authors.LastName AS Author, COUNT(S_Cards.Id_Book) AS Count
FROM S_Cards
JOIN Books ON S_Cards.Id_Book=Books.Id
JOIN Authors ON Books.Id_Author=Authors.Id
GROUP BY S_Cards.Id_Book, Authors.FirstName, Authors.LastName
ORDER BY Count DESC



--10. Display the most popular author among professors and the number of books by that author borrowed from the library.
SELECT TOP 1 
Authors.FirstName + ' ' + Authors.LastName AS Author, 
COUNT(T_Cards.Id_Book) AS Count
FROM T_Cards
JOIN Books ON T_Cards.Id_Book = Books.Id
JOIN Authors ON Books.Id_Author = Authors.Id
GROUP BY Authors.FirstName, Authors.LastName
ORDER BY Count DESC;

-- 11 Display the most popular topic among students and teachers. 
SELECT TOP 1 Topic, COUNT(*) AS Total 
FROM (
SELECT Id_Student AS Reader, Id_Book, Themes.Name As Topic
FROM S_Cards 
JOIN Books ON Books.Id=S_Cards.Id_Book
JOIN Themes ON Books.Id_Themes=Themes.Id
UNION 
SELECT Id_Teacher AS Reader, Id_Book , Themes.Name As Topic
FROM T_Cards
JOIN Books ON Books.ID=T_Cards.Id_Book
JOIN Themes ON Books.Id_Themes=Themes.Id
) AS Combined 
GROUP BY Topic
ORDER BY Total DESC


-- 12 Display the number of teachers and students who visited the library.
SELECT COUNT(DISTINCT Reader) 
FROM (
SELECT CONCAT('T', Id_Teacher) AS Reader FROM T_Cards
UNION 
SELECT CONCAT('S',Id_Student) AS Reader FROM S_Cards
) AS Total


--If we consider the total number of books in the library as 100%, calculate what percentage of books each faculty borrowed.
-- Display the most reading faculty and the most reading department.
-- Show the author of the most popular books among professors and students.
-- Display the titles of the most popular books among professors and students.
-- Show all students and professors who are designers.
-- Display all information about students and professors who borrowed books.
-- Show books borrowed by both professors and students.
-- Show how many books were issued by each of the librarians.