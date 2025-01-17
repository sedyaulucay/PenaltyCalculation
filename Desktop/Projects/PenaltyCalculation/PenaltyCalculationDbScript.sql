USE [master]
GO
/****** Object:  Database [PenaltyCalculation]    Script Date: 3.04.2023 13:51:13 ******/
CREATE DATABASE [PenaltyCalculation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PenaltyCalculation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PenaltyCalculation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PenaltyCalculation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PenaltyCalculation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PenaltyCalculation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PenaltyCalculation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PenaltyCalculation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET ARITHABORT OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PenaltyCalculation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PenaltyCalculation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PenaltyCalculation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PenaltyCalculation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PenaltyCalculation] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PenaltyCalculation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PenaltyCalculation] SET  MULTI_USER 
GO
ALTER DATABASE [PenaltyCalculation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PenaltyCalculation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PenaltyCalculation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PenaltyCalculation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PenaltyCalculation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PenaltyCalculation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PenaltyCalculation] SET QUERY_STORE = OFF
GO
USE [PenaltyCalculation]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3.04.2023 13:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3.04.2023 13:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CurrencyCode] [nvarchar](max) NULL,
	[PenaltyAmount] [decimal](18, 2) NOT NULL,
	[OffDay1] [nvarchar](max) NULL,
	[OffDay2] [nvarchar](max) NULL,
	[PenaltyDayCount] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 3.04.2023 13:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[HolidayId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[HolidayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED 
(
	[HolidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230401100319_InitialCreate', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230402113732_ModelEdits', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230402163006_PenaltyDaysLimitAdd', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230402182835_PenaltyAmountTypeUpdate', N'7.0.4')
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name], [CurrencyCode], [PenaltyAmount], [OffDay1], [OffDay2], [PenaltyDayCount]) VALUES (1, N'Turkey', N'TRY', CAST(5.00 AS Decimal(18, 2)), N'Saturday', N'Sunday', 10)
INSERT [dbo].[Countries] ([CountryId], [Name], [CurrencyCode], [PenaltyAmount], [OffDay1], [OffDay2], [PenaltyDayCount]) VALUES (2, N'Dubai', N'AED', CAST(10.00 AS Decimal(18, 2)), N'Friday', N'Saturday', 10)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (1, 1, CAST(N'2023-04-23T00:00:00.0000000' AS DateTime2), N'National Sovereignty and Children''s Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (2, 1, CAST(N'2023-05-19T00:00:00.0000000' AS DateTime2), N'Youth and Sports Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (7, 1, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), N'New Year''s Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (9, 1, CAST(N'2023-05-01T00:00:00.0000000' AS DateTime2), N'Labour and Solidarity Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (10, 1, CAST(N'2023-07-15T00:00:00.0000000' AS DateTime2), N'Democracy and National Unity Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (11, 1, CAST(N'2023-08-30T00:00:00.0000000' AS DateTime2), N'Victory Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (12, 1, CAST(N'2023-10-29T00:00:00.0000000' AS DateTime2), N'Republic Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (15, 1, CAST(N'2023-04-20T00:00:00.0000000' AS DateTime2), N'Ramadan Feast Eve')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (16, 1, CAST(N'2023-04-21T00:00:00.0000000' AS DateTime2), N'Ramadan Feast 1st Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (17, 1, CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2), N'Ramadan Feast 2nd Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (18, 1, CAST(N'2023-04-23T00:00:00.0000000' AS DateTime2), N'Ramadan Feast 3rd Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (19, 1, CAST(N'2023-06-27T00:00:00.0000000' AS DateTime2), N'Sacrifice Feast Eve')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (20, 1, CAST(N'2023-06-28T00:00:00.0000000' AS DateTime2), N'Sacrifice Feast 1st Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (21, 1, CAST(N'2023-06-29T00:00:00.0000000' AS DateTime2), N'Sacrifice Feast 2nd Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (24, 1, CAST(N'2023-06-30T00:00:00.0000000' AS DateTime2), N'Sacrifice Feast 3rd Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (25, 1, CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), N'Sacrifice Feast 4th Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (26, 2, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), N'New Year''s Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (29, 2, CAST(N'2023-04-20T00:00:00.0000000' AS DateTime2), N'Ramadan Feast Eve')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (30, 2, CAST(N'2023-04-21T00:00:00.0000000' AS DateTime2), N'Ramadan Feast 1st Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (32, 2, CAST(N'2023-04-22T00:00:00.0000000' AS DateTime2), N'Ramadan Feast 2nd Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (33, 2, CAST(N'2023-04-23T00:00:00.0000000' AS DateTime2), N'Ramadan Feast 3rd Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (35, 2, CAST(N'2023-06-27T00:00:00.0000000' AS DateTime2), N'Arafat (Hajj) Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (37, 2, CAST(N'2023-06-28T00:00:00.0000000' AS DateTime2), N'Eid al-Adha (Feast of Sacrifice)')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (39, 2, CAST(N'2023-06-29T00:00:00.0000000' AS DateTime2), N'Eid al-Adha')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (40, 2, CAST(N'2023-06-30T00:00:00.0000000' AS DateTime2), N'Eid al-Adha')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (41, 2, CAST(N'2023-07-19T00:00:00.0000000' AS DateTime2), N'Al-Hijra (Islamic New Year)')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (42, 2, CAST(N'2023-10-01T00:00:00.0000000' AS DateTime2), N'Commemoration Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (43, 2, CAST(N'2023-10-02T00:00:00.0000000' AS DateTime2), N'National Day')
INSERT [dbo].[Holidays] ([HolidayId], [CountryId], [Date], [HolidayName]) VALUES (44, 2, CAST(N'2023-10-03T00:00:00.0000000' AS DateTime2), N'National Day Holiday')
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
/****** Object:  Index [IX_Holidays_CountryId]    Script Date: 3.04.2023 13:51:13 ******/
CREATE NONCLUSTERED INDEX [IX_Holidays_CountryId] ON [dbo].[Holidays]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT ((0)) FOR [PenaltyDayCount]
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD  CONSTRAINT [FK_Holidays_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Holidays] CHECK CONSTRAINT [FK_Holidays_Countries_CountryId]
GO
USE [master]
GO
ALTER DATABASE [PenaltyCalculation] SET  READ_WRITE 
GO
