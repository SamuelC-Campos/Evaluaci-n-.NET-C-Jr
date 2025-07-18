USE [master]
GO
/****** Object:  Database [EvaluacionGD2]    Script Date: 18/7/2025 14:25:21 ******/
CREATE DATABASE [EvaluacionGD2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvaluacionGD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EvaluacionGD2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EvaluacionGD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EvaluacionGD2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EvaluacionGD2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvaluacionGD2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvaluacionGD2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvaluacionGD2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvaluacionGD2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvaluacionGD2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvaluacionGD2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET RECOVERY FULL 
GO
ALTER DATABASE [EvaluacionGD2] SET  MULTI_USER 
GO
ALTER DATABASE [EvaluacionGD2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvaluacionGD2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvaluacionGD2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvaluacionGD2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EvaluacionGD2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EvaluacionGD2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvaluacionGD2', N'ON'
GO
ALTER DATABASE [EvaluacionGD2] SET QUERY_STORE = ON
GO
ALTER DATABASE [EvaluacionGD2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EvaluacionGD2]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 18/7/2025 14:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CodigoCategoria] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 18/7/2025 14:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[CodigoProducto] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[CodigoCategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 18/7/2025 14:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[CodigoVenta] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[CodigoProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoria] ([CodigoCategoria], [Nombre]) VALUES (1, N'Electrónica')
GO
INSERT [dbo].[Categoria] ([CodigoCategoria], [Nombre]) VALUES (2, N'Ropa')
GO
INSERT [dbo].[Categoria] ([CodigoCategoria], [Nombre]) VALUES (3, N'Libros')
GO
INSERT [dbo].[Categoria] ([CodigoCategoria], [Nombre]) VALUES (4, N'Juguetes')
GO
INSERT [dbo].[Categoria] ([CodigoCategoria], [Nombre]) VALUES (5, N'Electrodomésticos')
GO
INSERT [dbo].[Categoria] ([CodigoCategoria], [Nombre]) VALUES (6, N'Deportes')
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (101, N'Laptop', 1)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (102, N'Camiseta', 2)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (103, N'Libro C#', 3)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (104, N'Pelota de fútbol', 6)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (105, N'Cafetera', 5)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (106, N'Muñeca', 4)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (107, N'Pantalones', 2)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (108, N'Smartphone', 1)
GO
INSERT [dbo].[Producto] ([CodigoProducto], [Nombre], [CodigoCategoria]) VALUES (109, N'Libro Java', 3)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1001, CAST(N'2019-05-10' AS Date), 101)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1002, CAST(N'2020-03-12' AS Date), 102)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1003, CAST(N'2021-09-15' AS Date), 103)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1004, CAST(N'2024-12-01' AS Date), 101)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1005, CAST(N'2019-01-15' AS Date), 104)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1006, CAST(N'2019-06-20' AS Date), 105)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1007, CAST(N'2019-11-05' AS Date), 106)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1008, CAST(N'2019-07-18' AS Date), 107)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1009, CAST(N'2019-08-22' AS Date), 108)
GO
INSERT [dbo].[Venta] ([CodigoVenta], [Fecha], [CodigoProducto]) VALUES (1010, CAST(N'2019-03-30' AS Date), 109)
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[Categoria] ([CodigoCategoria])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Producto] ([CodigoProducto])
GO
USE [master]
GO
ALTER DATABASE [EvaluacionGD2] SET  READ_WRITE 
GO
