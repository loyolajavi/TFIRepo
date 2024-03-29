USE [master]
GO
/****** Object:  Database [Ecommerce]    Script Date: 17/11/2019 15:49:07 ******/
CREATE DATABASE [Ecommerce] ON  PRIMARY 
( NAME = N'Ecommerce', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ecommerce.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ecommerce_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ecommerce_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ecommerce] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecommerce] SET DB_CHAINING OFF 
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [tecnologia]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [tecnologia] WITH PASSWORD=N'm¹/.}w5%ºÐçÐPJö%A!¿hÆ¨é·Ìÿ', DEFAULT_DATABASE=[Artec], DEFAULT_LANGUAGE=[Español], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [tecnologia] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [Javi-PC\Javi]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [Javi-PC\Javi] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [BUILTIN\Usuarios]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [BUILTIN\Usuarios] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'¿0Så¹YqïÑâd''{S*ð¹Â&&J', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 17/11/2019 15:49:07 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'ØIT¹Óê#½+i¦â|ekK(ÂÅ4½Á*', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
EXEC sys.sp_addsrvrolemember @loginame = N'tecnologia', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'NT SERVICE\Winmgmt', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'NT SERVICE\SQLWriter', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'NT Service\MSSQL$SQLEXPRESS', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'Javi-PC\Javi', @rolename = N'sysadmin'
GO
USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--StoredProcedures:
--  [dbo].[BitacoraLogInsert]
CREATE PROCEDURE [dbo].[BitacoraLogInsert]
(
	@IdBitacoraLog INT,
	@CUIT varchar(50),
	@NombreUsuario varchar(100),
	@Evento varchar(200),
	@FechaEvento DATETIME
)

	AS
	SET NOCOUNT ON
		INSERT INTO [BitacoraLog]
		(	[IdBitacoraLog],
			[CUIT],
			[NombreUsuario],
			[Evento],
			[FechaEvento]
		)
		VALUES
		(
			@IdBitacoraLog,
			@CUIT,
			@NombreUsuario,
			@Evento,
			@FechaEvento
		)

-- [dbo].[BitacoraLogSelect]








GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BitacoraLogSelect]
(
	@IdBitacoraLog INT
)
AS
SET NOCOUNT ON
SELECT	[IdBitacoraLog],
		[CUIT],
		[NombreUsuario],
		[Evento],
		[FechaEvento]
FROM	[BitacoraLog]
WHERE	[IdBitacoraLog] = @IdBitacoraLog








GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BitacoraLogSelectAll]
AS
SET NOCOUNT ON
SELECT	[IdBitacoraLog],
		[CUIT],
		[NombreUsuario],
		[Evento],
		[FechaEvento]
FROM	[BitacoraLog]








GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BitacoraLogSelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario VARCHAR(100)
)
AS
SET NOCOUNT ON
SELECT	[IdBitacoraLog],
		[CUIT],
		[NombreUsuario],
		[Evento],
		[FechaEvento]
FROM	[BitacoraLog]
WHERE	[CUIT] = @CUIT
AND		[NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BitacoraLogUPDATE]
(
	@IdBitacoraLog INT,
	@CUIT varchar(50),
	@NombreUsuario varchar(100),
	@Evento varchar(200),
	@FechaEvento DATETIME
)

AS

SET NOCOUNT ON

UPDATE [BitacoraLog]
SET [CUIT] = @CUIT,
	[NombreUsuario] = @NombreUsuario,
	[Evento] = @Evento,
	[FechaEvento] = @FechaEvento
WHERE [IdBitacoraLog] = @IdBitacoraLog










