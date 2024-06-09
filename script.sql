USE [master]
GO
/****** Object:  Database [MavericksBankDb1]    Script Date: 10-06-2024 00:55:12 ******/
CREATE DATABASE [MavericksBankDb1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MavericksBankDb1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MavericksBankDb1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MavericksBankDb1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MavericksBankDb1_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MavericksBankDb1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MavericksBankDb1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MavericksBankDb1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET ARITHABORT OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MavericksBankDb1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MavericksBankDb1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MavericksBankDb1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MavericksBankDb1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MavericksBankDb1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET RECOVERY FULL 
GO
ALTER DATABASE [MavericksBankDb1] SET  MULTI_USER 
GO
ALTER DATABASE [MavericksBankDb1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MavericksBankDb1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MavericksBankDb1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MavericksBankDb1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MavericksBankDb1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MavericksBankDb1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MavericksBankDb1', N'ON'
GO
ALTER DATABASE [MavericksBankDb1] SET QUERY_STORE = ON
GO
ALTER DATABASE [MavericksBankDb1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MavericksBankDb1]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[Token] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[CustDetails]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustDetails] AS
SELECT CustomerID,Username,Password
FROM Customer
WHERE CustomerID=1;
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[AccountType] [nvarchar](50) NULL,
	[Balance] [decimal](18, 2) NULL,
	[Status] [nvarchar](20) NULL,
	[IFSCCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AccView]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccView]
