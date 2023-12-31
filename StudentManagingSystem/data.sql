USE [master]
GO
/****** Object:  Database [StudentManagment]    Script Date: 7/26/2023 2:26:20 PM ******/
CREATE DATABASE [StudentManagment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManagment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudentManagment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentManagment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudentManagment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentManagment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManagment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManagment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManagment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManagment] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManagment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StudentManagment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManagment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManagment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManagment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManagment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManagment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManagment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManagment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentManagment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManagment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManagment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManagment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManagment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManagment] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [StudentManagment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManagment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentManagment] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManagment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManagment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManagment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManagment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentManagment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentManagment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudentManagment] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentManagment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentManagment]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/26/2023 2:26:21 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](max) NULL,
	[FullName] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](100) NULL,
	[Type] [int] NULL,
	[Activated] [bit] NULL,
	[image_url] [nvarchar](256) NULL,
	[activation_key] [nvarchar](20) NULL,
	[reset_key] [nvarchar](20) NULL,
	[reset_date] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[DOB] [datetime2](7) NULL,
	[Gender] [nvarchar](10) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassRooms]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRooms](
	[Id] [uniqueidentifier] NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[ClassCode] [nvarchar](50) NOT NULL,
	[Status] [bit] NULL,
	[DepartmentId] [uniqueidentifier] NULL,
	[UserId] [nvarchar](450) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ClassRooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [uniqueidentifier] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[DepartmentCode] [nvarchar](50) NOT NULL,
	[Status] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[SubTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[Link] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Points]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Points](
	[StudentId] [uniqueidentifier] NOT NULL,
	[SubjectId] [uniqueidentifier] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[ProgessPoint] [real] NULL,
	[MidtermPoint] [real] NULL,
	[FinalPoint] [real] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Points] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [uniqueidentifier] NOT NULL,
	[StudentName] [nvarchar](100) NOT NULL,
	[StudentCode] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[DOB] [datetime2](7) NULL,
	[Status] [bit] NULL,
	[Phone] [nvarchar](50) NULL,
	[ClassRoomId] [uniqueidentifier] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[InSemester] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [uniqueidentifier] NOT NULL,
	[SubjectName] [nvarchar](100) NOT NULL,
	[SubjectCode] [nvarchar](50) NOT NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](500) NULL,
	[Semester] [int] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 7/26/2023 2:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230322114137_initdb', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230324033111_addUserField', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230324053851_addSemester', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230326131046_fixPoint', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230327033937_addNoti', N'6.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230327035706_fixNoti', N'6.0.9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'0e5ed615-9ab5-4e03-bfa1-b6799342aa0a', N'AppUser', N'datpthe150862@fpt.edu.vn', N'Pham Tien Dat', N'HN', N'0352401626', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'datpthe150862@fpt.edu.vn', N'DATPTHE150862@FPT.EDU.VN', N'datpthe150862@fpt.edu.vn', N'DATPTHE150862@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAEGGsh+DhLqVrXEJL3d2NzGxK+yiUEJLw5KsCna54UjOkjJunSKeNUOWhOhOwtmkVDA==', N'5I3FNGJOBNRRQPPHBXPH5RDXMDWPFITY', N'b1243c33-adf1-4568-91a2-a626fa27899f', NULL, 0, 0, NULL, 1, 0, NULL, N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'10205be4-2ca8-4329-bcfe-6d4ff8b44605', N'AppUser', N'r@fpt.edu.vn', N'Pham Tien R', N'HN', N'0352401626', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'r@fpt.edu.vn', N'R@FPT.EDU.VN', N'r@fpt.edu.vn', N'R@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAEN6AqzX6dgPKalFZqB/XnuZY6vo3JoOjOJeS2tWrqZREb72q71TVA7wGzmSNXv3C3w==', N'UBCAG3WSVAB4TLQSNYHAXTJNM4Q7PZRZ', N'128c0a35-32ae-44ad-8d2d-4c4a4e2f3115', NULL, 0, 0, NULL, 1, 0, CAST(N'2001-07-04T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'1932b451-042d-4463-b842-d03bdbd0751f', N'AppUser', N'longdt@fpr.edu.vn', N'Dang Tran Long', N'Hanoi', N'0352401626', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-25T22:48:49.5705841' AS DateTime2), NULL, CAST(N'2023-07-25T23:26:49.9472369' AS DateTime2), N'longdt@fpr.edu.vn', N'LONGDT@FPR.EDU.VN', N'longdt@fpt.edu.vn', N'LONGDT@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAEPzN6qP1EJnNfyF0b92cqHzGQvoqhjOiBr+iKeP0WNS0dj+tkwIijrV0MyBcKyTtpg==', N'217c97d5-68ef-401c-a948-073504692896', N'a12c2b0a-2ea4-4e31-b683-3346bade918b', NULL, 0, 0, NULL, 0, 0, CAST(N'2023-07-18T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'1ddc087d-0271-4362-ab34-9c26ea26344f', N'AppUser', N'Anvhe11111@fpt.edu.vn', N'Nguyen Van A', N'HN', N'0352401626', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Anvhe11111@fpt.edu.vn', N'ANVHE11111@FPT.EDU.VN', N'Anvhe11111@fpt.edu.vn', N'ANVHE11111@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAEO3MLdaXdApeMqF+JvXePLHeuvmbRGHk7q4bYbu+H/izyor0plzuy3rvK8/umkR+bA==', N'QIAUKMVOOWGPFXKRWNBSBI3HOLDEULBF', N'841b17c5-40e2-47fc-96c8-63037601d194', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-10T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'2f84eb1f-a95b-4554-86fe-8ae5be6f0ce0', N'AppUser', N'cnv@gmail.com', N'Nguyen Van C', N'hn', N'123156465', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'cnv@gmail.com', N'CNV@GMAIL.COM', N'cnv@gmail.com', N'CNV@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEH8rb99kTKFtUjLLzjNN3/DKoxvGHtZKyj5WTtGLQ8nMLb4YX1VszXfABglBU0YizQ==', N'DV2TKDQQDHYMSNSDJQPDZZ7VBF35BJGM', N'66086c68-d69a-4fe6-b6b5-59de9c48e51d', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-03T00:00:00.0000000' AS DateTime2), N'Female')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'48518f19-f4eb-45ee-b0e0-6ce189c55aed', N'AppUser', N'h@gmail.com', N'Nguyen Van H', N'HN', N'039922111', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-26T07:48:15.0349860' AS DateTime2), NULL, NULL, N'h@gmail.com', N'H@GMAIL.COM', N'h@gmail.com', N'H@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEMI2YFi/HcQ2ZHf7e0MMum+ebN1B3dkDom/tT/eSdwgi9H9dsMF9iND8BQzIqSbjQ==', N'GUWNFVT2L4GFF6VYXCDZZYSCAA6PVJQM', N'6c0c84eb-474c-4044-92f4-7d55690c6d9b', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-11T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'5e2ccd27-e268-4296-aab5-fbd1915f3360', N'AppUser', N'd1@gmail.com', N'Pham Tien D', N'HN', N'4561133333', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'd1@gmail.com', N'D1@GMAIL.COM', N'd1@gmail.com', N'D1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBQW8WWXWSEB1+5SEAMMBGzwBqdspE96Ogy7UX2dAfKXe/UE19I9OGtzIqkhRSnmew==', N'4E46642UIGNPHEQCD4V623AETAHEP2OF', N'b74e8e32-7d42-4548-a41a-dc86285fe4d0', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-11T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'b3edbae3-4eb3-428e-90c7-1f969b300b2c', N'AppUser', N'bnv@gmail.com', N'Nguyen Van B', N'HN', N'0352401626', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'bnv@gmail.com', N'BNV@GMAIL.COM', N'bnv@gmail.com', N'BNV@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMawMdYot+bMd+p8H5D5QAvfCku7SNMvFNhcOQdWwHbJFVkvNAkpgksoAAR0nfw3sg==', N'CCRBATBXWFANXCMIBPBNYFTB33CNQPQ5', N'4a89634e-1234-45bf-8e45-b70f2b5a5ffd', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-17T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'b4181515-20c1-4476-8b9f-e07861c28a4b', N'AppUser', N'huynguyen@gmail.com', N'Huy Nguyễn Quang', N'HaNoi', N'0977666666', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-03T13:23:27.4488420' AS DateTime2), NULL, CAST(N'2023-07-25T20:58:13.0865228' AS DateTime2), N'huynguyen@gmail.com', N'HUYNGUYEN@GMAIL.COM', N'huynguyen@gmail.com', N'HUYNGUYEN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIsw+/C2Gu/zG0RpDXTEPpdJS5RILs71wvLwJn327rMLcn4feOe4MQUx11sGDXWSUw==', N'7a78aaba-0b2a-4579-a123-025f14027ceb', N'fc638003-e0b3-4729-9e28-f7f478370672', NULL, 0, 0, NULL, 0, 0, CAST(N'2023-07-04T00:00:00.0000000' AS DateTime2), N'Female')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'b74ddd14-6340-4840-95c2-db12554843e5', N'AppUser', N'admin@gmail.com', N'Administrator', NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJNF6Whm24f8KvAadpz0ZemJKIj9E68hQzX2cT4MjwbVRb2W/0YzYrEByAF2AuSUeA==', N'A6XNC2VS3FVV735AWVFKZHLKL5HNWRLX', N'e900a304-d957-47bb-b2aa-9b6999071f15', N'1234567890', 0, 0, NULL, 1, 0, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'c73f3ece-996d-42f7-a2fd-df9a7eb85378', N'AppUser', N'huynqhe150250@fpt.edu.vn', N'Nguyen Quang Huy', N'HN', N'035444666', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'huynqhe150250@fpt.edu.vn', N'HUYNQHE150250@FPT.EDU.VN', N'huynqhe150250@fpt.edu.vn', N'HUYNQHE150250@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAEG+ycJCBQBMcyRk9vUb/e6Tdy9eVCYeobxNDU6lHBUcsMBxrV89jLWDHm9WiZazngg==', N'VMW7LWI34SOIE4YT7NQQUTH7GO5BHPBQ', N'ab4f123e-188f-4ce6-9ae3-3070dd75ec53', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-10T00:00:00.0000000' AS DateTime2), N'Male')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Login], [FullName], [Address], [Phone], [Type], [Activated], [image_url], [activation_key], [reset_key], [reset_date], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DOB], [Gender]) VALUES (N'f42a7cbb-f8ea-41f7-8f69-13d269811bc2', N'AppUser', N't@gmail.com', N'Nguyen Van T', N'Hanoi', N'0352401626', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-07-26T00:08:18.9661965' AS DateTime2), NULL, NULL, N't@gmail.com', N'T@GMAIL.COM', N't@gmail.com', N'T@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBnS+Vdm04vLu7XxFctuBsyOtdPtFtUl5ycHraqWf41HdvmyB0AAsn6AM0LAFiTdrQ==', N'WH4I6DC7T6CZU7H5D7JFKMI5PUHRM3UB', N'0c0ae5be-7b8c-49f6-b274-016fe57b0e5c', NULL, 0, 0, NULL, 1, 0, CAST(N'2023-07-03T00:00:00.0000000' AS DateTime2), N'Male')