GO
/****** Object:  StoredProcedure [dbo].[CategoriaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CategoriaDelete]
(
	@IdCategoria INT
)

AS

SET NOCOUNT ON

UPDATE [Categoria]
SET FecBaja = GETDATE()
WHERE [IdCategoria] = @IdCategoria










GO
/****** Object:  StoredProcedure [dbo].[CategoriaDeleteAllByIdCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CategoriaDeleteAllByIdCategoria]
(
	@IdCategoria INT
)

AS

SET NOCOUNT ON


UPDATE [Categoria]
SET FecBaja = GETDATE()
WHERE [IdCategoria] = @IdCategoria










GO
/****** Object:  StoredProcedure [dbo].[CategoriaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CategoriaInsert]
(
	@DescripCategoria varchar(200),
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

INSERT INTo [Categoria]
(
	[DescripCategoria],
	[CUIT]
)
VALUES
(
	@DescripCategoria,
	@CUIT
)

SELECT SCOPE_IDENTITY()












GO
/****** Object:  StoredProcedure [dbo].[CategoriASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CategoriASelect]
(
	@IdCategoria INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [Categoria]
WHERE [IdCategoria] = @IdCategoria and FecBaja is null












GO
/****** Object:  StoredProcedure [dbo].[CategoriASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CategoriASelectAll]

AS

SET NOCOUNT ON

SELECT *
FROM [Categoria] where FecBaja is null













GO
/****** Object:  StoredProcedure [dbo].[CategoriASelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CategoriASelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Categoria]
WHERE [CUIT] = @CUIT and FecBaja is null













GO
/****** Object:  StoredProcedure [dbo].[CategoriASelectAllByIdCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CategoriASelectAllByIdCategoria]
(
	@IdCategoria INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [Categoria]
WHERE [IdCategoria] = @IdCategoria and FecBaja is null













GO
/****** Object:  StoredProcedure [dbo].[CategoriaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CategoriaUPDATE]
(
	@IdCategoria INT,
	@DescripCategoria varchar(200),
	@CUIT varchar(50)
)

AS

SET NOCOUNT ON

UPDATE [Categoria]
SET [DescripCategoria] = @DescripCategoria
WHERE [IdCategoria] = @IdCategoria
AND CUIT = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ClienteSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ClienteSelectAll]

as

set nocount on

select [Cliente],
	[URI]
from [cliente]








GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDelete]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON


UPDATE [Comprobante]
SET FecBaja = GETDATE()
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON



UPDATE [Comprobante]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDeleteAllByIdPedido]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON


UPDATE [Comprobante]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDeleteAllByIdSucursal]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

UPDATE [Comprobante]
SET FecBaja = GETDATE()
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdTipoComprobante]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDeleteAllByIdTipoComprobante]
(
	@IdTipoComprobante INT
)

AS

SET NOCOUNT ON


UPDATE [Comprobante]
SET FecBaja = GETDATE()
WHERE [IdTipoComprobante] = @IdTipoComprobante










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleDelete]
(
	@IdComprobanteDetalle INT,
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON


UPDATE [ComprobanteDetalle]
SET FecBaja = GETDATE()
WHERE [IdComprobanteDetalle] = @IdComprobanteDetalle
	and [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleDeleteAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON


UPDATE [ComprobanteDetalle]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

UPDATE [ComprobanteDetalle]
SET FecBaja = GETDATE()
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleInsert]
(
	@IdComprobanteDetalle INT,
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50),
	@IdProducto INT,
	@CantidadProducto INT,
	@PrecioUnitarioFact decimal(18, 0)
)

AS

SET NOCOUNT ON

INSERT INTo [ComprobanteDetalle]
(
	[IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
)
VALUES
(
	@IdComprobanteDetalle,
	@NroComprobante,
	@IdSucursal,
	@IdTipoComprobante,
	@CUIT,
	@IdProducto,
	@CantidadProducto,
	@PrecioUnitarioFact
)










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleSelect]
(
	@IdComprobanteDetalle INT,
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
FROM [ComprobanteDetalle]
WHERE [IdComprobanteDetalle] = @IdComprobanteDetalle
	and [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleSelectAll]

AS

SET NOCOUNT ON

SELECT [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
FROM [ComprobanteDetalle]











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleSelectAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

SELECT [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
FROM [ComprobanteDetalle]
WHERE [IdProducto] = @IdProducto
and fecbaja is null










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [IdComprobanteDetalle],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdProducto],
	[CantidadProducto],
	[PrecioUnitarioFact]
FROM [ComprobanteDetalle]
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteDetalleUPDATE]
(
	@IdComprobanteDetalle INT,
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50),
	@IdProducto INT,
	@CantidadProducto INT,
	@PrecioUnitarioFact decimal(18, 0)
)

AS

SET NOCOUNT ON

UPDATE [ComprobanteDetalle]
SET [IdProducto] = @IdProducto,
	[CantidadProducto] = @CantidadProducto,
	[PrecioUnitarioFact] = @PrecioUnitarioFact
WHERE [IdComprobanteDetalle] = @IdComprobanteDetalle	and [NroComprobante] = @NroComprobante	and [IdSucursal] = @IdSucursal	and [IdTipoComprobante] = @IdTipoComprobante	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteInsert]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@CUIT VARCHAR(50),
	@IdTipoComprobante INT,
	@FechaComprobante DATETIME,
	@IdPedido INT
)

AS

SET NOCOUNT ON

INSERT INTo [Comprobante]
(
	[NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[FechaComprobante],
	[IdPedido]
)
VALUES
(
	@NroComprobante,
	@IdSucursal,
	@CUIT,
	@IdTipoComprobante,
	@FechaComprobante,
	@IdPedido
)

SELECT SCOPE_IDENTITY();










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteInsertSeleccionar]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ComprobanteInsertSeleccionar]
--CreadoPor: galianoleo
--se usa para devolver el ultimo comprobante insertado   
(  
 @IdSucursal int,  
 @CUIT int,  
 @IdTipoComprobante int,  
 @IdComprobante int,  
 @FechaComprobante datetime,  
 @IdPedido int  
)  
  
as  
  
set nocount on  
  
insert into [Comprobante]  
(  
 [IdSucursal],  
 [CUIT],  
 [IdTipoComprobante],  
 [IdComprobante],  
 [FechaComprobante],  
 [IdPedido]  
)  
values  
(  
 @IdSucursal,  
 @CUIT,  
 @IdTipoComprobante,  
 @IdComprobante,  
 @FechaComprobante,  
 @IdPedido  
)  
 select top 1 
	NroComprobante 
from 
	Comprobante 
where 
	  IdSucursal = @IdSucursal
	  and CUIT = @CUIT
	  and IdTipoComprobante = @IdTipoComprobante
	  and IdComprobante = @IdComprobante
	  and FechaComprobante = @FechaComprobante
	  and IdPedido = @IdPedido
order by NroComprobante desc









GO
/****** Object:  StoredProcedure [dbo].[ComprobanteNDInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteNDInsert]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@CUIT VARCHAR(50),
	@IdTipoComprobante INT,
	@FechaComprobante DATETIME,
	@IdPedido INT,
	@Ajuste decimal(18, 0)
)

AS


INSERT INTo [Comprobante]
(
	[NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[FechaComprobante],
	[IdPedido],
	[Ajuste]
)
VALUES
(
	@NroComprobante,
	@IdSucursal,
	@CUIT,
	@IdTipoComprobante,
	@FechaComprobante,
	@IdPedido,
	@Ajuste
)

SELECT SCOPE_IDENTITY();










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelect]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
FROM [Comprobante]
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT
	










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelectAll]

AS

SET NOCOUNT ON

SELECT [NroComprobante],
	[IdSucursal],
	[CUIT],
	[IdTipoComprobante],
	[IdComprobante],
	[FechaComprobante],
	[IdPedido],
	[FecBaja]
FROM [Comprobante]











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)
AS
SET NOCOUNT ON
SELECT	[NroComprobante],
		[IdSucursal],
		[CUIT],
		[IdTipoComprobante],
		[IdComprobante],
		[FechaComprobante],
		[IdPedido],
		[FecBaja]
FROM	[Comprobante]
WHERE	[CUIT] = @CUIT











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT_NroComprobante]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ComprobanteSelectAllByCUIT_NroComprobante]
(
	@CUIT VARCHAR(50),
	@NroComprobante INT
)
AS
SET NOCOUNT ON
SELECT	[NroComprobante],
		[IdSucursal],
		[CUIT],
		[IdTipoComprobante],
		[IdComprobante],
		[FechaComprobante],
		[IdPedido],
		[FecBaja]
FROM	[Comprobante]
WHERE	[CUIT] = @CUIT and [NroComprobante] = @NroComprobante











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelectAllByIdPedido]
(
	@IdPedido INT
)
AS
SET NOCOUNT ON
SELECT	[NroComprobante],
		[IdSucursal],
		[CUIT],
		[IdTipoComprobante],
		[IdComprobante],
		[FechaComprobante],
		[IdPedido],
		[FecBaja]
FROM	[Comprobante]
WHERE	[IdPedido] = @IdPedido











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelectAllByIdSucursal]
(
	@IdSucursal INT
)
AS
SET NOCOUNT ON
SELECT	[NroComprobante],
		[IdSucursal],
		[CUIT],
		[IdTipoComprobante],
		[IdComprobante],
		[FechaComprobante],
		[IdPedido],
		[FecBaja]
FROM	[Comprobante]
WHERE	[IdSucursal] = @IdSucursal











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdTipoComprobante]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelectAllByIdTipoComprobante]
(
	@IdTipoComprobante INT
)
AS
SET NOCOUNT ON
SELECT	[NroComprobante],
		[IdSucursal],
		[CUIT],
		[IdTipoComprobante],
		[IdComprobante],
		[FechaComprobante],
		[IdPedido],
		[FecBaja]
FROM	[Comprobante]
WHERE	[IdTipoComprobante] = @IdTipoComprobante










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteUPDATE]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@CUIT VARCHAR(50),
	@IdTipoComprobante INT,
	@IdComprobante INT,
	@FechaComprobante DATETIME,
	@IdPedido INT
)
AS
SET NOCOUNT ON
UPDATE [Comprobante]
SET [IdComprobante] = @IdComprobante,
	[FechaComprobante] = @FechaComprobante,
	[IdPedido] = @IdPedido
WHERE [NroComprobante] = @NroComprobante	and [IdSucursal] = @IdSucursal	and [IdTipoComprobante] = @IdTipoComprobante	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CondicionFiscalDelete]
(
	@IdCondicionFiscal INT
)
AS
SET NOCOUNT ON
	UPDATE [CondicionFiscal]
	SET FecBaja = GETDATE()
	WHERE [IdCondicionFiscal] = @IdCondicionFiscal








GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CondicionFiscalInsert]
(
	@Descripcion varchar(200)
)

AS
SET NOCOUNT ON

INSERT INTO [CondicionFiscal]
(
	[Descripcion]
)
VALUES
(
	@Descripcion
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CondicionFiscalSelect]
(
	@IdCondicionFiscal INT
)
AS
SET NOCOUNT ON

SELECT	[IdCondicionFiscal],
		[Descripcion],
		[FecBaja]
FROM	[CondicionFiscal]
WHERE	[IdCondicionFiscal] = @IdCondicionFiscal










GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CondicionFiscalSelectAll]
AS
SET NOCOUNT ON
SELECT [IdCondicionFiscal],
	[Descripcion],
	[FecBaja]
FROM [CondicionFiscal]










GO
/****** Object:  StoredProcedure [dbo].[CondicionFiscalUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CondicionFiscalUPDATE]
(
	@IdCondicionFiscal INT,
	@Descripcion varchar(200)
)
AS
SET NOCOUNT ON
	UPDATE [CondicionFiscal]
	SET [Descripcion] = @Descripcion
	WHERE [IdCondicionFiscal] = @IdCondicionFiscal








GO
/****** Object:  StoredProcedure [dbo].[ConfigMailHostTraer]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ConfigMailHostTraer]

AS
BEGIN

SELECT cm.Puerto, cm.Host, cm.Ssl, cm.Remitente, cm.Remps
FROM ConfigMailHost cm

END




GO
/****** Object:  StoredProcedure [dbo].[ControladorDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ControladorDelete]
(
	@IdControlador INT
)
AS
SET NOCOUNT ON
	UPDATE [Controlador]
	SET FecBaja = GETDATE()
	WHERE [IdControlador] = @IdControlador








GO
/****** Object:  StoredProcedure [dbo].[ControladorDeleteAllByIdEmpresa]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ControladorDeleteAllByIdEmpresa]
(
	@IdEmpresa INT
)
AS
SET NOCOUNT ON
UPDATE [Controlador]
SET FecBaja = GETDATE()
WHERE [IdEmpresa] = @IdEmpresa










GO
/****** Object:  StoredProcedure [dbo].[ControladorInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ControladorInsert]
(
	@IdEmpresa INT,
	@Pagina varchar(500),
	@Controlador varchar(500),
	@Descripcion varchar(1000)
)
AS
SET NOCOUNT ON

INSERT INTO [Controlador]
(
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
)
VALUES
(
	@IdEmpresa,
	@Pagina,
	@Controlador,
	@Descripcion
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[ControladorSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ControladorSelect]
(
	@IdControlador INT
)

AS

SET NOCOUNT ON

SELECT [IdControlador],
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
FROM [Controlador]
WHERE [IdControlador] = @IdControlador










GO
/****** Object:  StoredProcedure [dbo].[ControladorSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ControladorSelectAll]

AS

SET NOCOUNT ON

SELECT [IdControlador],
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
FROM [Controlador]










GO
/****** Object:  StoredProcedure [dbo].[ControladorSelectAllByIdEmpresa]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ControladorSelectAllByIdEmpresa]
(
	@IdEmpresa INT
)

AS

SET NOCOUNT ON

SELECT [IdControlador],
	[IdEmpresa],
	[Pagina],
	[Controlador],
	[Descripcion]
FROM [Controlador]
WHERE [IdEmpresa] = @IdEmpresa










GO
/****** Object:  StoredProcedure [dbo].[ControladorUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ControladorUPDATE]
(
	@IdControlador INT,
	@IdEmpresa INT,
	@Pagina varchar(500),
	@Controlador varchar(500),
	@Descripcion varchar(1000)
)

AS

SET NOCOUNT ON

UPDATE [Controlador]
SET [IdEmpresa] = @IdEmpresa,
	[Pagina] = @Pagina,
	[Controlador] = @Controlador,
	[Descripcion] = @Descripcion
WHERE [IdControlador] = @IdControlador










GO
/****** Object:  StoredProcedure [dbo].[DescontarStockSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DescontarStockSucursal]
(
	@IdSucursal INT,
	@IdProducto INT,
	@CantDescontar INT,
	@CUIT varchar(50)
)

AS

update StockSucursal
SET CantidadProducto = (CantidadProducto - @CantDescontar)
where IdProducto = @IdProducto
and IdSucursal = @IdSucursal
and CUIT = LTRIM(RTRIM(@CUIT)) 










GO
/****** Object:  StoredProcedure [dbo].[DireccionDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionDelete]
(
	@IdDireccion INT
)

AS

SET NOCOUNT ON

UPDATE [Direccion]
SET FecBaja = GETDATE()
WHERE [IdDireccion] = @IdDireccion










GO
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionInsert]
(
	@Calle varchar(200),
	@Numero INT,
	@Piso INT,
	@Departamento varchar(100),
	@Localidad varchar(200),
	@IdProvincia INT,
	@IdTipoDireccion INT
)

AS

SET NOCOUNT ON

INSERT INTo [Direccion]
(
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion]
)
VALUES
(
	@Calle,
	@Numero,
	@Piso,
	@Departamento,
	@Localidad,
	@IdProvincia,
	@IdTipoDireccion
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[DireccionSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[DireccionSelect]
(
	@IdDireccion int
)

as

set nocount on

select *
from [Direccion]
where [IdDireccion] = @IdDireccion











GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionSelectAll]

AS

SET NOCOUNT ON

SELECT [IdDireccion],
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	[FecBaja]
FROM [Direccion]










GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIdProvincia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionSelectAllByIdProvincia]
(
	@IdProvincia INT
)

AS

SET NOCOUNT ON

SELECT [IdDireccion],
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	[FecBaja]
FROM [Direccion]
WHERE [IdProvincia] = @IdProvincia










GO
/****** Object:  StoredProcedure [dbo].[DireccionUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUPDATE]
(
	@IdDireccion INT,
	@Calle varchar(200),
	@Numero INT,
	@Piso INT,
	@Departamento varchar(100),
	@Localidad varchar(200),
	@IdProvincia INT,
	@IdTipoDireccion INT
)

AS

SET NOCOUNT ON

UPDATE [Direccion]
SET [Calle] = @Calle,
	[Numero] = @Numero,
	[Piso] = @Piso,
	[Departamento] = @Departamento,
	[Localidad] = @Localidad,
	[IdProvincia] = @IdProvincia,
	[IdTipoDireccion] = @IdTipoDireccion
WHERE [IdDireccion] = @IdDireccion










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUsuarioDelete]
(
	@IdDireccion INT,
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON



UPDATE [DireccionUsuario]
SET FecBaja = GETDATE()
WHERE [IdDireccion] = @IdDireccion
	and [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUsuarioDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON


UPDATE [DireccionUsuario]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[DireccionUsuarioInsert]
(
	@IdDireccion int,
	@CUIT varchar(50),
	@NombreUsuario varchar(100),
	@Predeterminada bit
)

as

set nocount on

insert into [DireccionUsuario]
(
	[IdDireccion],
	[CUIT],
	[NombreUsuario],
	[Predeterminada]
)
values
(
	@IdDireccion,
	@CUIT,
	@NombreUsuario,
	@Predeterminada
)











GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUsuarioSelect]
(
	@IdDireccion INT,
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)

)

AS

SET NOCOUNT ON

SELECT [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja],
	[Predeterminada]
FROM [DireccionUsuario]
WHERE [IdDireccion] = @IdDireccion
	and [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUsuarioSelectAll]

AS

SET NOCOUNT ON

SELECT [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja],
	[Predeterminada]
FROM [DireccionUsuario]










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[DireccionUsuarioSelectAllByCUIT_NombreUsuario]
(
	@CUIT varchar(50),
	@NombreUsuario varchar(100)
)

as

set nocount on

select [IdDireccion],
	[CUIT],
	[NombreUsuario],
	[FecBaja],
	[Predeterminada]
from [DireccionUsuario]
where [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [FecBaja] is null
	










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByIdDireccion]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DireccionUsuarioSelectAllByIdDireccion]
(
	@IdDireccion INT
)
AS
	SELECT	*
	FROM	[DireccionUsuario]
	WHERE	[IdDireccion] = @IdDireccion









GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUsuarioUPDATE]
(
	@IdDireccion INT,
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@Predeterminada bit
)
AS
SET NOCOUNT ON
	UPDATE [DireccionUsuario]
	SET [Predeterminada] = @Predeterminada
	WHERE [IdDireccion] = @IdDireccion	AND [CUIT] = @CUIT	AND [NombreUsuario] = @NombreUsuario








GO
/****** Object:  StoredProcedure [dbo].[EmpresaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresaDelete]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON



UPDATE [Empresa]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[EmpresaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresaInsert]
(
	@CUIT VARCHAR(50),
	@NombreEmpresa varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [Empresa]
(
	[CUIT],
	[NombreEmpresa]
)
VALUES
(
	@CUIT,
	@NombreEmpresa
)










GO
/****** Object:  StoredProcedure [dbo].[EmpresASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresASelect]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreEmpresa],
	[FecBaja]
FROM [Empresa]
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[EmpresASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresASelectAll]

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreEmpresa],
	[FecBaja]
FROM [Empresa]










GO
/****** Object:  StoredProcedure [dbo].[EmpresaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresaUPDATE]
(
	@CUIT VARCHAR(50),
	@NombreEmpresa varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Empresa]
SET [NombreEmpresa] = @NombreEmpresa
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPagoDelete]
(
	@IdEstadoPago INT
)

AS

SET NOCOUNT ON



UPDATE [EstadoPago]
SET FecBaja = GETDATE()
WHERE [IdEstadoPago] = @IdEstadoPago










GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPagoInsert]
(
	@DescripEstadoPago varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [EstadoPago]
(
	[DescripEstadoPago]
)
VALUES
(
	@DescripEstadoPago
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPagoSelect]
(
	@IdEstadoPago INT
)
AS
SET NOCOUNT ON
	SELECT	[IdEstadoPago],
			[DescripEstadoPago],
			[FecBaja]
	FROM	[EstadoPago]
	WHERE	[IdEstadoPago] = @IdEstadoPago








GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPagoSelectAll]
AS
SET NOCOUNT ON
	SELECT [IdEstadoPago],
		[DescripEstadoPago],
		[FecBaja]
	FROM [EstadoPago]








GO
/****** Object:  StoredProcedure [dbo].[EstadoPagoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPagoUPDATE]
(
	@IdEstadoPago INT,
	@DescripEstadoPago varchar(200)
)
AS
SET NOCOUNT ON
	UPDATE [EstadoPago]
	SET [DescripEstadoPago] = @DescripEstadoPago
	WHERE [IdEstadoPago] = @IdEstadoPago








GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPedidoDelete]
(
	@IdEstadoPedido INT
)

AS

SET NOCOUNT ON


UPDATE [EstadoPedido]
SET FecBaja = GETDATE()
WHERE [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPedidoInsert]
(
	@DescripcionEstadoPedido varchar(20)
)

AS

SET NOCOUNT ON

INSERT INTo [EstadoPedido]
(
	[DescripcionEstadoPedido]
)
VALUES
(
	@DescripcionEstadoPedido
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPedidoSelect]
(
	@IdEstadoPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdEstadoPedido],
	[DescripcionEstadoPedido],
	[FecBaja]
FROM [EstadoPedido]
WHERE [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPedidoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdEstadoPedido],
	[DescripcionEstadoPedido],
	[FecBaja]
FROM [EstadoPedido]










GO
/****** Object:  StoredProcedure [dbo].[EstadoPedidoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EstadoPedidoUPDATE]
(
	@IdEstadoPedido INT,
	@DescripcionEstadoPedido varchar(20)
)

AS

SET NOCOUNT ON

UPDATE [EstadoPedido]
SET [DescripcionEstadoPedido] = @DescripcionEstadoPedido
WHERE [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[FamiliaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FamiliaDelete]
(
	@IdFamilia INT
)

AS

SET NOCOUNT ON




UPDATE [Familia]
SET FecBaja = GETDATE()
WHERE [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[FamiliaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FamiliaInsert]
(
	@NombreFamilia varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [Familia]
(
	[NombreFamilia]
)
VALUES
(
	@NombreFamilia
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[FamiliASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FamiliASelect]
(
	@IdFamilia INT
)

AS

SET NOCOUNT ON

SELECT [IdFamilia],
	[NombreFamilia],
	[FecBaja]
FROM [Familia]
WHERE [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[FamiliASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FamiliASelectAll]

AS

SET NOCOUNT ON

SELECT [IdFamilia],
	[NombreFamilia],
	[FecBaja]
FROM [Familia]










GO
/****** Object:  StoredProcedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]
(
	@IdUsuario int

)

AS

SET NOCOUNT ON

SELECT Fam.IdFamilia, Fam.NombreFamilia
FROM Familia Fam
INNER JOIN UsuarioFamilia UF ON UF.IdFamilia = Fam.IdFamilia
INNER JOIN Usuario US ON US.CUIT = UF.CUIT AND US.NombreUsuario = UF.NombreUsuario
WHERE US.IdUsuario = @IdUsuario
and US.FecBaja is null
and Fam.FecBaja is null
and UF.FecBaja is null










GO
/****** Object:  StoredProcedure [dbo].[FamiliasSelectByCUITandNombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[FamiliasSelectByCUITandNombreUsuario]
@CUIT varchar(50),
@NombreUsuario varchar(50)
as
select familia.IdFamilia,familia.NombreFamilia from familia inner join UsuarioFamilia on familia.IdFamilia = UsuarioFamilia.IdFamilia where ltrim(rtrim(UsuarioFamilia.CUIT))=ltrim(rtrim(@CUIT)) and ltrim(rtrim(UsuarioFamilia.NombreUsuario))=ltrim(rtrim(@NombreUsuario)) 

GO
/****** Object:  StoredProcedure [dbo].[FamiliaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FamiliaUPDATE]
(
	@IdFamilia INT,
	@NombreFamilia varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Familia]
SET [NombreFamilia] = @NombreFamilia
WHERE [IdFamilia] = @IdFamilia



GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FormaEntregaDelete]
(
	@IdFormaEntrega INT
)
AS
SET NOCOUNT ON
UPDATE [FormaEntrega]
SET FecBaja = GETDATE()
WHERE [IdFormaEntrega] = @IdFormaEntrega



GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaEntregaInsert]
(
	@DescripcionFormaEntrega varchar(20)
)

AS

SET NOCOUNT ON

INSERT INTo [FormaEntrega]
(
	[DescripcionFormaEntrega]
)
VALUES
(
	@DescripcionFormaEntrega
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[FormaEntregASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FormaEntregASelect]
(
	@IdFormaEntrega INT
)
AS
SET NOCOUNT ON
SELECT	[IdFormaEntrega],
		[DescripcionFormaEntrega],
		[FecBaja]
FROM	[FormaEntrega]
WHERE	[IdFormaEntrega] = @IdFormaEntrega



GO
/****** Object:  StoredProcedure [dbo].[FormaEntregASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FormaEntregASelectAll]
AS
SET NOCOUNT ON
SELECT	[IdFormaEntrega],
		[DescripcionFormaEntrega],
		[FecBaja]
FROM	[FormaEntrega] 




GO
/****** Object:  StoredProcedure [dbo].[FormaEntregaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaEntregaUPDATE]
(
	@IdFormaEntrega INT,
	@DescripcionFormaEntrega varchar(20)
)

AS

SET NOCOUNT ON

UPDATE [FormaEntrega]
SET [DescripcionFormaEntrega] = @DescripcionFormaEntrega
WHERE [IdFormaEntrega] = @IdFormaEntrega










GO
/****** Object:  StoredProcedure [dbo].[FormaPagoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaPagoDelete]
(
	@IdFormaPago INT
)

AS

SET NOCOUNT ON



UPDATE [FormaPago]
SET FecBaja = GETDATE()
WHERE [IdFormaPago] = @IdFormaPago










GO
/****** Object:  StoredProcedure [dbo].[FormaPagoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaPagoInsert]
(
	@DescripFormaPago varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [FormaPago]
(
	[DescripFormaPago]
)
VALUES
(
	@DescripFormaPago
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[FormaPagoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaPagoSelect]
(
	@IdFormaPago INT
)

AS

SET NOCOUNT ON

SELECT [IdFormaPago],
	[DescripFormaPago],
	[FecBaja]
FROM [FormaPago]
WHERE [IdFormaPago] = @IdFormaPago










GO
/****** Object:  StoredProcedure [dbo].[FormaPagoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaPagoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdFormaPago],
	[DescripFormaPago]
	--[FecBaja]
FROM [FormaPago]









GO
/****** Object:  StoredProcedure [dbo].[FormaPagoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FormaPagoUPDATE]
(
	@IdFormaPago INT,
	@DescripFormaPago varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [FormaPago]
SET [DescripFormaPago] = @DescripFormaPago
WHERE [IdFormaPago] = @IdFormaPago










GO
/****** Object:  StoredProcedure [dbo].[Grafico5productosmasvendidos]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Grafico5productosmasvendidos]
@CUIT varchar(50)
as
select top 5 p.DescripProducto as Producto,Sum(pd.Cantidad) as Cantidad from pedidodetalle pd inner join producto p on  pd.IdProducto = p.IdProducto
where p.CUIT=@CUIT
group by DescripProducto

GO
/****** Object:  StoredProcedure [dbo].[GraficoComparacionVentasPeriodo]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[GraficoComparacionVentasPeriodo]
@CUIT as varchar(50)
as
DECLARE @CONTADOR INT
DECLARE @MES int
DECLARE @MESLetras varchar(10)
select @CONTADOR=SUM(PedidoDetalle.Cantidad * PedidoDetalle.PrecioUnitario),@MES=MONTH(FechaPedido) from Pedido inner join PedidoDetalle on Pedido.IdPedido=PedidoDetalle.IdPedido inner join PedidoEstadoPedido on pedido.IdPedido = PedidoEstadoPedido.IdPedido
where PedidoEstadoPedido.IdEstadoPedido = 6 and PEDIDO.CUIT='20344003646' and (YEAR(FechaPedido) = 2016) and (MONTH(FechaPedido) = 11)
group by MONTH(FechaPedido)
order by MONTH(FechaPedido)

if(@mes = 11)
begin
set @MESLetras = 'Noviembre'
end
if(@mes = 12)
begin
set @MESLetras = 'Diciembre'
end
if(@mes = 10)
begin
set @MESLetras = 'Octubre'
end
if(@mes = 9)
begin
set @MESLetras = 'Septiembre'
end
if(@mes = 8)
begin
set @MESLetras = 'Agosto'
end
if(@mes = 7)
begin
set @MESLetras = 'Julio'
end
if(@mes = 6)
begin
set @MESLetras = 'Junio'
end
if(@mes = 5)
begin
set @MESLetras = 'Mayo'
end
if(@mes = 4)
begin
set @MESLetras = 'Abril'
end
if(@mes = 3)
begin
set @MESLetras = 'Marzo'
end
if(@mes = 2)
begin
set @MESLetras = 'Febrero'
end
if(@mes = 1)
begin
set @MESLetras = 'Enero'
end


SELECT @MESLetras as Mes, @CONTADOR as Cantidad

GO
/****** Object:  StoredProcedure [dbo].[GraficoMontoVentas]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[GraficoMontoVentas]
@CUIT as varchar(50)
as
DECLARE @CONTADOR INT
DECLARE @MES int
DECLARE @MESLetras varchar(10)
select @CONTADOR=SUM(PedidoDetalle.Cantidad * PedidoDetalle.PrecioUnitario),@MES=MONTH(FechaPedido) from Pedido inner join PedidoDetalle on Pedido.IdPedido=PedidoDetalle.IdPedido inner join PedidoEstadoPedido on pedido.IdPedido = PedidoEstadoPedido.IdPedido
where PedidoEstadoPedido.IdEstadoPedido = 6 and PEDIDO.CUIT='20377540582' and (YEAR(FechaPedido) = 2017)
group by MONTH(FechaPedido)
order by MONTH(FechaPedido)

if(@mes = 11)
begin
set @MESLetras = 'Noviembre'
end
if(@mes = 12)
begin
set @MESLetras = 'Diciembre'
end
if(@mes = 10)
begin
set @MESLetras = 'Octubre'
end
if(@mes = 9)
begin
set @MESLetras = 'Septiembre'
end
if(@mes = 8)
begin
set @MESLetras = 'Agosto'
end
if(@mes = 7)
begin
set @MESLetras = 'Julio'
end
if(@mes = 6)
begin
set @MESLetras = 'Junio'
end
if(@mes = 5)
begin
set @MESLetras = 'Mayo'
end
if(@mes = 4)
begin
set @MESLetras = 'Abril'
end
if(@mes = 3)
begin
set @MESLetras = 'Marzo'
end
if(@mes = 2)
begin
set @MESLetras = 'Febrero'
end
if(@mes = 1)
begin
set @MESLetras = 'Enero'
end


SELECT @MESLetras as Mes, @CONTADOR as Cantidad

GO
/****** Object:  StoredProcedure [dbo].[GraficoProductosPorCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GraficoProductosPorCategoria]
@CUIT as varchar(50)
as
SELECT distinct Count(ProdCategoria.IdCategoria) as 'Productos', Categoria.DescripCategoria as 'Categoria' FROM ProdCategoria inner join Categoria on ProdCategoria.IdCategoria = Categoria.IdCategoria
where ProdCategoria.CUIT=@CUIT
GROUP BY Categoria.DescripCategoria



GO
/****** Object:  StoredProcedure [dbo].[GraficoVentasPeriodo]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GraficoVentasPeriodo]
@CUIT as varchar(50)
as
DECLARE @CONTADOR INT
DECLARE @MES int
DECLARE @MESLetras varchar(10)
select @CONTADOR=count(*),@MES=MONTH(FechaPedido) from Pedido inner join PedidoEstadoPedido on pedido.IdPedido = PedidoEstadoPedido.IdPedido
where PedidoEstadoPedido.IdEstadoPedido = 6 and CUIT='20377540582' and YEAR(FechaPedido) = 2017
group by MONTH(FechaPedido)
order by MONTH(FechaPedido)


if(@mes = 11)
begin
set @MESLetras = 'Noviembre'
end
if(@mes = 12)
begin
set @MESLetras = 'Diciembre'
end
if(@mes = 10)
begin
set @MESLetras = 'Octubre'
end
if(@mes = 9)
begin
set @MESLetras = 'Septiembre'
end
if(@mes = 8)
begin
set @MESLetras = 'Agosto'
end
if(@mes = 7)
begin
set @MESLetras = 'Julio'
end
if(@mes = 6)
begin
set @MESLetras = 'Junio'
end
if(@mes = 5)
begin
set @MESLetras = 'Mayo'
end
if(@mes = 4)
begin
set @MESLetras = 'Abril'
end
if(@mes = 3)
begin
set @MESLetras = 'Marzo'
end
if(@mes = 2)
begin
set @MESLetras = 'Febrero'
end
if(@mes = 1)
begin
set @MESLetras = 'Enero'
end


SELECT @MESLetras as Mes, @CONTADOR as Cantidad

GO
/****** Object:  StoredProcedure [dbo].[IvaProductoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IvaProductoDelete]
(
	@IdIvaProducto INT
)

AS

SET NOCOUNT ON


UPDATE [IvaProducto]
SET FecBaja = GETDATE()
WHERE [IdIvaProducto] = @IdIvaProducto










GO
/****** Object:  StoredProcedure [dbo].[IvaProductoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IvaProductoInsert]
(
	@PorcentajeIvaProd INT
)

AS

SET NOCOUNT ON

INSERT INTo [IvaProducto]
(
	[PorcentajeIvaProd]
)
VALUES
(
	@PorcentajeIvaProd
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[IvaProductoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IvaProductoSelect]
(
	@IdIvaProducto INT
)

AS

SET NOCOUNT ON

SELECT [IdIvaProducto],
	[PorcentajeIvaProd],
	[FecBaja]
FROM [IvaProducto]
WHERE [IdIvaProducto] = @IdIvaProducto










GO
/****** Object:  StoredProcedure [dbo].[IvaProductoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IvaProductoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdIvaProducto],
	[PorcentajeIvaProd],
	[FecBaja]
FROM [IvaProducto]










GO
/****** Object:  StoredProcedure [dbo].[IvaProductoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IvaProductoUPDATE]
(
	@IdIvaProducto INT,
	@PorcentajeIvaProd INT
)

AS

SET NOCOUNT ON

UPDATE [IvaProducto]
SET [PorcentajeIvaProd] = @PorcentajeIvaProd
WHERE [IdIvaProducto] = @IdIvaProducto










GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeControlDelete]
(
	@Texto varchar(400),
	@IdLenguaje INT
)

AS

SET NOCOUNT ON


UPDATE [LenguajeControl]
SET FecBaja = GETDATE()
WHERE [Texto] = @Texto
	and [IdLenguaje] = @IdLenguaje










GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlDeleteAllByIdLenguaje]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeControlDeleteAllByIdLenguaje]
(
	@IdLenguaje INT
)

AS

SET NOCOUNT ON



UPDATE [LenguajeControl]
SET FecBaja = GETDATE()
WHERE [IdLenguaje] = @IdLenguaje










GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LenguajeControlInsert]
(
	@Texto varchar(400),
	@IdLenguaje INT,
	@Valor varchar(400),
	@CUIT varchar(50)
)

AS

SET NOCOUNT ON

INSERT INTo [LenguajeControl]
(
	[Texto],
	[IdLenguaje],
	[Valor],
	[CUIT]
)
VALUES
(
	@Texto,
	@IdLenguaje,
	@Valor,
	@CUIT
)












GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LenguajeControlSelect]
(
	@Texto varchar(400),
	@IdLenguaje INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [Texto],
	[IdLenguaje],
	[Valor],
	[CUIT],
	[FecBaja]
FROM [LenguajeControl]
WHERE [Texto] = @Texto
	and [IdLenguaje] = @IdLenguaje and LTRIM(RTRIM([CUIT]))=LTRIM(RTRIM(@CUIT))












GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LenguajeControlSelectAll]

AS

SET NOCOUNT ON

SELECT [Texto],
	[IdLenguaje],
	[Valor],
	[CUIT],
	[FecBaja]
FROM [LenguajeControl]












GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAllByIdLenguaje]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LenguajeControlSelectAllByIdLenguaje]
(
	@IdLenguaje INT
)

AS

SET NOCOUNT ON

SELECT [Texto],
	[IdLenguaje],
	[Valor],
	[CUIT],
	[FecBaja]
FROM [LenguajeControl]
WHERE [IdLenguaje] = @IdLenguaje












GO
/****** Object:  StoredProcedure [dbo].[LenguajeControlUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LenguajeControlUPDATE]
(
	@Texto varchar(400),
	@IdLenguaje INT,
	@Valor varchar(400),
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

UPDATE [LenguajeControl]
SET [Valor] = @Valor
WHERE [Texto] = @Texto	and [IdLenguaje] = @IdLenguaje and [CUIT] = @CUIT












GO
/****** Object:  StoredProcedure [dbo].[LenguajeDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeDelete]
(
	@IdLenguaje INT
)

AS

SET NOCOUNT ON



UPDATE [Lenguaje]
SET FecBaja = GETDATE()
WHERE [IdLenguaje] = @IdLenguaje










GO
/****** Object:  StoredProcedure [dbo].[LenguajeInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeInsert]
(
	@DescripcionLenguaje varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [Lenguaje]
(
	[DescripcionLenguaje]
)
VALUES
(
	@DescripcionLenguaje
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[LenguajeSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeSelect]
(
	@IdLenguaje INT
)

AS

SET NOCOUNT ON

SELECT [IdLenguaje],
	[DescripcionLenguaje],
	[FecBaja]
FROM [Lenguaje]
WHERE [IdLenguaje] = @IdLenguaje










GO
/****** Object:  StoredProcedure [dbo].[LenguajeSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeSelectAll]

AS

SET NOCOUNT ON

SELECT [IdLenguaje],
	[DescripcionLenguaje],
	[FecBaja]
FROM [Lenguaje]










GO
/****** Object:  StoredProcedure [dbo].[LenguajeUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LenguajeUPDATE]
(
	@IdLenguaje INT,
	@DescripcionLenguaje varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Lenguaje]
SET [DescripcionLenguaje] = @DescripcionLenguaje
WHERE [IdLenguaje] = @IdLenguaje










GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosDelete]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdProducto int
)

AS

SET NOCOUNT ON



UPDATE [ListaDeseos]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
AND NombreUsuario = @NombreUsuario
AND	IdProducto = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON




UPDATE [ListaDeseos]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosInsert]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdProducto int
)

AS

SET NOCOUNT ON

INSERT INTo [ListaDeseos]
(
	[CUIT],
	[NombreUsuario],
	[IdProducto]
)
VALUES
(
	@CUIT,
	@NombreUsuario,
	@IdProducto
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosSelect]
(
	@CUIT varchar(50),
	@NombreUsuario varchar(100),
	@IdProducto int
)

AS

SET NOCOUNT ON

SELECT *
FROM [ListaDeseos]
WHERE CUIT = @CUIT 
AND NombreUsuario = @NombreUsuario
AND IdProducto = @IdProducto
AND FecBaja is null 










GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosSelectAll]

AS

SET NOCOUNT ON

SELECT *
FROM [ListaDeseos]
where FecBaja is null 










GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

SELECT *
FROM [ListaDeseos]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and FecBaja is null









GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaDeseosUPDATE]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdProducto int
)

AS

SET NOCOUNT ON

UPDATE [ListaDeseos]
SET [CUIT] = @CUIT,
	NombreUsuario = @NombreUsuario,
	IdProducto = @IdProducto
WHERE [CUIT] = @CUIT
AND NombreUsuario = @NombreUsuario
AND	IdProducto = @IdProducto









GO
/****** Object:  StoredProcedure [dbo].[MarcaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarcaDelete]
(
	@IdMarca INT
)

AS

SET NOCOUNT ON


UPDATE [Marca]
SET FecBaja = GETDATE()
WHERE [IdMarca] = @IdMarca










GO
/****** Object:  StoredProcedure [dbo].[MarcaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarcaInsert]
(
	@DescripcionMarca varchar(50)
)

AS

SET NOCOUNT ON

INSERT INTo [Marca]
(
	[DescripcionMarca]
)
VALUES
(
	@DescripcionMarca
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[MarcASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarcASelect]
(
	@IdMarca INT
)

AS

SET NOCOUNT ON

SELECT [IdMarca],
	[DescripcionMarca],
	[FecBaja]
FROM [Marca]
WHERE [IdMarca] = @IdMarca










GO
/****** Object:  StoredProcedure [dbo].[MarcASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarcASelectAll]

AS

SET NOCOUNT ON

SELECT [IdMarca],
	[DescripcionMarca],
	[FecBaja]
FROM [Marca]










GO
/****** Object:  StoredProcedure [dbo].[MarcaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarcaUPDATE]
(
	@IdMarca INT,
	@DescripcionMarca varchar(50)
)

AS

SET NOCOUNT ON

UPDATE [Marca]
SET [DescripcionMarca] = @DescripcionMarca
WHERE [IdMarca] = @IdMarca










GO
/****** Object:  StoredProcedure [dbo].[ModificarMailConfig]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarMailConfig]
(
	@unMail varchar(300),
	@unPass nvarchar(300),
	@unPuerto int,
	@unHost varchar(50),
	@unSSL bit
	
)

AS
BEGIN

UPDATE ConfigMailHost
SET Remitente = @unMail, 
	Remps = @unPass,
	Puerto = @unPuerto,
	Host = @unHost,
	Ssl = @unSSL

END



GO
/****** Object:  StoredProcedure [dbo].[MonedaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaDelete]
(
	@IdMoneda INT
)

AS

SET NOCOUNT ON


UPDATE [Moneda]
SET FecBaja = GETDATE()
WHERE [IdMoneda] = @IdMoneda










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresaDelete]
(
	@IdMoneda INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON



UPDATE [MonedaEmpresa]
SET FecBaja = GETDATE()
WHERE [IdMoneda] = @IdMoneda
	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresaDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON



UPDATE [MonedaEmpresa]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByIdMoneda]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresaDeleteAllByIdMoneda]
(
	@IdMoneda INT
)

AS

SET NOCOUNT ON


UPDATE [MonedaEmpresa]
SET FecBaja = GETDATE()
WHERE [IdMoneda] = @IdMoneda










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresaInsert]
(
	@IdMoneda INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

INSERT INTo [MonedaEmpresa]
(
	[IdMoneda],
	[CUIT]
)
VALUES
(
	@IdMoneda,
	@CUIT
)











GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresASelect]
(
	@IdMoneda INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [MonedaEmpresa]
WHERE [IdMoneda] = @IdMoneda
	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresASelectAll]

AS

SET NOCOUNT ON

SELECT [IdMoneda],
	[CUIT],
	[FecBaja]
FROM [MonedaEmpresa]










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresASelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [MonedaEmpresa]
WHERE [CUIT] = @CUIT











GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAllByIdMoneda]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresASelectAllByIdMoneda]
(
	@IdMoneda INT
)

AS

SET NOCOUNT ON

SELECT [IdMoneda],
	[CUIT],
	[FecBaja]
FROM [MonedaEmpresa]
WHERE [IdMoneda] = @IdMoneda










GO
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedaEmpresaUPDATE]
(
	@IdMoneda INT,
	@CUIT VARCHAR(50),
	@Cotizacion decimal(5,2)
)

AS

SET NOCOUNT ON

UPDATE [MonedaEmpresa]
SET Cotizacion = @Cotizacion,
	Fecha=getDate()
WHERE [IdMoneda] = @IdMoneda	and [CUIT] = @CUIT
GO
/****** Object:  StoredProcedure [dbo].[MonedaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MonedaInsert]
(
	@Nombre nvarchar(50),
	@SimboloMoneda nvarchar(3),
	@Url varchar(50)
)

AS

SET NOCOUNT ON

INSERT INTo [Moneda]
(
	[Nombre],
	[SimboloMoneda],
	[Url]
)
VALUES
(
	@Nombre,
	@SimboloMoneda,
	@Url
)


GO
/****** Object:  StoredProcedure [dbo].[MonedASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedASelect]
(
	@IdMoneda INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [Moneda]
WHERE [IdMoneda] = @IdMoneda
GO
/****** Object:  StoredProcedure [dbo].[MonedASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MonedASelectAll]

AS

SET NOCOUNT ON

SELECT [IdMoneda],
	[Nombre],
	[SimboloMoneda],
	[FecBaja]
FROM [Moneda]




GO
/****** Object:  StoredProcedure [dbo].[MonedaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MonedaUPDATE]
(
	@IdMoneda INT,
	@Nombre nvarchar(50),
	@SimboloMoneda nvarchar(3)
)

AS

SET NOCOUNT ON

UPDATE [Moneda]
SET [Nombre] = @Nombre,
	[SimboloMoneda] = @SimboloMoneda
WHERE [IdMoneda] = @IdMoneda







GO
/****** Object:  StoredProcedure [dbo].[PagoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoDelete]
(
	@IdPago INT
)

AS

SET NOCOUNT ON



UPDATE [Pago]
SET FecBaja = GETDATE()
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON


UPDATE [Pago]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdFormaPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoDeleteAllByIdFormaPago]
(
	@IdFormaPago INT
)

AS

SET NOCOUNT ON



UPDATE [Pago]
SET FecBaja = GETDATE()
WHERE [IdFormaPago] = @IdFormaPago










GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoDeleteAllByIdPedido]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON



UPDATE [Pago]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdTarjeta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoDeleteAllByIdTarjeta]
(
	@IdTarjeta INT
)

AS

SET NOCOUNT ON



UPDATE [Pago]
SET FecBaja = GETDATE()
WHERE [IdTarjeta] = @IdTarjeta










GO
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON




UPDATE [Pago]
SET FecBaja = GETDATE()
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoDelete]
(
	@IdEstadoPago INT,
	@IdPago INT
)

AS

SET NOCOUNT ON



UPDATE [PagoEstadoPago]
SET FecBaja = GETDATE()
WHERE [IdEstadoPago] = @IdEstadoPago
	and [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDeleteAllByIdEstadoPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoDeleteAllByIdEstadoPago]
(
	@IdEstadoPago INT
)

AS

SET NOCOUNT ON



UPDATE [PagoEstadoPago]
SET FecBaja = GETDATE()
WHERE [IdEstadoPago] = @IdEstadoPago










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDeleteAllByIdPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoDeleteAllByIdPago]
(
	@IdPago INT
)

AS

SET NOCOUNT ON



UPDATE [PagoEstadoPago]
SET FecBaja = GETDATE()
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoInsert]
(
	@IdEstadoPago INT,
	@IdPago INT,
	@Fecha DATETIME,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

INSERT INTo [PagoEstadoPago]
(
	[IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
)
VALUES
(
	@IdEstadoPago,
	@IdPago,
	@Fecha,
	@FecBaja
)










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoSelect]
(
	@IdEstadoPago INT,
	@IdPago INT
)

AS

SET NOCOUNT ON

SELECT [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
FROM [PagoEstadoPago]
WHERE [IdEstadoPago] = @IdEstadoPago
	and [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
FROM [PagoEstadoPago]










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAllByIdEstadoPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoSelectAllByIdEstadoPago]
(
	@IdEstadoPago INT
)

AS

SET NOCOUNT ON

SELECT [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
FROM [PagoEstadoPago]
WHERE [IdEstadoPago] = @IdEstadoPago










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAllByIdPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoSelectAllByIdPago]
(
	@IdPago INT
)

AS

SET NOCOUNT ON

SELECT [IdEstadoPago],
	[IdPago],
	[Fecha],
	[FecBaja]
FROM [PagoEstadoPago]
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoEstadoPagoUPDATE]
(
	@IdEstadoPago INT,
	@IdPago INT,
	@Fecha DATETIME,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [PagoEstadoPago]
SET [Fecha] = @Fecha,
	[FecBaja] = @FecBaja
WHERE [IdEstadoPago] = @IdEstadoPago	and [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoInsert]
(
	@FechaPago DATETIME,
	@IdFormaPago INT,
	@MontoPago decimal(18, 0),
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50),
	@IdTarjeta INT
)

AS

SET NOCOUNT ON

INSERT INTo [Pago]
(
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[IdTarjeta]



)
VALUES
(
	@FechaPago,
	@IdFormaPago,
	@MontoPago,
	@NroComprobante,
	@IdSucursal,
	@IdTipoComprobante,
	@CUIT,
	@IdTarjeta
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[PagoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelect]
(
	@IdPago INT
)

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdFormaPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelectAllByIdFormaPago]
(
	@IdFormaPago INT
)

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]
WHERE [IdFormaPago] = @IdFormaPago










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelectAllByIdPedido]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdTarjeta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelectAllByIdTarjeta]
(
	@IdTarjeta INT
)

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]
WHERE [IdTarjeta] = @IdTarjeta










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]
(
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [IdPago],
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[NroComprobante],
	[IdSucursal],
	[IdTipoComprobante],
	[CUIT],
	[FecBaja],
	[IdTarjeta]
FROM [Pago]
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT
	
	








GO
/****** Object:  StoredProcedure [dbo].[PagoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoUPDATE]
(
	@IdPago INT,
	@IdPedido INT,
	@FechaPago DATETIME,
	@IdFormaPago INT,
	@MontoPago decimal(18, 0),
	@NroComprobante INT,
	@IdSucursal INT,
	@IdTipoComprobante INT,
	@CUIT VARCHAR(50),
	@FecBaja DATETIME,
	@IdTarjeta INT
)

AS

SET NOCOUNT ON

UPDATE [Pago]
SET [IdPedido] = @IdPedido,
	[FechaPago] = @FechaPago,
	[IdFormaPago] = @IdFormaPago,
	[MontoPago] = @MontoPago,
	[NroComprobante] = @NroComprobante,
	[IdSucursal] = @IdSucursal,
	[IdTipoComprobante] = @IdTipoComprobante,
	[CUIT] = @CUIT,
	[FecBaja] = @FecBaja,
	[IdTarjeta] = @IdTarjeta
	
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PatenteDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteDelete]
(
	@IdPatente INT
)

AS

SET NOCOUNT ON


UPDATE [Patente]
SET FecBaja = GETDATE()
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliaDelete]
(
	@IdPatente INT,
	@IdFamilia INT
)

AS

SET NOCOUNT ON




UPDATE [PatenteFamilia]
SET FecBaja = GETDATE()
WHERE [IdPatente] = @IdPatente
	and [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliaDeleteAllByIdFamilia]
(
	@IdFamilia INT
)

AS

SET NOCOUNT ON



UPDATE [PatenteFamilia]
SET FecBaja = GETDATE()
WHERE [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdPatente]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliaDeleteAllByIdPatente]
(
	@IdPatente INT
)

AS

SET NOCOUNT ON


UPDATE [PatenteFamilia]
SET FecBaja = GETDATE()
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliaInsert]
(
	@IdPatente INT,
	@IdFamilia INT
)

AS

SET NOCOUNT ON

INSERT INTo [PatenteFamilia]
(
	[IdPatente],
	[IdFamilia]
)
VALUES
(
	@IdPatente,
	@IdFamilia
)










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliASelect]
(
	@IdPatente INT,
	@IdFamilia INT
)

AS

SET NOCOUNT ON

SELECT [IdPatente],
	[IdFamilia],
	[FecBaja]
FROM [PatenteFamilia]
WHERE [IdPatente] = @IdPatente
	and [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliASelectAll]

AS

SET NOCOUNT ON

SELECT [IdPatente],
	[IdFamilia],
	[FecBaja]
FROM [PatenteFamilia]










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAllByIdFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliASelectAllByIdFamilia]
(
	@IdFamilia INT
)

AS

SET NOCOUNT ON

SELECT [IdPatente],
	[IdFamilia],
	[FecBaja]
FROM [PatenteFamilia]
WHERE [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAllByIdPatente]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliASelectAllByIdPatente]
(
	@IdPatente INT
)

AS

SET NOCOUNT ON

SELECT [IdPatente],
	[IdFamilia],
	[FecBaja]
FROM [PatenteFamilia]
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteFamiliaUPDATE]
(
	@IdPatente INT,
	@IdFamilia INT,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [PatenteFamilia]
SET [FecBaja] = @FecBaja
WHERE [IdPatente] = @IdPatente	and [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[PatenteInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteInsert]
(
	@NombrePatente varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [Patente]
(
	[NombrePatente]
)
VALUES
(
	@NombrePatente
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[PatenteSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteSelect]
(
	@IdPatente INT
)

AS

SET NOCOUNT ON

SELECT [IdPatente],
	[NombrePatente],
	[FecBaja]
FROM [Patente]
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[PatenteSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteSelectAll]

AS

SET NOCOUNT ON

SELECT [IdPatente],
	[NombrePatente],
	[FecBaja]
FROM [Patente]










GO
/****** Object:  StoredProcedure [dbo].[PatentesSelectByFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatentesSelectByFamilia]
@IdFamilia int
as
select patente.IdPatente,patente.NombrePatente from patente inner join PatenteFamilia on patente.IdPatente = PatenteFamilia.IdPatente where PatenteFamilia.IdFamilia = @IdFamilia

GO
/****** Object:  StoredProcedure [dbo].[PatenteUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatenteUPDATE]
(
	@IdPatente INT,
	@NombrePatente varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Patente]
SET [NombrePatente] = @NombrePatente
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[PedidoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDelete]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON

UPDATE [Pedido]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON


UPDATE [Pedido]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON


UPDATE [Pedido]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByIdFormaEntrega]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDeleteAllByIdFormaEntrega]
(
	@IdFormaEntrega INT
)

AS

SET NOCOUNT ON


UPDATE [Pedido]
SET FecBaja = GETDATE()
WHERE [IdFormaEntrega] = @IdFormaEntrega










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleDelete]
(
	@IdPedido INT,
	@IdPedidoDetalle INT
)

AS

SET NOCOUNT ON


UPDATE [PedidoDetalle]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleDeleteAllByIdPedido]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON


UPDATE [PedidoDetalle]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleDeleteAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [PedidoDetalle]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleInsert]
(
	@IdPedido INT,
	@Cantidad INT,
	@PrecioUnitario decimal(18, 0),
	@Descuento INT,
	@IdProducto INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

INSERT INTo [PedidoDetalle]
(
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[CUIT]
)
VALUES
(
	@IdPedido,
	@Cantidad,
	@PrecioUnitario,
	@Descuento,
	@IdProducto,
	@CUIT
)











GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleSelect]
(
	@IdPedido INT,
	@IdPedidoDetalle INT
)

AS

SET NOCOUNT ON

SELECT [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
FROM [PedidoDetalle]
WHERE [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleSelectAll]

AS

SET NOCOUNT ON

SELECT [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
FROM [PedidoDetalle]










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PedidoDetalleSelectAllByIdPedido]
(
@IdPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPedidoDetalle],
[IdPedido],
[Cantidad],
[PrecioUnitario],
[Descuento],
[IdProducto],
[FecBaja],
[CUIT]
FROM [PedidoDetalle]
WHERE [IdPedido] = @IdPedido
GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleSelectAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

SELECT [IdPedidoDetalle],
	[IdPedido],
	[Cantidad],
	[PrecioUnitario],
	[Descuento],
	[IdProducto],
	[FecBaja]
FROM [PedidoDetalle]
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleUPDATE]
(
	@IdPedidoDetalle INT,
	@IdPedido INT,
	@Cantidad INT,
	@PrecioUnitario decimal(18, 0),
	@Descuento INT,
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [PedidoDetalle]
SET [Cantidad] = @Cantidad,
	[PrecioUnitario] = @PrecioUnitario,
	[Descuento] = @Descuento,
	[IdProducto] = @IdProducto
WHERE [IdPedido] = @IdPedido	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoDelete]
(
	@IdPedido INT,
	@IdEstadoPedido INT
)

AS

SET NOCOUNT ON

UPDATE [PedidoEstadoPedido]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido
	and [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdEstadoPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoDeleteAllByIdEstadoPedido]
(
	@IdEstadoPedido INT
)

AS

SET NOCOUNT ON

UPDATE [PedidoEstadoPedido]
SET FecBaja = GETDATE()
WHERE [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoDeleteAllByIdPedido]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON

UPDATE [PedidoEstadoPedido]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoInsert]
(
	@IdPedido INT,
	@IdEstadoPedido INT,
	@Fecha DATETIME,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

INSERT INTo [PedidoEstadoPedido]
(
	[IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
)
VALUES
(
	@IdPedido,
	@IdEstadoPedido,
	@Fecha,
	@FecBaja
)










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsertFin]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoInsertFin]
(
	@IdPedido INT,
	@IdEstadoPedido INT,
	@Fecha DATETIME
)

AS

SET NOCOUNT ON

INSERT INTo [PedidoEstadoPedido]
(
	[IdPedido],
	[IdEstadoPedido],
	[Fecha]
)
VALUES
(
	@IdPedido,
	@IdEstadoPedido,
	@Fecha
)










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoSelect]
(
	@IdPedido INT,
	@IdEstadoPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
FROM [PedidoEstadoPedido]
WHERE [IdPedido] = @IdPedido
	and [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
FROM [PedidoEstadoPedido]










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdEstadoPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoSelectAllByIdEstadoPedido]
(
	@IdEstadoPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
FROM [PedidoEstadoPedido]
WHERE [IdEstadoPedido] = @IdEstadoPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoSelectAllByIdPedido]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[IdEstadoPedido],
	[Fecha],
	[FecBaja]
FROM [PedidoEstadoPedido]
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoEstadoPedidoUPDATE]
(
	@IdPedido INT,
	@IdEstadoPedido INT,
	@Fecha DATETIME
)

AS

SET NOCOUNT ON

UPDATE [PedidoEstadoPedido]
SET [IdEstadoPedido] = @IdEstadoPedido,
[Fecha] = @Fecha
WHERE [IdPedido] = @IdPedido











GO
/****** Object:  StoredProcedure [dbo].[PedidoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoInsert]
(
	@FechaPedido DATETIME,
	@FechaFinPedido DATETIME,
	@NombreUsuario varchar(100),
	@PlazoEntrega INT,
	@IdFormaEntrega INT,
	@CUIT VARCHAR(50),
	@NumeroTracking varchar(50),
	@DireccionEntrega INT,
	@NroPedido BIGINT
)

AS

SET NOCOUNT ON

INSERT INTo [Pedido]
(
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[NroPedido]
)
VALUES
(
	@FechaPedido,
	@FechaFinPedido,
	@NombreUsuario,
	@PlazoEntrega,
	@IdFormaEntrega,
	@CUIT,
	@NumeroTracking,
	@DireccionEntrega,
	@NroPedido
)

SELECT SCOPE_IDENTITY()











GO
/****** Object:  StoredProcedure [dbo].[PedidoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelect]
(
	@IdPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
FROM [Pedido]
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
FROM [Pedido]










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Pedido]
WHERE [CUIT] = @CUIT


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja],
	[NroPedido]
FROM [Pedido]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByDireccionEntrega]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectAllByDireccionEntrega]
(
	@DireccionEntrega INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
FROM [Pedido]
WHERE [DireccionEntrega] = @DireccionEntrega










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByIdFormaEntrega]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectAllByIdFormaEntrega]
(
	@IdFormaEntrega INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	[PlazoEntrega],
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
FROM [Pedido]
WHERE [IdFormaEntrega] = @IdFormaEntrega










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectByCUIT_IDPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectByCUIT_IDPedido]
(
@elCuit VARCHAR(50),
@elIdPedido bigint
)

AS


SELECT *
FROM [Pedido]
WHERE [CUIT] = LTRIM(RTRIM(@elCuit)) AND
     IdPedido = @elIdPedido

GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectByCUIT_NroPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[PedidoSelectByCUIT_NroPedido]
(
@CUIT VARCHAR(50),
@NroPedido bigint
)

AS

SET NOCOUNT ON

SELECT *
FROM [Pedido]
WHERE [CUIT] = LTRIM(RTRIM(@CUIT)) AND
     [NroPedido] = @NroPedido

GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectMAXNroPedidoByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[PedidoSelectMAXNroPedidoByCUIT]
(
@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT MAX(NroPedido)
FROM [Pedido]
WHERE [CUIT] = @CUIT



GO
/****** Object:  StoredProcedure [dbo].[PedidoTraerEstadoActual]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoTraerEstadoActual]
(
@IdPedido INT
)

AS

SELECT TOP 1 est.IdEstadoPedido, est.DescripcionEstadoPedido
FROM PedidoEstadoPedido pdp
INNER JOIN EstadoPedido est ON pdp.IdEstadoPedido = est.IdEstadoPedido
WHERE IdPedido = @IdPedido
order by pdp.Fecha desc
GO
/****** Object:  StoredProcedure [dbo].[PedidoUltimoEstadoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoUltimoEstadoSelect]
(
@IdPedido INT
)

AS

SET NOCOUNT ON

SELECT [IdPedido],
[IdEstadoPedido],
MAX([Fecha]) as Fecha
FROM [PedidoEstadoPedido]
WHERE [IdPedido] = @IdPedido
GROUP BY IdPedido,IdEstadoPedido,Fecha
GO
/****** Object:  StoredProcedure [dbo].[PedidoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoUPDATE]
(
	@IdPedido INT,
	@FechaPedido DATETIME,
	@FechaFinPedido DATETIME,
	@NombreUsuario varchar(100),
	@PlazoEntrega INT,
	@IdFormaEntrega INT,
	@CUIT VARCHAR(50),
	@NumeroTracking varchar(50),
	@DireccionEntrega INT
)

AS

SET NOCOUNT ON

UPDATE [Pedido]
SET [FechaPedido] = @FechaPedido,
	[FechaFinPedido] = @FechaFinPedido,
	[NombreUsuario] = @NombreUsuario,
	[PlazoEntrega] = @PlazoEntrega,
	[IdFormaEntrega] = @IdFormaEntrega,
	[CUIT] = @CUIT,
	[NumeroTracking] = @NumeroTracking,
	[DireccionEntrega] = @DireccionEntrega
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProdCategoriaDelete]
(
	@IdProducto INT,
	@IdCategoria INT
)

AS

SET NOCOUNT ON


UPDATE [ProdCategoria]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto
	and [IdCategoria] = @IdCategoria










GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProdCategoriaDeleteAllByIdCategoria]
(
	@IdCategoria INT
)

AS

SET NOCOUNT ON

UPDATE [ProdCategoria]
SET FecBaja = GETDATE()
WHERE [IdCategoria] = @IdCategoria










GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProdCategoriaDeleteAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [ProdCategoria]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProdCategoriaInsert]
(
	@IdProducto INT,
	@IdCategoria INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

INSERT INTo [ProdCategoria]
(
	[IdProducto],
	[IdCategoria],
	[CUIT]
)
VALUES
(
	@IdProducto,
	@IdCategoria,
	@CUIT
)












GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProdCategoriASelect]
(
	@IdProducto INT,
	@IdCategoria INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [ProdCategoria]
WHERE [IdProducto] = @IdProducto
	and [IdCategoria] = @IdCategoria
	











GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProdCategoriASelectAll]

AS

SET NOCOUNT ON

SELECT *
FROM [ProdCategoria]












GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAllByIdCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProdCategoriASelectAllByIdCategoria]
(
	@IdCategoria INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [ProdCategoria]
WHERE [IdCategoria] = @IdCategoria












GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProdCategoriASelectAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [ProdCategoria]
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProdCategoriaUPDATE]
(
	@IdProducto INT,
	@IdCategoria INT,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [ProdCategoria]
SET [FecBaja] = @FecBaja
WHERE [IdProducto] = @IdProducto	and [IdCategoria] = @IdCategoria










GO
/****** Object:  StoredProcedure [dbo].[ProductoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoDelete]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [Producto]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

UPDATE [Producto]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdIvaProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoDeleteAllByIdIvaProducto]
(
	@IdIvaProducto INT
)

AS

SET NOCOUNT ON

UPDATE [Producto]
SET FecBaja = GETDATE()
WHERE [IdIvaProducto] = @IdIvaProducto










GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdMarca]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoDeleteAllByIdMarca]
(
	@IdMarca INT
)

AS

SET NOCOUNT ON

UPDATE [Producto]
SET FecBaja = GETDATE()
WHERE [IdMarca] = @IdMarca










GO
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoDeleteAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [Producto]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ProductoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoInsert]
(
	@CodigoProducto varchar(50),
	@PrecioUnitario decimal(18, 0),
	@IdMarca INT,
	@CUIT VARCHAR(50),
	@IdIvaProducto INT,
	@DescripProducto varchar(300),
	@URL varchar(500)
)

AS

SET NOCOUNT ON

INSERT INTo [Producto]
(
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL]
)
VALUES
(
	@CodigoProducto,
	@PrecioUnitario,
	@IdMarca,
	@CUIT,
	@IdIvaProducto,
	@DescripProducto,
	@URL
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[ProductoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelect]
(
	@CUIT varchar(50),
	@IdProducto int
)

as

set nocount on

SELECT *
FROM Producto
WHERE CUIT = @CUIT
AND IdProducto = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectAll]

AS

SET NOCOUNT ON

SELECT *
FROM [Producto]
--and fecbaja is null



GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Producto]
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdIvaProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectAllByIdIvaProducto]
(
	@IdIvaProducto INT
)

AS

SET NOCOUNT ON

SELECT [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
FROM [Producto]
WHERE [IdIvaProducto] = @IdIvaProducto










GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdMarca]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectAllByIdMarca]
(
	@IdMarca INT
)

AS

SET NOCOUNT ON

SELECT [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
FROM [Producto]
WHERE [IdMarca] = @IdMarca










GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

SELECT [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja]
FROM [Producto]
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectByCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProductoSelectByCategoria]
(
	@CUIT VARCHAR(50),
	@IdCategoria int
)

AS

SET NOCOUNT ON

SELECT *
FROM [Producto] Pro
INNER JOIN ProdCategoria ProdCat ON Pro.IdProducto = ProdCat.IdProducto AND Pro.CUIT = ProdCat.CUIT
WHERE ProdCat.CUIT = @CUIT 
and ProdCat.IdCategoria = @IdCategoria
and ProdCat.FecBaja is null
and Pro.FecBaja is null













GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectByDescripProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ProductoSelectByDescripProducto]
(
	@CUIT varchar(50),
	@DescripProducto varchar(300)
)

as

set nocount on

SELECT *
FROM Producto
WHERE CUIT = @CUIT
AND UPPER(DescripProducto) LIKE UPPER('%'+@DescripProducto+'%')








GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectByIdProductoCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[ProductoSelectByIdProductoCUIT]
(
	@CUIT varchar(50),
	@IdProducto int
)

as

set nocount on

SELECT *
FROM Producto
WHERE CUIT = @CUIT
AND IdProducto = @IdProducto








GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectMasVendidosByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectMasVendidosByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

--6 Productos mas vendidos
SELECT *
FROM Producto
WHERE Producto.IdProducto in (
		--Productos con mas cantidades en PedidoDetalle
		SELECT TOP 6 PDet.IdProducto
		FROM Producto Pro
		INNER JOIN PedidoDetalle PDet ON PDet.IdProducto = pro.IdProducto AND PDet.CUIT = pro.CUIT
		INNER JOIN Pedido Ped ON Ped.IdPedido = Pdet.IdPedido
		INNER JOIN PedidoEstadoPedido PEP ON PEP.IdPedido = Ped.IdPedido
		INNER JOIN EstadoPedido Est ON Est.IdEstadoPedido = PEP.IdEstadoPedido
		WHERE ped.CUIT = @CUIT AND est.DescripcionEstadoPedido LIKE ('Finalizado')
		Group By Pdet.IdProducto
		ORDER By SUM(Pdet.Cantidad) DESC
	)









GO
/****** Object:  StoredProcedure [dbo].[ProductoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ProductoUPDATE]
(
	@IdProducto INT,
	@CodigoProducto varchar(50),
	@PrecioUnitario decimal(18, 0),
	@IdMarca INT,
	@CUIT VARCHAR(50),
	@IdIvaProducto INT,
	@DescripProducto varchar(100),
	@URL varchar(500),
	@DescripLarga varchar(400)
)

AS

SET NOCOUNT ON

UPDATE [Producto]
SET [CodigoProducto] = @CodigoProducto,
	[PrecioUnitario] = @PrecioUnitario,
	[IdMarca] = @IdMarca,
	[CUIT] = @CUIT,
	[IdIvaProducto] = @IdIvaProducto,
	[DescripProducto] = @DescripProducto,
	[URL] = @URL,
	[DescripLarga]= @DescripLarga
	WHERE [IdProducto] = @IdProducto












GO
/****** Object:  StoredProcedure [dbo].[ProvinciaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProvinciaDelete]
(
	@IdProvincia INT
)

AS

SET NOCOUNT ON

UPDATE [Provincia]
SET FecBaja = GETDATE()
WHERE [IdProvincia] = @IdProvincia










GO
/****** Object:  StoredProcedure [dbo].[ProvinciaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProvinciaInsert]
(
	@IdProvincia INT,
	@DescripcionProvincia varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [Provincia]
(
	[IdProvincia],
	[DescripcionProvincia]
)
VALUES
(
	@IdProvincia,
	@DescripcionProvincia
)










GO
/****** Object:  StoredProcedure [dbo].[ProvinciASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProvinciASelect]
(
	@IdProvincia INT
)

AS

SET NOCOUNT ON

SELECT [IdProvincia],
	[DescripcionProvincia],
	[FecBaja]
FROM [Provincia]
WHERE [IdProvincia] = @IdProvincia










GO
/****** Object:  StoredProcedure [dbo].[ProvinciASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProvinciASelectAll]

AS

SET NOCOUNT ON

SELECT [IdProvincia],
	[DescripcionProvincia],
	[FecBaja]
FROM [Provincia]










GO
/****** Object:  StoredProcedure [dbo].[ProvinciaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProvinciaUPDATE]
(
	@IdProvincia INT,
	@DescripcionProvincia varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Provincia]
SET [DescripcionProvincia] = @DescripcionProvincia
WHERE [IdProvincia] = @IdProvincia










GO
/****** Object:  StoredProcedure [dbo].[rankingEmpresas]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rankingEmpresas]
@CUIT varchar(50)
as
begin
select * from usuario us
where us.CUIT=@CUIT
and us.NombreUsuario 
in( select top 5 ped.NombreUsuario 
from pedido ped
inner join pedidoestadopedido pedEsPed
on pedEsPed.IdPedido= ped.IdPedido
inner join EstadoPedido esPed 
on esPed.IdEstadoPedido=pedEsPed.IdEstadoPedido
where ped.CUIT=@CUIT
and esPed.DescripcionEstadoPedido like('Finalizado')
group by ped.NombreUsuario
order by count(ped.NombreUsuario) desc
)
end
GO
/****** Object:  StoredProcedure [dbo].[RecursoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RecursoDelete]
@CUIT varchar(50),
@Recurso varchar(30)
as
begin
	update Recurso
set Activo=0
where CUIT like @CUIT and Recurso like @Recurso
end
GO
/****** Object:  StoredProcedure [dbo].[RecursoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RecursoInsert]
@CUIT varchar(50),
@Recurso varchar(30),
@Url varchar(200)
as
begin

insert into Recurso values(@CUIT, @Recurso, @Url,1)
end

GO
/****** Object:  StoredProcedure [dbo].[RecursoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RecursoSelectAll]
as
begin
select * from Recurso
end

GO
/****** Object:  StoredProcedure [dbo].[RecursoUpdate]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RecursoUpdate]
@CUIT varchar(50),
@Recurso varchar(30),
@Url varchar(200)
as
begin
update Recurso
set 
	Url=@Url,
	Recurso=@Recurso
	where CUIT like @CUIT and Recurso like @Recurso

end
GO
/****** Object:  StoredProcedure [dbo].[ReportePedidosDeUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ReportePedidosDeUsuario]
@CUIT varchar(50),
@Usuario varchar(50)
as
select NroPedido as 'Pedido',FechaPedido as 'Fecha', ep.DescripcionEstadoPedido as 'Estado' from pedido p inner join PedidoEstadoPedido pep on p.IdPedido=pep.IdPedido inner join EstadoPedido ep on ep.IdEstadoPedido = pep.IdEstadoPedido
where NombreUsuario=ltrim(rtrim(@Usuario)) and CUIT=ltrim(rtrim(@CUIT))

GO
/****** Object:  StoredProcedure [dbo].[ReportePedidosPorFechayEstado]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ReportePedidosPorFechayEstado]
@CUIT varchar(50)
as

SELECT NroPedido as 'Pedido',Fecha, NombreUsuario as 'Usuario',EstadoPedido.DescripcionEstadoPedido as 'Estado' FROM pedido inner join FormaEntrega on pedido.IdFormaEntrega = FormaEntrega.IdFormaEntrega inner join PedidoEstadoPedido on pedido.IdPedido = PedidoEstadoPedido.IdPedido inner join EstadoPedido on EstadoPedido.IdEstadoPedido = PedidoEstadoPedido.IdEstadoPedido
where LTRIM(RTRIM(pedido.CUIT)) = LTRIM(RTRIM(@CUIT))
order by Fecha desc

GO
/****** Object:  StoredProcedure [dbo].[ReservaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservaDelete]
(
	@IdReserva INT
)

AS

SET NOCOUNT ON

UPDATE [Reserva]
SET FecBaja = GETDATE()
WHERE [IdReserva] = @IdReserva










GO
/****** Object:  StoredProcedure [dbo].[ReservaDeleteAllByIdPedido_IdPedidoDetalle]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservaDeleteAllByIdPedido_IdPedidoDetalle]
(
	@IdPedido INT,
	@IdPedidoDetalle INT
)

AS

SET NOCOUNT ON

UPDATE [Reserva]
SET FecBaja = GETDATE()
WHERE [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[ReservaDeleteAllByIdSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservaDeleteAllByIdSucursal]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

UPDATE [Reserva]
SET FecBaja = GETDATE()
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[ReservaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservaInsert]
(
	@IdPedido INT,
	@IdPedidoDetalle INT,
	@IdSucursal INT,
	@Activo bit,
	@Fecha DATETIME
)

AS

SET NOCOUNT ON

INSERT INTo [Reserva]
(
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha]
)
VALUES
(
	@IdPedido,
	@IdPedidoDetalle,
	@IdSucursal,
	@Activo,
	@Fecha
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[ReservASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservASelect]
(
	@IdReserva INT
)

AS

SET NOCOUNT ON

SELECT [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
FROM [Reserva]
WHERE [IdReserva] = @IdReserva










GO
/****** Object:  StoredProcedure [dbo].[ReservASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservASelectAll]

AS

SET NOCOUNT ON

SELECT [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
FROM [Reserva]










GO
/****** Object:  StoredProcedure [dbo].[ReservASelectAllByIdPedido_IdPedidoDetalle]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservASelectAllByIdPedido_IdPedidoDetalle]
(
	@IdPedido INT,
	@IdPedidoDetalle INT
)

AS

SET NOCOUNT ON

SELECT [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
FROM [Reserva]
WHERE [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[ReservASelectAllByIdSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservASelectAllByIdSucursal]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

SELECT [IdReserva],
	[IdPedido],
	[IdPedidoDetalle],
	[IdSucursal],
	[Activo],
	[Fecha],
	[FecBaja]
FROM [Reserva]
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[ReservaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReservaUPDATE]
(
	@IdReserva INT,
	@IdPedido INT,
	@IdPedidoDetalle INT,
	@IdSucursal INT,
	@Activo bit,
	@Fecha DATETIME
)

AS

SET NOCOUNT ON

UPDATE [Reserva]
SET [IdPedido] = @IdPedido,
	[IdPedidoDetalle] = @IdPedidoDetalle,
	[IdSucursal] = @IdSucursal,
	[Activo] = @Activo,
	[Fecha] = @Fecha
WHERE [IdReserva] = @IdReserva










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalDelete]
(
	@IdProducto INT,
	@IdSucursal INT
)

AS

SET NOCOUNT ON

UPDATE [StockSucursal]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto
	and [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalDeleteAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [StockSucursal]
SET FecBaja = GETDATE()
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalDeleteAllByIdSucursal]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

UPDATE [StockSucursal]
SET FecBaja = GETDATE()
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalInsert]
(
	@IdProducto INT,
	@IdSucursal INT,
	@CantidadProducto INT,
	@CUIT varchar(50)
)

AS

SET NOCOUNT ON

INSERT INTo [StockSucursal]
(
	[IdProducto],
	[IdSucursal],
	[CantidadProducto]
	,[CUIT]
)
VALUES
(
	@IdProducto,
	@IdSucursal,
	@CantidadProducto,
	@CUIT
)










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalSelect]
(
	@IdProducto INT,
	@IdSucursal INT
)

AS

SET NOCOUNT ON

SELECT [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
FROM [StockSucursal]
WHERE [IdProducto] = @IdProducto
	and [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalSelectAll]

AS

SET NOCOUNT ON

SELECT [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
FROM [StockSucursal]










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalSelectAllByIdProducto]
(
	@IdProducto INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [StockSucursal]
WHERE [IdProducto] = @IdProducto










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalSelectAllByIdSucursal]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

SELECT [IdProducto],
	[IdSucursal],
	[CantidadProducto],
	[FecBaja]
FROM [StockSucursal]
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StockSucursalUPDATE]
(
	@IdProducto INT,
	@IdSucursal INT,
	@CantidadProducto INT
)

AS

SET NOCOUNT ON

UPDATE [StockSucursal]
SET [CantidadProducto] = @CantidadProducto
WHERE [IdProducto] = @IdProducto	and [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[SucursalDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalDelete]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

UPDATE [Sucursal]
SET FecBaja = GETDATE()
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

UPDATE [Sucursal]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByDireccionSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalDeleteAllByDireccionSucursal]
(
	@DireccionSucursal INT
)

AS

SET NOCOUNT ON

UPDATE [Sucursal]
SET FecBaja = GETDATE()
WHERE [DireccionSucursal] = @DireccionSucursal










GO
/****** Object:  StoredProcedure [dbo].[SucursalInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalInsert]
(
	@DescripSucursal varchar(200),
	@DireccionSucursal INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

INSERT INTo [Sucursal]
(
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT]
)
VALUES
(
	@DescripSucursal,
	@DireccionSucursal,
	@CUIT
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[SucursalSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalSelect]
(
	@IdSucursal INT
)

AS

SET NOCOUNT ON

SELECT [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
FROM [Sucursal]
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[SucursalSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalSelectAll]

AS

SET NOCOUNT ON

SELECT [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
FROM [Sucursal]










GO
/****** Object:  StoredProcedure [dbo].[SucursalSelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
FROM [Sucursal]
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[SucursalSelectAllByDireccionSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalSelectAllByDireccionSucursal]
(
	@DireccionSucursal INT
)

AS

SET NOCOUNT ON

SELECT [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
FROM [Sucursal]
WHERE [DireccionSucursal] = @DireccionSucursal










GO
/****** Object:  StoredProcedure [dbo].[SucursalUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalUPDATE]
(
	@IdSucursal INT,
	@DescripSucursal varchar(200),
	@DireccionSucursal INT,
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

UPDATE [Sucursal]
SET [DescripSucursal] = @DescripSucursal,
	[DireccionSucursal] = @DireccionSucursal,
	[CUIT] = @CUIT
WHERE [IdSucursal] = @IdSucursal










GO
/****** Object:  StoredProcedure [dbo].[TarjetaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetaDelete]
(
	@IdTarjeta INT
)

AS

SET NOCOUNT ON

UPDATE [Tarjeta]
SET FecBaja = GETDATE()
WHERE [IdTarjeta] = @IdTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetaDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

UPDATE [Tarjeta]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByIdTipoTarjeta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetaDeleteAllByIdTipoTarjeta]
(
	@IdTipoTarjeta INT
)

AS

SET NOCOUNT ON


UPDATE [Tarjeta]
SET FecBaja = GETDATE()
WHERE [IdTipoTarjeta] = @IdTipoTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TarjetaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[TarjetaInsert]
(
	@IdTipoTarjeta INT,
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@Titular nvarchar(50),
	@Vencimiento DATETIME,
	@Numero bigINT,
	@CodSeguridad INT,
	@FecBaja DATETIME,
	@Predeterminada bit
)

AS

SET NOCOUNT ON

INSERT INTo [Tarjeta]
(
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja],
	[Predeterminada]
)
VALUES
(
	@IdTipoTarjeta,
	@CUIT,
	@NombreUsuario,
	@Titular,
	@Vencimiento,
	@Numero,
	@CodSeguridad,
	@FecBaja,
	@Predeterminada
)













GO
/****** Object:  StoredProcedure [dbo].[TarjetASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetASelect]
(
	@IdTarjeta INT
)

AS

SET NOCOUNT ON

SELECT [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
FROM [Tarjeta]
WHERE [IdTarjeta] = @IdTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TarjetASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetASelectAll]

AS

SET NOCOUNT ON

SELECT [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
FROM [Tarjeta]










GO
/****** Object:  StoredProcedure [dbo].[TarjetASelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[TarjetASelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Tarjeta]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario and FecBaja is null











GO
/****** Object:  StoredProcedure [dbo].[TarjetASelectAllByIdTipoTarjeta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetASelectAllByIdTipoTarjeta]
(
	@IdTipoTarjeta INT
)

AS

SET NOCOUNT ON

SELECT [IdTarjeta],
	[IdTipoTarjeta],
	[CUIT],
	[NombreUsuario],
	[Titular],
	[Vencimiento],
	[Numero],
	[CodSeguridad],
	[FecBaja]
FROM [Tarjeta]
WHERE [IdTipoTarjeta] = @IdTipoTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TarjetaSelectByNumero]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[TarjetaSelectByNumero]
(
	@Numero bigint,
	@CUIT varchar(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Tarjeta]
WHERE Numero = @Numero and LTRIM(RTRIM(CUIT))=LTRIM(RTRIM(@CUIT))











GO
/****** Object:  StoredProcedure [dbo].[TarjetaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetaUPDATE]
(
	@IdTarjeta INT,
	@IdTipoTarjeta INT,
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@Titular nvarchar(50),
	@Vencimiento DATETIME,
	@Numero bigINT,
	@CodSeguridad INT,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [Tarjeta]
SET [IdTipoTarjeta] = @IdTipoTarjeta,
	[CUIT] = @CUIT,
	[NombreUsuario] = @NombreUsuario,
	[Titular] = @Titular,
	[Vencimiento] = @Vencimiento,
	[Numero] = @Numero,
	[CodSeguridad] = @CodSeguridad,
	[FecBaja] = @FecBaja
WHERE [IdTarjeta] = @IdTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoDelete]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel INT
)

AS

SET NOCOUNT ON


UPDATE [Telefono]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [NroTelefono] = @NroTelefono
	and [CodArea] = @CodArea
	and [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON



UPDATE [Telefono]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIdTipoTel]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoDeleteAllByIdTipoTel]
(
	@IdTipoTel INT
)

AS

SET NOCOUNT ON



UPDATE [Telefono]
SET FecBaja = GETDATE()
WHERE [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TelefonoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoInsert]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel INT
)

AS

SET NOCOUNT ON

INSERT INTo [Telefono]
(
	[CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel]
)
VALUES
(
	@CUIT,
	@NombreUsuario,
	@NroTelefono,
	@CodArea,
	@IdTipoTel
)










GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoSelect]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel INT
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
FROM [Telefono]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [NroTelefono] = @NroTelefono
	and [CodArea] = @CodArea
	and [IdTipoTel] = @IdTipoTel
	









GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoSelectAll]

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
FROM [Telefono]










GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoSelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
FROM [Telefono]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIdTipoTel]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoSelectAllByIdTipoTel]
(
	@IdTipoTel INT
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
FROM [Telefono]
WHERE [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[TelefonoSelectAllByUsuario](
@CUIT varchar(50),
@NombreUsuario varchar(100)
)
as

set nocount on

select [CUIT],
	[NombreUsuario],
	[NroTelefono],
	[CodArea],
	[IdTipoTel],
	[FecBaja]
from [Telefono]
where ltrim(rtrim([CUIT])) = ltrim(rtrim(@CUIT))
	and ltrim(rtrim([NombreUsuario])) = ltrim(rtrim(@NombreUsuario))
	








GO
/****** Object:  StoredProcedure [dbo].[TelefonoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoUPDATE]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@CodArea varchar(10),
	@IdTipoTel INT,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [Telefono]
SET [FecBaja] = @FecBaja
WHERE [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario	and [NroTelefono] = @NroTelefono	and [CodArea] = @CodArea	and [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TelefonoUpdateDatosPersonales]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[TelefonoUpdateDatosPersonales]
(
	@CUIT varchar(50),
	@NombreUsuario varchar(100),
	@NroTelefono varchar(12),
	@IdTipoTel int

)

as

set nocount on

update [Telefono]
set [NroTelefono] = @NroTelefono, [IdTipoTel] = @IdTipoTel
where [CUIT] = ltrim(rtrim(@CUIT))	and [NombreUsuario] = ltrim(rtrim(@NombreUsuario)) and [NroTelefono] = @NroTelefono	











GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoComprobanteDelete]
(
	@IdTipoComprobante INT
)

AS

SET NOCOUNT ON



UPDATE [TipoComprobante]
SET FecBaja = GETDATE()
WHERE [IdTipoComprobante] = @IdTipoComprobante










GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoComprobanteInsert]
(
	@DescripTipoComprobante varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [TipoComprobante]
(
	[DescripTipoComprobante]
)
VALUES
(
	@DescripTipoComprobante
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoComprobanteSelect]
(
	@IdTipoComprobante INT
)

AS

SET NOCOUNT ON

SELECT [IdTipoComprobante],
	[DescripTipoComprobante],
	[FecBaja]
FROM [TipoComprobante]
WHERE [IdTipoComprobante] = @IdTipoComprobante










GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoComprobanteSelectAll]

AS

SET NOCOUNT ON

SELECT [IdTipoComprobante],
	[DescripTipoComprobante],
	[FecBaja]
FROM [TipoComprobante]










GO
/****** Object:  StoredProcedure [dbo].[TipoComprobanteUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoComprobanteUPDATE]
(
	@IdTipoComprobante INT,
	@DescripTipoComprobante varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [TipoComprobante]
SET [DescripTipoComprobante] = @DescripTipoComprobante
WHERE [IdTipoComprobante] = @IdTipoComprobante










GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoDireccionDelete]
(
	@IdTipoDireccion INT
)

AS

SET NOCOUNT ON



UPDATE [TipoDireccion]
SET FecBaja = GETDATE()
WHERE [IdTipoDireccion] = @IdTipoDireccion










GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoDireccionInsert]
(
	@DescripcionDireccion varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [TipoDireccion]
(
	[DescripcionDireccion]
)
VALUES
(
	@DescripcionDireccion
)










GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoDireccionSelect]
(
	@IdTipoDireccion INT
)

AS

SET NOCOUNT ON

SELECT [IdTipoDireccion],
	[DescripcionDireccion],
	[FecBaja]
FROM [TipoDireccion]
WHERE [IdTipoDireccion] = @IdTipoDireccion










GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoDireccionSelectAll]

AS

SET NOCOUNT ON

SELECT [IdTipoDireccion],
	[DescripcionDireccion],
	[FecBaja]
FROM [TipoDireccion]










GO
/****** Object:  StoredProcedure [dbo].[TipoDireccionUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoDireccionUPDATE]
(
	@IdTipoDireccion INT,
	@DescripcionDireccion varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [TipoDireccion]
SET [DescripcionDireccion] = @DescripcionDireccion
WHERE [IdTipoDireccion] = @IdTipoDireccion










GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTarjetaDelete]
(
	@IdTipoTarjeta INT
)

AS

SET NOCOUNT ON




UPDATE [TipoTarjeta]
SET FecBaja = GETDATE()
WHERE [IdTipoTarjeta] = @IdTipoTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTarjetaInsert]
(
	@IdTipoTarjeta INT,
	@Descripcion varchar(50),
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

INSERT INTo [TipoTarjeta]
(
	[IdTipoTarjeta],
	[Descripcion],
	[FecBaja]
)
VALUES
(
	@IdTipoTarjeta,
	@Descripcion,
	@FecBaja
)










GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTarjetASelect]
(
	@IdTipoTarjeta INT
)

AS

SET NOCOUNT ON

SELECT [IdTipoTarjeta],
	[Descripcion],
	[FecBaja]
FROM [TipoTarjeta]
WHERE [IdTipoTarjeta] = @IdTipoTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTarjetASelectAll]

AS

SET NOCOUNT ON

SELECT [IdTipoTarjeta],
	[Descripcion],
	[FecBaja]
FROM [TipoTarjeta]










GO
/****** Object:  StoredProcedure [dbo].[TipoTarjetaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTarjetaUPDATE]
(
	@IdTipoTarjeta INT,
	@Descripcion varchar(50),
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [TipoTarjeta]
SET [Descripcion] = @Descripcion,
	[FecBaja] = @FecBaja
WHERE [IdTipoTarjeta] = @IdTipoTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TipoTelDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTelDelete]
(
	@IdTipoTel INT
)

AS

SET NOCOUNT ON



UPDATE [TipoTel]
SET FecBaja = GETDATE()
WHERE [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TipoTelInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTelInsert]
(
	@DescripcionTipoTel varchar(20)
)

AS

SET NOCOUNT ON

INSERT INTo [TipoTel]
(
	[DescripcionTipoTel]
)
VALUES
(
	@DescripcionTipoTel
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[TipoTelSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTelSelect]
(
	@IdTipoTel INT
)

AS

SET NOCOUNT ON

SELECT [IdTipoTel],
	[DescripcionTipoTel],
	[FecBaja]
FROM [TipoTel]
WHERE [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TipoTelSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTelSelectAll]

AS

SET NOCOUNT ON

SELECT [IdTipoTel],
	[DescripcionTipoTel],
	[FecBaja]
FROM [TipoTel]










GO
/****** Object:  StoredProcedure [dbo].[TipoTelUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TipoTelUPDATE]
(
	@IdTipoTel INT,
	@DescripcionTipoTel varchar(20)
)

AS

SET NOCOUNT ON

UPDATE [TipoTel]
SET [DescripcionTipoTel] = @DescripcionTipoTel
WHERE [IdTipoTel] = @IdTipoTel










GO
/****** Object:  StoredProcedure [dbo].[TraerSucursalesConStock]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TraerSucursalesConStock]
(
	@IdProducto int,
	@CantidadProd int,
	@CUIT VARCHAR(50)
)

AS


--Sucursal con stock de un producto por parametro
SELECT suck.IdProducto, suck.IdSucursal, suck.CantidadProducto, suck.CUIT, suck.FecBaja
FROM StockSucursal suck
INNER JOIN Sucursal suc ON suc.IdSucursal = suck.IdSucursal
WHERE suck.CUIT = LTRIM(RTRIM(@CUIT)) 
AND suck.CantidadProducto >= @CantidadProd
AND suck.IdProducto in
	(
		select pro.IdProducto from
		Producto pro
		where pro.IdProducto = @IdProducto
	)







GO
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioDelete]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON


UPDATE [Usuario]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioDeleteAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON




UPDATE [Usuario]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdCondicionFiscal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioDeleteAllByIdCondicionFiscal]
(
	@IdCondicionFiscal INT
)

AS

SET NOCOUNT ON


UPDATE [Usuario]
SET FecBaja = GETDATE()
WHERE [IdCondicionFiscal] = @IdCondicionFiscal










GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioDeleteAllByIdUsuario]
(
	@IdUsuario INT
)

AS

SET NOCOUNT ON


UPDATE [Usuario]
SET FecBaja = GETDATE()
WHERE [IdUsuario] = @IdUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuarioTipo]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioDeleteAllByIdUsuarioTipo]
(
	@IdUsuarioTipo INT
)

AS

SET NOCOUNT ON


UPDATE [Usuario]
SET FecBaja = GETDATE()
WHERE [IdUsuarioTipo] = @IdUsuarioTipo










GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteSeleccionadosByIdUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioDeleteSeleccionadosByIdUsuario]
(
	@IdUsuario INT
)

AS

SET NOCOUNT ON


UPDATE [Usuario]
SET FecBaja = GETDATE()
WHERE IdUsuario = @IdUsuario









GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliaDelete]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdFamilia INT
)

AS

SET NOCOUNT ON



UPDATE [UsuarioFamilia]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliaDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON


UPDATE [UsuarioFamilia]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByIdFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliaDeleteAllByIdFamilia]
(
	@IdFamilia INT
)

AS

SET NOCOUNT ON

UPDATE [UsuarioFamilia]
SET FecBaja = GETDATE()
WHERE [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliaInsert]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdFamilia INT
)

AS

SET NOCOUNT ON

INSERT INTo [UsuarioFamilia]
(
	[CUIT],
	[NombreUsuario],
	[IdFamilia]
)
VALUES
(
	@CUIT,
	@NombreUsuario,
	@IdFamilia
)










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliASelect]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)

)

AS

SET NOCOUNT ON

SELECT *
FROM [UsuarioFamilia]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
and fecbaja is null










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliASelectAll]

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[IdFamilia],
	[FecBaja]
FROM [UsuarioFamilia]










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliASelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

SELECT *
FROM [UsuarioFamilia]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and fecbaja is null










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAllByIdFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliASelectAllByIdFamilia]
(
	@IdFamilia INT
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[IdFamilia],
	[FecBaja]
FROM [UsuarioFamilia]
WHERE [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioFamiliaUPDATE]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdFamilia INT,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [UsuarioFamilia]
SET [FecBaja] = @FecBaja
WHERE [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario	and [IdFamilia] = @IdFamilia










GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioInsert]
(
	@IdCondicionFiscal INT,
	@IdUsuarioTipo INT,
	@Nombre varchar(200),
	@Apellido varchar(200),
	@NroIdentificacion varchar(10),
	@CUIT VARCHAR(50),
	@Email varchar(400),
	@NombreUsuario varchar(100),
	@Clave varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [Usuario]
(
	[IdCondicionFiscal],
	[IdUsuarioTipo],
	[Nombre],
	[Apellido],
	[NroIdentificacion],
	[CUIT],
	[Email],
	[NombreUsuario],
	[Clave]
)
VALUES
(
	@IdCondicionFiscal,
	@IdUsuarioTipo,
	@Nombre,
	@Apellido,
	@NroIdentificacion,
	@CUIT,
	@Email,
	@NombreUsuario,
	@Clave
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteDelete]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdPatente INT
)

AS

SET NOCOUNT ON


UPDATE [UsuarioPatente]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteDeleteAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON


UPDATE [UsuarioPatente]
SET FecBaja = GETDATE()
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByIdPatente]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteDeleteAllByIdPatente]
(
	@IdPatente INT
)

AS

SET NOCOUNT ON


UPDATE [UsuarioPatente]
SET FecBaja = GETDATE()
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteInsert]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdPatente INT
)

AS

SET NOCOUNT ON

INSERT INTo [UsuarioPatente]
(
	[CUIT],
	[NombreUsuario],
	[IdPatente]
)
VALUES
(
	@CUIT,
	@NombreUsuario,
	@IdPatente
)










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteSelect]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdPatente INT
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
FROM [UsuarioPatente]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario
	and [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteSelectAll]
AS
SET NOCOUNT ON
SELECT [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
FROM [UsuarioPatente]










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByCUIT_NombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteSelectAllByCUIT_NombreUsuario]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100)
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
FROM [UsuarioPatente]
WHERE [CUIT] = @CUIT
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByIdPatente]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteSelectAllByIdPatente]
(
	@IdPatente INT
)

AS

SET NOCOUNT ON

SELECT [CUIT],
	[NombreUsuario],
	[IdPatente],
	[FecBaja]
FROM [UsuarioPatente]
WHERE [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioPatenteUPDATE]
(
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdPatente INT,
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [UsuarioPatente]
SET [FecBaja] = @FecBaja
WHERE [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario	and [IdPatente] = @IdPatente










GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[UsuarioSelect]
(
	@CUIT varchar(50),
	@NombreUsuario varchar(100)
)

as

set nocount on

select *
from [Usuario]
where ltrim(rtrim([CUIT])) = ltrim(rtrim(@CUIT))
	and ltrim(rtrim([NombreUsuario])) = ltrim(rtrim(@NombreUsuario))











GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioSelectAll]
AS
SET NOCOUNT ON

SELECT *
FROM [Usuario]





GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByCUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Usuario]
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdCondicionFiscal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioSelectAllByIdCondicionFiscal]
(
	@IdCondicionFiscal INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [Usuario]
WHERE [IdCondicionFiscal] = @IdCondicionFiscal










GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioSelectAllByIdUsuario]
(
	@IdUsuario INT
)

AS

SET NOCOUNT ON

SELECT *
FROM [Usuario]
WHERE [IdUsuario] = @IdUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuarioTipo_CUIT]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioSelectAllByIdUsuarioTipo_CUIT]
(
	@IdUsuarioTipo INT,
	@CUIT varchar(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Usuario]
WHERE [IdUsuarioTipo] = @IdUsuarioTipo
AND CUIT = @CUIT
and fecbaja is null









GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectByIdUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[UsuarioSelectByIdUsuario]
(
	@IdUsuario int
)

as

set nocount on

select *
from [Usuario]
where IdUsuario = @IdUsuario
and fecbaja is null











GO
/****** Object:  StoredProcedure [dbo].[UsuarioSelectByNombreUsuarioClave]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UsuarioSelectByNombreUsuarioClave]
(
	@Clave varchar(400),
	@NombreUsuario varchar(100),
	@Cuit varchar(50)
)

as

set nocount on

select *
from [Usuario]
where [Clave] = @Clave
	and [NombreUsuario] = @NombreUsuario
	and [CUIT]=ltrim(rtrim(@Cuit))
	









GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoDelete]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioTipoDelete]
(
	@IdUsuarioTipo INT
)

AS

SET NOCOUNT ON


UPDATE [UsuarioTipo]
SET FecBaja = GETDATE()
WHERE [IdUsuarioTipo] = @IdUsuarioTipo










GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoInsert]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioTipoInsert]
(
	@Descripcion varchar(200)
)

AS

SET NOCOUNT ON

INSERT INTo [UsuarioTipo]
(
	[Descripcion]
)
VALUES
(
	@Descripcion
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelect]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioTipoSelect]
(
	@IdUsuarioTipo INT
)

AS

SET NOCOUNT ON

SELECT [IdUsuarioTipo],
	[Descripcion],
	[FecBaja]
FROM [UsuarioTipo]
WHERE [IdUsuarioTipo] = @IdUsuarioTipo










GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelectAll]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioTipoSelectAll]

AS

SET NOCOUNT ON

SELECT [IdUsuarioTipo],
	[Descripcion],
	[FecBaja]
FROM [UsuarioTipo]










GO
/****** Object:  StoredProcedure [dbo].[UsuarioTipoUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioTipoUPDATE]
(
	@IdUsuarioTipo INT,
	@Descripcion varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [UsuarioTipo]
SET [Descripcion] = @Descripcion
WHERE [IdUsuarioTipo] = @IdUsuarioTipo










GO
/****** Object:  StoredProcedure [dbo].[UsuarioUPDATE]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioUPDATE]
(
	@IdUsuario INT,
	@IdCondicionFiscal INT,
	@IdUsuarioTipo INT,
	@Nombre varchar(200),
	@Apellido varchar(200),
	@NroIdentificacion varchar(10),
	@CUIT VARCHAR(50),
	@Email varchar(400),
	@NombreUsuario varchar(100),
	@Clave varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Usuario]
SET [IdCondicionFiscal] = @IdCondicionFiscal,
	[IdUsuarioTipo] = @IdUsuarioTipo,
	[Nombre] = @Nombre,
	[Apellido] = @Apellido,
	[NroIdentificacion] = @NroIdentificacion,
	[Email] = @Email,
	[Clave] = @Clave
WHERE [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateClave]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioUpdateClave]
(


@CUIT VARCHAR(50),
@NombreUsuario varchar(100),
@Clave varchar(200)
)

AS

SET NOCOUNT ON

UPDATE [Usuario]
SET 
[Clave] = @Clave
WHERE [CUIT] = @CUIT	and [NombreUsuario] = @NombreUsuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateDatosPersonales]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[UsuarioUpdateDatosPersonales]
(
	@Nombre varchar(200),
	@Apellido varchar(200),
	@CUIT varchar(50),
	@Email varchar(400),
	@NombreUsuario varchar(100)
)

as

set nocount on

update [Usuario]
set
	[Nombre] = @Nombre,
	[Apellido] = @Apellido,
	[Email] = @Email	
where [CUIT] = ltrim(rtrim(@CUIT))	and [NombreUsuario] = ltrim(rtrim(@NombreUsuario))











GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateDatosPersonalesConDNI]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioUpdateDatosPersonalesConDNI]
(
	@Nombre varchar(200),
	@Apellido varchar(200),
	@Email varchar(400),
	@NroIdentificacion varchar(12),
	@IdUsuario INT
	
)

AS

SET NOCOUNT ON

UPDATE [Usuario]
SET [Nombre] = @Nombre,
	[Apellido] = @Apellido,
	[Email] = @Email,
	[NroIdentificacion] = @NroIdentificacion
WHERE IdUsuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateNombreUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioUpdateNombreUsuario]
(
	@NombreUsuario varchar (100),
	@IdUsuario INT
)

AS

SET NOCOUNT ON

UPDATE [Usuario]
SET NombreUsuario = @NombreUsuario
WHERE [IdUsuario] = @IdUsuario










GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdatePermisosFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioUpdatePermisosFamilia]
(
	@CUIT varchar(50),
	@NombreUsuario varchar (100),
	@IdFamilia INT
)

AS

SET NOCOUNT ON

UPDATE [UsuarioFamilia]
SET IdFamilia = @IdFamilia
WHERE [CUIT] = @CUIT	
and [NombreUsuario] = @NombreUsuario
and fecbaja is null










GO
/****** Object:  Table [dbo].[BitacoraLog]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BitacoraLog](
	[IdBitacoraLog] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[DescripCategoria] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Categoria_1] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comprobante](
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[IdComprobante] [int] IDENTITY(1,1) NOT NULL,
	[FechaComprobante] [datetime] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[Ajuste] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[NroComprobante] ASC,
	[IdSucursal] ASC,
	[IdTipoComprobante] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComprobanteDetalle]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComprobanteDetalle](
	[IdComprobanteDetalle] [int] NOT NULL,
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[CantidadProducto] [int] NOT NULL,
	[PrecioUnitarioFact] [decimal](18, 0) NOT NULL,
	[FecBaja] [datetime] NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CondicionFiscal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CondicionFiscal](
	[IdCondicionFiscal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_CondicionFiscal] PRIMARY KEY CLUSTERED 
(
	[IdCondicionFiscal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConfigMailHost]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfigMailHost](
	[Puerto] [int] NOT NULL,
	[Host] [varchar](50) NOT NULL,
	[Ssl] [bit] NOT NULL,
	[Remitente] [varchar](300) NOT NULL,
	[Remps] [nvarchar](300) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 17/11/2019 15:49:07 ******/
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
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionUsuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DireccionUsuario](
	[IdDireccion] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[FecBaja] [datetime] NULL,
	[Predeterminada] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresa](
	[CUIT] [varchar](50) NOT NULL,
	[NombreEmpresa] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encuesta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encuesta](
	[IdEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[NombreEncuesta] [varchar](100) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Encuesta] PRIMARY KEY CLUSTERED 
(
	[IdEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encuesta_Usuario]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encuesta_Usuario](
	[IdEncuesta] [int] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Encuesta_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdEncuesta] ASC,
	[NombreUsuario] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPago](
	[IdEstadoPago] [int] IDENTITY(1,1) NOT NULL,
	[DescripEstadoPago] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_EstadoPago] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPedido](
	[IdEstadoPedido] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionEstadoPedido] [varchar](20) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_EstadoPedido] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoPedido2]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoPedido2](
	[IdEstadoPedido2] [int] IDENTITY(1,1) NOT NULL,
	[DescripEstadoPedido2] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoPedido2] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPedido2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [int] IDENTITY(1,1) NOT NULL,
	[NombreFamilia] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaEntrega]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaEntrega](
	[IdFormaEntrega] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionFormaEntrega] [varchar](20) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_FormaEntrega] PRIMARY KEY CLUSTERED 
