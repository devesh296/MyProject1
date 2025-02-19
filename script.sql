USE [master]
GO
/****** Object:  Database [Zepto]    Script Date: 23-09-2023 14:11:06 ******/
CREATE DATABASE [Zepto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zepto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Zepto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zepto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Zepto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Zepto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zepto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zepto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zepto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zepto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zepto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zepto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zepto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zepto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zepto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zepto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zepto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zepto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zepto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zepto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zepto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zepto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zepto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zepto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zepto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zepto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zepto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zepto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zepto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zepto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zepto] SET  MULTI_USER 
GO
ALTER DATABASE [Zepto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zepto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zepto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zepto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zepto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zepto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Zepto] SET QUERY_STORE = OFF
GO
USE [Zepto]
GO
/****** Object:  Table [dbo].[tbl_adminlogin]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_adminlogin](
	[adminid] [varchar](100) NOT NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cart]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cart](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[uid] [varchar](100) NULL,
	[quantity] [int] NULL,
	[total] [int] NULL,
	[add_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](100) NULL,
	[cpic] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contact]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contact](
	[sr] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[mobno] [bigint] NULL,
	[email] [varchar](100) NULL,
	[message] [text] NULL,
	[enq_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[pid] [int] NULL,
	[uid] [varchar](100) NULL,
	[quantity] [int] NULL,
	[total] [int] NULL,
	[add_date] [datetime] NULL,
	[status] [varchar](100) NULL,
	[order_date] [datetime] NULL,
 CONSTRAINT [PK__tbl_orde__3213E83FC5C06657] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[sub_cid] [int] NULL,
	[tittle] [varchar](100) NULL,
	[description] [text] NULL,
	[model] [varchar](100) NULL,
	[mrp] [int] NULL,
	[salerate] [int] NULL,
	[pack] [varchar](100) NULL,
	[pic] [varchar](200) NULL,
	[add_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_subcategory]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subcategory](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[subcat_name] [varchar](100) NULL,
	[subcat_pic] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 23-09-2023 14:11:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[name] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[mobileno] [bigint] NULL,
	[password] [varchar](100) NULL,
	[address] [text] NULL,
	[landmark] [varchar](100) NULL,
	[pincode] [int] NULL,
	[add_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tbl_adminlogin] ([adminid], [password]) VALUES (N'ram', N'9648')
GO
SET IDENTITY_INSERT [dbo].[tbl_cart] ON 

INSERT [dbo].[tbl_cart] ([cid], [pid], [uid], [quantity], [total], [add_date]) VALUES (12, 5, N'tonystark9044@gmail.com', 1, 20, CAST(N'2023-09-22T23:56:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([cid], [pid], [uid], [quantity], [total], [add_date]) VALUES (13, 15, N'tonystark9044@gmail.com', 2, 80, CAST(N'2023-09-23T00:02:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([cid], [pid], [uid], [quantity], [total], [add_date]) VALUES (14, 15, N'tonystark9044@gmail.com', 1, 40, CAST(N'2023-09-23T00:02:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([cid], [pid], [uid], [quantity], [total], [add_date]) VALUES (17, 18, N'prajapatirachit75@gmail.com', 1, 50, CAST(N'2023-09-23T04:20:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([cid], [pid], [uid], [quantity], [total], [add_date]) VALUES (18, 36, N'prajapatirachit75@gmail.com', 1, 85, CAST(N'2023-09-23T04:20:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([cid], [pid], [uid], [quantity], [total], [add_date]) VALUES (19, 25, N'prajapatirachit75@gmail.com', 1, 90, CAST(N'2023-09-23T04:20:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_cart] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (9, N'Dairy Products', N'2.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (10, N'Bakery Products', N'bread.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (11, N'Snacks', N'1.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (12, N'Drinks', N'redbull.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (13, N'Grocery Products', N'ricebag.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (14, N'Tea & Coffee', N'cf16.jpg')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (15, N'Fruits', N'fruitsCat.jpg')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (16, N'Vegetables', N'vegetableCat.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (17, N'BreakFast and Instant Products', N'fastfood1.jpg')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (18, N'Masala & Oils', N'saffola oil.png')
INSERT [dbo].[tbl_category] ([cid], [cname], [cpic]) VALUES (19, N'Cleaning Essentials', N'cleaningessential1.jpg')
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_contact] ON 

INSERT [dbo].[tbl_contact] ([sr], [name], [mobno], [email], [message], [enq_date]) VALUES (1, N'Rachit prajapati', 9305072482, N'prajapatirachit75@gmail.com', N'hello', CAST(N'2023-12-09T13:50:20.000' AS DateTime))
INSERT [dbo].[tbl_contact] ([sr], [name], [mobno], [email], [message], [enq_date]) VALUES (5, N'Stark', 8305913057, N'tonystark9044@gmail.com', N'Enquiry Demo
', CAST(N'2023-09-23T04:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_contact] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_order] ON 

INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (1, 4, 69, N'prajapatirachit75@gmail.com', 1, 65, CAST(N'2023-09-20T17:46:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T02:20:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (2, 5, 15, N'prajapatirachit75@gmail.com', 1, 40, CAST(N'2023-09-20T17:47:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T02:20:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (3, 6, 5, N'prajapatirachit75@gmail.com', 3, 60, CAST(N'2023-09-21T21:23:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T02:20:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (4, 8, 64, N'prajapatirachit75@gmail.com', 1, 799, CAST(N'2023-09-21T21:42:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T02:20:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (5, 9, 62, N'prajapatirachit75@gmail.com', 1, 89, CAST(N'2023-09-21T21:44:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T02:20:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (6, 11, 50, N'prajapatirachit75@gmail.com', 1, 125, CAST(N'2023-09-21T21:53:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T02:20:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (7, 15, 50, N'prajapatirachit75@gmail.com', 1, 125, CAST(N'2023-09-23T02:20:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T03:53:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [cid], [pid], [uid], [quantity], [total], [add_date], [status], [order_date]) VALUES (8, 16, 29, N'prajapatirachit75@gmail.com', 3, 75, CAST(N'2023-09-23T03:52:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T03:53:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_order] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (5, 10, 5, N'Good Day', N'Butter Delite', N'00', 30, 20, N'1', N'biscuit1.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (6, 10, 5, N'Moms Magic', N'Badam Mix', N'00', 50, 30, N'1', N'biscuit2.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (7, 10, 6, N'Regular Bread', N'Regular Bread for Diet Purpose', N'00', 25, 20, N'1', N'brd1.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (8, 10, 6, N'Haldirams', N'Cheese Bread', N'00', 42, 30, N'1', N'brd10.jpeg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (9, 10, 7, N'Cookies', N'Home made chocolate chips', N'00', 82, 70, N'1', N'cookies2.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (10, 10, 7, N'Pamerind Cookies', N'Brown Chocolate Cookies', N'00', 115, 95, N'1', N'cookies3.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (11, 10, 8, N'Cup Cake', N'Vanilla Cup Cake with Red Velvet garnishing and Cherry Toppings ', N'00', 300, 240, N'6', N'cupcake1.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (12, 10, 8, N'Cup Cake', N'Extra Choco with Chocolate garnishing', N'00', 100, 80, N'2', N'cupcake4.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (13, 10, 9, N'Butter Scotch Cake', N'Butter Scotch cake with extra creamy flavour', N'00', 670, 550, N'1', N'ck2.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (14, 10, 9, N'Vanilla Cake', N'Vanilla With Chocolate ', N'00', 450, 400, N'1', N'ck5.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (15, 12, 18, N'Sprite', N'Lime Flavoured Carbonated Water', N'00', 60, 40, N'700ml', N'cd12.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (16, 12, 18, N'CocaCola', N'Delicious & Refreshing', N'00', 70, 50, N'1L', N'cd11.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (17, 12, 18, N'Mirinda', N'Carbonated Orange Flavoured water ', N'00', 40, 30, N'500ml', N'cd13.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (18, 12, 18, N'Pepsi', N'Delicious & Refreshing', N'00', 70, 50, N'1L', N'cd16.png', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (19, 12, 19, N'Sting', N'A Refreshing Energy Drink', N'00', 40, 30, N'250ML', N'energydrink1.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (20, 12, 19, N'St. Cardinas', N'Energy Drink to Refresh you.', N'00', 100, 80, N'300ML', N'cd3.jpeg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (21, 17, 10, N'Cup Noodles', N'A Cup of full noodles that make your day', N'00', 75, 60, N'250G', N'canfood1.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (22, 17, 10, N'La Choy', N'Chowmein Noodles with extra delicious masala mix', N'00', 85, 70, N'250G', N'canfood3.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (23, 17, 10, N'Boyardee', N'Pasta with White Sauce', N'00', 190, 155, N'500G', N'canfood4.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (24, 17, 11, N'Maggi', N'2 Min Noodles', N'00', 50, 40, N'250G', N'packetfood1.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (25, 17, 11, N'Maggi', N'Special Masala Noodle', N'00', 105, 90, N'400G', N'packetfood2.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (26, 9, 12, N'Amul Doodh', N'Amul Regular Doodh ', N'00', 40, 32, N'500ml', N'milk1.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (27, 9, 12, N'Namaste India', N'Gadha Maza ', N'00', 35, 28, N'500ml', N'milk4.jpg', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (28, 9, 12, N'Namaste India', N'Active Milk', N'00', 40, 32, N'500ml', N'milk5.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (29, 9, 13, N'Amul ', N'Lassi ', N'00', 32, 25, N'250ML', N'lassi1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (30, 9, 13, N'Britannia', N'Wincing Cow Thick Lassi Mango Flavour', N'00', 40, 35, N'250ML', N'lassi2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (31, 9, 13, N'Britannia', N'Wincing Cow Thick Lassi Classic Flavour', N'00', 25, 20, N'250ML', N'lassi3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (32, 9, 14, N'Amul Cheese', N'Regular Cheese', N'00', 74, 60, N'500G', N'cheese1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (33, 9, 14, N'Go Cheese', N'Blend Cheese', N'00', 65, 50, N'250G', N'cheese2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (34, 9, 14, N'Gowardhan', N'Processed Cheese', N'00', 120, 95, N'500G', N'cheese3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (35, 9, 14, N'Golden Farms', N'Cheddar Cheese', N'00', 50, 45, N'250G', N'cheese4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (36, 9, 15, N'Amul Butter', N'Regular Butter', N'00', 115, 85, N'250G', N'butter1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (37, 9, 15, N'Namaste India', N'Pasta Table Butter', N'00', 95, 70, N'250G', N'butter2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (38, 9, 15, N'Amul Butter', N'Amul Butter Unsalted Edition', N'00', 180, 155, N'500G', N'butter3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (39, 9, 15, N'Namaste India', N'Pasteurized Butter', N'00', 190, 160, N'500G', N'butter4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (41, 9, 15, N'Chat Masala', N'Namkeen Butter', N'00', 125, 95, N'250G', N'butter5.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (42, 9, 16, N'Amul ', N'Masti Dahi', N'00', 52, 45, N'400G', N'dahi1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (43, 9, 16, N'Verka', N'Dahi', N'00', 57, 45, N'500G', N'dahi2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (44, 9, 16, N'Dinisha ', N'Dahi', N'00', 32, 25, N'250ML', N'dahi3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (45, 9, 16, N'Gowardhan', N'Rich n Rich Dahi', N'00', 70, 55, N'500G', N'dahi4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (46, 9, 16, N'Milky Fresh', N'Dahi', N'00', 105, 85, N'1L', N'dahi5.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (47, 9, 17, N'Amul ', N'Pista Badam mix Ice Cream', N'00', 25, 20, N'75ml', N'ic11.png', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (48, 9, 17, N'Creamery', N'Cold Stone Chocolate', N'00', 45, 35, N'150ml', N'ic10.png', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (49, 9, 17, N'Hudsonville', N'Triple Peanut Butter Cup', N'00', 85, 65, N'400G', N'ic14.png', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (50, 12, 20, N'B Natural', N'Orange Juice 2 Pack', N'00', 190, 125, N'1L', N'juice.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (51, 12, 20, N'Paper Boat', N'Yummy Guava', N'00', 115, 95, N'1L', N'juice2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (52, 12, 20, N'KOD', N'Mango Flavour', N'00', 60, 45, N'500ml', N'juice3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (53, 12, 20, N'Tropicana', N'Mix Fruit Juice', N'00', 119, 99, N'1L', N'juice4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (54, 12, 20, N'MO Fruit', N'Star Fruit Necta', N'00', 34, 30, N'250ML', N'juice5.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (55, 19, 42, N'Ambi Pur', N'Air', N'00', 179, 149, N'200ml', N'freshner1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (56, 19, 42, N'Odonil ', N'Ocean ', N'00', 199, 179, N'200ml', N'freshner2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (57, 19, 42, N'Ambi Pur', N'Rose & Bloom', N'00', 239, 189, N'275ml', N'freshner3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (58, 19, 42, N'Godrej Aer', N'Combo of Alive and Passion', N'00', 489, 409, N'250ML', N'freshner4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (59, 19, 43, N'Surf Excel', N'Matic Green', N'00', 229, 169, N'500ml', N'liquidDetergent1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (60, 19, 43, N'Tide', N'Liquid Detergent', N'00', 459, 399, N'1L', N'liquidDetergent2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (61, 19, 43, N'Ariel', N'Liquid Detergent', N'00', 259, 189, N'500ml', N'liquidDetergent3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (62, 19, 43, N'Surf Excel', N'Matic Purple Liquid Detergent ', N'00', 129, 89, N'250ML', N'liquidDetergent4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (63, 19, 43, N'Surf Excel', N'Matic Light Green Liquid Detergent', N'00', 559, 489, N'1L', N'liquidDetergent5.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (64, 19, 44, N'Tide', N'Double Power Jasmine & Rose ', N'00', 1099, 799, N'6kg + 2kg', N'detergent1.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (65, 19, 44, N'Rin', N'Refresh Double Power', N'00', 99, 79, N'1Kg', N'detergent2.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (66, 19, 44, N'Surf Excel', N'Matic Green Detergent Powder', N'00', 105, 85, N'1Kg', N'detergent3.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (67, 19, 44, N'Activ Wheel', N'2 in 1', N'00', 95, 75, N'1Kg', N'detergent4.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (68, 19, 44, N'Surf Excel', N'Easy Wash', N'00', 25, 20, N'250G', N'detergent5.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (69, 19, 44, N'Henko', N'Stain Care', N'00', 80, 65, N'1kg', N'detergent6.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (70, 19, 44, N'Ariel', N'Complete +', N'00', 115, 95, N'1Kg', N'detergent7.jpg', CAST(N'2023-09-18' AS Date))
INSERT [dbo].[tbl_product] ([pid], [cid], [sub_cid], [tittle], [description], [model], [mrp], [salerate], [pack], [pic], [add_date]) VALUES (71, 19, 44, N'Vanish', N'Oxi action All in One', N'00', 189, 149, N'1Kg', N'detergent8.jpg', CAST(N'2023-09-18' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subcategory] ON 

INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (5, 10, N'Biscuits', N'Biscuit 1.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (6, 10, N'Breads', N'bread.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (7, 10, N'Cookies', N'Cookie 2.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (8, 10, N'Cup Cakes', N'cup cake 1.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (9, 10, N'Cakes', N'8.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (10, 17, N'Can Foods', N'fastfood1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (11, 17, N'Packet Foods', N'fastfood2.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (12, 9, N'Milk', N'mk2.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (13, 9, N'Lassi', N'ff5.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (14, 9, N'Cheese', N'ff2.jpeg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (15, 9, N'Butter', N'ff3.jpeg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (16, 9, N'Dahi', N'ff4.jpeg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (17, 9, N'Ice Creams', N'ic14.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (18, 12, N'Cold Drinks', N'cd7.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (19, 12, N'Energy Drink', N'cd3.jpeg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (20, 12, N'Juices', N'p1.jpeg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (21, 15, N'Fresh Fruits', N's2.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (22, 15, N'Berries', N'berry1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (23, 15, N'Melons', N'melons1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (24, 15, N'Citrus ', N'citrus1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (25, 15, N'Drupes', N'drupes1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (26, 15, N'Tropicals', N'tropical1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (27, 13, N'Flour/Atta', N'fortune atta.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (28, 13, N'sugar', N'sugar1.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (29, 13, N'Rice', N'ricebag.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (31, 13, N'Salt', N'salt1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (32, 18, N'Vegetable Oils', N'saffola oil.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (33, 18, N'Ghee', N'Ghee1.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (34, 11, N'Chips', N'lays1.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (35, 11, N'Kurkure', N'snacks1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (36, 14, N'Coffee', N'cf10.png')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (37, 14, N'Tea', N'cf18.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (38, 16, N'Regular Vegetables', N'veg6.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (40, 16, N'Leafy Vegetables', N'leafveg1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (41, 16, N'Sticky Vegetables', N'stickveg1.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (42, 19, N'Freshners', N'freshner.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (43, 19, N'Liquid Detergent', N'liquidDetergent.jpg')
INSERT [dbo].[tbl_subcategory] ([sid], [cid], [subcat_name], [subcat_pic]) VALUES (44, 19, N'Detergent Powder', N'detergent.jpg')
SET IDENTITY_INSERT [dbo].[tbl_subcategory] OFF
GO
INSERT [dbo].[tbl_user] ([name], [email], [mobileno], [password], [address], [landmark], [pincode], [add_date]) VALUES (N'Rachit ', N'prajapatirachit75@gmail.com', 9305072482, N'9648', N'house no. 323, Jalaun Chungi, Orai Jalaun(U.P.)', N'Near SP Residence', 285001, CAST(N'2023-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_user] ([name], [email], [mobileno], [password], [address], [landmark], [pincode], [add_date]) VALUES (N'Stark', N'tonystark9044@gmail.com', 8305913057, N'9044', N'Salabad', N'Salabad Post Office', 285123, CAST(N'2023-09-22T23:56:05.000' AS DateTime))
GO
ALTER TABLE [dbo].[tbl_cart]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[tbl_product] ([pid])
GO
ALTER TABLE [dbo].[tbl_cart]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[tbl_user] ([email])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([sub_cid])
REFERENCES [dbo].[tbl_subcategory] ([sid])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[tbl_category] ([cid])
GO
ALTER TABLE [dbo].[tbl_subcategory]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[tbl_category] ([cid])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Zepto] SET  READ_WRITE 
GO
