USE [master]
GO
/****** Object:  Database [WeirdosShop]    Script Date: 6/1/2024 12:59:38 AM ******/
CREATE DATABASE [WeirdosShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeirdosShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HAONAM\MSSQL\DATA\WeirdosShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WeirdosShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HAONAM\MSSQL\DATA\WeirdosShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WeirdosShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeirdosShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeirdosShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeirdosShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeirdosShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeirdosShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeirdosShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeirdosShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeirdosShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeirdosShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeirdosShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeirdosShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeirdosShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeirdosShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeirdosShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeirdosShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeirdosShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeirdosShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeirdosShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeirdosShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeirdosShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeirdosShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeirdosShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeirdosShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeirdosShop] SET RECOVERY FULL 
GO
ALTER DATABASE [WeirdosShop] SET  MULTI_USER 
GO
ALTER DATABASE [WeirdosShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeirdosShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeirdosShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeirdosShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WeirdosShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WeirdosShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WeirdosShop', N'ON'
GO
ALTER DATABASE [WeirdosShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [WeirdosShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WeirdosShop]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[img] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[namecus] [nvarchar](100) NULL,
	[addresscus] [nvarchar](max) NULL,
	[emailcus] [varchar](max) NULL,
	[phonenum] [nchar](15) NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_detail]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_detail](
	[cartid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[quantity] [int] NULL,
	[sale] [int] NULL,
	[unitprice] [float] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Cart_detail] PRIMARY KEY CLUSTERED 
(
	[cartid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
	[type] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[detail] [ntext] NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[price] [float] NULL,
	[description] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[size] [nvarchar](10) NULL,
	[color] [nvarchar](30) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
	[categoryid] [int] NULL,
	[img] [nvarchar](50) NULL,
	[img1] [nvarchar](50) NULL,
	[img2] [nvarchar](50) NULL,
	[img3] [nvarchar](50) NULL,
	[sale] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/1/2024 12:59:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[phonenum] [varchar](20) NULL,
	[name] [nvarchar](max) NULL,
	[email] [varchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[role] [nchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 
GO
INSERT [dbo].[Banner] ([id], [name], [img], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'banner1', N'slideshow_2.png', NULL, N'all', 1, 1, CAST(N'2024-05-11T21:04:00' AS SmallDateTime))
GO
INSERT [dbo].[Banner] ([id], [name], [img], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'banner2', N'slideshow_3.png', NULL, N'all', 0, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([id], [namecus], [addresscus], [emailcus], [phonenum], [datebegin]) VALUES (2, N'Nguyễn An', N'521, đường E, phường F, quận G, TPHCM', N'haha@gmail.com', N'9876543210     ', CAST(N'2024-05-31T01:16:00' AS SmallDateTime))
GO
INSERT [dbo].[Cart] ([id], [namecus], [addresscus], [emailcus], [phonenum], [datebegin]) VALUES (3, N'Nguyễn Hào Nam', N'12, đường A, phường B, quận C, TPHCM', N'123@gmail.com', N'0123456789     ', CAST(N'2024-05-29T01:13:00' AS SmallDateTime))
GO
INSERT [dbo].[Cart] ([id], [namecus], [addresscus], [emailcus], [phonenum], [datebegin]) VALUES (4, N'Nguyễn An', N'455, đường E, phường F, quận G, TPHCM', N'0123@gmail.com', N'4567890123     ', CAST(N'2024-05-31T14:15:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (2, 5, 2, 20, 160000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (2, 11, 1, 30, 70000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (2, 26, 1, 30, 70000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (3, 1, 1, 0, 100000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (3, 5, 2, 20, 160000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (3, 26, 2, 30, 140000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (4, 2, 1, 0, 100000, 0)
GO
INSERT [dbo].[Cart_detail] ([cartid], [productid], [quantity], [sale], [unitprice], [status]) VALUES (4, 9, 2, 0, 200000, 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Tops', NULL, N'top', 1, 1, CAST(N'2024-05-22T00:04:00' AS SmallDateTime))
GO
INSERT [dbo].[Category] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Bottoms', NULL, N'bottom', 1, 2, NULL)
GO
INSERT [dbo].[Category] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Outerwear', NULL, N'outerwear', 1, 3, NULL)
GO
INSERT [dbo].[Category] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Bags', NULL, N'bag', 1, 4, NULL)
GO
INSERT [dbo].[Category] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Accessories', NULL, N'accessory', 1, 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Footer] ON 
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (1, N'Weirdos', NULL, N'home', 1, 1, NULL, N'logo', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (2, N'Store 1', NULL, NULL, 1, 2, NULL, N'local', N'266, Tôn Đản, P.8, Q4, TPHCM', NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (3, N'Store 2', NULL, NULL, 1, 3, NULL, N'local', N'350, Điện Biên Phủ, P.7, Bình Thạnh, TPHCM', NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (4, N'FB', N'https://facebook.com', NULL, 1, 4, NULL, N'media', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (5, N'IG', N'https://instagram.com', NULL, 1, 5, NULL, N'media', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (6, N'Chính sách sử dụng website', NULL, N'chinh-sach-su-dung-web', 1, 6, NULL, N'policy', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (7, N'Chính sách đổi trả', NULL, N'chinh-sach-doi-tra', 1, 7, NULL, N'policy', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (8, N'Chính sách vận chuyển', NULL, N'chinh-sach-van-chuyen', 1, 8, NULL, N'policy', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (9, N'Chính sách bảo mật', NULL, N'chinh-sach-bao-mat', 1, 9, NULL, N'policy', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (10, N'Phương thức thanh toán', NULL, N'phuong-thuc-thanh-toan', 1, 10, NULL, N'tutor', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (11, N'Hướng dẫn mua hàng', NULL, N'huong-dan-mua-hang', 1, 11, NULL, N'tutor', NULL, NULL)
GO
INSERT [dbo].[Footer] ([id], [name], [link], [meta], [hide], [order], [datebegin], [type], [description], [img]) VALUES (12, N'Điều khoản dịch vụ', NULL, N'dieu-khoan-dich-vu', 1, 12, NULL, N'tutor', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Footer] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Home', NULL, N'home', 1, 1, CAST(N'2024-05-11T19:54:00' AS SmallDateTime))
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Tops', NULL, N'products/top', 1, 3, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Bottoms', NULL, N'products/bottom', 1, 4, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Outerwear', NULL, N'products/outerwear', 1, 5, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Bags', NULL, N'products/bag', 1, 6, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (6, N'Accessories', NULL, N'products/accessory', 1, 7, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (7, N'Sale', NULL, N'products/sale', 1, 8, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (8, N'Recruitment', NULL, N'news', 1, 9, NULL)
GO
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (9, N'All', NULL, N'products/all', 1, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([id], [name], [img], [description], [detail], [meta], [hide], [order], [datebegin]) VALUES (1, N'new collection 2022', N'slideshow_3.png', N'Hãy cùng đón chờ bộ sưu tập mới của nhà Weirdos', NULL, N'new-collection-2022', 1, 1, CAST(N'2024-05-20T22:47:00' AS SmallDateTime))
GO
INSERT [dbo].[News] ([id], [name], [img], [description], [detail], [meta], [hide], [order], [datebegin]) VALUES (2, N'new session', N'slideshow_2.png', N'Cùng Weirdos đón chờ một mùa sản phẩm mới', NULL, N'new-session', 1, 2, CAST(N'2022-03-10T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[News] ([id], [name], [img], [description], [detail], [meta], [hide], [order], [datebegin]) VALUES (3, N'new year new job', N'thongbaotd.png', N'Nhanh chóng apply vào các vị trí của nhà Weirdos thôi nào bạn ơi!', N'Vào ngày 15/9/2023 chúng mình có mở một đợt chiêu mộ thành viên trở thành người nhà của Weirdo. Các bạn nhanh tay đến của cửa hàng để được phỏng vấn trực tiếp hoặc các bạn có thể apply qua email của chúng mình nha!', N'new-year-new-job', 1, 3, CAST(N'2024-05-23T02:30:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (1, N'hades cerise bow tee', 100000, NULL, N'hades_cerise_bow_tee', N'xl', N'pink', 1, 1, NULL, 1, N'hades_cerise_bow_tee.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (2, N'hades cerise cravat tee', 100000, NULL, N'hades_cerise_cravat_tee', N'xl', N'white', 1, 2, NULL, 1, N'hades_cerise_cravat_tee.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (3, N'hades scralet stitch tee', 100000, NULL, N'hades_scralet_stitch_tee', N'xl', N'black', 1, 3, NULL, 1, N'hades_scralet_stitch_tee.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (4, N'lamp legend tee', 100000, NULL, N'lamp_legend_tee', N'xl', N'washed black', 1, 4, NULL, 1, N'lamp_legend_tee.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (5, N'lodestar famed long sleeve', 100000, NULL, N'lodestar_famed_long_sleeve', N'xl', N'black', 1, 5, NULL, 1, N'lodestar_famed_long_sleeve.png', NULL, NULL, NULL, 20)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (6, N'tornado route pants', 100000, NULL, N'tornado_route_pants', N'xl', N'wash', 1, 1, NULL, 2, N'tornado_route_pants.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (7, N'hades racer vain jacket', 100000, NULL, N'hades_racer_vain_jacket', N'xl', N'black', 1, 1, NULL, 3, N'hades_racer_vain_jacket.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (8, N'scuffers love polo', 100000, NULL, N'scuffers_love_polo', N'xl', N'white', 1, 6, NULL, 1, N'scuffers_love_polo.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (9, N'segment raglan polo', 100000, NULL, N'segment_raglan_polo', N'xl', N'black', 1, 7, NULL, 1, N'segment_raglan_polo.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (10, N'sleepless saigon tee', 100000, NULL, N'sleepless_saigon_tee', N'xl', N'white', 1, 8, NULL, 1, N'sleepless_saigon_tee.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (11, N'sonorous tank top', 100000, NULL, N'sonorous_tank_top', N'xl', N'brown', 1, 9, NULL, 1, N'sonorous_tank_top.png', NULL, NULL, NULL, 30)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (12, N'hades khaki cargo shorts', 100000, NULL, N'hades_khaki_cargo_shorts', N'xl', N'black', 1, 2, NULL, 2, N'hades_khaki_cargo_shorts.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (13, N'mellow might skirt', 100000, NULL, N'mellow_might_skirt', N'xl', N'washed jean', 1, 3, NULL, 2, N'mellow_might_skirt.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (14, N'robust shorts', 100000, NULL, N'robust_shorts', N'xl', N'black', 1, 4, NULL, 2, N'robust_shorts.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (15, N'sliver hypezone wide leg pants', 100000, NULL, N'sliver_hypezone_wide_leg_pants', N'xl', N'gray', 1, 5, NULL, 2, N'sliver_hypezone_wide_leg_pants.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (16, N'wavelength parachute pants', 100000, NULL, N'wavelength_parachute_pants', N'xl', N'black', 1, 6, NULL, 2, N'wavelength_parachute_pants.png', NULL, NULL, NULL, 20)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (17, N'aquiline leather jacket', 100000, NULL, N'aquiline_leather_jacket', N'xl', N'black', 1, 2, NULL, 3, N'aquiline_leather_jacket.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (18, N'arbormass hoodie', 100000, NULL, N'arbormass_hoodie', N'xl', N'brown', 1, 3, NULL, 3, N'arbormass_hoodie.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (19, N'exddus symblue hoodie zip', 100000, NULL, N'exddus_symblue_hoodie_zip', N'xl', N'white', 1, 4, NULL, 3, N'exddus_symblue_hoodie_zip.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (20, N'hades faded polyester jacket', 100000, NULL, N'hades_faded_polyester_jacket', N'xl', N'black', 1, 5, NULL, 3, N'hades_faded_polyester_jacket.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (21, N'lithe boxy hoodie', 100000, NULL, N'lithe_boxy_hoodie', N'xl', N'black', 1, 6, NULL, 3, N'lithe_boxy_hoodie.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (22, N'looming zip jacket', 100000, NULL, N'looming_zip_jacket', N'xl', N'brown', 1, 7, NULL, 3, N'looming_zip_jacket.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (23, N'major pieces jacket', 100000, NULL, N'major_pieces_jacket', N'xl', N'black', 1, 8, NULL, 3, N'major_pieces_jacket.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (24, N'resilent petals sweater', 100000, NULL, N'resilent_petals_sweater', N'xl', N'brown', 1, 9, NULL, 3, N'resilent_petals_sweater.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (25, N'seraphic pearls zip hoodie', 100000, NULL, N'seraphic_pearls_zip_hoodie', N'xl', N'gray', 1, 10, NULL, 3, N'seraphic_pearls_zip_hoodie.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (26, N'skewed hook hoodie', 100000, NULL, N'skewed_hook_hoodie', N'xl', N'black', 1, 11, NULL, 3, N'skewed_hook_hoodie.png', NULL, NULL, NULL, 30)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (27, N'almighty wined backpack', 100000, NULL, N'almighty_wined_backpack', NULL, N'black', 1, 1, NULL, 4, N'almighty_wined_backpack.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (28, N'black block backpack', 100000, NULL, N'black_block_backpack', NULL, N'black', 1, 2, NULL, 4, N'black_block_backpack.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (29, N'lagom backpack', 100000, NULL, N'lagom_backpack', NULL, N'black', 1, 3, NULL, 4, N'lagom_backpack.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (30, N'motivation grunge backpack', 100000, NULL, N'motivation_grunge_backpack', NULL, N'brown', 1, 4, NULL, 4, N'motivation_grunge_backpack.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (31, N'neoprene utility backpack black', 100000, NULL, N'neoprene_utility_backpack_black', NULL, N'black', 1, 5, NULL, 4, N'neoprene_utility_backpack_black.png', NULL, NULL, NULL, 10)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (32, N'hades tailwind cap', 100000, NULL, N'hades_tailwind_cap', NULL, N'gray', 1, 1, NULL, 5, N'hades_tailwind_cap.png', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([id], [name], [price], [description], [meta], [size], [color], [hide], [order], [datebegin], [categoryid], [img], [img1], [img2], [img3], [sale]) VALUES (33, N'logo socks', 100000, NULL, N'logo_socks', NULL, N'white', 1, 2, NULL, 5, N'logo_socks.png', NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([id], [username], [password], [phonenum], [name], [email], [address], [role]) VALUES (1, N'admin01', N'e10adc3949ba59abbe56e057f20f883e', N'9876543210', N'Nguyễn Hào Nam', NULL, NULL, N'Admin               ')
GO
INSERT [dbo].[User] ([id], [username], [password], [phonenum], [name], [email], [address], [role]) VALUES (2, N'client01', N'827ccb0eea8a706c4c34a16891f84e7b', N'0123456789', N'Nguyễn Hào Nam', NULL, N'12, đường A, phường B, quận C, TPHCM', N'Client              ')
GO
INSERT [dbo].[User] ([id], [username], [password], [phonenum], [name], [email], [address], [role]) VALUES (3, N'client02', N'd6a9a933c8aafc51e55ac0662b6e4d4a', N'4567890123', N'Nguyễn An', N'0123@gmail.com', N'455, đường E, phường F, quận G, TPHCM', N'Client              ')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_sale]  DEFAULT ((0)) FOR [sale]
GO
ALTER TABLE [dbo].[Cart_detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_detail_Cart1] FOREIGN KEY([cartid])
REFERENCES [dbo].[Cart] ([id])
GO
ALTER TABLE [dbo].[Cart_detail] CHECK CONSTRAINT [FK_Cart_detail_Cart1]
GO
ALTER TABLE [dbo].[Cart_detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_detail_Product1] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart_detail] CHECK CONSTRAINT [FK_Cart_detail_Product1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [WeirdosShop] SET  READ_WRITE 
GO
