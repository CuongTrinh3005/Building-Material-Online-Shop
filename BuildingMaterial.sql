USE [BuildingMaterials]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14-Jan-21 2:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [nvarchar](8) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Category__19093A2BD2BEA114] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 14-Jan-21 2:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomOrders]    Script Date: 14-Jan-21 2:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomOrders](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[CustomerID] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK__CustomOr__C3905BAFB2C1CDE6] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14-Jan-21 2:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [bigint] NOT NULL,
	[ProductID] [nchar](8) NOT NULL,
	[QuantityOrder] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK__OrderDet__08D097C1AADABA82] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14-Jan-21 2:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nchar](8) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NULL,
	[Discount] [float] NULL,
	[CategoryID] [nvarchar](8) NULL,
	[DonViTinh] [nvarchar](8) NULL,
	[Photo] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Specification] [nvarchar](max) NULL,
	[ViewCount] [int] NULL,
	[Special] [bit] NULL,
	[DateIn] [date] NULL,
	[Available] [bit] NULL,
 CONSTRAINT [PK__Product__B40CC6ED3F68C104] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'DTN     ', N'Đá tự nhiên')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'GBXM    ', N'Gạch Block xi măng')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'GM      ', N'Gạch men')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'GTT     ', N'Gạch trang trí')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'TBD     ', N'Thiết bị điện')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'TBNN    ', N'Thiết bị ngành nước')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'TBXD    ', N'Thiết bị xây dựng')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (N'VLT     ', N'Vật liệu thô')
