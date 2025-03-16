CREATE DATABASE [Library] 
GO
USE [Library]
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL
)
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Pages] [int] NOT NULL,
	[YearPress] [int] NOT NULL,
	[Id_Themes] [int] NOT NULL,
	[Id_Category] [int] NOT NULL,
	[Id_Author] [int] NOT NULL,
	[Id_Press] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL
)

GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL
)
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL
)

GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Id_Faculty] [int] NOT NULL
)

GO
CREATE TABLE [dbo].[Libs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL
)

GO
CREATE TABLE [dbo].[Press](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL
)
GO
CREATE TABLE [dbo].[S_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Student] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Group] [int] NOT NULL,
	[Term] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[T_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Teacher] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Dep] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[Themes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (1, N'Джеймс Р.', N'Грофф')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (2, N'Сергій', N'Горобець')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (3, N'Михайло', N'Лірник')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (4, N'Микола', N'Ганін')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (5, N'Олексій', N'Бобрик')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (6, N'Володимир', N'Зеленський')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (7, N'Євангелос', N'Петрусос')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (8, N'Маркус', N'Герхагер')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (9, N'Павло', N'Гарбар')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (10, N'Павло', N'Дібров')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (11, N'Людмила', N'Омельченко')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (12, N'Кевін', N'Рейчард')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (13, N'Ольга', N'Кулько')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (14, N'Марк', N'Браун')
SET IDENTITY_INSERT [dbo].[Authors] OFF

SET IDENTITY_INSERT [dbo].[Books] ON 
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (1, N'SQL', 816, 2021, 1, 1, 1, 2, N'2-е видання', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (2, N'3D Studio Max 3', 640, 2020, 3, 6, 3, 3, N'Учбовий курс', 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (3, N'Бібліотеки Python', 272, 2009, 2, 4, 5, 4, N'Компоненти', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (4, N'Visual Studio', 416, 2020, 2, 5, 4, 3, N'Спеціальний довідник', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (5, N'Курс математичного аналізу', 328, 2010, 4, 2, 2, 5, N'1-й том', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (6, N'Java Head First', 288, 2010, 2, 3, 5, 4, N'Компоненти', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (7, N'Інтегроване середовище розробки', 272, 2020, 2, 3, 5, 4, N'Сeредовище розробки', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (8, N'Алгоритми', 32, 2020, 2, 4, 5, 4, N'Довідник', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (9, N'Backend for Application', 488, 2020, 2, 5, 6, 6, N'Довідник с примерами', 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (10, N'JavaScript', 576, 2020, 2, 5, 7, 2, N'Гайд розробника 1-й том', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (11, N'Малювання', 416, 2020, 5, 7, 8, 2, N'Повний фарш', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (12, N'Gmail корпоративна структура пошти', 480, 2020, 6, 8, 9, 2, N'Мережа', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (13, N'Windows 11', 352, 2023, 9, 12, 13, 2, N'Нічого собі таке', 4)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (14, N'Unix довідник', 384, 2020, 9, 13, 12, 3, N'Довідник для DevOps', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (15, N'DIY якщо руки з того місця', 512, 2020, 1, 11, 11, 2, N'Самовчитель', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (16, N'Самовчитель себе від Фрейда', 512, 2019, 7, 10, 11, 2, N'Самовчитель', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (17, N'Самовчитель Perl', 432, 2010, 2, 9, 10, 2, N'Самовчитель', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (18, N'HTML якщо нічого робити', 1040, 2010, 7, 14, 14, 2, N'Гайд', 5)
SET IDENTITY_INSERT [dbo].[Books] OFF

SET IDENTITY_INSERT [dbo].[Categories] ON 
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Мова SQL')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Мат аналіз')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'C++ Builder')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Python')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Visual Studio')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'3D Studio Max')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'JavaScript')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Gmail')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Perl')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Front')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Visual FoxPro')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Windows 11')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Unix')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (14, N'HTML')
SET IDENTITY_INSERT [dbo].[Categories] OFF

SET IDENTITY_INSERT [dbo].[Departments] ON 
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'Программування')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'Графіки та Дизайну')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'Заліза та Адміністрації')
SET IDENTITY_INSERT [dbo].[Departments] OFF

SET IDENTITY_INSERT [dbo].[Faculties] ON 
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (1, N'Программування')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (2, N'Веб-дизайну')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (3, N'Адміністрування')
SET IDENTITY_INSERT [dbo].[Faculties] OFF

SET IDENTITY_INSERT [dbo].[Groups] ON 
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (2, N'9П1', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (3, N'9П2', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (4, N'9А', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (5, N'9Д', 2)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (6, N'14А', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (7, N'19П1', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (8, N'18П2', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (9, N'18А', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (10, N'19Д', 2)
SET IDENTITY_INSERT [dbo].[Groups] OFF

SET IDENTITY_INSERT [dbo].[Libs] ON 
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (1, N'Сергій', N'Максименко')
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (2, N'Дмитро', N'Хтотакий')
SET IDENTITY_INSERT [dbo].[Libs] OFF

SET IDENTITY_INSERT [dbo].[Press] ON 
INSERT [dbo].[Press] ([Id], [Name]) VALUES (1, N'Soft')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (2, N'XYZ')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (3, N'Львів')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (4, N'Старого Лева')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (5, N'Нове')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (6, N'ЄКнига')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (7, N'Преса')
SET IDENTITY_INSERT [dbo].[Press] OFF

SET IDENTITY_INSERT [dbo].[S_Cards] ON 
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 1, CAST(N'2001-05-17 00:00:00.000' AS DateTime), CAST(N'2001-06-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 17, 18, CAST(N'2000-05-18 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 3, CAST(N'2001-04-21 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 21, 4, CAST(N'2001-03-26 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 3, 1, CAST(N'2000-05-07 00:00:00.000' AS DateTime), CAST(N'2001-04-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 7, 11, CAST(N'2001-06-02 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 16, 14, CAST(N'2001-04-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 11, 6, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (9, 17, 2, CAST(N'2001-10-01 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (10, 10, 13, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[S_Cards] OFF

SET IDENTITY_INSERT [dbo].[Students] ON 
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (2, N'Свят', N'Зезик', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (3, N'Ольга', N'Мантулік', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (4, N'Ольга', N'Осьтака', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (5, N'Ольга', N'Курняк', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (6, N'Галина', N'Інащенко', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (7, N'Юрій', N'Шевченко', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (8, N'Юрій', N'Гопак', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (9, N'Ігор', N'Ярмилович', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (10, N'Ігорь', N'Пилипенко', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (11, N'Максим', N'Хвойда', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (12, N'Євген', N'Сало', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (13, N'Хлор', N'Елемент', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (14, N'Наталя', N'Городоцька', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (15, N'Олена', N'Зеленська', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (16, N'Галя', N'Балувана', 9, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (17, N'Олександр', N'По', 10, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (18, N'Марія', N'Цисик', 10, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (19, N'Ольга', N'Більуспині', 5, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (20, N'Станіслав', N'Лем', 7, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (21, N'Олена', N'Дума', 4, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (22, N'Данило', N'Галицький', 6, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (23, N'Оксана', N'Невмиренко', 6, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (24, N'Остап', N'Вишня', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (25, N'Ірина', N'Недайбоже', 5, 2)
SET IDENTITY_INSERT [dbo].[Students] OFF

SET IDENTITY_INSERT [dbo].[T_Cards] ON 
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 13, CAST(N'2010-01-01 00:00:00.000' AS DateTime), CAST(N'2011-07-04 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 10, 2, CAST(N'2020-03-03 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 12, CAST(N'2018-06-04 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 3, 1, CAST(N'2023-09-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 8, 8, CAST(N'2022-05-05 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 5, 18, CAST(N'2021-02-02 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 12, 17, CAST(N'2021-03-04 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 4, 18, CAST(N'2018-07-02 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[T_Cards] OFF

SET IDENTITY_INSERT [dbo].[Teachers] ON 
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (1, N'Криштоф', N'Полуботько', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (2, N'Петро', N'Гашек', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (3, N'Сергій', N'Манило', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (4, N'Дмитро', N'Самохатько', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (5, N'Віктор', N'Павлик', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (6, N'Вадим', N'Ткаченко', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (7, N'Леся', N'Кудря', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (8, N'Хато', N'Мамото', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (9, N'Андрій', N'Тендюк', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (10, N'Олег', N'Шастун', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (11, N'Микола', N'Шифро', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (12, N'Олександр', N'Паномарьов', 1)
SET IDENTITY_INSERT [dbo].[Teachers] OFF

SET IDENTITY_INSERT [dbo].[Themes] ON 
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (1, N'Бази даних')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (2, N'Программування')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (3, N'Графічні сбірки')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (4, N'Математика')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (5, N'Математичні сібрки')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (6, N'Мережі')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (7, N'Web-дизайн')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (8, N'Windows 11')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (9, N'Операційні системи')
SET IDENTITY_INSERT [dbo].[Themes] OFF

ALTER TABLE [dbo].[Authors] ADD  CONSTRAINT [Authors_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [Books_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
CREATE NONCLUSTERED INDEX [AuthorsBooks] ON [dbo].[Books]
(
	[Id_Author] ASC
)
GO
CREATE NONCLUSTERED INDEX [CategoriesBooks] ON [dbo].[Books]
(
	[Id_Category] ASC
)
GO
CREATE NONCLUSTERED INDEX [PressBooks] ON [dbo].[Books]
(
	[Id_Press] ASC
)
GO
CREATE NONCLUSTERED INDEX [ThemesBooks] ON [dbo].[Books]
(
	[Id_Themes] ASC
)
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [Categories_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [Departments_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [Faculties_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[Groups] ADD  CONSTRAINT [Groups_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
CREATE NONCLUSTERED INDEX [FacultiesGroups] ON [dbo].[Groups]
(
	[Id_Faculty] ASC
)
GO
ALTER TABLE [dbo].[Libs] ADD  CONSTRAINT [Libs_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[Press] ADD  CONSTRAINT [Press_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[S_Cards] ADD  CONSTRAINT [S_Cards_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
CREATE NONCLUSTERED INDEX [BooksCards] ON [dbo].[S_Cards]
(
	[Id_Book] ASC
)
GO
CREATE NONCLUSTERED INDEX [LibsCards] ON [dbo].[S_Cards]
(
	[Id_Lib] ASC
)
GO
CREATE NONCLUSTERED INDEX [StudentsCards] ON [dbo].[S_Cards]
(
	[Id_Student] ASC
)
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [Students_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
CREATE NONCLUSTERED INDEX [GroupsStudents] ON [dbo].[Students]
(
	[Id_Group] ASC
)
GO
ALTER TABLE [dbo].[T_Cards] ADD  CONSTRAINT [T_Cards_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
CREATE NONCLUSTERED INDEX [BooksT_Cards] ON [dbo].[T_Cards]
(
	[Id_Book] ASC
)
GO
CREATE NONCLUSTERED INDEX [LibsT_Cards] ON [dbo].[T_Cards]
(
	[Id_Lib] ASC
)
GO
CREATE NONCLUSTERED INDEX [TeachersT_Cards] ON [dbo].[T_Cards]
(
	[Id_Teacher] ASC
)
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [Teachers_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
CREATE NONCLUSTERED INDEX [DepartmentsTeachers] ON [dbo].[Teachers]
(
	[Id_Dep] ASC
)
GO
ALTER TABLE [dbo].[Themes] ADD  CONSTRAINT [Themes_PK] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK00] FOREIGN KEY([Id_Author])
REFERENCES [dbo].[Authors] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK00]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK01] FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK01]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK02] FOREIGN KEY([Id_Press])
REFERENCES [dbo].[Press] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK02]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Books_FK03] FOREIGN KEY([Id_Themes])
REFERENCES [dbo].[Themes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Books_FK03]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [Groups_FK00] FOREIGN KEY([Id_Faculty])
REFERENCES [dbo].[Faculties] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [Groups_FK00]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [S_Cards_FK00] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [S_Cards_FK00]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [S_Cards_FK01] FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [S_Cards_FK01]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [S_Cards_FK02] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Students] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [S_Cards_FK02]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [Students_FK00] FOREIGN KEY([Id_Group])
REFERENCES [dbo].[Groups] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [Students_FK00]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [T_Cards_FK00] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [T_Cards_FK00]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [T_Cards_FK01] FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [T_Cards_FK01]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [T_Cards_FK02] FOREIGN KEY([Id_Teacher])
REFERENCES [dbo].[Teachers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [T_Cards_FK02]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [Teachers_FK00] FOREIGN KEY([Id_Dep])
REFERENCES [dbo].[Departments] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [Teachers_FK00]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK Books Pages] CHECK  (([Pages]>(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK Books Pages]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK Books Quantity] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK Books Quantity]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK Books YearPress] CHECK  (([YearPress]>=(1445)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK Books YearPress]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [CK S_Cards DateIn] CHECK  (([DateIn]>='1/1/2000'))
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [CK S_Cards DateIn]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD  CONSTRAINT [CK S_Cards DateOut] CHECK  (([DateOut]>='1/1/2000'))
GO
ALTER TABLE [dbo].[S_Cards] CHECK CONSTRAINT [CK S_Cards DateOut]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK Students Term] CHECK  (([Term]>(0) AND [Term]<=(12)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK Students Term]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [CK T_Cards DateIn] CHECK  (([DateIn]>='1/1/2000'))
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [CK T_Cards DateIn]
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD  CONSTRAINT [CK T_Cards DateOut] CHECK  (([DateOut]>='1/1/2000'))
GO
ALTER TABLE [dbo].[T_Cards] CHECK CONSTRAINT [CK T_Cards DateOut]
GO
