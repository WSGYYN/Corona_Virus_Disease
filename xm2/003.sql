USE [master]
GO
/****** Object:  Database [CvdDB]    Script Date: 06/08/2023 17:59:41 ******/
CREATE DATABASE [CvdDB] ON  PRIMARY 
( NAME = N'CvdDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CvdDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CvdDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CvdDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CvdDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CvdDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CvdDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CvdDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CvdDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CvdDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CvdDB] SET ARITHABORT OFF
GO
ALTER DATABASE [CvdDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CvdDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CvdDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CvdDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CvdDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CvdDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CvdDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CvdDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CvdDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CvdDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CvdDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [CvdDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CvdDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CvdDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CvdDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CvdDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CvdDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CvdDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CvdDB] SET  READ_WRITE
GO
ALTER DATABASE [CvdDB] SET RECOVERY FULL
GO
ALTER DATABASE [CvdDB] SET  MULTI_USER
GO
ALTER DATABASE [CvdDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CvdDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CvdDB', N'ON'
GO
USE [CvdDB]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[StuID] [int] NULL,
	[Hot] [nvarchar](50) NULL,
	[Vreason] [nvarchar](50) NULL,
	[Vtime] [datetime] NULL,
	[DRID] [int] NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Visit] ON
INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (1, 1, N'否', N'感冒', CAST(0x0000AF2A0083D600 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Visit] OFF
/****** Object:  Table [dbo].[User]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[AID] [int] NULL,
	[Apeople] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Atime] [datetime] NULL,
	[Uto] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[TAcc] [nvarchar](50) NULL,
	[TName] [nvarchar](50) NULL,
	[TPassword] [nvarchar](50) NULL,
	[TBM] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON
INSERT [dbo].[Teacher] ([TID], [TAcc], [TName], [TPassword], [TBM], [State]) VALUES (1, N'teatest', N'老班', N'123456', N'信息学院', N'0')
INSERT [dbo].[Teacher] ([TID], [TAcc], [TName], [TPassword], [TBM], [State]) VALUES (2, N'teatest002', N'teatest002', N'123456', N'123', NULL)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
/****** Object:  Table [dbo].[Student]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StuID] [int] IDENTITY(1,1) NOT NULL,
	[StuAcc] [nvarchar](50) NULL,
	[StuName] [nvarchar](50) NULL,
	[StuPassword] [nvarchar](50) NULL,
	[StuClass] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[TID] [int] NULL,
	[CID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [StuClass], [State], [TID], [CID]) VALUES (1, N'stutest', N'张三', N'123456', N'101班', N'0', 1, 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Table [dbo].[Notice]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[NID] [int] IDENTITY(1,1) NOT NULL,
	[Ntitle] [nvarchar](50) NULL,
	[NContent] [nvarchar](50) NULL,
	[ReleTime] [datetime] NULL,
	[Npic] [nvarchar](50) NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Notice] ON
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (1, N'这是标题1', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0190083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (2, N'这是标题2', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0180083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (3, N'这是标题3', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0170083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (4, N'这是标题4', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0160083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (5, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (6, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (7, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (8, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (9, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (10, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (11, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (12, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (13, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (14, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (15, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (16, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (17, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (18, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (19, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (20, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (21, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (22, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (23, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (24, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (25, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (26, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (27, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(0x0000B0150083D600 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Notice] OFF
/****** Object:  Table [dbo].[Leave]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[StuID] [int] NULL,
	[LstartTime] [datetime] NULL,
	[LoverTime] [datetime] NULL,
	[Lreason] [nvarchar](50) NULL,
	[Lorschool] [int] NULL,
	[Lview] [nvarchar](50) NULL,
	[TID] [int] NULL,
	[VState] [int] NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Leave] ON
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (2, 1, CAST(0x0000AF2A0083D600 AS DateTime), CAST(0x0000AF2B0083D600 AS DateTime), N'购买生活物资', 0, N'快去快回', 1, 0)
SET IDENTITY_INSERT [dbo].[Leave] OFF
/****** Object:  Table [dbo].[Doctor]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DRID] [int] IDENTITY(1,1) NOT NULL,
	[Drname] [nvarchar](50) NULL,
	[DrAcc] [nvarchar](50) NULL,
	[DrPassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DRID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON
INSERT [dbo].[Doctor] ([DRID], [Drname], [DrAcc], [DrPassword]) VALUES (1, N'Dr.王', N'drtest', N'123456')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
/****** Object:  Table [dbo].[Detection]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detection](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[Dtime] [datetime] NULL,
	[Dresult] [nvarchar](50) NULL,
	[StuID] [int] NULL,
 CONSTRAINT [PK_Detection] PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Detection] ON
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1, CAST(0x0000B01900A4CB80 AS DateTime), N'阴性', 1)
SET IDENTITY_INSERT [dbo].[Detection] OFF
/****** Object:  Table [dbo].[Class]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NULL,
	[Classname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Class] ON
INSERT [dbo].[Class] ([CID], [TID], [Classname]) VALUES (1, 1, N'101班')
SET IDENTITY_INSERT [dbo].[Class] OFF
/****** Object:  Table [dbo].[Article]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[Apic] [nvarchar](50) NULL,
	[Aname] [nvarchar](50) NULL,
	[Acount] [int] NULL,
	[Atype] [nvarchar](50) NULL,
	[Warehousing] [nvarchar](50) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 06/08/2023 17:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminAcc] [nvarchar](50) NULL,
	[AdminName] [nvarchar](50) NULL,
	[AdminPaword] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
