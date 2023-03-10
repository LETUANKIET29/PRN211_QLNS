USE [master]
GO
/****** Object:  Database [QLNS_v2]    Script Date: 2/16/2023 1:07:36 PM ******/
CREATE DATABASE [QLNS_v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNS_v2', FILENAME = N'D:\Student\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLNS_v2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNS_v2_log', FILENAME = N'D:\Student\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLNS_v2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLNS_v2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNS_v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNS_v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNS_v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNS_v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNS_v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNS_v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNS_v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNS_v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNS_v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNS_v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNS_v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNS_v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNS_v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNS_v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNS_v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNS_v2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNS_v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNS_v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNS_v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNS_v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNS_v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNS_v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNS_v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNS_v2] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNS_v2] SET  MULTI_USER 
GO
ALTER DATABASE [QLNS_v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNS_v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNS_v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNS_v2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNS_v2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNS_v2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNS_v2', N'ON'
GO
ALTER DATABASE [QLNS_v2] SET QUERY_STORE = OFF
GO
USE [QLNS_v2]
GO
/****** Object:  Table [dbo].[AdvanceSalary]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceSalary](
	[AdvanceSalaryID] [int] IDENTITY(1,1) NOT NULL,
	[AdvanceSalaryDay] [datetime] NULL,
	[AdvanceAmount] [int] NULL,
	[Status] [bit] NULL,
	[DeveloperID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvanceSalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificate]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificate](
	[certificateID] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperID] [int] NULL,
	[certificateDetailsName] [nvarchar](100) NULL,
 CONSTRAINT [PK__certific__A15CBE8E4DFAA90E] PRIMARY KEY CLUSTERED 
(
	[certificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyAddress] [nvarchar](500) NULL,
	[CompanyPhone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[DeveloperID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[CitizenID] [nvarchar](50) NULL,
	[Address] [nvarchar](300) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Develope__DE084CD19ADB5D39] PRIMARY KEY CLUSTERED 
(
	[DeveloperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laborcontract]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laborcontract](
	[LaborcontractID] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperID] [int] NULL,
	[Status] [int] NULL,
	[PositionID] [int] NULL,
	[CompanyID] [int] NULL,
	[ContractSigningDate] [date] NULL,
	[Start_day] [date] NULL,
	[End_day] [date] NULL,
	[Details] [nvarchar](500) NULL,
	[Salary] [float] NULL,
 CONSTRAINT [PK__Laborcon__04CA75AB050DB104] PRIMARY KEY CLUSTERED 
(
	[LaborcontractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryCal]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryCal](
	[SalaryCalID] [int] NOT NULL,
	[DeveloperID] [int] NULL,
	[LaborcontractID] [int] NULL,
	[TimesheetID] [int] NULL,
	[AdvanceSalaryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalaryCalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[TimesheetID] [int] IDENTITY(1,1) NOT NULL,
	[Day] [date] NULL,
	[Time] [float] NULL,
	[DeveloperID] [int] NULL,
	[TypeShiftID] [int] NULL,
 CONSTRAINT [PK__Timeshee__848CBECD43A59EE1] PRIMARY KEY CLUSTERED 
(
	[TimesheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeShift]    Script Date: 2/16/2023 1:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeShift](
	[TypeShiftID] [int] IDENTITY(1,1) NOT NULL,
	[TypeShiftName] [nvarchar](50) NULL,
	[CoefficientsSalary] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[certificate] ON 

INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (1, 1, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (2, 2, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (3, 3, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (4, 4, N'Thạc sĩ')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (5, 5, N'Thạc sĩ')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (6, 6, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (8, 8, N'Thạc sĩ')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (9, 9, N'Thạc sĩ')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (10, 10, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (11, 11, N'Cử Nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (12, 12, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (13, 13, N'Cử Nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (16, 16, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (17, 18, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (18, 19, N'Thạc sĩ')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (19, 20, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (20, 21, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (21, 22, N'Cử nhân')
INSERT [dbo].[certificate] ([certificateID], [DeveloperID], [certificateDetailsName]) VALUES (28, 29, N'Cử nhân')
SET IDENTITY_INSERT [dbo].[certificate] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [CompanyName], [CompanyAddress], [CompanyPhone]) VALUES (1, N'Lạc Hồng', N'Quận 1, TP HCM', N'0988484888')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [CompanyAddress], [CompanyPhone]) VALUES (2, N'Thuận Tiến', N'Quận 2, TP HCM', N'0948444222')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [CompanyAddress], [CompanyPhone]) VALUES (3, N'Quốc Phát', N'Tân Bình, TP HCM', N'0494245858')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [CompanyAddress], [CompanyPhone]) VALUES (4, N'Long Thành', N'Quận 9, TP HCM', N'0384224393')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [CompanyAddress], [CompanyPhone]) VALUES (5, N'Hoàng Long ', N'Dĩ An, Bình Dương', N'0944743999')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Developer] ON 

INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (1, N'Trần Hoàng Minh', 0, CAST(N'1998-05-10' AS Date), N'0499483953', N'Minh1998@gmail.com', N'078948393849', N'Bình Dương', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (2, N'Lê Trọng Nhân', 0, CAST(N'2000-10-02' AS Date), N'0384983984', N'Nhan2000@gmail.com', N'038447389344', N'Long An', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (3, N'Trần Trung Quân', 0, CAST(N'1999-11-02' AS Date), N'0399344724', N'Quan1999@gmail.com', N'039433202223', N'Đồng Nai', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (4, N'Nguyễn Tiến Linh', 0, CAST(N'1997-06-03' AS Date), N'0238498248', N'Linh1997@gmail.com', N'048495739782', N'Củ Chi, TP HCM', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (5, N'Nguyễn Ngọc Nhi', 1, CAST(N'2000-03-10' AS Date), N'0484837549', N'Nhi2000@gmail.com', N'048384978299', N'Bình Dương', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (6, N'Nguyễn Hồng Nhung', 1, CAST(N'1999-01-13' AS Date), N'0948374247', N'Nhung1999@gmail.com', N'038589439389', N'Long An ', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (7, N'Trương Trọng Nghĩa', 0, CAST(N'1980-03-03' AS Date), N'0484989749', N'Nghia1980@gmail.com', N'048397483945', N'Quận 2, TP HCM', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (8, N'Nguyễn Hoàng Nam', 0, CAST(N'1995-04-20' AS Date), N'0957872837', N'Nam1995@gmail.com', N'038595849858', N'Bình Dương', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (9, N'Lê Nguyễn Nhật Minh', 0, CAST(N'1994-05-09' AS Date), N'0484948388', N'Minh1994@gmail.com', N'038594849580', N'Quận 9, TP HCM', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (10, N'Phạm Gia Nghĩa', 0, CAST(N'1999-07-05' AS Date), N'0384938395', N'Nghĩa1999@gmail.com', N'038595830389', N'Tây Ninh', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (11, N'Nguyễn Tiến Hoàng', 0, CAST(N'1999-11-20' AS Date), N'0499483953', N'Hoang1999@gmail.com', N'035948393849', N'Bình Dương', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (12, N'Nguyễn Văn Tiến', 0, CAST(N'1999-05-18' AS Date), N'0499483953', N'Tien1999@gmail.com', N'035948393849', N'Bình Dương', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (13, N'Trần Hoàng Minh', 0, CAST(N'1998-05-10' AS Date), N'0499483953', N'Minh1998@gmail.com', N'078948393849', N'Đồng nai', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (16, N'Nguyễn Văn Đạt', 0, CAST(N'2000-01-20' AS Date), N'0484374759', N'Dat2000@gmail.com', N'0439483922', N'Long An', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (18, N'Trần Trọng Kim', 0, CAST(N'1999-11-05' AS Date), N'0394539583', N'Kim1999@gmail.com', N'0484483929', N'Bình Dương', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (19, N'Lê Trọng Tấn', 0, CAST(N'1988-01-01' AS Date), N'0394382941', N'Tan1988@gmail.com', N'034239204829', N'Thủ Đức, TP HCM', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (20, N'Trần Văn Minh Quân', 0, CAST(N'2000-11-03' AS Date), N'0384593929', N'Quan2000@gmail.com', N'034957337937', N'Gia lai', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (21, N'Nguyễn Văn Thiệu', 0, CAST(N'1996-01-01' AS Date), N'0849483927', N'Thieu1996@gmail.com', N'038947294829', N'Bình Thuận', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (22, N'Nguyễn Thanh Tùng', 0, CAST(N'1997-07-01' AS Date), N'0384838403', N'Tung1997@gmail.com', N'038472829482', N'Gia lai', 1)
INSERT [dbo].[Developer] ([DeveloperID], [Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status]) VALUES (29, N'Nguyễn Tiến Linh', 0, CAST(N'1998-11-03' AS Date), N'0478573839', N'Linh1998@gmail.com', N'039474829291', N'Bình Dương', 1)
SET IDENTITY_INSERT [dbo].[Developer] OFF
GO
SET IDENTITY_INSERT [dbo].[Laborcontract] ON 

INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (1, 1, 1, 1, 1, CAST(N'2023-01-03' AS Date), CAST(N'2023-01-04' AS Date), CAST(N'2023-04-04' AS Date), NULL, 12000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (2, 2, 1, 2, 1, CAST(N'2023-01-03' AS Date), CAST(N'2023-01-04' AS Date), CAST(N'2023-04-04' AS Date), NULL, 10000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (3, 3, 1, 1, 1, CAST(N'2023-01-03' AS Date), CAST(N'2023-01-04' AS Date), CAST(N'2023-04-04' AS Date), NULL, 12000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (4, 4, 1, 3, 1, CAST(N'2023-01-03' AS Date), CAST(N'2023-01-04' AS Date), CAST(N'2023-04-04' AS Date), NULL, 18000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (5, 4, 0, 1, 2, CAST(N'2022-01-20' AS Date), CAST(N'2022-01-22' AS Date), CAST(N'2022-07-22' AS Date), NULL, 13000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (6, 5, 1, 1, 2, CAST(N'2023-01-06' AS Date), CAST(N'2023-01-07' AS Date), CAST(N'2023-07-07' AS Date), NULL, 12000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (7, 6, 1, 2, 3, CAST(N'2023-01-06' AS Date), CAST(N'2023-01-07' AS Date), CAST(N'2023-07-07' AS Date), NULL, 11000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (8, 7, 1, 4, 2, CAST(N'2023-01-06' AS Date), CAST(N'2023-01-07' AS Date), CAST(N'2023-07-07' AS Date), NULL, 30000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (9, 8, 1, 3, 3, CAST(N'2023-01-15' AS Date), CAST(N'2023-01-17' AS Date), CAST(N'2023-07-17' AS Date), NULL, 18000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (10, 8, 0, 1, 1, CAST(N'2022-01-20' AS Date), CAST(N'2022-01-22' AS Date), CAST(N'2022-07-22' AS Date), NULL, 14000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (11, 9, 1, 3, 5, CAST(N'2023-01-15' AS Date), CAST(N'2023-01-17' AS Date), CAST(N'2023-07-17' AS Date), NULL, 18000000)
INSERT [dbo].[Laborcontract] ([LaborcontractID], [DeveloperID], [Status], [PositionID], [CompanyID], [ContractSigningDate], [Start_day], [End_day], [Details], [Salary]) VALUES (12, 10, 1, 2, 3, CAST(N'2023-01-15' AS Date), CAST(N'2023-01-17' AS Date), CAST(N'2023-07-17' AS Date), NULL, 12000000)
SET IDENTITY_INSERT [dbo].[Laborcontract] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (1, N'Developer')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (2, N'Tester')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (3, N'Quality Control')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (4, N'Project Manager')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeShift] ON 

INSERT [dbo].[TypeShift] ([TypeShiftID], [TypeShiftName], [CoefficientsSalary]) VALUES (1, N'Thường', 1)
INSERT [dbo].[TypeShift] ([TypeShiftID], [TypeShiftName], [CoefficientsSalary]) VALUES (2, N'Tăng ca ngày thường ', 1.5)
INSERT [dbo].[TypeShift] ([TypeShiftID], [TypeShiftName], [CoefficientsSalary]) VALUES (3, N'Cuối tuần', 1.5)
INSERT [dbo].[TypeShift] ([TypeShiftID], [TypeShiftName], [CoefficientsSalary]) VALUES (4, N'Tăng ca cuối tuần', 2)
INSERT [dbo].[TypeShift] ([TypeShiftID], [TypeShiftName], [CoefficientsSalary]) VALUES (5, N'Nghỉ lễ', 3)
INSERT [dbo].[TypeShift] ([TypeShiftID], [TypeShiftName], [CoefficientsSalary]) VALUES (6, N'Tăng ca Nghỉ lễ', 4)
SET IDENTITY_INSERT [dbo].[TypeShift] OFF
GO
ALTER TABLE [dbo].[AdvanceSalary]  WITH CHECK ADD  CONSTRAINT [FK__AdvanceSa__Devel__398D8EEE] FOREIGN KEY([DeveloperID])
REFERENCES [dbo].[Developer] ([DeveloperID])
GO
ALTER TABLE [dbo].[AdvanceSalary] CHECK CONSTRAINT [FK__AdvanceSa__Devel__398D8EEE]
GO
ALTER TABLE [dbo].[certificate]  WITH CHECK ADD  CONSTRAINT [FK_certificate_Developer] FOREIGN KEY([DeveloperID])
REFERENCES [dbo].[Developer] ([DeveloperID])
GO
ALTER TABLE [dbo].[certificate] CHECK CONSTRAINT [FK_certificate_Developer]
GO
ALTER TABLE [dbo].[Laborcontract]  WITH CHECK ADD  CONSTRAINT [FK__Laborcont__Compa__37A5467C] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Laborcontract] CHECK CONSTRAINT [FK__Laborcont__Compa__37A5467C]
GO
ALTER TABLE [dbo].[Laborcontract]  WITH CHECK ADD  CONSTRAINT [FK__Laborcont__Devel__3A81B327] FOREIGN KEY([DeveloperID])
REFERENCES [dbo].[Developer] ([DeveloperID])
GO
ALTER TABLE [dbo].[Laborcontract] CHECK CONSTRAINT [FK__Laborcont__Devel__3A81B327]
GO
ALTER TABLE [dbo].[Laborcontract]  WITH CHECK ADD  CONSTRAINT [FK__Laborcont__Posit__35BCFE0A] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Laborcontract] CHECK CONSTRAINT [FK__Laborcont__Posit__35BCFE0A]
GO
ALTER TABLE [dbo].[SalaryCal]  WITH CHECK ADD FOREIGN KEY([AdvanceSalaryID])
REFERENCES [dbo].[AdvanceSalary] ([AdvanceSalaryID])
GO
ALTER TABLE [dbo].[SalaryCal]  WITH CHECK ADD  CONSTRAINT [FK__SalaryCal__Devel__3C69FB99] FOREIGN KEY([DeveloperID])
REFERENCES [dbo].[Developer] ([DeveloperID])
GO
ALTER TABLE [dbo].[SalaryCal] CHECK CONSTRAINT [FK__SalaryCal__Devel__3C69FB99]
GO
ALTER TABLE [dbo].[SalaryCal]  WITH CHECK ADD  CONSTRAINT [FK__SalaryCal__Labor__3D5E1FD2] FOREIGN KEY([LaborcontractID])
REFERENCES [dbo].[Laborcontract] ([LaborcontractID])
GO
ALTER TABLE [dbo].[SalaryCal] CHECK CONSTRAINT [FK__SalaryCal__Labor__3D5E1FD2]
GO
ALTER TABLE [dbo].[SalaryCal]  WITH CHECK ADD  CONSTRAINT [FK__SalaryCal__Times__403A8C7D] FOREIGN KEY([TimesheetID])
REFERENCES [dbo].[Timesheet] ([TimesheetID])
GO
ALTER TABLE [dbo].[SalaryCal] CHECK CONSTRAINT [FK__SalaryCal__Times__403A8C7D]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK__Timesheet__Devel__3F466844] FOREIGN KEY([DeveloperID])
REFERENCES [dbo].[Developer] ([DeveloperID])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK__Timesheet__Devel__3F466844]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK__Timesheet__TypeS__3E52440B] FOREIGN KEY([TypeShiftID])
REFERENCES [dbo].[TypeShift] ([TypeShiftID])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK__Timesheet__TypeS__3E52440B]
GO
USE [master]
GO
ALTER DATABASE [QLNS_v2] SET  READ_WRITE 
GO