GO
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'ars', N'234', N'Arsenal', 0, N'London, England', N'23456789', N'arsenal@gmail.com', N'arsenal.png', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'Dj1', N'456', N'Alex', 1, N'Quận Cầu  Giấy, Hà Nội', N'23456789', N'dj1@gmail.com', N'natural1.jpg', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'jerry2', N'678', N'Nguyen Van Teo1', 0, N'Quận Tân Bình, TP HCM', N'23456789', N'nvb@gmail.com', N'user.jpg', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'MeStu ', N'234', N'Trinh Quoc Cuong', 1, N'Biên Hòa, Đồng Nai', N'23456789', N'n17dccn017@student.ptithcm.edu.vn', N'natural3.jpg', 1)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'test', N'123', N'Test', 1, N'Biên Hòa City', N'12345678', N'cuongtrinhq@gmail.com', N'Street.jpg', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'test123', N'456', N'Trinh Quoc Cuong', 0, N'Biên Hòa, Đồng Nai', N'23456789', N'nvl@gmail.com', N'user.jpg', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'tom', N'123', N'Nguyen Van B', 1, N'Quận Tân Bình, TP HCM', N'23456789', N'trinhquoccuong3005@gmail.com', N'arsenal.png', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'tom123', N'123', N'Nguyen Van Teo', 1, N'Quận Cầu  Giấy, Hà Nội', N'23456789', N'nvl@gmail.com', N'natural2.jpg', 0)
INSERT [dbo].[Customers] ([CustomerID], [Password], [Name], [Gender], [Address], [PhoneNumber], [Email], [Photo], [Admin]) VALUES (N'tom234', N'123', N'Jame Bonds', 0, N'Quận Cầu  Giấy, Hà Nội', N'23456789', N'nvb@gmail.com', N'ny.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[CustomOrders] ON 

INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (10, CAST(N'2020-11-11' AS Date), N'ars', N'London, England', N'Không hoàn trả')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (11, CAST(N'2020-11-11' AS Date), N'jerry2', N'Biên Hòa, Đồng Nai', N'Giao gần nhà thờ ')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (12, CAST(N'2020-11-11' AS Date), N'jerry2', N'Quận Tân Bình, TP HCM', N'Nếu đồ vật hư phải bồi thường')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (13, CAST(N'2020-11-11' AS Date), N'tom', N'Quận Tân Bình, TP HCM', N'Test gửi email')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (14, CAST(N'2020-11-11' AS Date), N'tom', N'Quận Tân Bình, TP HCM', N'Test gửi email')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (15, CAST(N'2020-11-09' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'Test gửi email')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (17, CAST(N'2020-11-12' AS Date), N'Dj1', N'Biên Hòa, Đồng Nai', N'Test gửi email')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (18, CAST(N'2020-11-12' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'Test gửi email')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (19, CAST(N'2020-11-12' AS Date), N'test', N'Biên Hòa, Đồng Nai', N'Test gửi email')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (20, CAST(N'2020-11-12' AS Date), N'test', N'Quận Cầu  Giấy, Hà Nội', N'Test gửi email không firewall')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (21, CAST(N'2020-11-12' AS Date), N'test', N'Quận Tân Bình, TP HCM', N'Test gửi email có firewall có avast ')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (22, CAST(N'2020-11-18' AS Date), N'test', N'Biên Hòa, Đồng Nai', N'Test gửi email cuối')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (23, CAST(N'2020-12-28' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'Giao gần nhà thờ ')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (24, CAST(N'2020-12-28' AS Date), N'tom', N'Soạn word phần gửi mail xác nhận đơn đặt hàng', N'Mail')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (25, CAST(N'2020-12-28' AS Date), N'tom', N'Soạn word phần gửi mail xác nhận đơn đặt hàng', N'Test gửi mail cho file word ')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (26, CAST(N'2020-12-28' AS Date), N'tom', N'Quận Tân Bình, TP HCM', N'Trả lại khi có hỏng hóc')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (27, CAST(N'2020-12-28' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'Càng nhanh càng tốt')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (28, CAST(N'2020-12-28' AS Date), N'tom', N'London, England', N'')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (29, CAST(N'2020-12-29' AS Date), N'tom', N'London, England', N'Giao gần nhà thờ ')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (30, CAST(N'2020-12-29' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (31, CAST(N'2021-01-07' AS Date), N'tom', N'Quận Tân Bình, TP HCM', N'Stay the same.')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (32, CAST(N'2021-01-07' AS Date), N'tom', N'Quận Tân Bình, TP HCM', N'Test Customer Address path in order.')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (33, CAST(N'2021-01-07' AS Date), N'test', N'Biên Hòa, Đồng Nai', N'')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (34, CAST(N'2021-01-07' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'')
INSERT [dbo].[CustomOrders] ([OrderID], [OrderDate], [CustomerID], [Address], [Description]) VALUES (35, CAST(N'2021-01-09' AS Date), N'tom', N'Biên Hòa, Đồng Nai', N'')
SET IDENTITY_INSERT [dbo].[CustomOrders] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (10, N'GMT002  ', 2, 95000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (11, N'GBG001  ', 1, 16000, 0.20000000298023224)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (11, N'GBG002  ', 1, 40000, 0.0099999997764825821)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (11, N'GBG003  ', 2, 20000, 0.30000001192092896)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (11, N'GCS001  ', 1, 125000, 0.029999999329447746)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (11, N'GDR001  ', 1, 51000, 0.05000000074505806)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (11, N'GMT002  ', 1, 95000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (12, N'GDR001  ', 5, 51000, 0.05000000074505806)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (12, N'GVL002  ', 1, 215000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (13, N'GBG002  ', 1, 40000, 0.0099999997764825821)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (13, N'GBG003  ', 1, 20000, 0.30000001192092896)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (14, N'GBG003  ', 1, 20000, 0.30000001192092896)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (15, N'GCS001  ', 1, 125000, 0.029999999329447746)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (17, N'GBG001  ', 2, 16000, 0.20000000298023224)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (17, N'GBG003  ', 3, 20000, 0.30000001192092896)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (17, N'GMT002  ', 4, 95000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (18, N'GBG003  ', 5, 20000, 0.30000001192092896)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (18, N'GCS001  ', 3, 125000, 0.029999999329447746)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (18, N'GVL003  ', 6, 105000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (19, N'GBG001  ', 4, 16000, 0.20000000298023224)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (19, N'GDR001  ', 10, 51000, 0.05000000074505806)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (19, N'GMT001  ', 5, 110000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (19, N'GMT002  ', 3, 95000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (19, N'GVL001  ', 9, 21500, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (20, N'GBG002  ', 1, 40000, 0.0099999997764825821)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (21, N'GDR002  ', 1, 51000, 0.12999999523162842)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (22, N'GDR002  ', 3, 51000, 0.12999999523162842)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (22, N'GMT001  ', 6, 110000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (23, N'BNN002  ', 3, 16000000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (23, N'GBGTD   ', 1, 15000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (24, N'GBG001  ', 1, 16000, 0.20000000298023224)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (24, N'GBG002  ', 1, 40000, 0.0099999997764825821)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (25, N'BNN001  ', 1, 2250000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (25, N'GBGTD   ', 1, 15000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (26, N'GBG003  ', 1, 20000, 0.30000001192092896)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (26, N'GDR001  ', 1, 51000, 0.05000000074505806)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (27, N'GMT001  ', 1, 110000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (27, N'GMT002  ', 1, 95000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (28, N'GDR002  ', 1, 51000, 0.12999999523162842)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (29, N'GVL003  ', 1, 105000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (29, N'VLXD002 ', 8, 160000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (30, N'GBG001  ', 1, 16000, 0.20000000298023224)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (31, N'GCS001  ', 3, 125000, 0.029999999329447746)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (32, N'GDR001  ', 3, 51000, 0.05000000074505806)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (33, N'BNN001  ', 1, 2250000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (33, N'GDR002  ', 2, 51000, 0.12999999523162842)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (33, N'GMT002  ', 1, 95000, 0)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (34, N'GBG002  ', 1, 40000, 0.0099999997764825821)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (35, N'GBG001  ', 4, 16000, 0.20000000298023224)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [QuantityOrder], [UnitPrice], [Discount]) VALUES (35, N'GCS001  ', 3, 125000, 0.029999999329447746)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'BNN001  ', N'Bình nước nóng Rossi Saphir 22L ngang', 2250000, 1, 0, N'TBNN    ', N'bình', N'binh-nuoc-nong-rosi-saphi.png', N'<h2 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 1.4; color: rgb(50, 60, 63); margin-top: 0px; font-size: 2em; letter-spacing: 0.01em; text-align: justify;"><strong><span style="font-size: 16px;">Bình nước nóng Rossi Saphir 22L Loại Ngang</span></strong></h2><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;"><a href="https://vatlieuxaydung24h.vn/binh-nuoc-nong-rossi-saphir-22l-ngang" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>Bình nước nóng Rossi Saphir 22L ngang</strong></a>&nbsp;là thương hiệu bình nước nóng cao cấp của Tập đoàn Tân Á Đại Thành. Sản phẩm mang phong cách thiết kế Ý và là sản phẩm bán chạy nhất trên thị trường hiện nay. Bình nước nóng Rossi tích hợp những tính năng hiện đại của một&nbsp;<a href="https://vatlieuxaydung24h.vn/binh-nuoc-nong-lanh" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>bình nước nóng</strong></a>&nbsp;thế hệ mới với mục tiêu mang đến cho khách hàng trải nghiệm cao cấp từ cuộc sống tiện nghi.</p>', N'<h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 1.4; color: rgb(50, 60, 63); margin-top: 10px; font-size: 1.71429em; letter-spacing: 0.01em; text-align: justify;"><span style="font-size: 14px;">Thông số kỹ thuật của Bình nước nóng Rossi Saphir 22L ngang:</span></h3><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Tên sản phẩm:&nbsp;Bình nước nóng gián tiếp Rossi Saphir 22L</p><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Trọng lượng: 12 kg</p><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Kích thước: 530 × 305 × 270 cm</p><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Mã Sản phẩm: RS-22SL</p><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Chất liệu: Ruột bình tráng men Sapphire - Công nghệ tự làm sạch ruột bình</p><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Dung tích: 22L</p><p style="margin-bottom: 15px; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify;">- Kiểu Dáng: Loại Ngang</p>', 1, 1, CAST(N'2020-11-14' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'BNN002  ', N'Bồn nước inox Tân Á Đại Thành 6000L', 16000000, 1, 0, N'TBNN    ', N'bồn', N'bon-nuoc-tan-a.png', N'<h2 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 28.35px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 2em; letter-spacing: 0.01em;"><strong><span style="font-size: 16px;">Bồn chứa nước Inox Tân Á Đại Thành 5000L - F1420</span></strong></h2><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;"><strong>VLXD Hưng Gia Bình</strong>&nbsp;- Nhà phân phối chuyên nghiệp các loại&nbsp;<a href="https://vatlieuxaydung24h.vn/bon-nuoc" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>Bồn chứa nước Inox</strong></a>, bồn nhựa, máy nước nóng năng lượng mặt trời, bình nước nóng lạnh Ariston, Rosssi, máy lọc nước ... tại Đà Nẵng, Hội An và các tỉnh Miền Trung, Tây Nguyên.</p>', N'<h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 22.113px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 1.71429em; letter-spacing: 0.01em;"><span style="font-size: 14px;">KÍCH THƯỚC BỒN NƯỚC INOX TÂN Á ĐẠI THÀNH 4000 LÍT NGANG</span></h3><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">* Đường kính thân bồn: 1420 mm</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chiều dài bồn: 3305 mm</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chiều cao: 1640 mm</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chiều rộng chân&nbsp;: 1500 mm</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Vật liệu: Inox SUS 304.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Dung tích bồn: 5000 lít.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">&gt;&gt;&gt; Đơn giá: 12.050.000 đ.</p><h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 22.113px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 1.71429em; letter-spacing: 0.01em;"><span style="font-size: 14px;">KÍCH THƯỚC BỒN NƯỚC INOX TÂN Á ĐẠI THÀNH 4000 LÍT ĐỨNG</span></h3><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">* Đường kính thân bồn: 1360 mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chiều cao bồn: 3355 mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chiều rộng bồn: 1520 mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Vật liệu: Inox SUS 304.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Dung tích bồn: 5000 lít.</p>', 0, 0, CAST(N'2020-11-10' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GBG001  ', N'Gạch bông gió cube H-006', 16000, 1, 0.20000000298023224, N'DTN     ', N'viên', N'gach-bong-gio-cube.png', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình là nhà sản xuất và phân phối gạch bông gió xi măng H-006 xây tường trang trí nội - ngoại thất giá rẻ nhất tại Đà Nẵng, Hội An, Quảng Nam, Huế, Quảng Trị...

Gạch bông gió H-006 là sản phẩm gạch block xây tường trang trí rất được ưa chuộng trên thị trường hiện nay, bởi phong cách mới lạ, sáng tạo và độc đáo, tạo nên một không gian mở vừa mang nét hiện đại vừa mang nét cổ điển...', N'- Tên sản phẩm: Gạch bông gió CUBE H-006.

- Mã sản phẩm: H-006

- Kích thước: 19 x 19 x 6.5 cm

- Số lượng:  25 viên/ m2

- Trọng lượng: 3.4 - 3.6 kg / viên

- Màu sắc: Màu xám đen hoặc màu trắng.

Đơn giá:

- Màu trắng: 26.000 đ/viên.

- Màu xám đen: 21.000 đ/viên.', 2, 0, CAST(N'2020-10-12' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GBG002  ', N'Gạch bông gió Hoa roi tráng men BGM01', 40000, 1, 0.0099999997764825821, N'GBXM', NULL, N'gach-bong-gio-hoa-roi.png', N'Gạch bông gió hoa roi BGM01 hay gạch thông gió hoa roi 20x20 là sản phẩm gạch tráng men được nung nóng trong lò ở nhiệt cao nên có độ bền chắc, thích hợp với mọi mục đích sử dụng như trang trí chùa, chiền, nhà xây phong cách cổ, làm ô thông gió, trang trí tường, ô gió cửa sổ,...', N'-    Tên sản phẩm: Gạch bông gió hoa roi men sứ BGM01


-    Mã sản phẩm: BGM01


-    Trọng lượng : ~1.2kg/viên.


-    Kích thước: 20x20 cm, dày ~ 3,5 cm.


', 1, 0, CAST(N'2020-09-14' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GBG003  ', N'Gạch bông gió DanaTiles D02 màu trắng', 20000, 1, 0.30000001192092896, N'GTT', NULL, N'gach-bong-gio-dana.png', N'DanaTiles - Hưng Gia Bình - Nhà phân phối gạch bông gió DanaTiles D02 màu trắng tại Đà Nẵng, Hội An, Quy Nhơn và Miền Trung, Tây Nguyên... Sản phẩm đẹp, sắc nét - Giá tốt - Giao hàng tận nơi với mọi số lượng.

>> Hãy liên hệ và đặt hàng ngay hôm nay: 0935.090.252 - 0905.363.878 gặp mr Bình để được hỗ trợ báo giá tốt nhất.

>> Uy tín - Chuyên nghiệp - Tận tâm - Giao hàng tận nơi toàn quốc.

Gạch bông gió DanaTiles Maze D02 là một loại của gạch block xây tường được làm từ bê tông xi măng cốt liệu, thường được sử dụng để xây tường trang trí nội thất như xây tường rào, xây tường vách ngăn, xây tường mặt tiền nhà...

Ưu điểm lớn nhất của gạch bông gió xi măng là có khả năng lấy gió lấy sáng tự nhiên, vừa là loại vật liệu trang trí có tính thẩm mỹ cao, nên gạch bông gió xi măng hiện đang là dòng sản phẩm bán chạy và rất được ưa chuộng trên thị trường hiện nay.', N'- Tên sản phẩm: Gạch bông gió xi măng DanaTiles DANA-D02 màu trắng

- Mã sản phẩm: DANA-D02

- Kích thước: 190 x 190 x 65 mm.

- Số lượng: 25 viên/m2.

- Trọng lượng: 2,8 kg/viên

- Màu sắc: màu trắng sữa

- Chất liệu: bê tông xi măng cốt liệu

- Nhà sản xuất: Nhà máy Sản xuất gạch Dana Tiles', 2, 0, CAST(N'2019-10-20' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GBGTD   ', N'Gạch bông gió Tứ Diệp', 15000, 1, 0, N'DTN     ', N'viên', N'gach-bong-gio-tu-diep.png', N'<p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;"><strong>VLXD Hưng Gia Bình</strong>&nbsp;- Nhà phân phối Sỉ &amp; Lẻ các loại gạch gốm trang trí nội ngoại thất như gạch bông gió đất nung,&nbsp;<a href="https://vatlieuxaydung24h.vn/gach-bong-gio-xi-mang" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>gạch bông gió xi măng</strong></a>, Đá tự nhiên, ngói lợp nhà tại Đà Nẵng, Hội An và khu vực Miền Trung, Tây Nguyên.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;"><a href="https://vatlieuxaydung24h.vn/gach-bong-gio-tu-diep" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>Gạch Tứ Diệp</strong></a>&nbsp;còn được gọi là Gạch bông gió Tứ Diệp&nbsp;hay Gạch thông gió Tứ Diệp được làm từ gạch tuynel, gạch gốm đất sét&nbsp;nung chất lượng cao.</p>', N'<h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 32.4001px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 1.71429em; letter-spacing: 0.01em; text-align: justify;"><span style="font-size: 14px;">Đặc điểm kỹ thuật của gạch Tứ Diệp:</span></h3><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Tên sản phẩm: Gạch bông gió Tứ Diệp.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Kích thước viên gạch: 20x20x6 cm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Số lượng: 25 viên/m2.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Trọng lượng: 2.1 kg/viên.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Chất liệu: đất sét nung nóng ở nhiệt độ cao.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Hãng sản xuất: Công ty Cổ Phần Gạch Ngói Đồng Nai.</p>', 0, 0, CAST(N'2020-11-16' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GCS001  ', N'Gạch con sâu | Gạch zíc zắc', 125000, 1, 0.029999999329447746, N'GBXM', NULL, N'gach-con-sau.png', N'Gạch con sâu hay gạch zíc zắc là sản phẩm gạch block lát nền có cường độ chịu nén cao, khả năng chống mài mòn, chống trơn trượt, chống bám bẩn và thoát nước cục bộ rất tốt. Đặc biệt, các loại gạch block lát nền này không bị ảnh hưởng bởi các tác động môi trường như nóng, ẩm, nhiễm mặn và hóa chất công nghiệp...

Gạch zíc zắc thường được dùng để lát vỉa hè cho các công trình giao thông công cộng như lối đi, hè đường, bến bãi, cầu cảng, sân trường, bệnh viện, công viên, quảng trường ... hoặc sân vườn nhà, biệt thự đòi hỏi cường độ chịu lực cao.

Sản phẩm gạch block lát vỉa hè của công ty Hưng Gia Bình đa dạng về mẫu mã, kích thước; màu sắc bền đẹp, đáp ứng mọi yêu cầu thiết kế công trình của Kiến trúc sư và chủ đầu tư.', N'-  Tên sản phẩm: Gạch con sâu hay Gạch Zíc Zắc.

-  Thuộc loại: Gạch block tự chèn, gạch block lát vỉa hè hoặc gạch block lát sân vườn.

-  Bề mặt: Có 2 loại là loại Mặt trơn và loại Mặt nhám.

-  Kích thước: 224 x 112 x 60 (mm).

-  Định mức: 39,5 viên/m2.

-  Trọng lượng: 2,5 kg/viên.

', 0, 0, CAST(N'2020-08-28' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GDR001  ', N'Gạch Lamri ốp chân tường Prime 2946', 51000, 1, 0.05000000074505806, N'GM      ', NULL, N'gach-lamri-2946.png', N'Gạch lamri ốp chân tường Prime 2946', N'- Tên SP: Gạch lamri ốp chân tường Prime 2946
- Kích thước: 50x86 cm.
- Bề mặt: nhẵn bóng.
- Hãng sản xuất: Prime', 4, 0, CAST(N'2019-05-30' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GDR002  ', N'Gạch Lambri ốp chân tường 1965', 51000, 1, 0.12999999523162842, N'GM', NULL, N'gach-lamri-1965.png', N'Gạch lamri ốp chân tường Prime 1965', N'- Tên SP: Gạch lamri ốp chân tường Prime 1965
- Kích thước: 50x86 cm.
- Bề mặt: nhẵn bóng.
- Hãng sản xuất: Prime', 8, 0, CAST(N'2020-06-06' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GHS001  ', N'Gạch Granit Hoàng Sa', 264000, 1, 0, N'GM', NULL, N'gach-granit-hoang-sa.png', N'Gạch granite Hoàng Sa Đồng Tâm 50x50
Bộ sưu tập gạch granite lát sân vườn của Công ty Gạch Đồng Tâm mang tên “Trường Sa - Hoàng Sa - Việt Nam” xuất hiện thời gian qua trên thị trường vật liệu xây dựng đã gây được sự chú ý lớn đối với các nhà thầu xây dựng, công ty tư vấn thiết kế xây dựng và chủ đầu tư...

Viên gạch Hoàng Sa có thêm những họa tiết nổi trên bề mặt là các vỏ sò, vỏ ốc… những sản vật quý hiếm từ biển cả mà khi xưa dân binh đã ra đảo mang về. Bề mặt của mẫu gạch Hoàng Sa cũng nhám như cát biển nhưng tất cả họa tiết đều ngả sang màu vàng ngà, đúng như tên gọi “bãi cát vàng” mà cha ông đã đặt cho Hoàng Sa.', N'-  Tên sản phẩm: Gạch granite lát sân vườn Hoàng Sa.


-  Kích thước: 50x50 cm hoặc 500x500 mm.


-  Màu sắc: Nâu đỏ đậm 
-  Vân đá sân vườn


-  Bề mặt: Nhám, ít trày xướt, chống trơn trượt.


-  Công nghệ in: Kỹ thuật số.


-  Loại gạch: Gạch granite.


-  Công năng: Gạch ốp lát nền sân vườn.


', 1, 0, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GMT001  ', N'Gạch Terrazzo 30x30 màu đỏ', 110000, 1, 0, N'GBXM    ', NULL, N'gach-terrazzo-do.png', N'Vườn Đá Việt là nhà sản xuất và phân phối trực tiếp sản phẩm Gạch block xi măng, gạch Terrazzo lát vỉa hè đến người tiêu dùng (không qua đại lý). Vì vậy,  công ty chúng tôi cam kết sẽ cung cấp cho quý khách hàng những sản phẩm gạch block lát vỉa hè uy tín, chất lượng, chính hãng với giá cả cạnh tranh nhất.', N'- Tên sản phẩm: Gạch block terrazzo màu đỏ.

- Kích viên: 300x300x30 mm.

- Số lượng : 11 viên/m2.

- Màu sắc: Màu đỏ

- Kiểu bề mặt gạch: Kiểu Cánh quạt, kiểu Xoằn Ốc, Kiểu mắt nai, Kiểu Ô vuông.', 0, 0, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GMT002  ', N'Gạch terrazzo 30x30 màu ghi', 95000, 1, 0, N'GBXM', NULL, N'gach-terrazzo-ghi.png', N'Vườn Đá Việt là nhà sản xuất và phân phối trực tiếp sản phẩm Gạch block không nung, gạch terrazzo lát vỉa hè đến người tiêu dùng (không qua đại lý). Vì vậy, chúng tôi cam kết sẽ cung cấp cho quý khách hàng những sản phẩm gạch lát vỉa hè uy tín, chất lượng, chính hãng với giá cả cạnh tranh nhất.

Gạch block terrazzo được sản xuất từ nguyên liệu bột đá, đá mi, cát, xi măng, bột màu, phụ gia và chất độn, v.v... Dùng công nghệ rung hoặc ép rung cho bê tông được lèn chặt theo khuôn mẫu có sẵn để tạo hình dạng cho mỗi viên gạch block. Các khâu chọn nguyên liệu, phối liệu, lực rung ép, phụ gia và bảo dưỡng v.v... sẽ quyết định độ cứng và chất lượng của gạch.', N'- Tên sản phẩm: Gạch terrazzo 30x30 màu ghi.

- Kích thước: 300x300x30 mm.

- Số lượng: 11 viên/m2.

- Màu sắc: Màu ghi trắng, màu ghi đen, màu vàng, màu đỏ...

- Kiểu hoa văn: kiểu xoắn ốc, kiểu mắt nai, kiểu trống đồng hay cánh quạt, kiểu ô vuông, ...

- Chất liệu: bê tông xi măng cốt liệu.

- Nhà sản xuất: Nhà máy Sản xuất Gạch Dana Tiles

- Đơn giá: Loại 1: 105.000 đ/m2. Loại 2: 90.000 đ/m2.', 1, 1, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GO0001  ', N'Gạch ống Đại Hưng 6 lỗ nhỏ', 1500, 1, 0, N'VLT     ', N'viên', N'gach-ong.png', N'<h2 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 37.8px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 2em; letter-spacing: 0.01em;"><span style="font-size: 18px;">Gạch ống 6 lỗ nhỏ Đại Hưng 75x115x175 mm</span></h2><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;"><a href="https://vatlieuxaydung24h.vn/gach-ong-dai-hung-6-lo-nho" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>Gạch ống 6 lỗ nhỏ Đại Hưng</strong></a>&nbsp;75x115x175 mm là loại gạch xây dựng được làm bằng gốm đất sét nung chất lượng cao tại xã Đại Đồng, huyện Đại Lộc, tỉnh Quảng Nam. Gạch Đại Hưng được sản xuất trên dây chuyền thiết bị hiện đại và công nghệ tiên tiến hàng đầu của Châu Âu.</p>', N'<h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 32.4001px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 1.71429em; letter-spacing: 0.01em;"><span style="font-size: 14px;">THÔNG SỐ KỸ THUẬT GẠCH TUYNEL 6 LỖ ĐẠI HƯNG:</span></h3><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Tên sản phẩm:&nbsp;<strong>Gạch ống Đại Hưng 6 lỗ tròn loại nhỏ</strong>.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Kích thước gạch:&nbsp;<strong>75x115x175</strong>&nbsp;mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Trọng lượng: 2,0 kg/viên.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chủng loại: gạch loại nhỏ.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chất liệu: gốm đất sét nung chất lượng cao.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Cường độ chịu nén: 75 kg/cm2.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Cường độ chịu uốn: &gt;=40 N/cm2.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Độ hút nước: 6:9 %.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Hãng sản xuất: Công ty CP Gạch Gốm Đại Hưng.</p>', 0, 0, CAST(N'2020-11-07' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GVL001  ', N'Gạch Viglacera ốp tường GW 3602', 21500, 1, 0, N'GM      ', NULL, N'gach-viglacera-3602.png', N'Gạch viglacera GW 3602 là loại gạch ốp tường trang trí có kích thước 300x600 mm có bề mặt nhám, giả cổ vân đá, xương bán sứ, men matt phù hợp cho không gian nhà vệ sịnh cao cấp, các khu biệt thự, nhà phố, nhà hàng, khách sạn, khu nhà ở xã hội, chung cư tới khu công cộng như bệnh viện, trường học, nhà ga, sân bay...', N'- Tên sản phẩm: Gạch viglacera ốp tường trang trí GW 3602.

- Mã sản phẩm: GW3602

- Kích thước: 30x60 cm

- Bề mặt: gạch có bề mặt nhám, giả cổ vân đá.

- Xương gạch: gạch xương bán sứ

- Men gạch: gạch men matt

- Loại gạch: Gạch ốp tường, gạch lát nền, gạch trang trí nội ngoại thất.

- Quy cách đóng gói: Đóng hộp carton = 6 viên/hộp = 1.08 m2.

- Trọng lượng: 20 kg/hộp.

- Sử dụng: Đây là loại gạch men ốp tường trang trí nội ngoại thất thường được sử dụng chủ yếu để thi công ốp lát tường nhà vệ sinh, gạch ốp tường phòng bếp, gạch ốp tường phòng khách, gạch lát nền, gạch lát nền nhà vệ sinh, gạch lát nền phòng khách, gạch lát nền nhà, gạch trang trí, gạch chống trơn, gạch ngoại thất...', 4, 1, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GVL002  ', N'Gạch Viglacera ốp tường GW 3616', 215000, 1, 0, N'GM', NULL, N'gach-viglacera-3616.png', N'Gạch viglacera ốp tường trang trí GW 3616
Gạch viglacera GW 3616 là loại gạch ốp tường trang trí có kích thước 300x600 mm có bề mặt nhám, giả cổ vân đá, xương bán sứ Porcelain, men matt phù hợp cho không gian nhà vệ sịnh cao cấp, các khu biệt thự, nhà phố, nhà hàng, khách sạn, khu nhà ở xã hội, chung cư tới khu công cộng như bệnh viện, trường học, nhà ga, sân bay...', N'-    Tên sản phẩm: Gạch viglacera ốp tường trang trí GW 3616.




-    Mã sản phẩm: GW3616




-    Kích thước: 30x60 cm




-    Bề mặt: gạch nhám




-    Xương gạch: gạch xương bán sứ




-    Men gạch: gạch men matt




-    Loại gạch: Gạch ốp tường, gạch lát nền, gạch trang trí nội ngoại thất.




', 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'GVL003  ', N'Gạch lát nền sân vườn Viglacera SV402', 105000, 1, 0, N'GM', NULL, N'gach-viglacera-sv402.png', N'Gạch lát nền sân vườn Viglacera SV402 là loại gạch men lát nền sân vườn thường được sử dụng để ốp lát nền nhà như ốp gạch lát nền hiên nhà, ban công, khu nghỉ ngơi, lát nền sân vườn, phòng bếp, phòng vệ sinh, ...', N'-  Tên sản phẩm: Gạch men lát sân vườn Viglacera SV402.


-  Mã SP: SV402


-  Kích thước: 400x400 mm hay 40x40 cm..


-  Quy cách: Đóng hộp 6 viên.


', 4, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'test2   ', N'Jame', 15000, 1, 0, N'DTN     ', N'', N'product.png', N'<br>', N'<br>', 0, 0, CAST(N'2021-01-07' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'VLXD002 ', N'Cát san lấp', 160000, 1, 0, N'VLT     ', N'', N'cat-san-lap.png', N'<h2 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 37.8px; color: rgb(50, 60, 63); margin: 12pt 0in; font-size: 2em; letter-spacing: 0.01em; text-align: justify;"><strong><span style="font-size: 18px;">Cát san lấp nền</span></strong></h2><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;"><a href="https://vatlieuxaydung24h.vn/cat-san-lap" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>Cát san lấp</strong></a>&nbsp;là loại vật liệu dùng làm lớp đệm cát sử dụng rất hiệu quả cho các nền đất yếu ở trạng thái bão hoà nước như nền đất sét nhão, đất sét pha nhão, đất cát pha, đất bùn, than bùn… và chiều dày các lớp đất yếu nhỏ hơn dưới 3m.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">** Hãy liên hệ đặt hàng ngay hôm nay:<span style="color: rgb(0, 128, 0);"><strong>&nbsp;</strong></span><span style="color: rgb(0, 128, 0);"><span style="font-size: 16px;"><strong>0905.363.878 - 0935.090.252</strong></span></span>&nbsp;- gặp Mr Bình để được hỗ trợ&nbsp;báo giá tốt nhất.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">** Giao hàng tận nơi với mọi số lượng lớn nhỏ. Miễn phí giao hàng với số lượng từ 4m3 trở lên.</p><h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 32.4001px; color: rgb(50, 60, 63); margin: 12pt 0in; font-size: 1.71429em; letter-spacing: 0.01em; text-align: justify;"><strong><span style="font-size: 14px;">Biện pháp thi công cát san lấp:</span></strong></h3><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">Tiến hành đào bỏ một phần hoặc toàn bộ lớp đất yếu (trường hợp lớp đất yếu có chiều dày bé) và thay vào đó bằng lớp cát hạt trung, hạt thô được đầm chặt.</p>', N'<h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 32.4001px; color: rgb(50, 60, 63); margin: 12pt 0in; font-size: 1.71429em; letter-spacing: 0.01em; text-align: justify;"><strong><span style="font-size: 14px;">Đặc tính kỹ thuật của cát san lấp trong thi công xây dựng:</span></strong></h3><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">Việc thay thế lớp đất yếu bằng tầng đệm cát san lấp có những tác dụng chủ yếu sau:</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Lớp đệm nền đất bằng cát san lấp thay thế lớp đất yếu nằm trực tiếp dưới đáy móng. Đệm cát san lấp đóng vai trò như một lớp chịu tải, tiếp thu tải trọng công trình và truyền tải trọng đó các lớp đất yếu bên dưới.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Giảm được độ lún và chênh lệch lún của công trình vì có sự phân bộ lại ứng suất do tải trọng ngoài gây ra trong nền đất dưới tầng đệm cát.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Giảm được chiều sâu chôn móng nên giảm được khối lượng vật liệu làm móng.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Giảm được áp lực công trình truyền xuống đến trị số mà nền đất yếu có thể tiếp nhận được.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Làm tăng khả năng ổn định của công trình, kể cả khi có tải trọng ngang tác dụng, vì&nbsp;<a href="https://vatlieuxaydung24h.vn/cat-xay-dung" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>cát</strong></a>&nbsp;được nén chặt làm tăng lực ma sát và sức chống trượt.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Tăng nhanh quá trình cố kết của đất nền, do vậy sẽ giúp làm tăng nhanh khả năng chịu tải của nền và tăng nhanh thời gian ổn định về lún cho công trình.</p><p style="margin: 12pt 0in; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; text-align: justify; line-height: 18.9px;">- Về mặt&nbsp;<strong>thi công cát san lấp</strong>&nbsp;vô cùng đơn giản, không đòi hỏi nhiều thiết bị phức tạp nên được sử dụng tương đối rộng rãi.</p>', 0, 0, CAST(N'2020-11-07' AS Date), 1)
INSERT [dbo].[Products] ([ProductID], [Name], [UnitPrice], [Quantity], [Discount], [CategoryID], [DonViTinh], [Photo], [Description], [Specification], [ViewCount], [Special], [DateIn], [Available]) VALUES (N'VTXD001 ', N'Cùm giàn giáo', 22000, 1, 0, N'TBXD    ', N'', N'cun-gian-giao.png', N'<h2 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 37.8px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 2em; letter-spacing: 0.01em;"><span style="font-size: 16px;"><strong>Khóa giàn giáo, cùm giàn giáo</strong></span></h2><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;"><a href="https://vatlieuxaydung24h.vn/cum-gian-giao" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(6, 87, 163); transition: all 150ms ease-in-out 0s;"><strong>Khóa giàn giáo</strong></a>&nbsp;hay còn được gọi là cùm giàn giáo được sử dụng phổ biến trong ngành cơ khí xây dựng, giúp cùm, neo hoặc khóa cố định vị trí giữa các loại ống thép có đường kính từ 42 - 49 mm, góp phần thúc đẩy hiệu suất công việc cũng như an toàn cho người lao động.</p><h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 32.4001px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 1.71429em; letter-spacing: 0.01em;"><span style="font-size: 14px;">Hiện nay, Cùm giàn giáo có 2 loại chính là: Cùm xoay giàn giáo và Cùm tĩnh giàn giáo.</span></h3><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">-&nbsp;<strong>Cùm xoay giàn giáo</strong>&nbsp;được cấu tạo bởi hai cụm có thể quay 360 độ, sử dụng đơn giản có thể đặt ở mọi vị trí cần liên kết, tháo lắp nhanh chóng, vận chuyển dể dàng, tăng hiệu suất công việc. Cùm xoay sử dụng bu long D12-D17 để đảm bảo chắc chắn khi khóa vào các ống sắt được an toàn nhất.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">-&nbsp;<strong>Cùm tĩnh giàn giáo</strong>&nbsp;còn được gọi là cùm chết hay&nbsp;cùm cố định, được cấu tạo bởi hai cụm cố định chỉ dùng để liên kết các ống thép ở một góc cố định 90 độ mà thôi.</p>', N'<h3 style="font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; line-height: 32.4001px; color: rgb(50, 60, 63); margin: 12pt 0cm; font-size: 1.71429em; letter-spacing: 0.01em;"><span style="font-size: 14px;">Thông số kỹ thuật của cùm giàn giáo:</span></h3><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Tên sản phẩm: Cùm xoay ống giàn giáo hay Khóa xoay giàn giáo.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Chất liệu: Sắt thép.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Bề mặt: Mạ kẽm chống rỉ.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Quy cách: 42 x 49 mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Độ dầy: B2,5 mm - 2,8 mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Trọng lượng: 0,55 kg.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Bu lông: M12.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Sử dụng để khóa các loại ống thép có đường kính từ 42 - 49 mm.</p><p style="margin: 12pt 0cm; color: rgb(54, 63, 77); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; letter-spacing: 0.25px; line-height: 18.9px;">- Nhà phân phối: Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình.</p>', 1, 0, CAST(N'2020-08-11' AS Date), 1)
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[CustomOrders]  WITH CHECK ADD  CONSTRAINT [FK__CustomOrd__Custo__412EB0B6] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomOrders] CHECK CONSTRAINT [FK__CustomOrd__Custo__412EB0B6]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__440B1D61] FOREIGN KEY([OrderID])
REFERENCES [dbo].[CustomOrders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__440B1D61]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__44FF419A] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__44FF419A]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__3B75D760] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Product__Categor__3B75D760]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_UPrice] CHECK  (([UnitPrice]>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UPrice]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_ViewCount] CHECK  (([ViewCount]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ViewCount]
GO
