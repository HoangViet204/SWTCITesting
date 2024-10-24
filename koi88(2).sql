USE [master]
GO
/****** Object:  Database [Koi88]    Script Date: 10/6/2024 1:27:49 AM ******/
CREATE DATABASE [Koi88]

GO
ALTER DATABASE [Koi88] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Koi88] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Koi88] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Koi88] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Koi88] SET ARITHABORT OFF 
GO
ALTER DATABASE [Koi88] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Koi88] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Koi88] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Koi88] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Koi88] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Koi88] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Koi88] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Koi88] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Koi88] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Koi88] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Koi88] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Koi88] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Koi88] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Koi88] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Koi88] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Koi88] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Koi88] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Koi88] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Koi88] SET  MULTI_USER 
GO
ALTER DATABASE [Koi88] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Koi88] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Koi88] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Koi88] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Koi88] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Koi88] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Koi88] SET QUERY_STORE = ON
GO
ALTER DATABASE [Koi88] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Koi88]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](100) NULL,
	[firstname] [nvarchar](100) NULL,
	[lastname] [nvarchar](100) NULL,
	[gender] [nvarchar](50) NULL,
	[phone] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[imageUrl] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[trip_id] [int] NULL,
	[po_id] [int] NULL,
	[booking_payment_id] [int] NULL,
	[feedback_id] [int] NULL,
	[customer_id] [int] NULL,
	[quote_sent_date] [date] NULL,
	[quote_approved_date] [date] NULL,
	[status] [nvarchar](200) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[quoted_amount] [decimal](10, 2) NULL,
	[booking_date] [date] NULL,
	[fullname] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[favoritefarm] [nvarchar](200) NULL,
	[estimatedCost] [decimal](10, 2) NULL,
	[favoriteKoi] [nvarchar](200) NULL,
	[gender] [nvarchar](50) NULL,
	[note] [nvarchar](1000) NULL,
	[hotel_accommodation] [nvarchar](100) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingPayment]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingPayment](
	[booking_payment_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [int] NULL,
	[comments] [nvarchar](1000) NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KoiFarm]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KoiFarm](
	[farm_id] [int] IDENTITY(1,1) NOT NULL,
	[trip_detail_id] [int] NULL,
	[koi_id] [int] NULL,
	[farm_name] [nvarchar](100) NULL,
	[location] [nvarchar](200) NULL,
	[contact_info] [nvarchar](200) NULL,
	[imageUrl] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[farm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KoiFish]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KoiFish](
	[koi_id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[koi_price] [decimal](10, 2) NULL,
	[size] [nvarchar](50) NULL,
	[variety_id] [int] NULL,
	[imageUrl] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[koi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KoiPackage]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KoiPackage](
	[package_id] [int] IDENTITY(1,1) NOT NULL,
	[farm_id] [int] NULL,
	[po_detail_id] [int] NULL,
	[package_name] [nvarchar](100) NULL,
	[description] [nvarchar](200) NULL,
	[package_price] [decimal](10, 2) NULL,
	[imageUrl] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[payment_method_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_payment_id] [int] NULL,
	[po_payment_id] [int] NULL,
	[method_name] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PO]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO](
	[po_id] [int] IDENTITY(1,1) NOT NULL,
	[farm_id] [int] NULL,
	[total_amount] [decimal](10, 2) NULL,
	[koi_delivery_date] [date] NULL,
	[koi_delivery_time] [time](7) NULL,
	[status] [nvarchar](100) NULL,
	[po_detail_id] [int] NULL,
	[Delivery_Location] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[po_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PODetail]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PODetail](
	[po_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[po_id] [int] NULL,
	[koi_id] [int] NULL,
	[farm_id] [int] NULL,
	[deposit] [decimal](10, 2) NULL,
	[total_koi_price] [decimal](10, 2) NULL,
	[remaining_price] [decimal](10, 2) NULL,
	[quantity] [int] NULL,
	[imageUrl] [nvarchar](100) NULL,
	[Day] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[po_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPayment]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPayment](
	[po_payment_id] [int] IDENTITY(1,1) NOT NULL,
	[po_id] [int] NULL,
	[payment_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[po_payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[booking_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialVariety]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialVariety](
	[special_variety_id] [int] IDENTITY(1,1) NOT NULL,
	[farm_id] [int] NULL,
	[variety_id] [int] NULL,
	[special_description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[special_variety_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[trip_id] [int] IDENTITY(1,1) NOT NULL,
	[trip_detail_id] [int] NULL,
	[trip_name] [nvarchar](100) NULL,
	[price_total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripDetail]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripDetail](
	[trip_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[main_topic] [nvarchar](200) NULL,
	[sub_topic] [nvarchar](1000) NULL,
	[note_price] [nvarchar](300) NULL,
	[Day] [date] NULL,
	[trip_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[trip_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variety]    Script Date: 10/6/2024 1:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variety](
	[variety_id] [int] IDENTITY(1,1) NOT NULL,
	[package_id] [int] NULL,
	[variety_name] [nvarchar](100) NULL,
	[description] [nvarchar](200) NULL,
	[imageUrl] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[variety_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (2, N'ngoctrungtsn111@gmail.com', NULL, N'Trung Đoàn', N'', NULL, NULL, N'ngoctrungtsn111@gmail.com', NULL, 1, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (3, N'trung', N'123', NULL, N'trung', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (5, N'trung123', N'12345678', N'Zun', N'Doan', NULL, N'0787171500', N'trung@gmail.com', NULL, 1, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (6, N'manager', N'123', NULL, N'Trung', NULL, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (7, N'salestaff', N'123', NULL, N'Khoa', NULL, NULL, NULL, NULL, 3, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (8, N'consulting', N'123', NULL, N'Viet', NULL, NULL, NULL, NULL, 4, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (9, N'delivering', N'123', NULL, N'Thuan', NULL, NULL, NULL, NULL, 5, 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [firstname], [lastname], [gender], [phone], [email], [imageUrl], [role_id], [status]) VALUES (10, N'trung1234', N'123456789', N'Trung', N'Doan', NULL, N'0787171600', N'trung31231@gmail.com', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([booking_id], [trip_id], [po_id], [booking_payment_id], [feedback_id], [customer_id], [quote_sent_date], [quote_approved_date], [status], [start_date], [end_date], [quoted_amount], [booking_date], [fullname], [phone], [email], [favoritefarm], [estimatedCost], [favoriteKoi], [gender], [note], [hotel_accommodation], [isActive]) VALUES (36, 13, 5, NULL, NULL, 3, CAST(N'2024-10-06' AS Date), CAST(N'2024-10-06' AS Date), N'Delivered', CAST(N'2024-10-20' AS Date), CAST(N'2024-10-24' AS Date), CAST(4000.00 AS Decimal(10, 2)), CAST(N'2024-10-06' AS Date), N'trung doan', N'0923012930', N'viet12345@gmail.com', N'koi asagi', CAST(3000.00 AS Decimal(10, 2)), N'koi asagi', N'Male', N'abcd hotel', N'abcd hotel', 1)
INSERT [dbo].[Booking] ([booking_id], [trip_id], [po_id], [booking_payment_id], [feedback_id], [customer_id], [quote_sent_date], [quote_approved_date], [status], [start_date], [end_date], [quoted_amount], [booking_date], [fullname], [phone], [email], [favoritefarm], [estimatedCost], [favoriteKoi], [gender], [note], [hotel_accommodation], [isActive]) VALUES (37, 14, 6, NULL, NULL, 3, CAST(N'2024-10-06' AS Date), CAST(N'2024-10-06' AS Date), N'Delivered', CAST(N'2024-10-08' AS Date), CAST(N'2024-10-17' AS Date), CAST(40000.00 AS Decimal(10, 2)), CAST(N'2024-10-06' AS Date), N'trung doan', N'09213019232', N'viet12345@gmail.com', N'asagi farm', CAST(3000.00 AS Decimal(10, 2)), N'koi asagi', N'Male', N'abcd hotel', N'abcd hotel', 1)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_id], [account_id]) VALUES (1, 2)
INSERT [dbo].[Customer] ([customer_id], [account_id]) VALUES (2, 3)
INSERT [dbo].[Customer] ([customer_id], [account_id]) VALUES (3, 5)
INSERT [dbo].[Customer] ([customer_id], [account_id]) VALUES (4, 10)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[PO] ON 

INSERT [dbo].[PO] ([po_id], [farm_id], [total_amount], [koi_delivery_date], [koi_delivery_time], [status], [po_detail_id], [Delivery_Location]) VALUES (1, NULL, CAST(3040.00 AS Decimal(10, 2)), CAST(N'2024-10-12' AS Date), CAST(N'06:56:00' AS Time), NULL, NULL, N'abc hotel')
INSERT [dbo].[PO] ([po_id], [farm_id], [total_amount], [koi_delivery_date], [koi_delivery_time], [status], [po_detail_id], [Delivery_Location]) VALUES (2, NULL, CAST(4000.00 AS Decimal(10, 2)), CAST(N'2024-10-20' AS Date), CAST(N'07:05:00' AS Time), NULL, NULL, N'abcd hotel')
INSERT [dbo].[PO] ([po_id], [farm_id], [total_amount], [koi_delivery_date], [koi_delivery_time], [status], [po_detail_id], [Delivery_Location]) VALUES (3, NULL, CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-10-05' AS Date), CAST(N'01:17:00' AS Time), NULL, NULL, N'abcd hotel')
INSERT [dbo].[PO] ([po_id], [farm_id], [total_amount], [koi_delivery_date], [koi_delivery_time], [status], [po_detail_id], [Delivery_Location]) VALUES (4, NULL, CAST(4000.00 AS Decimal(10, 2)), CAST(N'2024-10-11' AS Date), CAST(N'01:38:00' AS Time), NULL, NULL, N'abcd hotel')
INSERT [dbo].[PO] ([po_id], [farm_id], [total_amount], [koi_delivery_date], [koi_delivery_time], [status], [po_detail_id], [Delivery_Location]) VALUES (5, NULL, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-10-07' AS Date), CAST(N'02:22:00' AS Time), NULL, NULL, N'muong thanh tang 4')
INSERT [dbo].[PO] ([po_id], [farm_id], [total_amount], [koi_delivery_date], [koi_delivery_time], [status], [po_detail_id], [Delivery_Location]) VALUES (6, NULL, CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-10-16' AS Date), CAST(N'04:03:00' AS Time), NULL, NULL, N'muong thanh tang 4')
SET IDENTITY_INSERT [dbo].[PO] OFF
GO
SET IDENTITY_INSERT [dbo].[PODetail] ON 

INSERT [dbo].[PODetail] ([po_detail_id], [po_id], [koi_id], [farm_id], [deposit], [total_koi_price], [remaining_price], [quantity], [imageUrl], [Day]) VALUES (1, 1, NULL, NULL, CAST(1600.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PODetail] ([po_detail_id], [po_id], [koi_id], [farm_id], [deposit], [total_koi_price], [remaining_price], [quantity], [imageUrl], [Day]) VALUES (2, 2, NULL, NULL, CAST(2000.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PODetail] ([po_detail_id], [po_id], [koi_id], [farm_id], [deposit], [total_koi_price], [remaining_price], [quantity], [imageUrl], [Day]) VALUES (3, 3, NULL, NULL, CAST(1500.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PODetail] ([po_detail_id], [po_id], [koi_id], [farm_id], [deposit], [total_koi_price], [remaining_price], [quantity], [imageUrl], [Day]) VALUES (4, 4, NULL, NULL, CAST(1250.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PODetail] ([po_detail_id], [po_id], [koi_id], [farm_id], [deposit], [total_koi_price], [remaining_price], [quantity], [imageUrl], [Day]) VALUES (5, 5, NULL, NULL, CAST(1000.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PODetail] ([po_detail_id], [po_id], [koi_id], [farm_id], [deposit], [total_koi_price], [remaining_price], [quantity], [imageUrl], [Day]) VALUES (6, 6, NULL, NULL, CAST(1500.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PODetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [name], [booking_id]) VALUES (1, N'customer', NULL)
INSERT [dbo].[Role] ([role_id], [name], [booking_id]) VALUES (2, N'manager', NULL)
INSERT [dbo].[Role] ([role_id], [name], [booking_id]) VALUES (3, N'salestaff', NULL)
INSERT [dbo].[Role] ([role_id], [name], [booking_id]) VALUES (4, N'consultingstaff', NULL)
INSERT [dbo].[Role] ([role_id], [name], [booking_id]) VALUES (5, N'deliveringstaff', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Trip] ON 

INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (6, 1, N'Koi haha', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (7, 7, N'Asagi koi trip', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (8, 9, N'Asagi koi trips', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (9, 10, N'Asagi koi trip', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (10, 11, N'Asagi koi tripzz', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (11, NULL, N'asagi koi', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (12, NULL, N'asagi koi', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (13, NULL, N'asagikoi30', NULL)
INSERT [dbo].[Trip] ([trip_id], [trip_detail_id], [trip_name], [price_total]) VALUES (14, NULL, N'Asagi koi trip', NULL)
SET IDENTITY_INSERT [dbo].[Trip] OFF
GO
SET IDENTITY_INSERT [dbo].[TripDetail] ON 

INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (1, N'hihi', N'hoho', N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (2, N'qua da', N'pep si oi', N'3000.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (3, N'qua da', N'coca si oi', N'3000.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (4, N'qua da', N'coca si oi', N'4.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (5, N'qua da', N'coca si oi', N'4000.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (6, N'qua da', N'coca si oi', N'4000.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (7, N'qua da', N'coca si oi', N'2000.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (8, N'qua da', N'coca si oi', N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (9, N'qua da', N'coca si oi', N'123123.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (10, N'qua da', N'coca si oi', N'4020.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (11, N'Asagi koi trips', N'Asagi koi trips', N'2000.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (12, N'okok', N'haha', N'310.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (13, NULL, NULL, N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (14, NULL, NULL, N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (15, NULL, NULL, N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (16, NULL, NULL, N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (17, NULL, NULL, N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (18, NULL, NULL, N'0.00', NULL, NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (19, N'haha', N'haha', N'300.00', CAST(N'2024-10-04' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (20, N'hihi', N'hihi', N'400.00', CAST(N'2024-10-05' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (21, N'hoho', N'hoho', N'500.00', CAST(N'2024-10-06' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (22, N'haha', N'haha', N'300.00', CAST(N'2024-10-04' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (23, N'hihi', N'hihi', N'400.00', CAST(N'2024-10-05' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (24, N'hoho', N'hoho', N'500.00', CAST(N'2024-10-06' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (25, N'hjhj', N'hjhj', N'700.00', CAST(N'2024-10-13' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (26, N'haha', N'haha', N'300.00', CAST(N'2024-10-04' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (27, N'hihi', N'hihi', N'400.00', CAST(N'2024-10-05' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (28, N'hoho', N'hoho', N'500.00', CAST(N'2024-10-06' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (29, N'hjhj', N'hjhj', N'700.00', CAST(N'2024-10-13' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (30, N'haha', N'haha', N'300.00', CAST(N'2024-10-04' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (31, N'hihi', N'hihi', N'400.00', CAST(N'2024-10-05' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (32, N'hoho', N'hoho', N'500.00', CAST(N'2024-10-06' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (33, N'asagi koi', N'asagi koi', N'300.00', CAST(N'2024-10-05' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (34, N'bo sua koi', N'bo sua koi', N'500.00', CAST(N'2024-10-06' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (35, N'trang den koi', N'trang den koi', N'700.00', CAST(N'2024-10-08' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (36, N'asagi koi', N'<p>asagi koi</p>', N'300.00', CAST(N'2024-10-05' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (37, N'bo sua koi', N'<p>bo sua koi</p>', N'500.00', CAST(N'2024-10-06' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (38, N'trang den koi', N'<p>trang den koi</p>', N'700.00', CAST(N'2024-10-08' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (39, N'asagi koi', N'asagi koi', N'300.00', CAST(N'2024-10-05' AS Date), 12)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (40, N'bo sua koi', N'bo sua koi', N'500.00', CAST(N'2024-10-06' AS Date), 12)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (41, N'trang den koi', N'trang den koi', N'700.00', CAST(N'2024-10-08' AS Date), 12)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (42, N'haha', N'haha', N'2000.00', CAST(N'2024-10-25' AS Date), 11)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (43, N'haha', N'haha', N'500$ airport', CAST(N'2024-10-04' AS Date), 6)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (44, N'hihi', N'hihi', N'1500$ airport', CAST(N'2024-10-05' AS Date), 6)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (45, N'hoho', N'hoho', N'500$ airport', CAST(N'2024-10-06' AS Date), 6)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (46, N'asagi farm', N'asagi farm', N'1200 $ airport -> Rent car 500$', CAST(N'2024-10-22' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (47, N'thao cam vien', N'thao cam vien', N'rent boat 700$', CAST(N'2024-10-23' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (48, N'asagi farm', N'asagi farm', N'1200 $ airport -> Rent car 500$', CAST(N'2024-10-22' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (49, N'thao cam vien', N'thao cam vien', N'rent boat 700$', CAST(N'2024-10-24' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (50, N'asagi farm', N'asagi farm', N'1200 $ airport -> Rent car 500$', CAST(N'2024-10-22' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (51, N'thao cam vien', N'thao cam vien', N'rent boat 700$ tao khong thich 700 cho cai gia hop ly', CAST(N'2024-10-24' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (52, N'asagi farm', N'asagi farm', N'1200 $ airport -> Rent car 500$', CAST(N'2024-10-22' AS Date), 13)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (53, N'thao cam vien', N'thao cam vien', N'rent boat 1700$', CAST(N'2024-10-24' AS Date), 13)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (54, N'thao cam vien', N'di thu nhun', N'1200 $ airport -> Rent car 500$', CAST(N'2024-10-10' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (55, N'thao cam vien', N'di thu nhun', N'1200 $ airport -> Rent car 5000$', CAST(N'2024-10-10' AS Date), NULL)
INSERT [dbo].[TripDetail] ([trip_detail_id], [main_topic], [sub_topic], [note_price], [Day], [trip_id]) VALUES (56, N'thao cam vien', N'di thu nhun cung Tran Ha Linh', N'1200 $ airport -> Rent car 5000$', CAST(N'2024-10-10' AS Date), 14)
SET IDENTITY_INSERT [dbo].[TripDetail] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([booking_payment_id])
REFERENCES [dbo].[BookingPayment] ([booking_payment_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([feedback_id])
REFERENCES [dbo].[Feedback] ([feedback_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([po_id])
REFERENCES [dbo].[PO] ([po_id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([trip_id])
REFERENCES [dbo].[Trip] ([trip_id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[KoiFarm]  WITH CHECK ADD FOREIGN KEY([koi_id])
REFERENCES [dbo].[KoiFish] ([koi_id])
GO
ALTER TABLE [dbo].[KoiFarm]  WITH CHECK ADD FOREIGN KEY([trip_detail_id])
REFERENCES [dbo].[TripDetail] ([trip_detail_id])
GO
ALTER TABLE [dbo].[KoiFish]  WITH CHECK ADD FOREIGN KEY([variety_id])
REFERENCES [dbo].[Variety] ([variety_id])
GO
ALTER TABLE [dbo].[KoiPackage]  WITH CHECK ADD FOREIGN KEY([farm_id])
REFERENCES [dbo].[KoiFarm] ([farm_id])
GO
ALTER TABLE [dbo].[KoiPackage]  WITH CHECK ADD FOREIGN KEY([po_detail_id])
REFERENCES [dbo].[PODetail] ([po_detail_id])
GO
ALTER TABLE [dbo].[PaymentMethod]  WITH CHECK ADD FOREIGN KEY([booking_payment_id])
REFERENCES [dbo].[BookingPayment] ([booking_payment_id])
GO
ALTER TABLE [dbo].[PaymentMethod]  WITH CHECK ADD FOREIGN KEY([po_payment_id])
REFERENCES [dbo].[POPayment] ([po_payment_id])
GO
ALTER TABLE [dbo].[PO]  WITH CHECK ADD FOREIGN KEY([farm_id])
REFERENCES [dbo].[KoiFarm] ([farm_id])
GO
ALTER TABLE [dbo].[PO]  WITH CHECK ADD  CONSTRAINT [FK_PO_PODetail] FOREIGN KEY([po_detail_id])
REFERENCES [dbo].[PODetail] ([po_detail_id])
GO
ALTER TABLE [dbo].[PO] CHECK CONSTRAINT [FK_PO_PODetail]
GO
ALTER TABLE [dbo].[PODetail]  WITH CHECK ADD FOREIGN KEY([farm_id])
REFERENCES [dbo].[KoiFarm] ([farm_id])
GO
ALTER TABLE [dbo].[PODetail]  WITH CHECK ADD FOREIGN KEY([koi_id])
REFERENCES [dbo].[KoiFish] ([koi_id])
GO
ALTER TABLE [dbo].[PODetail]  WITH CHECK ADD FOREIGN KEY([po_id])
REFERENCES [dbo].[PO] ([po_id])
GO
ALTER TABLE [dbo].[POPayment]  WITH CHECK ADD FOREIGN KEY([po_id])
REFERENCES [dbo].[PO] ([po_id])
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[SpecialVariety]  WITH CHECK ADD FOREIGN KEY([farm_id])
REFERENCES [dbo].[KoiFarm] ([farm_id])
GO
ALTER TABLE [dbo].[SpecialVariety]  WITH CHECK ADD FOREIGN KEY([variety_id])
REFERENCES [dbo].[Variety] ([variety_id])
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD FOREIGN KEY([trip_detail_id])
REFERENCES [dbo].[TripDetail] ([trip_detail_id])
GO
ALTER TABLE [dbo].[TripDetail]  WITH CHECK ADD  CONSTRAINT [FK_TripDetail_Trip] FOREIGN KEY([trip_id])
REFERENCES [dbo].[Trip] ([trip_id])
GO
ALTER TABLE [dbo].[TripDetail] CHECK CONSTRAINT [FK_TripDetail_Trip]
GO
ALTER TABLE [dbo].[Variety]  WITH CHECK ADD FOREIGN KEY([package_id])
REFERENCES [dbo].[KoiPackage] ([package_id])
GO
USE [master]
GO
ALTER DATABASE [Koi88] SET  READ_WRITE 
GO
