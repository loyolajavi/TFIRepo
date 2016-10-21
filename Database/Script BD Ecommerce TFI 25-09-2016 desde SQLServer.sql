USE [master]
GO
/****** Object:  Database [Ecommercetfiv12]    Script Date: 25/09/2016 19:43:29 ******/
CREATE DATABASE [Ecommercetfiv12]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ecommercetfiv12', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ecommercetfiv12.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ecommercetfiv12_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ecommercetfiv12_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ecommercetfiv12] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecommercetfiv12].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecommercetfiv12] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ecommercetfiv12] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommercetfiv12] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommercetfiv12] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecommercetfiv12] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ecommercetfiv12] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecommercetfiv12] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ecommercetfiv12] SET  MULTI_USER 
GO
ALTER DATABASE [Ecommercetfiv12] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecommercetfiv12] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecommercetfiv12] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecommercetfiv12] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Ecommercetfiv12]
GO
/****** Object:  Table [dbo].[BitacoraLog]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BitacoraLog](
	[IdBitacoraLog] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Evento] [varchar](200) NOT NULL,
	[FechaEvento] [datetime] NOT NULL,
 CONSTRAINT [PK_BitacoraLog] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[DescripCategoria] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[IdComprobante] [int] NOT NULL,
	[FechaComprobante] [datetime] NOT NULL,
	[IdPedido] [int] NOT NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[NroComprobante] ASC,
	[IdSucursal] ASC,
	[IdTipoComprobante] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComprobanteDetalle]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobanteDetalle](
	[IdComprobanteDetalle] [int] NOT NULL,
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[CantidadProducto] [int] NOT NULL,
	[PrecioUnitarioFact] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_ComprobanteDetalle] PRIMARY KEY CLUSTERED 
(
	[IdComprobanteDetalle] ASC,
	[NroComprobante] ASC,
	[IdSucursal] ASC,
	[IdTipoComprobante] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CondicionFiscal]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CondicionFiscal](
	[IdCondicionFiscal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_CondicionFiscal] PRIMARY KEY CLUSTERED 
(
	[IdCondicionFiscal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](200) NOT NULL,
	[Numero] [int] NOT NULL,
	[Piso] [int] NULL,
	[Departamento] [varchar](100) NULL,
	[Localidad] [varchar](200) NULL,
	[IdProvincia] [int] NOT NULL,
	[IdTipoDireccion] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionUsuario]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DireccionUsuario](
	[IdDireccion] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Direccion_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC,
	[CUIT] ASC,
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[CUIT] [int] NOT NULL,
	[NombreEmpresa] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPago]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPago](
	[IdEstadoPago] [int] IDENTITY(1,1) NOT NULL,
	[DescripEstadoPago] [varchar](200) NOT NULL,
 CONSTRAINT [PK_EstadoPago] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPedido]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPedido](
	[IdEstadoPedido] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionEstadoPedido] [varchar](20) NOT NULL,
 CONSTRAINT [PK_EstadoPedido] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [int] IDENTITY(1,1) NOT NULL,
	[NombreFamilia] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaEntrega]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaEntrega](
	[IdFormaEntrega] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionFormaEntrega] [varchar](20) NOT NULL,
 CONSTRAINT [PK_FormaEntrega] PRIMARY KEY CLUSTERED 
(
	[IdFormaEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaPago](
	[IdFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[DescripFormaPago] [varchar](200) NOT NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IvaProducto]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IvaProducto](
	[IdIvaProducto] [int] IDENTITY(1,1) NOT NULL,
	[PorcentajeIvaProd] [int] NOT NULL,
 CONSTRAINT [PK_IvaProducto] PRIMARY KEY CLUSTERED 
(
	[IdIvaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lenguaje](
	[IdLenguaje] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionLenguaje] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[IdLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenguajeControl]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LenguajeControl](
	[Texto] [varchar](400) NOT NULL,
	[IdLenguaje] [int] NOT NULL,
	[Valor] [varchar](400) NOT NULL,
 CONSTRAINT [PK_LenguajeControl_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[Texto] ASC,
	[IdLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaDeseos]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListaDeseos](
	[IdListaDeseos] [int] IDENTITY(1,1) NOT NULL,
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ListaDeseos] PRIMARY KEY CLUSTERED 
(
	[IdListaDeseos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaDeseosDetalle]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaDeseosDetalle](
	[IdListaDeseos] [int] NOT NULL,
	[IdListaDeseosDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[FechaDeseoDetalle] [datetime] NOT NULL,
 CONSTRAINT [PK_ListaDeseosDetalle] PRIMARY KEY CLUSTERED 
(
	[IdListaDeseos] ASC,
	[IdListaDeseosDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marca]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionMarca] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[IdEstadoPago] [int] NOT NULL,
	[IdFormaPago] [int] NOT NULL,
	[MontoPago] [decimal](18, 0) NOT NULL,
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patente]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patente](
	[IdPatente] [int] IDENTITY(1,1) NOT NULL,
	[NombrePatente] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteFamilia](
	[IdPatente] [int] NOT NULL,
	[IdFamilia] [int] NOT NULL,
 CONSTRAINT [PK_Patente_Familia] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC,
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedido](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[FechaPedido] [datetime] NOT NULL,
	[FechaFinPedido] [datetime] NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[PlazoEntrega] [int] NULL,
	[IdEstadoPedido] [int] NOT NULL,
	[IdFormaEntrega] [int] NULL,
	[CUIT] [int] NOT NULL,
	[NumeroTracking] [varchar](50) NULL,
	[DireccionEntrega] [int] NOT NULL,
 CONSTRAINT [PK_IdPedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoDetalle](
	[IdPedidoDetalle] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
	[Descuento] [int] NULL,
	[IdProducto] [int] NOT NULL,
 CONSTRAINT [PK_IdPedidoDetalle] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdPedidoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProdCategoria]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdCategoria](
	[IdProducto] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_ProdCategoria] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProducto] [varchar](50) NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
	[IdIvaProducto] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] NOT NULL,
	[DescripcionProvincia] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdPedidoDetalle] [int] NOT NULL,
	[IdSucursal] [int] NULL,
	[Activo] [bit] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[DescripSucursal] [varchar](200) NOT NULL,
	[DireccionSucursal] [int] NOT NULL,
	[CUIT] [int] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefono](
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[NroTelefono] [varchar](12) NOT NULL,
	[CodArea] [varchar](10) NOT NULL,
	[IdTipoTel] [int] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[NroTelefono] ASC,
	[CodArea] ASC,
	[IdTipoTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[IdTipoComprobante] [int] IDENTITY(1,1) NOT NULL,
	[DescripTipoComprobante] [varchar](200) NOT NULL,
 CONSTRAINT [PK_TipoComprobante] PRIMARY KEY CLUSTERED 
(
	[IdTipoComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDireccion](
	[IdTipoDireccion] [int] NOT NULL,
	[DescripcionDireccion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_TipoDireccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTel]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTel](
	[IdTipoTel] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTipoTel] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoTel] PRIMARY KEY CLUSTERED 
(
	[IdTipoTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdCondicionFiscal] [int] NULL,
	[IdUsuarioTipo] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Apellido] [varchar](200) NOT NULL,
	[Dni] [varchar](10) NULL,
	[CUIT] [int] NOT NULL,
	[Email] [varchar](400) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Clave] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioFamilia](
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdFamilia] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Familia] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioPatente]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioPatente](
	[CUIT] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdPatente] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Patente] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioTipo]    Script Date: 25/09/2016 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioTipo](
	[IdUsuarioTipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_UsuarioTipo] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BitacoraLog]  WITH CHECK ADD  CONSTRAINT [FK_BitacoraLog_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[BitacoraLog] CHECK CONSTRAINT [FK_BitacoraLog_Usuario]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Empresa]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Pedido]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Sucursal]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_TipoComprobante] FOREIGN KEY([IdTipoComprobante])
REFERENCES [dbo].[TipoComprobante] ([IdTipoComprobante])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_TipoComprobante]
GO
ALTER TABLE [dbo].[ComprobanteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ComprobanteDetalle_Comprobante] FOREIGN KEY([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
REFERENCES [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
GO
ALTER TABLE [dbo].[ComprobanteDetalle] CHECK CONSTRAINT [FK_ComprobanteDetalle_Comprobante]
GO
ALTER TABLE [dbo].[ComprobanteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ComprobanteDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ComprobanteDetalle] CHECK CONSTRAINT [FK_ComprobanteDetalle_Producto]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_DireccionTipo] FOREIGN KEY([IdTipoDireccion])
REFERENCES [dbo].[TipoDireccion] ([IdTipoDireccion])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_DireccionTipo]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Provincia] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Provincia]
GO
ALTER TABLE [dbo].[DireccionUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DireccionUsuario_Cliente] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[DireccionUsuario] CHECK CONSTRAINT [FK_DireccionUsuario_Cliente]
GO
ALTER TABLE [dbo].[DireccionUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DireccionUsuario_Direccion] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[DireccionUsuario] CHECK CONSTRAINT [FK_DireccionUsuario_Direccion]
GO
ALTER TABLE [dbo].[LenguajeControl]  WITH CHECK ADD  CONSTRAINT [FK_LenguageControl_Lenguage] FOREIGN KEY([IdLenguaje])
REFERENCES [dbo].[Lenguaje] ([IdLenguaje])
GO
ALTER TABLE [dbo].[LenguajeControl] CHECK CONSTRAINT [FK_LenguageControl_Lenguage]
GO
ALTER TABLE [dbo].[ListaDeseos]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseos_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[ListaDeseos] CHECK CONSTRAINT [FK_ListaDeseos_Usuario]
GO
ALTER TABLE [dbo].[ListaDeseosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseosDetalle_ListaDeseos] FOREIGN KEY([IdListaDeseos])
REFERENCES [dbo].[ListaDeseos] ([IdListaDeseos])
GO
ALTER TABLE [dbo].[ListaDeseosDetalle] CHECK CONSTRAINT [FK_ListaDeseosDetalle_ListaDeseos]
GO
ALTER TABLE [dbo].[ListaDeseosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseosDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ListaDeseosDetalle] CHECK CONSTRAINT [FK_ListaDeseosDetalle_Producto]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Comprobante] FOREIGN KEY([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
REFERENCES [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Comprobante]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Empresa]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_EstadoPago] FOREIGN KEY([IdEstadoPago])
REFERENCES [dbo].[EstadoPago] ([IdEstadoPago])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_EstadoPago]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_FormaPago] FOREIGN KEY([IdFormaPago])
REFERENCES [dbo].[FormaPago] ([IdFormaPago])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_FormaPago]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Pedido]
GO
ALTER TABLE [dbo].[PatenteFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PatenteFamilia_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[PatenteFamilia] CHECK CONSTRAINT [FK_PatenteFamilia_Familia]
GO
ALTER TABLE [dbo].[PatenteFamilia]  WITH CHECK ADD  CONSTRAINT [FK_PatenteFamilia_Patente] FOREIGN KEY([IdPatente])
REFERENCES [dbo].[Patente] ([IdPatente])
GO
ALTER TABLE [dbo].[PatenteFamilia] CHECK CONSTRAINT [FK_PatenteFamilia_Patente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Direccion] FOREIGN KEY([DireccionEntrega])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Direccion]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Empresa]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_EstadoPedido] FOREIGN KEY([IdEstadoPedido])
REFERENCES [dbo].[EstadoPedido] ([IdEstadoPedido])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_EstadoPedido]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_FormaEntrega] FOREIGN KEY([IdFormaEntrega])
REFERENCES [dbo].[FormaEntrega] ([IdFormaEntrega])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_FormaEntrega]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Usuario]
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Pedido]
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Producto]
GO
ALTER TABLE [dbo].[ProdCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProductoCateg_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[ProdCategoria] CHECK CONSTRAINT [FK_ProductoCateg_Categoria]
GO
ALTER TABLE [dbo].[ProdCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProductoCateg_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[ProdCategoria] CHECK CONSTRAINT [FK_ProductoCateg_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_IvaProducto] FOREIGN KEY([IdIvaProducto])
REFERENCES [dbo].[IvaProducto] ([IdIvaProducto])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_IvaProducto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_PedidoDetalle] FOREIGN KEY([IdPedido], [IdPedidoDetalle])
REFERENCES [dbo].[PedidoDetalle] ([IdPedido], [IdPedidoDetalle])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_PedidoDetalle]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Sucursal]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Direccion] FOREIGN KEY([DireccionSucursal])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Direccion]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Empresa]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TipoTel] FOREIGN KEY([IdTipoTel])
REFERENCES [dbo].[TipoTel] ([IdTipoTel])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TipoTel]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_CondFiscal] FOREIGN KEY([IdCondicionFiscal])
REFERENCES [dbo].[CondicionFiscal] ([IdCondicionFiscal])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_CondFiscal]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_UsuarioTipo] FOREIGN KEY([IdUsuarioTipo])
REFERENCES [dbo].[UsuarioTipo] ([IdUsuarioTipo])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_UsuarioTipo]
GO
ALTER TABLE [dbo].[UsuarioFamilia]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioFamilia_Familia] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[UsuarioFamilia] CHECK CONSTRAINT [FK_UsuarioFamilia_Familia]
GO
ALTER TABLE [dbo].[UsuarioFamilia]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioFamilia_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[UsuarioFamilia] CHECK CONSTRAINT [FK_UsuarioFamilia_Usuario]
GO
ALTER TABLE [dbo].[UsuarioPatente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPatente_Patente] FOREIGN KEY([IdPatente])
REFERENCES [dbo].[Patente] ([IdPatente])
GO
ALTER TABLE [dbo].[UsuarioPatente] CHECK CONSTRAINT [FK_UsuarioPatente_Patente]
GO
ALTER TABLE [dbo].[UsuarioPatente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPatente_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[UsuarioPatente] CHECK CONSTRAINT [FK_UsuarioPatente_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Ecommercetfiv12] SET  READ_WRITE 
GO
