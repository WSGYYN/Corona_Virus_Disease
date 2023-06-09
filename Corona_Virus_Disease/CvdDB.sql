USE [master]
GO
/****** Object:  Database [CvdDB]    Script Date: 2023/6/11 20:24:13 ******/
CREATE DATABASE [CvdDB] ON  PRIMARY 
( NAME = N'CvdDB', FILENAME = N'D:\软件\SQL Server\SQL Server 根目录\MSSQL12.MSSQLSERVER\MSSQL\DATA\CvdDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CvdDB_log', FILENAME = N'D:\软件\SQL Server\SQL Server 根目录\MSSQL12.MSSQLSERVER\MSSQL\DATA\CvdDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Admin]    Script Date: 2023/6/11 20:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminAcc] [nvarchar](50) NULL,
	[AdminName] [nvarchar](50) NULL,
	[AdminPaword] [nvarchar](50) NULL,
	[BMID] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 2023/6/11 20:24:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bmt]    Script Date: 2023/6/11 20:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bmt](
	[BMID] [int] IDENTITY(1,1) NOT NULL,
	[BMname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bmt] PRIMARY KEY CLUSTERED 
(
	[BMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 2023/6/11 20:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NULL,
	[Classname] [nvarchar](50) NULL,
	[BMID] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detection]    Script Date: 2023/6/11 20:24:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 2023/6/11 20:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DRID] [int] IDENTITY(1,1) NOT NULL,
	[Drname] [nvarchar](50) NULL,
	[DrAcc] [nvarchar](50) NULL,
	[DrPassword] [nvarchar](50) NULL,
	[BMID] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Leave]    Script Date: 2023/6/11 20:24:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notice]    Script Date: 2023/6/11 20:24:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2023/6/11 20:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StuID] [int] IDENTITY(1,1) NOT NULL,
	[StuAcc] [nvarchar](50) NULL,
	[StuName] [nvarchar](50) NULL,
	[StuPassword] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[TID] [int] NULL,
	[CID] [int] NULL,
	[StuXH] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2023/6/11 20:24:13 ******/
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
	[BMID] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2023/6/11 20:24:13 ******/
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
	[UCount] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Visit]    Script Date: 2023/6/11 20:24:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [AdminAcc], [AdminName], [AdminPaword], [BMID]) VALUES (1, N'Admin', N'Admin', N'112233', 1)
INSERT [dbo].[Admin] ([AdminID], [AdminAcc], [AdminName], [AdminPaword], [BMID]) VALUES (2, N'admin20230610', N'Yytan', N'adminGw5CS20230610175346', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([AID], [Apic], [Aname], [Acount], [Atype], [Warehousing]) VALUES (1, N'微信截图_20230609153548.png', N'windows', 1000, N'操作系统', N'未入库')
INSERT [dbo].[Article] ([AID], [Apic], [Aname], [Acount], [Atype], [Warehousing]) VALUES (2, N'微信截图_20230609153548.png', N'999感冒灵', 1000, N'消杀类', N'未入库')
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Bmt] ON 

INSERT [dbo].[Bmt] ([BMID], [BMname]) VALUES (1, N'行政管理办公室')
INSERT [dbo].[Bmt] ([BMID], [BMname]) VALUES (2, N'计算机系')
INSERT [dbo].[Bmt] ([BMID], [BMname]) VALUES (3, N'医务室')
INSERT [dbo].[Bmt] ([BMID], [BMname]) VALUES (4, N'机械系')
SET IDENTITY_INSERT [dbo].[Bmt] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([CID], [TID], [Classname], [BMID]) VALUES (1, 1, N'101班', 2)
INSERT [dbo].[Class] ([CID], [TID], [Classname], [BMID]) VALUES (2, 1, N'102班', 2)
INSERT [dbo].[Class] ([CID], [TID], [Classname], [BMID]) VALUES (1001, 2, N'火箭班', 2)
INSERT [dbo].[Class] ([CID], [TID], [Classname], [BMID]) VALUES (1003, 2, N'机械001班', 4)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Detection] ON 

INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (5, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 3)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1001, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1002, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1003, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1004, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 3)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1005, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1006, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1002)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1007, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1008, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1009, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1010, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1003)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1011, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1012, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1005)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1013, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1014, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 3)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1015, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1006)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1016, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1017, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1018, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1003)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1019, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1020, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1021, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1005)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1022, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 3)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1023, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1006)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1024, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1025, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1006)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1026, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1002)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1027, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1028, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1003)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1029, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1030, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1002)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1031, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1003)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1032, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1033, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1034, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1002)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1035, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1036, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1004)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1037, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 5)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1038, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 1002)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1039, CAST(N'2023-06-06 10:00:00.000' AS DateTime), N'阴性', 1006)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1040, CAST(N'2023-05-05 00:00:00.000' AS DateTime), N'阴性', 6)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1041, CAST(N'2023-06-11 19:38:42.347' AS DateTime), N'阳性', 1004)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1042, CAST(N'2023-06-11 20:10:37.133' AS DateTime), N'阴性', 1006)
INSERT [dbo].[Detection] ([DID], [Dtime], [Dresult], [StuID]) VALUES (1043, CAST(N'2023-06-11 20:10:55.773' AS DateTime), N'阳性', 1003)
SET IDENTITY_INSERT [dbo].[Detection] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([DRID], [Drname], [DrAcc], [DrPassword], [BMID]) VALUES (1, N'Dr.王', N'drtest', N'123456', 3)
INSERT [dbo].[Doctor] ([DRID], [Drname], [DrAcc], [DrPassword], [BMID]) VALUES (2, N'Dr.潭', N'Drtan', N'112233', 3)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Leave] ON 

INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (2, 1, CAST(N'2022-10-10 08:00:00.000' AS DateTime), CAST(N'2022-10-11 08:00:00.000' AS DateTime), N'购买生活物资', 0, N'快去快回', 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (7, 3, CAST(N'2022-10-14 00:00:00.000' AS DateTime), CAST(N'2022-10-15 00:00:00.000' AS DateTime), N'A', 0, N'阿斯顿', 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1002, 5, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1003, 6, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1004, 1005, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1005, 1003, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1006, 3, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1007, 1002, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1008, 6, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1009, 5, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1010, 1004, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1011, 1003, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1012, 3, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1013, 1002, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1014, 1003, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1015, 3, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1016, 1001, CAST(N'2023-06-25 14:39:00.000' AS DateTime), CAST(N'2023-06-27 14:39:00.000' AS DateTime), N'123', 1, NULL, 1, 0)
INSERT [dbo].[Leave] ([LID], [StuID], [LstartTime], [LoverTime], [Lreason], [Lorschool], [Lview], [TID], [VState]) VALUES (1017, 1, CAST(N'2023-06-01 20:09:00.000' AS DateTime), CAST(N'2023-06-02 20:09:00.000' AS DateTime), N'感冒', 0, N'不准离校', 1, 0)
SET IDENTITY_INSERT [dbo].[Leave] OFF
SET IDENTITY_INSERT [dbo].[Notice] ON 

INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (1, N'这是标题1', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-06 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (2, N'这是标题2', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-05 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (3, N'这是标题3', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-04 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (4, N'这是标题4', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-03 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (5, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (6, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (7, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (8, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (9, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (11, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (12, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (13, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (14, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (15, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (16, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (17, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (18, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (19, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (20, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (21, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (22, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (23, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (24, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (25, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (26, N'这是标题5', N'你好世界！你好世界！你好世界！你好世界！你好世界！', CAST(N'2023-06-02 08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Notice] ([NID], [Ntitle], [NContent], [ReleTime], [Npic]) VALUES (28, N'这是一个夜晚', N'孤单寂寞冷啊，孤单寂寞冷啊，孤单寂寞冷啊，孤单寂寞冷啊，孤单寂寞冷啊，孤单寂寞冷啊，孤单寂寞冷啊。', CAST(N'2023-06-11 00:12:51.527' AS DateTime), N'微信截图_20230611001100.png')
SET IDENTITY_INSERT [dbo].[Notice] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (1, N'stutest', N'李云龙', N'123456', N'0', 1, 2, 10101)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (3, N'stutest002', N'王五', N'123456', N'0', 1, 1, 10102)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (5, N'student8fCEm', N'楚云飞', N'123456', N'0', 1, 2, 10201)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (6, N'student20230610112018DRNGT', N'李狗蛋', N'123456', N'0', 1, 1, 10201)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (1002, N'stutest003', N'stutest003', N'123456', N'0', 1, 1, 10102)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (1003, N'stutest004', N'stutest004', N'123456', N'0', 1, 1001, 10102)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (1004, N'stutest005', N'stutest005', N'123456', N'0', 1, 1003, 10102)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (1005, N'stutest006', N'stutest006', N'123456', N'0', 1, 1001, 10102)
INSERT [dbo].[Student] ([StuID], [StuAcc], [StuName], [StuPassword], [State], [TID], [CID], [StuXH]) VALUES (1006, N'stutest007', N'stutest007', N'123456', N'0', 1, 1001, 10102)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TID], [TAcc], [TName], [TPassword], [TBM], [State], [BMID]) VALUES (1, N'teatest', N'老班', N'123456', N'信息学院', N'0', 2)
INSERT [dbo].[Teacher] ([TID], [TAcc], [TName], [TPassword], [TBM], [State], [BMID]) VALUES (2, N'teatest002', N'teatest002', N'123456', N'123', NULL, 4)
INSERT [dbo].[Teacher] ([TID], [TAcc], [TName], [TPassword], [TBM], [State], [BMID]) VALUES (5, N'test004', N'老周', N'112233', N'机械制造与自动化', NULL, 4)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1, 1, N'李云龙', N'1', CAST(N'2022-10-10 00:00:00.000' AS DateTime), N'防疫', 10)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (2, 1, N'王五', N'1', CAST(N'2023-06-10 10:14:22.310' AS DateTime), N'防疫', 10)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (3, 2, N'楚云飞', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (4, 1, N'李狗蛋', N'1', CAST(N'2023-06-10 10:25:11.523' AS DateTime), N'防疫', 70)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1001, 2, N'stutest003', N'0', CAST(N'2023-06-11 14:18:26.293' AS DateTime), N'防疫', 1)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1002, 1, N'stutest004', N'1', CAST(N'2022-10-10 00:00:00.000' AS DateTime), N'防疫', 10)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1003, 1, N'stutest005', N'1', CAST(N'2023-06-10 10:14:22.310' AS DateTime), N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1004, 2, N'stutest006', NULL, NULL, N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1005, 2, N'stutest007', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1014, 1, N'stutest005', N'1', CAST(N'2023-06-10 10:14:22.310' AS DateTime), N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1015, 2, N'stutest006', NULL, NULL, N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1016, 2, N'stutest007', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1017, 2, N'楚云飞', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1018, 1, N'李狗蛋', N'1', CAST(N'2023-06-10 10:25:11.523' AS DateTime), N'防疫', 70)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1019, 2, N'stutest003', N'0', CAST(N'2023-06-11 14:18:26.293' AS DateTime), N'防疫', 1)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1020, 1, N'stutest004', N'1', CAST(N'2022-10-10 00:00:00.000' AS DateTime), N'防疫', 10)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1021, 1, N'stutest005', N'1', CAST(N'2023-06-10 10:14:22.310' AS DateTime), N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1022, 2, N'楚云飞', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1023, 1, N'李狗蛋', N'1', CAST(N'2023-06-10 10:25:11.523' AS DateTime), N'防疫', 70)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1024, 2, N'stutest003', N'0', CAST(N'2023-06-11 14:18:26.293' AS DateTime), N'防疫', 1)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1025, 1, N'stutest004', N'1', CAST(N'2022-10-10 00:00:00.000' AS DateTime), N'防疫', 10)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1026, 1, N'stutest005', N'1', CAST(N'2023-06-10 10:14:22.310' AS DateTime), N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1027, 2, N'stutest006', NULL, NULL, N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1028, 2, N'stutest007', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1029, 1, N'stutest005', N'1', CAST(N'2023-06-10 10:14:22.310' AS DateTime), N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1030, 2, N'stutest006', NULL, NULL, N'防疫', NULL)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1031, 2, N'stutest007', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1032, 2, N'楚云飞', N'1', CAST(N'2023-06-10 10:20:45.027' AS DateTime), N'防疫', 59)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1033, 1, N'李狗蛋', N'1', CAST(N'2023-06-10 10:25:11.523' AS DateTime), N'防疫', 70)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1035, 1, N'Admin', N'0', CAST(N'2023-06-11 19:55:59.437' AS DateTime), N'防疫', 1)
INSERT [dbo].[User] ([UID], [AID], [Apeople], [State], [Atime], [Uto], [UCount]) VALUES (1036, 1, N'老班', N'0', CAST(N'2023-06-11 20:11:19.270' AS DateTime), N'防疫', 10)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (1, 1, N'否', N'感冒', CAST(N'2022-10-10 08:00:00.000' AS DateTime), 1)
INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (4, 1, N'是', N'发热', CAST(N'2022-10-10 09:00:00.000' AS DateTime), 1)
INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (5, 1, N'是', N'发烧', CAST(N'2022-10-10 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (6, 3, N'是', N'发烧', CAST(N'2022-11-11 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (1001, 6, N'否', N'感冒', CAST(N'2023-06-11 14:24:00.727' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VID], [StuID], [Hot], [Vreason], [Vtime], [DRID]) VALUES (1002, 3, N'是', N'感冒', CAST(N'2023-06-11 14:25:35.803' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Visit] OFF
USE [master]
GO
ALTER DATABASE [CvdDB] SET  READ_WRITE 
GO