AS
SELECT AccountID,CustomerID, Status FROM Account
WHERE Status='PENDING';
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10-06-2024 00:55:13 ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchDetails]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchDetails](
	[IFSCCode] [nvarchar](450) NOT NULL,
	[BranchName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BranchDetails] PRIMARY KEY CLUSTERED 
(
	[IFSCCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Token] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAccountAssociation]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAccountAssociation](
	[EmployeeID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK__Employee__099995A99B46B9EC] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLoanAssociation]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLoanAssociation](
	[EmployeeID] [int] NOT NULL,
	[LoanID] [int] NOT NULL,
 CONSTRAINT [PK__Employee__1E25E2B2270169FA] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[LoanType] [nvarchar](20) NULL,
	[AccountID] [int] NULL,
	[LoanAmount] [decimal](18, 2) NULL,
	[InterestRate] [decimal](5, 2) NULL,
	[LoanStatus] [nvarchar](50) NULL,
	[ApprovalDate] [datetime] NULL,
	[DisbursementDate] [datetime] NULL,
	[Tenure] [int] NOT NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[SenderAccountID] [int] NULL,
	[RecieverAccountID] [int] NULL,
	[TransactionType] [nvarchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[TransactionDate] [datetime] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240307085318_bankmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240308054855_newmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240308055741_tokenmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240308063519_tokenidmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240308074744_finalmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240309214730_adminnmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240309222135_adminfinalmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240310183124_branchmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240310183924_newmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240310184230_branchmig', N'6.0.27')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240310193729_accountmig', N'6.0.27')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (16, 1, N'savings', CAST(900.00 AS Decimal(18, 2)), N'disapproved', N'MKID004048')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (17, 18, N'personal', CAST(500.00 AS Decimal(18, 2)), N'approved', N'MKID005051')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (18, 18, N'salary', CAST(1000.00 AS Decimal(18, 2)), N'approved', N'MKID004048')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (21, 2, N'personal', CAST(900.00 AS Decimal(18, 2)), N'approved', N'MKID004047')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (23, 20, N'savings', CAST(2101.00 AS Decimal(18, 2)), N'approved', N'MKID005051')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (25, 20, N'salary', CAST(800.00 AS Decimal(18, 2)), N'approved', N'MKID004048')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (26, 24, N'personal', CAST(997.00 AS Decimal(18, 2)), N'approved', N'MKID004047')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (28, 40, N'savings', CAST(500.00 AS Decimal(18, 2)), N'approved', N'MKID004048')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (29, 40, N'personal', CAST(1000.00 AS Decimal(18, 2)), N'disapproved', N'MKID005051')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (30, 41, N'personal', CAST(10000.00 AS Decimal(18, 2)), N'approved', N'MKID004047')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (31, 42, N'personal', CAST(1500.00 AS Decimal(18, 2)), N'tobedeleted', N'MKID005051')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (32, 42, N'savings', CAST(124456.00 AS Decimal(18, 2)), N'approved', N'MKID004047')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (33, 43, N'personal', CAST(200500.00 AS Decimal(18, 2)), N'approved', N'MKID005051')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (36, 51, N'personal', CAST(1900.00 AS Decimal(18, 2)), N'PENDING', N'MKID004047')
GO
INSERT [dbo].[Account] ([AccountID], [CustomerID], [AccountType], [Balance], [Status], [IFSCCode]) VALUES (37, 49, N'personal', CAST(8000.00 AS Decimal(18, 2)), N'PENDING', N'MKID004047')
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 
GO
INSERT [dbo].[Admin] ([AdminId], [Username], [Email], [Name], [Password]) VALUES (2, N'Ajay', N'ajay', N'Ajay', N'Ajay')
GO
INSERT [dbo].[Admin] ([AdminId], [Username], [Email], [Name], [Password]) VALUES (3, N'Rajesh', N'rajesh@gmail.com', N'rajesh', N'rajesh')
GO
INSERT [dbo].[Admin] ([AdminId], [Username], [Email], [Name], [Password]) VALUES (4, N'Rohit', N'rohit@gmail.com', N'Rohit', N'rohit')
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
INSERT [dbo].[BranchDetails] ([IFSCCode], [BranchName]) VALUES (N'MKID004047', N'Mumbai')
GO
INSERT [dbo].[BranchDetails] ([IFSCCode], [BranchName]) VALUES (N'MKID004048', N'Sangli')
GO
INSERT [dbo].[BranchDetails] ([IFSCCode], [BranchName]) VALUES (N'MKID005051', N'Pune')
GO
INSERT [dbo].[BranchDetails] ([IFSCCode], [BranchName]) VALUES (N'MKID005052', N'Delhi')
GO
INSERT [dbo].[BranchDetails] ([IFSCCode], [BranchName]) VALUES (N'MKID007066', N'Bengluru')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (1, N'Ajay', N'ajayk', N'ajay', N'ajay@gmail.com', N'9890427259', N'Mahad', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQWpheSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDQ5OTk4NiwiZXhwIjoxNzEwNTAxNzg2LCJpYXQiOjE3MTA0OTk5ODZ9.DMzNVKO4meL3l8dD_ogjwNC4LzU2RPuKW93-7rP49dDUEcuOTh2NKoNxEsymMl218mb21UI7oWn2SapDNUuQcw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (2, N'Rohit', N'Ajay', N'Rohit', N'rrk@gmail.com', N'8055998766', N'Plaus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiUm9oaXQiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTA0NDQ3NDgsImV4cCI6MTcxMDQ0NjU0OCwiaWF0IjoxNzEwNDQ0NzQ4fQ.36DWDg1TKNXlExTUFz_9GHhlrAc62A5GNwIrdNOmGGdCUHP7PUDjLkX7TdgA-x0eNdpxYXs0umzSDMCdU_rpig')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (3, N'Rajesh', N'Raju', N'Rajesh', N'Raj@gmail.com', N'9088776654', N'Pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiUmFqZXNoIiwicm9sZSI6IkN1c3RvbWVyIiwibmJmIjoxNzEwMDE4NjEyLCJleHAiOjE3MTAwMjA0MTEsImlhdCI6MTcxMDAxODYxMn0.Ad3QhjQiw26cfrlDWdZ_ZSvzW2QaN_g9tIEtAqtgpUNiqFbPI8bUdEXXLGq4BNldfvZXEzPPYLkgOeNGbZwTbg')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (4, N'ratna', N'ratna', N'Ratna', N'ratna@gmail.com', N'8900765544', N'mumbai', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmF0bmFAZ21haWwuY29tIiwibmFtZWlkIjoiMCIsIm5iZiI6MTcwOTg4NDI5MSwiZXhwIjoxNzA5ODg3ODkxLCJpYXQiOjE3MDk4ODQyOTF9.aWWke8BIQP1hmIXTVskbsctEZ2q9IahLWtJZkvy9wC0')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (5, N'ratnesh', N'ratna', N'Ratna', N'ratna@gmail.com', N'8900765544', N'mumbai', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmF0bmFAZ21haWwuY29tIiwibmFtZWlkIjoiMCIsIm5iZiI6MTcwOTg4NDMyMCwiZXhwIjoxNzA5ODg3OTIwLCJpYXQiOjE3MDk4ODQzMjB9.cZJrSIjG7-R-x9watwF8Tk8M99cxCZCLMdef_6BJ8w4')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (6, N'sam', N'samy', N'sam', N'sam@gmail.com', N'8900765544', N'sangli', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoic2FtQGdtYWlsLmNvbSIsIm5hbWVpZCI6IjAiLCJuYmYiOjE3MDk4ODUwMDcsImV4cCI6MTcwOTg4ODYwNywiaWF0IjoxNzA5ODg1MDA3fQ.JlGykqc5QKt3DoR8QdxXEO3SvxxlH_JIG8LogC9pODs')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (8, N'Dinesh', N'Dineshg', N'Dinesh', N'dinesh@gmail.com', N'9089006544', N'pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiRGluZXNoIiwicm9sZSI6IkN1c3RvbWVyIiwibmJmIjoxNzA5OTc2OTk3LCJleHAiOjE3MDk5Nzg3OTcsImlhdCI6MTcwOTk3Njk5N30.YDXziUkCEZxiMfx2BPRQh4X87xrH0Y0T_x9kmdz40busWOhfN8QxyzedByGqKBEiNN7euxSQY9P-b0zuX4VfAw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (9, N'Tilu', N'Tilu', N'Tilu', N'tilu@gmail.com', N'9088765556', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVGlsdSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcwOTk4MDg4OSwiZXhwIjoxNzA5OTgyNjg5LCJpYXQiOjE3MDk5ODA4ODl9.7H9lEmmyb1zQKx66Y2MHJxcpmIhv2OpBbAWj6O2zkh3ak3DTsdJtAdQiUMNcxDIBkg4onXRtESIxjjS6KXuldg')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (10, N'Rajt', N'Rajt', N'Raj', N'raj@gmail.com', N'9088776655', N'sangola', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiUmFqdCIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcwOTk4NjE0MywiZXhwIjoxNzA5OTg3OTQzLCJpYXQiOjE3MDk5ODYxNDN9.vw_hAExQk8l8zHLJmXdzAzrqZh_bG33vlbbe91hPHtEo4LCOabrQ_-n1X2_HAZP0tMJJo3_mhoPc8HVyBAkTRw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (11, N'Sandy', N'sandy', N'sandy', N'sandy@gmail.com', N'9088776655', N'sangli', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiU2FuZHkiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MDk5OTExMDMsImV4cCI6MTcwOTk5MjkwMywiaWF0IjoxNzA5OTkxMTAzfQ.PLQKfVMC1ZRewn7jOaReu3u3EmLTjJQOTbQhfKvV74FjDEi8t2aNdSHbH2UAK1O3LQsST3Agu5eKJvHSna7U7g')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (12, N'ramesh', N'ramesh', N'ramesh', N'ramesh@gmail.com', N'6788554433', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmFtZXNoIiwicm9sZSI6IkN1c3RvbWVyIiwibmJmIjoxNzA5OTkxNDgzLCJleHAiOjE3MDk5OTMyODMsImlhdCI6MTcwOTk5MTQ4M30.BlyKo2Q-UHnAzpXkTRXJ0ZzO7qGasH0IbyhFW3Q4egMbMO0K-fUhuiGgFWWn5kbeyCWhDM4vuYxWbCyGWpV9TQ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (13, N'prajj', N'prajj', N'praj', N'praj@gmail.com', N'8099776655', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicHJhamoiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MDk5OTE3MTAsImV4cCI6MTcwOTk5MzUxMCwiaWF0IjoxNzA5OTkxNzEwfQ.QhxfZQFZWWXzSESx0Y8mpmGnUwxY8yBOBxtCoCHGTVgXM-9EtTPGUcIhFLStJChnSjG8yS_In1ACrCrsPWpNiQ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (16, N'manu', N'manu2', N'manu', N'manu@gmail.com', N'8766905543', N'pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoibWFudSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDA1ODE2NCwiZXhwIjoxNzEwMDU5OTY0LCJpYXQiOjE3MTAwNTgxNjR9.PrJEo_jZCRTLeYyEdB9fSlF_jn95H6BxNgi6u6O5G-ghDxMPsv7Iv5sM3DB9sz1PTGZ53XLgEvzSXKra1ygUiw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (17, N'khapale', N'kahaple', N'khapale', N'khapale@gmail.com', N'90876655', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoia2hhcGFsZSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDE0OTg0MiwiZXhwIjoxNzEwMTUxNjQyLCJpYXQiOjE3MTAxNDk4NDJ9.BO93H_PbEiXZjzWueC_DjK-4LyhNUqkBqNZSXOwAdlDbt_zhfCiroc5HB2-PwE96qAnU8grxqVkUHhY8cEsvnw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (18, N'rama', N'rama', N'rama', N'rama@gmail.com', N'9099123443', N'Palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmFtYSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDIyNjQ5MSwiZXhwIjoxNzEwMjI4MjkxLCJpYXQiOjE3MTAyMjY0OTF9.rzXNdmGeVkaLGj6Yi1MzEbALFHEyKMZ7ekXGvlU_VkaasaelJXq03zJRbgGNUvY2yO8Ai2FY1xcRaTjM0DPOqA')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (19, N'shankar', N'shankar', N'shankar', N'shankar@gmali.com', N'7890654432', N'Palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoic2hhbmthciIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDI1Njk3NCwiZXhwIjoxNzEwMjU4Nzc0LCJpYXQiOjE3MTAyNTY5NzR9.uQz_Gkq5zgkjEaCM2p7XUBMtHm_gMESD_BR2tCYL-V3ohdfDSoAS2EtjRotmlI2XgzoSZ2bLm8wjmd6AWL0PxA')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (20, N'vivek', N'vivek', N'Vivek', N'vivek@gmail.com', N'8055998766', N'pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidml2ZWsiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTE4MTI5OTEsImV4cCI6MTcxMTgxNDc5MSwiaWF0IjoxNzExODEyOTkxfQ.H4KG12mG2qOgBFu_x67LXXt9QoZxcppdApCFcSXYoRV9ib1EwZaqvYzctkqv9kbCfIp9mjwLGMNFDx4yAMq-LQ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (21, N'don', N'don', N'don', N'don@gmail.com', N'8099887766', N'pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiZG9uIiwicm9sZSI6IkN1c3RvbWVyIiwibmJmIjoxNzEwMzEwMzQ0LCJleHAiOjE3MTAzMTIxNDQsImlhdCI6MTcxMDMxMDM0NH0.JH2YkWLjuiQbU6kvOPJcaQalu0EJPwa1eKspm5UOKWewnmZmjhZdGUGQDgg-A0XSv8LxW6RyQPq1a96cZKPJ7w')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (22, N'bhau', N'bhau', N'bhau', N'bhau@gmail.com', N'9099998888', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYmhhdSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDMxMDgyMiwiZXhwIjoxNzEwMzEyNjIyLCJpYXQiOjE3MTAzMTA4MjJ9.yZHxWSSTbZ-_hZ_7tfzncBftFDO4rrq38tJpWCQZoVo8VLNpdW_e5as4sdDpaJv_4xhSlGopmzhVr0-9sjobAA')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (23, N'md', N'md', N'md', N'md@gmail.com', N'1234567890', N'mahad', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoibWQiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTAzMTIzNDcsImV4cCI6MTcxMDMxNDE0NywiaWF0IjoxNzEwMzEyMzQ3fQ.GVW2a_nek6tydW2kK6XnfRQKiKOQhw5quohM-C3wXuy6r-PZtgYStjrXQ3hSzBef5OJAngU8IL_XbqENwygKjQ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (24, N'raja', N'raja', N'raja', N'raja@gmail.com', N'9088990099', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmFqYSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDMyMzM3NSwiZXhwIjoxNzEwMzI1MTc1LCJpYXQiOjE3MTAzMjMzNzV9.65Gs5_etNpbmdIPE4s-Za7tkOQM-OFspyNnRpj90MtTenuBpWol7hEspOYVa_0ipKn1EBuZklw13usZg29SASw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (40, N'ravikaka', N'ravi', N'ravi', N'ravikaka@gmail.com', N'9099008877', N'palus', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmF2aWtha2EiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTA0NDEwMTAsImV4cCI6MTcxMDQ0MjgxMCwiaWF0IjoxNzEwNDQxMDEwfQ.7rcsTkm7stAu7FpsYbMw0InS2Ej4VBErQBJzWz8WMT76KprYojDpWgNox8V3mr46lQKckipZF2b2e4SyiuVvPw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (41, N'ajayk', N'ajayk', N'ajay', N'ajayk@gmail.com', N'9088776655', N'sangli', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYWpheWsiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTA0NDU1MDMsImV4cCI6MTcxMDQ0NzMwMywiaWF0IjoxNzEwNDQ1NTAzfQ.1D-QWzyFV1PKQtpK2Eleq7wJMAwfI2BrxTvtYLrEWwGp9AkZRMWwiECDx_LSbX3mQn5LdM0ezFvZPOPsA_TLfw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (42, N'cust', N'cust1', N'cust', N'cust@gmail.com', N'9034221210', N'pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiY3VzdCIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxMDQ5NTc5NSwiZXhwIjoxNzEwNDk3NTk1LCJpYXQiOjE3MTA0OTU3OTV9.fgtdp6O3yD7RBRiFMxRhYIPDMTFTIx8qBPh1skektGqD0GACURd2kVhsqSes9l1Zk4mAIQDtI6cfatwZLAsTVQ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (43, N'cust2', N'cust2', N'cust2', N'cust2@gmail.com', N'9088776655', N'sangli', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiY3VzdDIiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTA0ODQ4OTAsImV4cCI6MTcxMDQ4NjY5MCwiaWF0IjoxNzEwNDg0ODkwfQ.vmOvb3sAR-dSD93aFIyEqZzkODJ2Z8Yxsh_APzKDYo5T71j7O4i77KD_etTmn6idMiubl2E5fxATHWsa8yr_-w')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (44, N'customer', N'Customer', N'customer', N'customer@gmail.com', N'9088776655', N'Pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiY3VzdG9tZXIiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTA0OTQwMjQsImV4cCI6MTcxMDQ5NTgyNCwiaWF0IjoxNzEwNDk0MDI0fQ._T9ArfluculvZwiDPc8SLKUdIw3ZzCNSyV5XYL3PAMc0YwdHxbgszWrAkYlQeQQSWv2ZJjVdrcA1RL-JWj8ZaQ')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (45, N'user', N'user', N'user', N'user', N'1233445566', N'pune', NULL)
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (46, N'Gauri', N'$2a$11$vhThDW6C7rZ3nQ1TRD1RSecJml4E91ZjoEyB4eLhI3t3F3d23Kk3a', N'gauri', N'gauri', N'9099887777', N'pune', NULL)
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (47, N'tiju', N'$2a$11$wRichlxao9gzOB645uSoiOp1Z39IW26u5d59x1oePCV9Vlxp82z9K', N'tiju', N'tiju@gmail.com', N'8766554433', N'pune', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InRpanUiLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTc3NzkwNDQsImV4cCI6MTcxNzc4MDg0NCwiaWF0IjoxNzE3Nzc5MDQ0fQ.Imrrs3EzfopCWLen-d-0y3np583V7wzRysTjaMTXo8r9sQpOAYH3frUKqp3vvVmeXTz2BbkH-17rjca8UY8_-g')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (48, N'sayali', N'sayali', N'sayali', N'say@gmail.com', N'09860393478', N'sangli', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNheWFsaSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTcxNzgzMTQ3MCwiZXhwIjoxNzE3ODMzMjcwLCJpYXQiOjE3MTc4MzE0NzB9.bppabDvhqdX2f7zAE-ueWuaHQ2oZhwjRNpkIKzF9FvxFRAi6hu74w0XmOD6XX4mv5-O8OH0Y9YGHpmeWEjmQlw')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (49, N'ryan', N'$2a$11$p0Tc3dovekDRn.Hv1fQITuvJv0DsTMAsv0DxtGmyvZaDm0s1Cs6su', N'ryan', N'ryan@gmail.com', N'908899000', N'chennai', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InJ5YW4iLCJyb2xlIjoiQ3VzdG9tZXIiLCJuYmYiOjE3MTc4MzIwNTcsImV4cCI6MTcxNzgzMzg1NywiaWF0IjoxNzE3ODMyMDU3fQ.QymkWW5PLpl-1Ks1zOe82y2oW26U7X8O6duN9aIUJiAN8aoY7SqcdE0pu9UYkN5MNM8FizJA1MXkKxcojArlvA')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (50, N'hi', N'$2a$11$XsoKJ8Kes8zdvvY5FP9JEOk04agYrR7KAUqmEmvPeKanyfCrS6Zpe', N'hi', N'hi@gmail.com', N'9099889900', N'hi', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImhpIiwicm9sZSI6IkN1c3RvbWVyIiwibmJmIjoxNzE3ODQxNTU5LCJleHAiOjE3MTc4NDMzNTksImlhdCI6MTcxNzg0MTU1OX0.a0M_tbKj-3Vgcv_z-ZY3ZN64pDnpYDPRTYPsc-06A4wrdnvK8185LbvMKkUpqLP3RNKCFTaGElCDPRP81SASQA')
GO
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Name], [Email], [Phone], [Address], [Token]) VALUES (51, N'ravikamt', N'$2a$11$LUu5G5Ymdj5D32xgmVqj2uz.2OIE1rm.LFSHw/3Qr6AC2smnl2hGy', N'ravikamt', N'ravikamt@gmail.com', N'908899000', N'chennai', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InJhdmlrYW10Iiwicm9sZSI6IkN1c3RvbWVyIiwibmJmIjoxNzE3ODQzNzY1LCJleHAiOjE3MTc4NDU1NjUsImlhdCI6MTcxNzg0Mzc2NX0.MNXJijEcjdbH2NPqQk6HhOIzgJ9qEXRqmKJzqNC8JCLlbjerUuFLBHPNEPkLaEZdyH5C_P4zcB83t52EPzpLAA')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (4, N'sakib', N'sakib', N'sakib', N'sakib@gmail.com', N'9087665544', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNha2liIiwicm9sZSI6IkVtcGxveWVlIiwibmJmIjoxNzE3ODU5NTMzLCJleHAiOjE3MTc4NjEzMzMsImlhdCI6MTcxNzg1OTUzM30.8izKEtbj3fgnVY8DbcdQ9YS6F4JBXXNtwiVL4ajxf6WPqi_ZXllw3qEbTBeNKNtAXggtPP-8MWaRYcGhuOTHzQ')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (5, N'sonu', N'sonu', N'sonu', N'sonu@gmail.com', N'9087665544', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNvbnUiLCJyb2xlIjoiRW1wbG95ZWUiLCJuYmYiOjE3MTc4MzQ1NTAsImV4cCI6MTcxNzgzNjM1MCwiaWF0IjoxNzE3ODM0NTUwfQ.dPY1kfsVZ8hqV0R5bnHYyFtN4NfWn_-XmcvDqeGoODoIghsiMWRe9ekA-4k_b2OQhlzL-Dc68tU3z5L-zuCUGg')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (6, N'ram', N'ram', N'ram', N'ram@gmail.com', N'9088765544', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyYW0iLCJlbWFpbCI6InJhbSIsIm5iZiI6MTcwOTg5ODM0NCwiZXhwIjoxNzA5ODk4OTQ0LCJpYXQiOjE3MDk4OTgzNDQsImlzcyI6Iklzc3VyZSIsImF1ZCI6IkF1ZGllbmNlIn0.4rBsFn2zg1Fxt0TADIGavGZuY3X3zxVq77m3IDkFIPkXJNwKDoTRFjHdGfbyxhWGe1n9bTbYaydu1_oty2DvhQ')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (15, N'Manoj', N'manoj', N'Manoj', N'manoj@gmail.com', N'908877655', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTWFub2oiLCJyb2xlIjoiRW1wbG95ZWUiLCJuYmYiOjE3MTAxNzA0NDEsImV4cCI6MTcxMDE3MjI0MSwiaWF0IjoxNzEwMTcwNDQxfQ.BP3kFzw8K7rlU9BReeK86ULP-tAvP4HWpey9PvwHCJNknL6eA1fECL24zyornuZBNQ7iLSSId2UrKLDfGY5Diw')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (19, N'raj', N'raj', N'Raj', N'raj@gmail.com', N'9098776655', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmFqIiwicm9sZSI6IkVtcGxveWVlIiwibmJmIjoxNzEwMzE4NTYyLCJleHAiOjE3MTAzMjAzNjIsImlhdCI6MTcxMDMxODU2Mn0.Zv4wUCrc2MgLjkYhsnnqExMYtNE7H2WVrCnzFSs6Ck_ODUZcxeeNif1jnjJvC7nHAzJ7m3sl9lY0NEHkUSolqA')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (20, N'Amar', N'Amar', N'amar', N'amar@gmail.com', N'9088776655', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQW1hciIsInJvbGUiOiJFbXBsb3llZSIsIm5iZiI6MTcxMDMyODY5OSwiZXhwIjoxNzEwMzMwNDk5LCJpYXQiOjE3MTAzMjg2OTl9._6kiAw0aS3gIx7gOBuu9Y92ySO8KSBzvBkoFo5Y3QP6fDKuIPFxUyC8y3WI7GaoAnyqLRvAqrlEc8fm7YS34OQ')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (21, N'raja', N'raja', N'raja', N'raja@gmail.com', N'9012342242', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicmFqYSIsInJvbGUiOiJFbXBsb3llZSIsIm5iZiI6MTcxMDQ3OTM4MywiZXhwIjoxNzEwNDgxMTgzLCJpYXQiOjE3MTA0NzkzODN9.XdScNlKsA1pqSPNa9AdDaBD9W8eWSfusGU6OzzZhTLLT1fYGtK8iEfTxX9ZpIKnPl5MzFhBytcIc45Ww7q5kag')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (22, N'Employee', N'Employee', N'Employee', N'employee@gmail.com', N'9077665544', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiRW1wbG95ZWUiLCJyb2xlIjoiRW1wbG95ZWUiLCJuYmYiOjE3MTA0ODc0MzcsImV4cCI6MTcxMDQ4OTIzNywiaWF0IjoxNzEwNDg3NDM3fQ.QQQJ5d9QNOhLRMTljvJKsVLWCnYLXrdeeNKDwvFRM85WtOzJJ2ZQNEwNdAFJuJrpzQfBB1YZoQ2vrO5HnJJ9lQ')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (24, N'bhai', N'bhai', N'bhai', N'bhai@gmail.com', N'8977665544', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYmhhaSIsInJvbGUiOiJFbXBsb3llZSIsIm5iZiI6MTcxMDYwNzcxNiwiZXhwIjoxNzEwNjA5NTE2LCJpYXQiOjE3MTA2MDc3MTZ9.Ej5iWGY1vzLjjDj3hmdft10kQxrWYZUg6gIk2KwX_Dp3UXqI6o63nP9702Un9ZIm5IJh_Qm-Z8f7TjVxdU4FNg')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Username], [Password], [Name], [Email], [Phone], [Token]) VALUES (25, N'gaurav', N'gaurav', N'gaurav', N'g@gmail.com', N'9088775544', N'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImdhdXJhdiIsInJvbGUiOiJFbXBsb3llZSIsIm5iZiI6MTcxNzkzODE2NiwiZXhwIjoxNzE3OTM5OTY2LCJpYXQiOjE3MTc5MzgxNjZ9.zkN0KMcVM7GF88rwnDWhQdFba2MLYb_K6pAWAMWWXfUkDz0fIBlbWTjtGBlc84o4KvsD9FntUXGbq8sDa5cVZg')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Loan] ON 
GO
INSERT [dbo].[Loan] ([LoanID], [LoanType], [AccountID], [LoanAmount], [InterestRate], [LoanStatus], [ApprovalDate], [DisbursementDate], [Tenure]) VALUES (26, N'education', 23, CAST(100000.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(5, 2)), N'Approved', CAST(N'2024-03-14T19:20:00.477' AS DateTime), CAST(N'2024-03-14T19:20:00.477' AS DateTime), 12)
GO
INSERT [dbo].[Loan] ([LoanID], [LoanType], [AccountID], [LoanAmount], [InterestRate], [LoanStatus], [ApprovalDate], [DisbursementDate], [Tenure]) VALUES (28, N'car', 28, CAST(109000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), N'Approved', CAST(N'2024-03-14T17:19:35.853' AS DateTime), CAST(N'2024-03-14T17:19:35.853' AS DateTime), 12)
GO
INSERT [dbo].[Loan] ([LoanID], [LoanType], [AccountID], [LoanAmount], [InterestRate], [LoanStatus], [ApprovalDate], [DisbursementDate], [Tenure]) VALUES (29, N'agricultural', 31, CAST(10000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(5, 2)), N'disapproved', NULL, NULL, 12)
GO
INSERT [dbo].[Loan] ([LoanID], [LoanType], [AccountID], [LoanAmount], [InterestRate], [LoanStatus], [ApprovalDate], [DisbursementDate], [Tenure]) VALUES (30, N'car', 31, CAST(123456.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), N'Approved', CAST(N'2024-03-15T04:35:30.447' AS DateTime), CAST(N'2024-03-15T04:35:30.447' AS DateTime), 24)
GO
INSERT [dbo].[Loan] ([LoanID], [LoanType], [AccountID], [LoanAmount], [InterestRate], [LoanStatus], [ApprovalDate], [DisbursementDate], [Tenure]) VALUES (31, N'education', 32, CAST(123456.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(5, 2)), N'Approved', CAST(N'2024-03-15T09:33:27.907' AS DateTime), CAST(N'2024-03-15T09:33:27.907' AS DateTime), 12)
GO
INSERT [dbo].[Loan] ([LoanID], [LoanType], [AccountID], [LoanAmount], [InterestRate], [LoanStatus], [ApprovalDate], [DisbursementDate], [Tenure]) VALUES (32, N'car', 33, CAST(200000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), N'Approved', CAST(N'2024-03-15T09:39:51.457' AS DateTime), CAST(N'2024-03-15T09:39:51.457' AS DateTime), 12)
GO
SET IDENTITY_INSERT [dbo].[Loan] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (1, 3, 1, N'transfer', CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T11:42:39.853' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (2, 3, 1, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T17:52:52.453' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (5, 3, 1, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:12:24.573' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (7, NULL, 1, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:21:31.447' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (8, NULL, 3, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:22:35.260' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (9, NULL, 3, NULL, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:24:08.530' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (10, 3, NULL, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:28:27.773' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (11, 3, NULL, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:28:42.140' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (12, 3, 1, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-07T19:29:03.087' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (13, NULL, 2, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:16:01.800' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (14, NULL, 2, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:16:17.887' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (15, 2, 3, NULL, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:16:35.570' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (16, 2, NULL, NULL, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:16:44.060' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (17, 2, NULL, NULL, CAST(900.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:17:14.500' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (18, NULL, 2, NULL, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:18:19.017' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (19, NULL, 2, NULL, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:18:40.590' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (20, NULL, 2, NULL, CAST(2300.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:19:38.210' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (21, NULL, 3, NULL, CAST(8000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:22:16.660' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (22, NULL, 3, NULL, CAST(8000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:22:25.427' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (23, 3, NULL, NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:22:46.470' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (24, NULL, 4, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:38:26.243' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (25, NULL, 4, NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:38:50.737' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (26, 4, NULL, NULL, CAST(700.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:39:17.497' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (27, NULL, 4, NULL, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:39:38.343' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (28, NULL, 3, NULL, CAST(8000.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:40:23.990' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (29, NULL, 3, NULL, CAST(9.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:44:25.137' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (30, 4, 3, NULL, CAST(7.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:45:22.163' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (31, NULL, 4, NULL, CAST(3.00 AS Decimal(18, 2)), CAST(N'2024-03-08T02:45:48.343' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (32, NULL, 4, N'Deposit', CAST(9.00 AS Decimal(18, 2)), CAST(N'2024-03-08T03:00:51.217' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (33, NULL, 11, N'Deposit', CAST(89000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:40:14.200' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (34, 11, 4, N'Withdraw', CAST(890.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:45:34.613' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (35, 11, 4, N'Withdraw', CAST(890.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:45:41.280' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (36, 11, 4, N'Withdraw', CAST(890.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:46:11.300' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (37, 11, 10, N'Transfer', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:46:55.740' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (38, 11, 10, N'Transfer', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:48:44.537' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (39, 11, 10, N'Transfer', CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:49:02.780' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (40, 11, 10, N'Transfer', CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:58:57.310' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (41, 11, 10, N'Transfer', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T13:59:18.590' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (42, 11, 10, N'Transfer', CAST(10000.00 AS Decimal(18, 2)), CAST(N'2024-03-10T14:02:11.047' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (43, 3, 1, N'Transfer', CAST(123.00 AS Decimal(18, 2)), CAST(N'2024-03-10T20:35:09.910' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (44, 3, NULL, N'Withdraw', CAST(3.00 AS Decimal(18, 2)), CAST(N'2024-03-10T20:43:00.017' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (45, 3, NULL, N'Withdraw', CAST(346.00 AS Decimal(18, 2)), CAST(N'2024-03-10T20:43:45.320' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (46, NULL, 3, N'Deposit', CAST(346.00 AS Decimal(18, 2)), CAST(N'2024-03-10T20:50:39.417' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (47, 3, 1, N'Transfer', CAST(346.00 AS Decimal(18, 2)), CAST(N'2024-03-10T21:14:16.017' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (48, NULL, 14, N'Deposit', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-11T10:04:46.927' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (49, 14, 3, N'Transfer', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-11T10:07:57.207' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (50, NULL, 14, N'Deposit', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-11T10:13:48.797' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (51, 14, NULL, N'Withdraw', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-11T10:14:05.440' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (52, NULL, 14, N'Deposit', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-12T09:47:15.867' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (53, 14, NULL, N'Withdraw', CAST(800.00 AS Decimal(18, 2)), CAST(N'2024-03-12T09:47:32.303' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (54, 14, 5, N'Transfer', CAST(100.00 AS Decimal(18, 2)), CAST(N'2024-03-12T09:48:16.757' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (55, NULL, 20, N'Deposit', CAST(600.00 AS Decimal(18, 2)), CAST(N'2024-03-12T20:56:53.040' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (56, 20, NULL, N'Withdraw', CAST(600.00 AS Decimal(18, 2)), CAST(N'2024-03-12T20:59:11.430' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (57, 20, 3, N'Transfer', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-12T20:59:43.080' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (58, NULL, 22, N'Deposit', CAST(700.00 AS Decimal(18, 2)), CAST(N'2024-03-13T11:46:52.187' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (59, 22, NULL, N'Withdraw', CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-03-13T11:47:06.583' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (60, 22, 1, N'Transfer', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-13T11:47:20.297' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (61, 24, NULL, N'Withdraw', CAST(234.00 AS Decimal(18, 2)), CAST(N'2024-03-13T12:16:11.297' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (62, NULL, 23, N'Deposit', CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-03-13T13:57:56.617' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (63, 23, NULL, N'Withdraw', CAST(100.00 AS Decimal(18, 2)), CAST(N'2024-03-13T13:58:11.233' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (64, 26, 300, N'Withdraw', CAST(3.00 AS Decimal(18, 2)), CAST(N'2024-03-13T15:19:57.837' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (65, NULL, 27, N'Deposit', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-03-13T16:42:18.633' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (66, 27, 2, N'Withdraw', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-13T16:42:39.070' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (67, 27, NULL, N'Withdraw', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-13T16:43:08.360' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (68, NULL, 28, N'Deposit', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-14T21:29:34.190' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (69, 28, NULL, N'Withdraw', CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-03-14T21:30:05.513' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (70, 28, 3, N'Transfer', CAST(300.00 AS Decimal(18, 2)), CAST(N'2024-03-14T21:30:25.440' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (71, NULL, 31, N'Deposit', CAST(1.00 AS Decimal(18, 2)), CAST(N'2024-03-15T09:59:31.163' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (72, 31, NULL, N'Withdraw', CAST(300.00 AS Decimal(18, 2)), CAST(N'2024-03-15T09:59:45.020' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (73, 31, 4, N'Withdraw', CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-03-15T10:00:02.903' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (74, NULL, 33, N'Deposit', CAST(400.00 AS Decimal(18, 2)), CAST(N'2024-03-15T12:12:03.077' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (75, 33, NULL, N'Withdraw', CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-03-15T12:12:17.473' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (76, 33, 14, N'Transfer', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-15T12:13:25.250' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (77, NULL, 34, N'Deposit', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-15T12:45:26.277' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (78, 34, NULL, N'Withdraw', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-15T12:45:41.193' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (79, 34, 3, N'Transfer', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-03-15T12:46:03.860' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (80, NULL, 23, N'Deposit', CAST(1001.00 AS Decimal(18, 2)), CAST(N'2024-03-30T21:07:26.660' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (81, NULL, 35, N'Deposit', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2024-06-08T16:11:12.300' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (82, 35, 1, N'Withdraw', CAST(2300.00 AS Decimal(18, 2)), CAST(N'2024-06-08T16:12:15.883' AS DateTime))
GO
INSERT [dbo].[Transactions] ([TransactionID], [SenderAccountID], [RecieverAccountID], [TransactionType], [Amount], [TransactionDate]) VALUES (83, 35, NULL, N'Withdraw', CAST(12000.00 AS Decimal(18, 2)), CAST(N'2024-06-08T16:13:20.987' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
/****** Object:  Index [IX_Account_CustomerID]    Script Date: 10-06-2024 00:55:13 ******/
CREATE NONCLUSTERED INDEX [IX_Account_CustomerID] ON [dbo].[Account]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__536C85E420292607]    Script Date: 10-06-2024 00:55:13 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Customer__536C85E420292607] ON [dbo].[Customer]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__536C85E4A9EDE3A7]    Script Date: 10-06-2024 00:55:13 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Employee__536C85E4A9EDE3A7] ON [dbo].[Employee]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeAccountAssociation_AccountID]    Script Date: 10-06-2024 00:55:13 ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeAccountAssociation_AccountID] ON [dbo].[EmployeeAccountAssociation]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeLoanAssociation_LoanID]    Script Date: 10-06-2024 00:55:13 ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeLoanAssociation_LoanID] ON [dbo].[EmployeeLoanAssociation]
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Loan_AccountID]    Script Date: 10-06-2024 00:55:13 ******/
CREATE NONCLUSTERED INDEX [IX_Loan_AccountID] ON [dbo].[Loan]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_RecieverAccountID]    Script Date: 10-06-2024 00:55:13 ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_RecieverAccountID] ON [dbo].[Transactions]
(
	[RecieverAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_SenderAccountID]    Script Date: 10-06-2024 00:55:13 ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_SenderAccountID] ON [dbo].[Transactions]
(
	[SenderAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__Custome__3A81B327] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__Custome__3A81B327]
GO
ALTER TABLE [dbo].[EmployeeAccountAssociation]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeA__Accou__4D94879B] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeAccountAssociation] CHECK CONSTRAINT [FK__EmployeeA__Accou__4D94879B]
GO
ALTER TABLE [dbo].[EmployeeAccountAssociation]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeA__Emplo__4CA06362] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeAccountAssociation] CHECK CONSTRAINT [FK__EmployeeA__Emplo__4CA06362]
GO
ALTER TABLE [dbo].[EmployeeLoanAssociation]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeL__Emplo__5070F446] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeLoanAssociation] CHECK CONSTRAINT [FK__EmployeeL__Emplo__5070F446]
GO
ALTER TABLE [dbo].[EmployeeLoanAssociation]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeL__LoanI__5165187F] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loan] ([LoanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeLoanAssociation] CHECK CONSTRAINT [FK__EmployeeL__LoanI__5165187F]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK__Loan__AccountID__46E78A0C] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK__Loan__AccountID__46E78A0C]
GO
/****** Object:  StoredProcedure [dbo].[GetAccountStatus]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccountStatus]
@AccountID INT 
AS
BEGIN
SELECT*FROM Account
WHERE AccountID=@AccountID
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomer]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomer]
@Username varchar(20)
AS 
BEGIN
SELECT C.CustomerID,C.Username,A.Status
FROM Customer C
JOIN Account A  ON A.CustomerID=C.CustomerID
WHERE Username=@Username
END;
GO
/****** Object:  StoredProcedure [dbo].[GetLoanStatus]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLoanStatus] 
@LoanStatus varchar
AS 
BEGIN
SELECT*FROM Loan
WHERE LoanStatus=@LoanStatus
END;
GO
/****** Object:  StoredProcedure [dbo].[GetLoanStatuses]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLoanStatuses]
@LoanStatus varchar(10)
AS 
BEGIN
SELECT*FROM Loan
WHERE LoanStatus=@LoanStatus
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionAmount]    Script Date: 10-06-2024 00:55:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTransactionAmount]
@TransactionID INT
AS
BEGIN
SELECT Amount FROM Transactions
WHERE TransactionID=@TransactionID
END;
GO
USE [master]
GO
ALTER DATABASE [MavericksBankDb1] SET  READ_WRITE 
GO
