USE [master]
GO
/****** Object:  Database [CCINV]    Script Date: 04/24/2013 12:50:13 ******/
CREATE DATABASE [CCINV] ON  PRIMARY 
( NAME = N'CCINV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CCINV.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CCINV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CCINV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CCINV] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CCINV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CCINV] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CCINV] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CCINV] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CCINV] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CCINV] SET ARITHABORT OFF
GO
ALTER DATABASE [CCINV] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CCINV] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CCINV] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CCINV] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CCINV] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CCINV] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CCINV] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CCINV] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CCINV] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CCINV] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CCINV] SET  DISABLE_BROKER
GO
ALTER DATABASE [CCINV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CCINV] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CCINV] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CCINV] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CCINV] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CCINV] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CCINV] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CCINV] SET  READ_WRITE
GO
ALTER DATABASE [CCINV] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CCINV] SET  MULTI_USER
GO
ALTER DATABASE [CCINV] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CCINV] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CCINV', N'ON'
GO
USE [CCINV]
GO
/****** Object:  User [cc]    Script Date: 04/24/2013 12:50:13 ******/
CREATE USER [cc] FOR LOGIN [cc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (1, N'America''s Cups')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (2, N'Charlie''s Cup Emporium')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (3, N'Greenville Cups Inc')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (4, N'Tervis')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (5, N'Paper Products Cupers')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (6, N'Charleston''s Cup Company')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (7, N'New York''s Cups Inc')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (8, N'Chinese Can Cup')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (9, N'English Tea Cozies')
INSERT [dbo].[Manufacturer] ([ID], [Name]) VALUES (10, N'AAA New Man')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (0, N'Steve', N'Johnson', N'Steve.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (2, N'Steve', N'Johnson', N'Steve.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (3, N'Steve', N'Jameson', N'Steve.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (4, N'Steve', N'Morrison', N'Steve.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (5, N'Steve', N'Einstein', N'Steve.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (6, N'Steve', N'Kwalski', N'Steve.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (7, N'Steve', N'Smith', N'Steve.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (8, N'Steve', N'Moore', N'Steve.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (9, N'Steve', N'Jones', N'Steve.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (10, N'Steve', N'Laughridge', N'Steve.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (11, N'Steve', N'Abole', N'Steve.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (12, N'Nancy', N'Johnson', N'Nancy.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (13, N'Nancy', N'Jameson', N'Nancy.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (14, N'Nancy', N'Morrison', N'Nancy.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (15, N'Nancy', N'Einstein', N'Nancy.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (16, N'Nancy', N'Kwalski', N'Nancy.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (17, N'Nancy', N'Smith', N'Nancy.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (18, N'Nancy', N'Moore', N'Nancy.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (19, N'Nancy', N'Jones', N'Nancy.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (20, N'Nancy', N'Laughridge', N'Nancy.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (21, N'Nancy', N'Abole', N'Nancy.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (22, N'Roger', N'Johnson', N'Roger.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (23, N'Roger', N'Jameson', N'Roger.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (24, N'Roger', N'Morrison', N'Roger.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (25, N'Roger', N'Einstein', N'Roger.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (26, N'Roger', N'Kwalski', N'Roger.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (27, N'Roger', N'Smith', N'Roger.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (28, N'Roger', N'Moore', N'Roger.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (29, N'Roger', N'Jones', N'Roger.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (30, N'Roger', N'Laughridge', N'Roger.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (31, N'Roger', N'Abole', N'Roger.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (32, N'Dan', N'Johnson', N'Dan.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (33, N'Dan', N'Jameson', N'Dan.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (34, N'Dan', N'Morrison', N'Dan.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (35, N'Dan', N'Einstein', N'Dan.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (36, N'Dan', N'Kwalski', N'Dan.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (37, N'Dan', N'Smith', N'Dan.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (38, N'Dan', N'Moore', N'Dan.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (39, N'Dan', N'Jones', N'Dan.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (40, N'Dan', N'Laughridge', N'Dan.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (41, N'Dan', N'Abole', N'Dan.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (42, N'Scott', N'Johnson', N'Scott.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (43, N'Scott', N'Jameson', N'Scott.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (44, N'Scott', N'Morrison', N'Scott.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (45, N'Scott', N'Einstein', N'Scott.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (46, N'Scott', N'Kwalski', N'Scott.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (47, N'Scott', N'Smith', N'Scott.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (48, N'Scott', N'Moore', N'Scott.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (49, N'Scott', N'Jones', N'Scott.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (50, N'Scott', N'Laughridge', N'Scott.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (51, N'Scott', N'Abole', N'Scott.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (52, N'Nick', N'Johnson', N'Nick.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (53, N'Nick', N'Jameson', N'Nick.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (54, N'Nick', N'Morrison', N'Nick.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (55, N'Nick', N'Einstein', N'Nick.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (56, N'Nick', N'Kwalski', N'Nick.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (57, N'Nick', N'Smith', N'Nick.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (58, N'Nick', N'Moore', N'Nick.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (59, N'Nick', N'Jones', N'Nick.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (60, N'Nick', N'Laughridge', N'Nick.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (61, N'Nick', N'Abole', N'Nick.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (62, N'Brandon', N'Johnson', N'Brandon.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (63, N'Brandon', N'Jameson', N'Brandon.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (64, N'Brandon', N'Morrison', N'Brandon.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (65, N'Brandon', N'Einstein', N'Brandon.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (66, N'Brandon', N'Kwalski', N'Brandon.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (67, N'Brandon', N'Smith', N'Brandon.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (68, N'Brandon', N'Moore', N'Brandon.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (69, N'Brandon', N'Jones', N'Brandon.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (70, N'Brandon', N'Laughridge', N'Brandon.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (71, N'Brandon', N'Abole', N'Brandon.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (72, N'Rachel', N'Johnson', N'Rachel.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (73, N'Rachel', N'Jameson', N'Rachel.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (74, N'Rachel', N'Morrison', N'Rachel.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (75, N'Rachel', N'Einstein', N'Rachel.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (76, N'Rachel', N'Kwalski', N'Rachel.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (77, N'Rachel', N'Smith', N'Rachel.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (78, N'Rachel', N'Moore', N'Rachel.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (79, N'Rachel', N'Jones', N'Rachel.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (80, N'Rachel', N'Laughridge', N'Rachel.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (81, N'Rachel', N'Abole', N'Rachel.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (82, N'Melissa', N'Johnson', N'Melissa.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (83, N'Melissa', N'Jameson', N'Melissa.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (84, N'Melissa', N'Morrison', N'Melissa.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (85, N'Melissa', N'Einstein', N'Melissa.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (86, N'Melissa', N'Kwalski', N'Melissa.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (87, N'Melissa', N'Smith', N'Melissa.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (88, N'Melissa', N'Moore', N'Melissa.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (89, N'Melissa', N'Jones', N'Melissa.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (90, N'Melissa', N'Laughridge', N'Melissa.Laughridge@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (91, N'Melissa', N'Abole', N'Melissa.Abole@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (92, N'Thomas', N'Johnson', N'Thomas.Johnson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (93, N'Thomas', N'Jameson', N'Thomas.Jameson@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (94, N'Thomas', N'Morrison', N'Thomas.Morrison@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (95, N'Thomas', N'Einstein', N'Thomas.Einstein@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (96, N'Thomas', N'Kwalski', N'Thomas.Kwalski@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (97, N'Thomas', N'Smith', N'Thomas.Smith@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (98, N'Thomas', N'Moore', N'Thomas.Moore@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (99, N'Thomas', N'Jones', N'Thomas.Jones@fakemail.com')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (100, N'Thomas', N'Laughridge', N'Thomas.Laughridge@fakemail.com')
GO
print 'Processed 100 total records'
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email]) VALUES (101, N'Thomas', N'Abole', N'Thomas.Abole@fakemail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[Warehouse]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipper](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Shipper] ON
INSERT [dbo].[Shipper] ([ID], [Name], [FirstName], [LastName], [Email], [Phone]) VALUES (1, N'UPS', NULL, NULL, NULL, NULL)
INSERT [dbo].[Shipper] ([ID], [Name], [FirstName], [LastName], [Email], [Phone]) VALUES (2, N'FedEx', NULL, NULL, NULL, NULL)
INSERT [dbo].[Shipper] ([ID], [Name], [FirstName], [LastName], [Email], [Phone]) VALUES (3, N'United States Postal Service', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Shipper] OFF
/****** Object:  Table [dbo].[PaymentInfo]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Method] [varchar](50) NULL,
	[CC] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Customer_ID] [int] NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_PaymentInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](10) NULL,
	[Address] [varchar](50) NULL,
	[Customer_ID] [int] NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_ID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Cost] [numeric](18, 2) NULL,
	[RetailCost] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (4, 1, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (5, 1, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (6, 1, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (7, 1, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (8, 1, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (9, 1, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (10, 1, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (11, 1, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (12, 1, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (13, 2, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (14, 2, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (15, 2, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (16, 2, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (17, 2, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (18, 2, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (19, 2, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (20, 2, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (21, 2, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (22, 3, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (23, 3, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (24, 3, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (25, 3, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (26, 3, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (27, 3, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (28, 3, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (29, 3, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (30, 3, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (31, 4, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (32, 4, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (33, 4, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (34, 4, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (35, 4, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (36, 4, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (37, 4, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (38, 4, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (39, 4, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (40, 5, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (41, 5, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (42, 5, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (43, 5, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (44, 5, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (45, 5, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (46, 5, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (47, 5, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (48, 5, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (49, 6, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (50, 6, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (51, 6, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (52, 6, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (53, 6, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (54, 6, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (55, 6, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (56, 6, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (57, 6, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (58, 7, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (59, 7, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (60, 7, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (61, 7, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (62, 7, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (63, 7, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (64, 7, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (65, 7, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (66, 7, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (67, 8, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (68, 8, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (69, 8, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (70, 8, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (71, 8, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (72, 8, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (73, 8, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (74, 8, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (75, 8, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (76, 9, N'Small Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (77, 9, N'Small Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (78, 9, N'Small Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (79, 9, N'Medium Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (80, 9, N'Medium Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (81, 9, N'Medium Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (82, 9, N'Large Coffee cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (83, 9, N'Large Styrofoam cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (84, 9, N'Large Insulated cup', NULL, NULL, NULL)
INSERT [dbo].[Item] ([ID], [Manufacturer_ID], [Name], [Description], [Cost], [RetailCost]) VALUES (85, 10, N'Our Brand New Cups', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[Inventory]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Item_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Warehouse_ID] [int] NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Shipper_ID] [int] NULL,
	[PaymentInfo_ID] [int] NULL,
	[DateArrived] [datetime] NULL,
	[DateOrdered] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([ID], [Customer_ID], [Shipper_ID], [PaymentInfo_ID], [DateArrived], [DateOrdered]) VALUES (3, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [Customer_ID], [Shipper_ID], [PaymentInfo_ID], [DateArrived], [DateOrdered]) VALUES (4, 7, 3, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [Customer_ID], [Shipper_ID], [PaymentInfo_ID], [DateArrived], [DateOrdered]) VALUES (5, 25, 2, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [Customer_ID], [Shipper_ID], [PaymentInfo_ID], [DateArrived], [DateOrdered]) VALUES (6, 7, 3, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [Customer_ID], [Shipper_ID], [PaymentInfo_ID], [DateArrived], [DateOrdered]) VALUES (10, 4, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [Customer_ID], [Shipper_ID], [PaymentInfo_ID], [DateArrived], [DateOrdered]) VALUES (11, 50, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[OrderItems]    Script Date: 04/24/2013 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Item_ID] [int] NULL,
	[Order_ID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON
INSERT [dbo].[OrderItems] ([Item_ID], [Order_ID], [ID], [Quantity]) VALUES (56, 6, 2, 7)
INSERT [dbo].[OrderItems] ([Item_ID], [Order_ID], [ID], [Quantity]) VALUES (51, 10, 3, NULL)
INSERT [dbo].[OrderItems] ([Item_ID], [Order_ID], [ID], [Quantity]) VALUES (38, 10, 4, 5)
INSERT [dbo].[OrderItems] ([Item_ID], [Order_ID], [ID], [Quantity]) VALUES (7, 3, 5, 6)
INSERT [dbo].[OrderItems] ([Item_ID], [Order_ID], [ID], [Quantity]) VALUES (58, 3, 9, 32)
INSERT [dbo].[OrderItems] ([Item_ID], [Order_ID], [ID], [Quantity]) VALUES (85, 11, 10, 2)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
/****** Object:  ForeignKey [FK_PaymentInfo_Customer]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[PaymentInfo]  WITH CHECK ADD  CONSTRAINT [FK_PaymentInfo_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[PaymentInfo] CHECK CONSTRAINT [FK_PaymentInfo_Customer]
GO
/****** Object:  ForeignKey [FK_Address_Customer]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Customer]
GO
/****** Object:  ForeignKey [FK_Item_Manufacturer]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Manufacturer] FOREIGN KEY([Manufacturer_ID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Manufacturer]
GO
/****** Object:  ForeignKey [FK_Inventory_Item]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Item] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Item]
GO
/****** Object:  ForeignKey [FK_Inventory_Warehouse]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Warehouse] FOREIGN KEY([Warehouse_ID])
REFERENCES [dbo].[Warehouse] ([ID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Warehouse]
GO
/****** Object:  ForeignKey [FK_Order_PaymentInfo]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentInfo] FOREIGN KEY([PaymentInfo_ID])
REFERENCES [dbo].[PaymentInfo] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentInfo]
GO
/****** Object:  ForeignKey [FK_Order_Shipper]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipper] FOREIGN KEY([Shipper_ID])
REFERENCES [dbo].[Shipper] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipper]
GO
/****** Object:  ForeignKey [FK_OrderItems_Item]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Item] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Item]
GO
/****** Object:  ForeignKey [FK_OrderItems_Order]    Script Date: 04/24/2013 12:50:14 ******/
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