(
	[IdFormaEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaPago](
	[IdFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[DescripFormaPago] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IvaProducto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IvaProducto](
	[IdIvaProducto] [int] IDENTITY(1,1) NOT NULL,
	[PorcentajeIvaProd] [decimal](18, 2) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_IvaProducto] PRIMARY KEY CLUSTERED 
(
	[IdIvaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lenguaje](
	[IdLenguaje] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionLenguaje] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[IdLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenguajeControl]    Script Date: 17/11/2019 15:49:07 ******/
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
	[FecBaja] [datetime] NULL,
	[CUIT] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LenguajeControl_Lenguaje] PRIMARY KEY CLUSTERED 
(
	[Texto] ASC,
	[IdLenguaje] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenguajeControl_Empresa]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LenguajeControl_Empresa](
	[CUIT] [varchar](50) NOT NULL,
	[Texto] [varchar](400) NOT NULL,
	[IdLenguaje] [int] NOT NULL,
 CONSTRAINT [PK_LenguajeControl_Empresa] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[Texto] ASC,
	[IdLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaDeseos]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListaDeseos](
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[FecBaja] [date] NULL,
	[IdDeseo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ListaDeseos_1] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[IdProducto] ASC,
	[IdDeseo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionMarca] [varchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Moneda](
	[IdMoneda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[SimboloMoneda] [nvarchar](3) NOT NULL,
	[FecBaja] [datetime] NULL,
	[Url] [varchar](50) NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[IdMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonedaEmpresa]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonedaEmpresa](
	[IdMoneda] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[Cotizacion] [decimal](5, 2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
	[Predeterminada] [bit] NULL,
 CONSTRAINT [PK_Cotizacion] PRIMARY KEY CLUSTERED 
(
	[IdMoneda] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pago](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[IdFormaPago] [int] NOT NULL,
	[MontoPago] [decimal](18, 0) NOT NULL,
	[NroComprobante] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[IdTipoComprobante] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
	[IdTarjeta] [int] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PagoEstadoPago]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoEstadoPago](
	[IdEstadoPago] [int] NOT NULL,
	[IdPago] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_PagoEstadoPago] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPago] ASC,
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patente]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patente](
	[IdPatente] [int] IDENTITY(1,1) NOT NULL,
	[NombrePatente] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteFamilia](
	[IdPatente] [int] NOT NULL,
	[IdFamilia] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Patente_Familia] PRIMARY KEY CLUSTERED 
(
	[IdPatente] ASC,
	[IdFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 17/11/2019 15:49:07 ******/
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
	[IdFormaEntrega] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[NumeroTracking] [varchar](50) NULL,
	[DireccionEntrega] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[NroPedido] [bigint] NOT NULL,
	[IdEstadoPedido2] [int] NULL,
 CONSTRAINT [PK_IdPedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidoDetalle](
	[IdPedidoDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
	[Descuento] [int] NULL,
	[IdProducto] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[CUIT] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IdPedidoDetalle] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdPedidoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoEstadoPedido]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoEstadoPedido](
	[IdPedido] [int] NOT NULL,
	[IdEstadoPedido] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_PedidoEstadoPedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC,
	[IdEstadoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pregunta](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[TextoPregunta] [varchar](300) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdEncuesta] [int] NOT NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdCategoria]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProdCategoria](
	[IdProducto] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[CUIT] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProdCategoria_1] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdCategoria] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProducto] [varchar](50) NOT NULL,
	[PrecioUnitario] [decimal](18, 3) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[IdIvaProducto] [int] NOT NULL,
	[DescripProducto] [varchar](100) NOT NULL,
	[URL] [varchar](50) NULL,
	[FecBaja] [datetime] NULL,
	[DescripLarga] [varchar](400) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionProvincia] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recurso]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recurso](
	[CUIT] [varchar](50) NOT NULL,
	[Recurso] [varchar](30) NOT NULL,
	[Url] [varchar](200) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Recurso] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[Recurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdPedidoDetalle] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[TextoRespuesta] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdPregunta] [int] NOT NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockSucursal]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockSucursal](
	[IdProducto] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CantidadProducto] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[CUIT] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockSucursal] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdSucursal] ASC,
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 17/11/2019 15:49:07 ******/
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
	[CUIT] [varchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[IdTarjeta] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTarjeta] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Titular] [nvarchar](50) NOT NULL,
	[Vencimiento] [datetime] NOT NULL,
	[Numero] [bigint] NOT NULL,
	[CodSeguridad] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[Predeterminada] [bit] NULL,
 CONSTRAINT [PK_TarjetAS] PRIMARY KEY CLUSTERED 