GO
INSERT [dbo].[ClassRooms] ([Id], [ClassName], [ClassCode], [Status], [DepartmentId], [UserId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'47acdb46-eeb9-4371-841b-2838d8d6e5b4', N'SE1616', N'PRN221_.Net', 1, N'1d9c7a24-7a46-470d-a28e-1d7f2032e146', N'48518f19-f4eb-45ee-b0e0-6ce189c55aed', NULL, CAST(N'2023-07-26T08:56:08.2697100' AS DateTime2), NULL, CAST(N'2023-07-26T11:14:25.1861326' AS DateTime2))
INSERT [dbo].[ClassRooms] ([Id], [ClassName], [ClassCode], [Status], [DepartmentId], [UserId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'd10b40b7-1fc5-47cf-8f56-5bcfdcc70890', N'SE1888', N'SE', 1, N'918bbeba-aded-468d-8cc2-07080ac243f1', N'b4181515-20c1-4476-8b9f-e07861c28a4b', NULL, CAST(N'2023-07-03T13:37:05.5197474' AS DateTime2), NULL, CAST(N'2023-07-25T22:45:50.0367468' AS DateTime2))
INSERT [dbo].[ClassRooms] ([Id], [ClassName], [ClassCode], [Status], [DepartmentId], [UserId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'bd2a623a-169f-45c7-a9c5-df19aade06cb', N'SE1617', N'PRN221_se1617', 1, N'1d9c7a24-7a46-470d-a28e-1d7f2032e146', N'48518f19-f4eb-45ee-b0e0-6ce189c55aed', NULL, CAST(N'2023-07-26T11:16:54.5981440' AS DateTime2), NULL, NULL)
INSERT [dbo].[ClassRooms] ([Id], [ClassName], [ClassCode], [Status], [DepartmentId], [UserId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'aaf679b1-05e8-41f5-b354-f0d6d155be58', N'SE1620', N'PRN221', 1, N'fb25c8ba-94e0-4364-a753-39f7c80aa47f', N'48518f19-f4eb-45ee-b0e0-6ce189c55aed', NULL, CAST(N'2023-07-25T21:01:10.2246845' AS DateTime2), NULL, CAST(N'2023-07-26T08:13:41.3534783' AS DateTime2))
INSERT [dbo].[ClassRooms] ([Id], [ClassName], [ClassCode], [Status], [DepartmentId], [UserId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'90d2707a-2ccf-4cf5-a83f-fd21df9710d3', N'SE1883', N'SR', 1, N'4f91d7cd-1776-4b68-bece-4c16afa508e7', N'1932b451-042d-4463-b842-d03bdbd0751f', NULL, CAST(N'2023-07-03T13:38:54.6846202' AS DateTime2), NULL, CAST(N'2023-07-25T23:20:14.6432941' AS DateTime2))
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'918bbeba-aded-468d-8cc2-07080ac243f1', N'DeptB', N'B202L', 1, NULL, CAST(N'2023-07-03T13:09:13.4410595' AS DateTime2), NULL, CAST(N'2023-07-25T21:53:53.6647027' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'1d9c7a24-7a46-470d-a28e-1d7f2032e146', N'DeptA', N'Alpha', 1, NULL, CAST(N'2023-07-26T07:54:05.8133082' AS DateTime2), NULL, CAST(N'2023-07-26T07:54:19.8303981' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'1d1d7a74-6e75-48d7-b903-28d5c6cd0632', N'DeptE', N'E201R', 1, NULL, CAST(N'2023-07-03T13:05:33.4992553' AS DateTime2), NULL, CAST(N'2023-07-25T21:49:49.2334513' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'fb25c8ba-94e0-4364-a753-39f7c80aa47f', N'DeptD', N'D408R', 1, NULL, CAST(N'2023-07-03T13:05:15.4455499' AS DateTime2), NULL, CAST(N'2023-07-25T21:49:59.9641673' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'dd0c069b-e6e0-4657-ac80-4083481c5e92', N'DeptC', N'C303R', 0, NULL, CAST(N'2023-07-03T13:09:03.4766980' AS DateTime2), NULL, CAST(N'2023-07-25T21:47:45.8656027' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'4f91d7cd-1776-4b68-bece-4c16afa508e7', N'DeptA', N'A506L', 1, NULL, CAST(N'2023-07-25T21:54:48.0835754' AS DateTime2), NULL, NULL)
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'1e7f1220-e45d-420c-8041-69d1cd0bc1c8', N'DeptA', N'A203R', 1, NULL, CAST(N'2023-07-02T23:14:10.0701133' AS DateTime2), NULL, CAST(N'2023-07-25T21:50:16.3829398' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'7a7d1b29-06cd-4058-b42d-754b6009ae0a', N'DeptC', N'C202L', 0, NULL, CAST(N'2023-07-02T23:37:22.1697505' AS DateTime2), NULL, CAST(N'2023-07-25T21:50:08.6319971' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'146e9e51-8a0d-4158-bf64-ada328e531cc', N'DeptD', N'D123L', 0, NULL, CAST(N'2023-07-25T21:52:04.0944133' AS DateTime2), NULL, NULL)
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'03bacbeb-0f8c-40c9-a77a-cfddb8b75976', N'DeptA', N'A509R', 0, NULL, CAST(N'2023-07-25T21:52:54.4886321' AS DateTime2), NULL, NULL)
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'b0cdfa2c-c5c6-493f-ab3d-e55eebfd372a', N'DeptF', N'F111R', 1, NULL, CAST(N'2023-07-03T13:05:43.5292714' AS DateTime2), NULL, CAST(N'2023-07-25T21:48:08.2899402' AS DateTime2))
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'2d55446d-09e4-4f53-a4fb-e614795ec567', N'DeptC', N'C508R', 0, NULL, CAST(N'2023-07-25T20:53:10.2792074' AS DateTime2), NULL, NULL)
INSERT [dbo].[Departments] ([Id], [DepartmentName], [DepartmentCode], [Status], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'35289705-b404-40bc-8c89-e9f1b0f000e9', N'DeptD', N'D555R', 1, NULL, CAST(N'2023-07-25T21:51:31.3666577' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Notifications] ([Id], [Title], [SubTitle], [Content], [Status], [Link], [IsRead], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'8f03c6e5-17ae-41b2-b88e-4b586cce8ee1', N'Thông báo lịch thi thực hành, lịch thi kết thúc học phần lần 1 và lần 2 học kỳ Summer 2023.', N'Lich thi', N'Phòng khảo thí thông báo đã có lịch thi thực hành, lịch thi kết thúc học phần lần 1 và lần 2 học kỳ Summer 2023. Các em đăng nhập fap.fpt.edu.vn (phần View exam schedule (Xem lịch thi) ) để xem lịch thi và phòng thi lần 1 của mình.', 0, NULL, NULL, N'Administrator', CAST(N'2023-07-25T22:27:58.7122413' AS DateTime2), NULL, CAST(N'2023-07-26T00:37:45.3580813' AS DateTime2))
INSERT [dbo].[Notifications] ([Id], [Title], [SubTitle], [Content], [Status], [Link], [IsRead], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'59f08ac8-4a14-4709-b9db-4c9d92c9a33d', N'{KTX} THÔNG BÁO V/V CẮT NƯỚC VỆ SINH BỂ CHỨA ĐỊNH KỲ', N'Ve sinh be chua', N'Gửi các bạn,

Thực hiện theo chỉ đạo của Nhà trường và kế hoạch vệ sinh định kỳ bể chứa nước hàng năm tại KTX,

 Phòng HCTH gửi thông báo đến các bạn Sinh viên về lịch cắt nước vệ sinh, thau rửa bể chứa năm 2023 cụ thể như sau:

Thời gian dự kiến: Từ ngày 06/7 đến hết ngày 07/7/2023', 0, NULL, NULL, N'Administrator', CAST(N'2023-07-25T22:25:33.5607257' AS DateTime2), NULL, CAST(N'2023-07-25T22:44:12.0969092' AS DateTime2))
INSERT [dbo].[Notifications] ([Id], [Title], [SubTitle], [Content], [Status], [Link], [IsRead], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'26d7441a-7947-4247-834d-833f77c71636', N' FU-HL Thông báo về việc đăng ký mua BHYT năm 2023 - 2024', N'BHYT 2023-2024', N' Đối tượng áp dụng:
Sinh viên chưa mua BHYT trong năm 2023
Sinh viên có hạn thẻ BHYT đến 31/08/2023', 1, N'https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=26351', NULL, N'Administrator', CAST(N'2023-07-25T22:24:17.3041596' AS DateTime2), NULL, CAST(N'2023-07-25T22:33:48.6992348' AS DateTime2))
INSERT [dbo].[Notifications] ([Id], [Title], [SubTitle], [Content], [Status], [Link], [IsRead], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'2ceda4d2-dd1c-4584-a7b8-838dd56b8d51', N'Thông báo về việc thay đổi các kênh thanh toán học phí', N'Hoc phi', N'Hoc phi FA23', 1, NULL, NULL, N'Administrator', CAST(N'2023-07-25T22:22:54.5598414' AS DateTime2), NULL, CAST(N'2023-07-25T22:23:29.5815597' AS DateTime2))
INSERT [dbo].[Notifications] ([Id], [Title], [SubTitle], [Content], [Status], [Link], [IsRead], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'89cea921-066e-44c1-92b8-ed17c77c3e7a', N' FU-HL Thông báo điểm thi kết thúc học phần lần 2 các môn KRL112, JPD216, JPD316 học kỳ Summer 2023', N'Notificate', N'Phòng Khảo thí thông báo đã có điểm thi kết thúc học phần lần 2 các môn KRL112, JPD216, JPD316 học kỳ Summer 2023, các em đăng nhập FAP để xem điểm chi tiết.', 1, N'https://fap.fpt.edu.vn/CmsFAP/NewsDetail.aspx?id=25081', NULL, N'Administrator', CAST(N'2023-07-03T13:30:12.5053970' AS DateTime2), NULL, CAST(N'2023-07-26T00:37:18.6963109' AS DateTime2))
GO
INSERT [dbo].[Points] ([StudentId], [SubjectId], [Id], [ProgessPoint], [MidtermPoint], [FinalPoint], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'0e5ed615-9ab5-4e03-bfa1-b6799342aa0a', N'cea05ae3-9e66-401a-9a4a-614fc137026a', N'ea5be5ec-d453-4f27-8b77-e00ffc457736', 8, 8, 8, NULL, CAST(N'2023-07-26T00:22:26.9124457' AS DateTime2), NULL, NULL)
INSERT [dbo].[Points] ([StudentId], [SubjectId], [Id], [ProgessPoint], [MidtermPoint], [FinalPoint], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'b3edbae3-4eb3-428e-90c7-1f969b300b2c', N'98f496f2-a211-4f12-ba05-bfc31e54ef27', N'89636c7a-57d9-4622-8722-186232651ddd', 5, 5, 5, NULL, CAST(N'2023-07-25T23:55:37.9831096' AS DateTime2), NULL, NULL)
INSERT [dbo].[Points] ([StudentId], [SubjectId], [Id], [ProgessPoint], [MidtermPoint], [FinalPoint], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'0e5ed615-9ab5-4e03-bfa1-b6799342aa0a', N'98f496f2-a211-4f12-ba05-bfc31e54ef27', N'cb6d0ab7-7162-4be5-a722-d0cf2d034465', 8, 9, 6, NULL, CAST(N'2023-07-25T23:56:45.7572810' AS DateTime2), NULL, CAST(N'2023-07-26T07:49:26.6565076' AS DateTime2))
INSERT [dbo].[Points] ([StudentId], [SubjectId], [Id], [ProgessPoint], [MidtermPoint], [FinalPoint], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'c73f3ece-996d-42f7-a2fd-df9a7eb85378', N'98f496f2-a211-4f12-ba05-bfc31e54ef27', N'551ce19c-d060-43f4-a659-1c693bf8cae7', 5, 5, 5, NULL, CAST(N'2023-07-25T23:51:10.1502237' AS DateTime2), NULL, CAST(N'2023-07-25T23:51:18.5285743' AS DateTime2))
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29', N'Student', N'STUDENT', N'7f92ebd0-e1a1-41f6-9449-1345c4777f84')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6b07cdfb-d5dd-47fc-ab6e-db78db34b35e', N'Admin', N'ADMIN', N'c30edd7f-7f0b-415b-bc23-0fd583029501')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7b440da3-86ee-49cc-9f0f-bee5288fb676', N'Teacher', N'TEACHER', N'55ce8651-d18c-4bcb-a45d-2a9cebbf4757')
GO
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'b3edbae3-4eb3-428e-90c7-1f969b300b2c', N'Nguyen Van B', N'HS111111', N'HN', N'bnv@gmail.com', N'Male', CAST(N'2023-07-17T00:00:00.0000000' AS DateTime2), 1, N'0352401626', N'aaf679b1-05e8-41f5-b354-f0d6d155be58', NULL, CAST(N'2023-07-25T23:47:58.6033383' AS DateTime2), NULL, NULL, 8)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'10205be4-2ca8-4329-bcfe-6d4ff8b44605', N'Pham Tien R', N'HE150865', N'HN', N'r@fpt.edu.vn', N'Male', CAST(N'2001-07-04T00:00:00.0000000' AS DateTime2), 1, N'0352401626', N'47acdb46-eeb9-4371-841b-2838d8d6e5b4', NULL, CAST(N'2023-07-26T09:55:38.9126893' AS DateTime2), NULL, NULL, 8)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'2f84eb1f-a95b-4554-86fe-8ae5be6f0ce0', N'Nguyen Van C', N'HE123456', N'hn', N'cnv@gmail.com', N'Female', CAST(N'2023-07-03T00:00:00.0000000' AS DateTime2), 1, N'123156465', N'90d2707a-2ccf-4cf5-a83f-fd21df9710d3', NULL, CAST(N'2023-07-25T23:59:04.8233745' AS DateTime2), NULL, NULL, 7)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'1ddc087d-0271-4362-ab34-9c26ea26344f', N'Nguyen Van A', N'He11111', N'HN', N'Anvhe11111@fpt.edu.vn', N'Male', CAST(N'2023-07-10T00:00:00.0000000' AS DateTime2), 1, N'0352401626', N'aaf679b1-05e8-41f5-b354-f0d6d155be58', NULL, CAST(N'2023-07-25T23:30:31.0518285' AS DateTime2), NULL, NULL, 7)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'0e5ed615-9ab5-4e03-bfa1-b6799342aa0a', N'Pham Tien Dat', N'HE150862', N'HN', N'datpthe150862@fpt.edu.vn', N'Male', NULL, 1, N'0352401626', N'aaf679b1-05e8-41f5-b354-f0d6d155be58', NULL, CAST(N'2023-07-25T21:03:55.6326692' AS DateTime2), NULL, CAST(N'2023-07-25T23:27:59.4551750' AS DateTime2), 8)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'c73f3ece-996d-42f7-a2fd-df9a7eb85378', N'Nguyen Quang Huy', N'HE150250', N'HN', N'huynqhe150250@fpt.edu.vn', N'Male', CAST(N'2023-07-10T00:00:00.0000000' AS DateTime2), 1, N'035444666', N'90d2707a-2ccf-4cf5-a83f-fd21df9710d3', NULL, CAST(N'2023-07-25T22:46:51.9425182' AS DateTime2), NULL, NULL, 8)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentCode], [Address], [Email], [Gender], [DOB], [Status], [Phone], [ClassRoomId], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate], [InSemester]) VALUES (N'5e2ccd27-e268-4296-aab5-fbd1915f3360', N'Pham Tien D', N'HE150862', N'HN', N'd1@gmail.com', N'Male', CAST(N'2023-07-11T00:00:00.0000000' AS DateTime2), 1, N'4561133333', N'47acdb46-eeb9-4371-841b-2838d8d6e5b4', NULL, CAST(N'2023-07-26T08:03:23.5562054' AS DateTime2), NULL, CAST(N'2023-07-26T08:56:21.5288965' AS DateTime2), 1)
GO
INSERT [dbo].[Subjects] ([Id], [SubjectName], [SubjectCode], [Status], [Description], [Semester], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'cea05ae3-9e66-401a-9a4a-614fc137026a', N'Political economics of Marxism – Leninism', N'MLN122', 1, N'Political economics of Marxism – Leninism', 8, NULL, CAST(N'2023-07-26T00:22:08.4755266' AS DateTime2), NULL, CAST(N'2023-07-26T00:25:30.6523988' AS DateTime2))
INSERT [dbo].[Subjects] ([Id], [SubjectName], [SubjectCode], [Status], [Description], [Semester], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'55ab828d-e19a-4d76-abd2-627c1ef2db02', N'Basis Cross-Platform Application Programming With .NET(PRN211)', N'PRN211', 1, N'Basis Cross-Platform Application Programming With .NET', 5, NULL, CAST(N'2023-07-25T22:18:09.9588284' AS DateTime2), NULL, CAST(N'2023-07-26T00:25:14.9853037' AS DateTime2))
INSERT [dbo].[Subjects] ([Id], [SubjectName], [SubjectCode], [Status], [Description], [Semester], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'98f496f2-a211-4f12-ba05-bfc31e54ef27', N'Building Cross-Platform Back-End Application With .NET(PRN231)', N'PRN231', 1, N'Building Cross-Platform Back-End Application With .NET', 8, NULL, CAST(N'2023-07-25T22:20:36.6825175' AS DateTime2), NULL, CAST(N'2023-07-26T00:25:21.4827645' AS DateTime2))
INSERT [dbo].[Subjects] ([Id], [SubjectName], [SubjectCode], [Status], [Description], [Semester], [CreatedBy], [CreatedDate], [LastModifiedBy], [LastModifiedDate]) VALUES (N'59042c6d-15f6-42a6-93ca-cc421480e06b', N'Advanced Cross-Platform Application Programming With .NET(PRN221)', N'PRN221', 1, N'Advanced Cross-Platform Application Programming With .NET(PRN221)', 7, NULL, CAST(N'2023-07-25T21:03:28.3245440' AS DateTime2), NULL, CAST(N'2023-07-25T22:21:04.4712892' AS DateTime2))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'0e5ed615-9ab5-4e03-bfa1-b6799342aa0a', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'10205be4-2ca8-4329-bcfe-6d4ff8b44605', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'1ddc087d-0271-4362-ab34-9c26ea26344f', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'2f84eb1f-a95b-4554-86fe-8ae5be6f0ce0', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'5e2ccd27-e268-4296-aab5-fbd1915f3360', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'b3edbae3-4eb3-428e-90c7-1f969b300b2c', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'c73f3ece-996d-42f7-a2fd-df9a7eb85378', N'2bb31b93-c6b8-40c4-98d6-19ea6ed52c29')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'b74ddd14-6340-4840-95c2-db12554843e5', N'6b07cdfb-d5dd-47fc-ab6e-db78db34b35e')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'1932b451-042d-4463-b842-d03bdbd0751f', N'7b440da3-86ee-49cc-9f0f-bee5288fb676')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'48518f19-f4eb-45ee-b0e0-6ce189c55aed', N'7b440da3-86ee-49cc-9f0f-bee5288fb676')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'b4181515-20c1-4476-8b9f-e07861c28a4b', N'7b440da3-86ee-49cc-9f0f-bee5288fb676')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'f42a7cbb-f8ea-41f7-8f69-13d269811bc2', N'7b440da3-86ee-49cc-9f0f-bee5288fb676')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClassRooms_DepartmentId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassRooms_DepartmentId] ON [dbo].[ClassRooms]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ClassRooms_UserId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassRooms_UserId] ON [dbo].[ClassRooms]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Points_StudentId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Points_StudentId] ON [dbo].[Points]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_ClassRoomId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Students_ClassRoomId] ON [dbo].[Students]
(
	[ClassRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 7/26/2023 2:26:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0)) FOR [InSemester]
GO
ALTER TABLE [dbo].[ClassRooms]  WITH CHECK ADD  CONSTRAINT [FK_ClassRooms_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassRooms] CHECK CONSTRAINT [FK_ClassRooms_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClassRooms]  WITH CHECK ADD  CONSTRAINT [FK_ClassRooms_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[ClassRooms] CHECK CONSTRAINT [FK_ClassRooms_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Points]  WITH CHECK ADD  CONSTRAINT [FK_Points_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Points] CHECK CONSTRAINT [FK_Points_Students_StudentId]
GO
ALTER TABLE [dbo].[Points]  WITH CHECK ADD  CONSTRAINT [FK_Points_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Points] CHECK CONSTRAINT [FK_Points_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_ClassRooms_ClassRoomId] FOREIGN KEY([ClassRoomId])
REFERENCES [dbo].[ClassRooms] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_ClassRooms_ClassRoomId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [StudentManagment] SET  READ_WRITE 
GO
