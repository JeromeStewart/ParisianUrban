USE [master]
GO
/****** Object:  Database [ParisianDB]    Script Date: 2018-06-05 11:37:04 AM ******/
CREATE DATABASE [ParisianDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ParisianDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS2017\MSSQL\DATA\ParisianDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ParisianDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS2017\MSSQL\DATA\ParisianDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ParisianDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParisianDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParisianDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParisianDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParisianDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParisianDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParisianDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParisianDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ParisianDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParisianDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParisianDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParisianDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParisianDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParisianDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParisianDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParisianDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParisianDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ParisianDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParisianDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParisianDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParisianDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParisianDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParisianDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ParisianDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParisianDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ParisianDB] SET  MULTI_USER 
GO
ALTER DATABASE [ParisianDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParisianDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParisianDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParisianDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ParisianDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ParisianDB] SET QUERY_STORE = OFF
GO
USE [ParisianDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ParisianDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018-06-05 11:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1111,1111) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 2018-06-05 11:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApID] [int] IDENTITY(1,1) NOT NULL,
	[ApAddress] [nvarchar](50) NOT NULL,
	[ApDescription] [nvarchar](150) NOT NULL,
	[ApPrice] [float] NOT NULL,
	[ApTimeStamp] [datetime] NOT NULL,
	[ApImage] [nvarchar](85) NOT NULL,
	[ApRefDetail] [int] NOT NULL,
	[ApStatus] [bit] NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[ApID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApDetails]    Script Date: 2018-06-05 11:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApDetails](
	[ApDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ApPetFriendly] [bit] NOT NULL,
	[ApBathroomNum] [smallint] NOT NULL,
	[ApFurnished] [bit] NOT NULL,
 CONSTRAINT [PK_ApDetails] PRIMARY KEY CLUSTERED 
(
	[ApDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2018-06-05 11:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessID] [int] NOT NULL,
	[Description] [nvarchar](350) NOT NULL,
	[DatePosted] [datetime] NOT NULL,
	[CreatorID] [int] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyManager]    Script Date: 2018-06-05 11:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyManager](
	[PmID] [int] IDENTITY(1,1) NOT NULL,
	[PmName] [nvarchar](50) NOT NULL,
	[PmEmail] [nvarchar](50) NOT NULL,
	[PmPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PropertyManager] PRIMARY KEY CLUSTERED 
(
	[PmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2018-06-05 11:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1234,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [Password], [Name]) VALUES (1111, N'Padmin', N'Jerome')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Apartment] ON 

INSERT [dbo].[Apartment] ([ApID], [ApAddress], [ApDescription], [ApPrice], [ApTimeStamp], [ApImage], [ApRefDetail], [ApStatus]) VALUES (2, N'123 rue St-denis', N'Cozy apartment with beautiful sunset view!', 850, CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'~/Content/ApImages/Apartment_1.JPG', 1, 1)
INSERT [dbo].[Apartment] ([ApID], [ApAddress], [ApDescription], [ApPrice], [ApTimeStamp], [ApImage], [ApRefDetail], [ApStatus]) VALUES (4, N'7924 Thelma', N'1st floor apartment. Very bright, with large windows in each room', 835, CAST(N'2018-04-15T00:00:00.000' AS DateTime), N'~/Content/ApImages/Apartment_2.JPG', 2, 1)
INSERT [dbo].[Apartment] ([ApID], [ApAddress], [ApDescription], [ApPrice], [ApTimeStamp], [ApImage], [ApRefDetail], [ApStatus]) VALUES (15, N'H3H2E4, Montréal, QC', N'Grand 4 1/2 à louer non meublé au rez-de chaussée d''une maison victorienne
à 3 min du métro Guy-Concordia (ligne verte)', 1650, CAST(N'2018-04-16T00:00:00.000' AS DateTime), N'~/Content/ApImages/Apartment_3.JPG', 2, 1)
INSERT [dbo].[Apartment] ([ApID], [ApAddress], [ApDescription], [ApPrice], [ApTimeStamp], [ApImage], [ApRefDetail], [ApStatus]) VALUES (16, N'1350 Du Fort street', N'3 1/2 - Le 1350 Appartements - Centre-Ville', 905, CAST(N'2018-04-17T00:00:00.000' AS DateTime), N'~/Content/ApImages/Apartment_4.JPG', 1, 1)
SET IDENTITY_INSERT [dbo].[Apartment] OFF
SET IDENTITY_INSERT [dbo].[ApDetails] ON 

INSERT [dbo].[ApDetails] ([ApDetailID], [ApPetFriendly], [ApBathroomNum], [ApFurnished]) VALUES (1, 0, 2, 0)
INSERT [dbo].[ApDetails] ([ApDetailID], [ApPetFriendly], [ApBathroomNum], [ApFurnished]) VALUES (2, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[ApDetails] OFF
SET IDENTITY_INSERT [dbo].[PropertyManager] ON 

INSERT [dbo].[PropertyManager] ([PmID], [PmName], [PmEmail], [PmPassword]) VALUES (1, N'Dubois', N'Dubois23@gmail.com', N'padmin')
INSERT [dbo].[PropertyManager] ([PmID], [PmName], [PmEmail], [PmPassword]) VALUES (2, N'Maryjane', N'MJcontact@gmail.com', N'padmin')
SET IDENTITY_INSERT [dbo].[PropertyManager] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Firstname], [Lastname], [Email], [Address], [PasswordHash]) VALUES (1234, N'Henry', N'Brown', N'HenryB93@gmail.com', N'123 sesame street', N'uCLxzS3PxoW0foPjmAKJ/V2OP/OoLe8k19HWi7Jy6zI=')
INSERT [dbo].[Users] ([ID], [Firstname], [Lastname], [Email], [Address], [PasswordHash]) VALUES (1236, N'John', N'Wick', N'theRealJW@gmail.com', N'45 elm street', N'uCLxzS3PxoW0foPjmAKJ/V2OP/OoLe8k19HWi7Jy6zI=')
INSERT [dbo].[Users] ([ID], [Firstname], [Lastname], [Email], [Address], [PasswordHash]) VALUES (1237, N'Steve', N'Jobs', N'Apple@gmail.com', N'123 Apple', N'uCLxzS3PxoW0foPjmAKJ/V2OP/OoLe8k19HWi7Jy6zI=')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the Administrator.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Password of the administrator.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the administrator.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'Name'
GO
USE [master]
GO
ALTER DATABASE [ParisianDB] SET  READ_WRITE 
GO