(
	[IdTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefono](
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[NroTelefono] [varchar](12) NOT NULL,
	[CodArea] [varchar](10) NOT NULL,
	[IdTipoTel] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Telefono_1] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC,
	[NroTelefono] ASC,
	[IdTipoTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[IdTipoComprobante] [int] IDENTITY(1,1) NOT NULL,
	[DescripTipoComprobante] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoComprobante] PRIMARY KEY CLUSTERED 
(
	[IdTipoComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDireccion](
	[IdTipoDireccion] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionDireccion] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoDireccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTarjeta](
	[IdTipoTarjeta] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoTarjetAS] PRIMARY KEY CLUSTERED 
(
	[IdTipoTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTel]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTel](
	[IdTipoTel] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTipoTel] [varchar](20) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_TipoTel] PRIMARY KEY CLUSTERED 
(
	[IdTipoTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/11/2019 15:49:07 ******/
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
	[NroIdentificacion] [varchar](12) NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[Email] [varchar](400) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Clave] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
	[URI] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC,
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioFamilia](
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdFamilia] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
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
/****** Object:  Table [dbo].[UsuarioPatente]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioPatente](
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[IdPatente] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
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
/****** Object:  Table [dbo].[UsuarioTipo]    Script Date: 17/11/2019 15:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioTipo](
	[IdUsuarioTipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FecBaja] [datetime] NULL,
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
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Categoria1] FOREIGN KEY([IdCategoria], [CUIT])
REFERENCES [dbo].[Categoria] ([IdCategoria], [CUIT])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Categoria1]
GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Categoria] CHECK CONSTRAINT [FK_Categoria_Empresa]
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
ALTER TABLE [dbo].[ComprobanteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ComprobanteDetalle_Producto] FOREIGN KEY([IdProducto], [CUIT])
REFERENCES [dbo].[Producto] ([IdProducto], [CUIT])
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
ALTER TABLE [dbo].[Encuesta_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_Usuario_Encuesta] FOREIGN KEY([IdEncuesta])
REFERENCES [dbo].[Encuesta] ([IdEncuesta])
GO
ALTER TABLE [dbo].[Encuesta_Usuario] CHECK CONSTRAINT [FK_Encuesta_Usuario_Encuesta]
GO
ALTER TABLE [dbo].[Encuesta_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Encuesta_Usuario_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Encuesta_Usuario] CHECK CONSTRAINT [FK_Encuesta_Usuario_Usuario]
GO
ALTER TABLE [dbo].[LenguajeControl]  WITH CHECK ADD  CONSTRAINT [FK_LenguageControl_Lenguage] FOREIGN KEY([IdLenguaje])
REFERENCES [dbo].[Lenguaje] ([IdLenguaje])
GO
ALTER TABLE [dbo].[LenguajeControl] CHECK CONSTRAINT [FK_LenguageControl_Lenguage]
GO
ALTER TABLE [dbo].[LenguajeControl_Empresa]  WITH CHECK ADD  CONSTRAINT [FK_LenguajeControl_Empresa_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[LenguajeControl_Empresa] CHECK CONSTRAINT [FK_LenguajeControl_Empresa_Empresa]
GO
ALTER TABLE [dbo].[LenguajeControl_Empresa]  WITH CHECK ADD  CONSTRAINT [FK_LenguajeControl_Empresa_LenguajeControl] FOREIGN KEY([Texto], [IdLenguaje], [CUIT])
REFERENCES [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [CUIT])
GO
ALTER TABLE [dbo].[LenguajeControl_Empresa] CHECK CONSTRAINT [FK_LenguajeControl_Empresa_LenguajeControl]
GO
ALTER TABLE [dbo].[ListaDeseos]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseos_Producto] FOREIGN KEY([IdProducto], [CUIT])
REFERENCES [dbo].[Producto] ([IdProducto], [CUIT])
GO
ALTER TABLE [dbo].[ListaDeseos] CHECK CONSTRAINT [FK_ListaDeseos_Producto]
GO
ALTER TABLE [dbo].[ListaDeseos]  WITH CHECK ADD  CONSTRAINT [FK_ListaDeseos_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[ListaDeseos] CHECK CONSTRAINT [FK_ListaDeseos_Usuario]
GO
ALTER TABLE [dbo].[MonedaEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[MonedaEmpresa] CHECK CONSTRAINT [FK_Cotizacion_Empresa]
GO
ALTER TABLE [dbo].[MonedaEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Moneda] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[Moneda] ([IdMoneda])
GO
ALTER TABLE [dbo].[MonedaEmpresa] CHECK CONSTRAINT [FK_Cotizacion_Moneda]
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
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Tarjeta] FOREIGN KEY([IdTarjeta])
REFERENCES [dbo].[Tarjeta] ([IdTarjeta])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Tarjeta]
GO
ALTER TABLE [dbo].[PagoEstadoPago]  WITH CHECK ADD  CONSTRAINT [FK_PagoEstadoPago_EstadoPago] FOREIGN KEY([IdEstadoPago])
REFERENCES [dbo].[EstadoPago] ([IdEstadoPago])
GO
ALTER TABLE [dbo].[PagoEstadoPago] CHECK CONSTRAINT [FK_PagoEstadoPago_EstadoPago]
GO
ALTER TABLE [dbo].[PagoEstadoPago]  WITH CHECK ADD  CONSTRAINT [FK_PagoEstadoPago_Pago] FOREIGN KEY([IdPago])
REFERENCES [dbo].[Pago] ([IdPago])
GO
ALTER TABLE [dbo].[PagoEstadoPago] CHECK CONSTRAINT [FK_PagoEstadoPago_Pago]
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
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_FormaEntrega] FOREIGN KEY([IdFormaEntrega])
REFERENCES [dbo].[FormaEntrega] ([IdFormaEntrega])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_FormaEntrega]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Pedido] FOREIGN KEY([IdEstadoPedido2])
REFERENCES [dbo].[EstadoPedido2] ([IdEstadoPedido2])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Pedido]
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
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Producto] FOREIGN KEY([IdProducto], [CUIT])
REFERENCES [dbo].[Producto] ([IdProducto], [CUIT])
GO
ALTER TABLE [dbo].[PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Producto]
GO
ALTER TABLE [dbo].[PedidoEstadoPedido]  WITH CHECK ADD  CONSTRAINT [FK_PedidoEstadoPedidoEstPed] FOREIGN KEY([IdEstadoPedido])
REFERENCES [dbo].[EstadoPedido] ([IdEstadoPedido])
GO
ALTER TABLE [dbo].[PedidoEstadoPedido] CHECK CONSTRAINT [FK_PedidoEstadoPedidoEstPed]
GO
ALTER TABLE [dbo].[PedidoEstadoPedido]  WITH CHECK ADD  CONSTRAINT [FK_PedidoEstadoPedidoPed] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([IdPedido])
GO
ALTER TABLE [dbo].[PedidoEstadoPedido] CHECK CONSTRAINT [FK_PedidoEstadoPedidoPed]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Encuesta] FOREIGN KEY([IdEncuesta])
REFERENCES [dbo].[Encuesta] ([IdEncuesta])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Encuesta]
GO
ALTER TABLE [dbo].[ProdCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProdCategoria_Categoria] FOREIGN KEY([IdCategoria], [CUIT])
REFERENCES [dbo].[Categoria] ([IdCategoria], [CUIT])
GO
ALTER TABLE [dbo].[ProdCategoria] CHECK CONSTRAINT [FK_ProdCategoria_Categoria]
GO
ALTER TABLE [dbo].[ProdCategoria]  WITH CHECK ADD  CONSTRAINT [FK_ProdCategoria_Producto] FOREIGN KEY([IdProducto], [CUIT])
REFERENCES [dbo].[Producto] ([IdProducto], [CUIT])
GO
ALTER TABLE [dbo].[ProdCategoria] CHECK CONSTRAINT [FK_ProdCategoria_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Empresa]
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
ALTER TABLE [dbo].[Recurso]  WITH CHECK ADD FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
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
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Pregunta] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta]
GO
ALTER TABLE [dbo].[StockSucursal]  WITH CHECK ADD  CONSTRAINT [FK_StockSucursal_Producto] FOREIGN KEY([IdProducto], [CUIT])
REFERENCES [dbo].[Producto] ([IdProducto], [CUIT])
GO
ALTER TABLE [dbo].[StockSucursal] CHECK CONSTRAINT [FK_StockSucursal_Producto]
GO
ALTER TABLE [dbo].[StockSucursal]  WITH CHECK ADD  CONSTRAINT [FK_StockSucursal_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[StockSucursal] CHECK CONSTRAINT [FK_StockSucursal_Sucursal]
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
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Usuario] FOREIGN KEY([CUIT], [NombreUsuario])
REFERENCES [dbo].[Usuario] ([CUIT], [NombreUsuario])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Usuario]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_TarjetAS_TipoTarjetAS] FOREIGN KEY([IdTipoTarjeta])
REFERENCES [dbo].[TipoTarjeta] ([IdTipoTarjeta])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_TarjetAS_TipoTarjetAS]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empresa] FOREIGN KEY([CUIT])
REFERENCES [dbo].[Empresa] ([CUIT])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empresa]
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
ON UPDATE CASCADE
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
ALTER DATABASE [Ecommerce] SET  READ_WRITE 
GO
