USE [master]
GO
/****** Object:  Database [Ecommerce]    Script Date: 05/12/2019 0:12:29 ******/
CREATE DATABASE [Ecommerce] ON  PRIMARY 
( NAME = N'Ecommerce', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ecommerce.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
ALTER DATABASE [Ecommerce] SET  DISABLE_BROKER 
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
/****** Object:  Login [tecnologia]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [tecnologia] WITH PASSWORD=N'Æß±$âQ¨ÅhÇÛ!5Ë]ËM1D7oR@eÉñ', DEFAULT_DATABASE=[Artec], DEFAULT_LANGUAGE=[Español], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [tecnologia] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [Javi-PC\Javi]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [Javi-PC\Javi] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [BUILTIN\Usuarios]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [BUILTIN\Usuarios] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'.! ì?S«Em<ÑÂäïÛF!¥,QÞPd', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 05/12/2019 0:12:29 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'¿?ò"Ø:KTG¸P³¬ù/²0õ¬O\oÆàd\Y}Æ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
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
/****** Object:  StoredProcedure [dbo].[BaseDatosRespaldar]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BaseDatosRespaldar]
(
	@Nombre varchar(50),
	@Destino varchar(300),
	@Obser varchar(500)
)


AS
BEGIN

BACKUP DATABASE ECommerce TO DISK = @Destino WITH DESCRIPTION = @Obser, NOFORMAT, NOINIT, NAME = @Nombre, SKIP, NOREWIND, NOUNLOAD,  STATS = 10

END



--select * from BitacoraLog



GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogInsert]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BitacoraLogInsert]
(
	@elNombreUs varchar(100),
	@elCUIT varchar(50),
	@fecha DATETIME,
	@tipo varchar(10),
	@accionrealizada varchar(50),
	@msj varchar(5000)
	
)

	AS
		INSERT INTO [BitacoraLog]
		(	
			NombreUsuario,
			CUIT,
			Fecha,
			TipoLog,
			Accion,
			Mensaje
		)
		VALUES
		(
			@elNombreUs,
			@elCUIT,
			@fecha,
			@tipo,
			@accionrealizada,
			@msj
		)










GO
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraVerLogs]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BitacoraVerLogs]
(
	@TipoLog varchar(10),
	@fechaInicio datetime = null,
	@fechaFin datetime = null
)


AS
BEGIN


SELECT *
from BitacoraLog bi
WHERE bi.TipoLog = @TipoLog
and (bi.Fecha >= @fechaInicio OR @fechaInicio IS NULL)
and (bi.Fecha < @fechaFin+1 OR @fechaFin IS NULL)

END
GO
/****** Object:  StoredProcedure [dbo].[CategoriaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaDeleteAllByIdCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelectAllByIdCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdTipoComprobante]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdPedido],
	Ajuste
)
VALUES
(
	@NroComprobante,
	@IdSucursal,
	@CUIT,
	@IdTipoComprobante,
	@FechaComprobante,
	@IdPedido,
	0
)

SELECT SCOPE_IDENTITY();










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteInsertSeleccionar]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteNDInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
	[FecBaja],
	Ajuste
FROM [Comprobante]
WHERE [NroComprobante] = @NroComprobante
	and [IdSucursal] = @IdSucursal
	and [IdTipoComprobante] = @IdTipoComprobante
	and [CUIT] = @CUIT
	










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
	[FecBaja],
	Ajuste
FROM [Comprobante]











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
		[FecBaja],
		Ajuste
FROM	[Comprobante]
WHERE	[CUIT] = @CUIT











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT_NroComprobante]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ComprobanteSelectAllByCUIT_NroComprobante]
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
		[FecBaja],
		Ajuste
FROM	[Comprobante]
WHERE	[CUIT] = @CUIT and [NroComprobante] = @NroComprobante











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
		[FecBaja],
		Ajuste
FROM	[Comprobante]
WHERE	[IdPedido] = @IdPedido











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
		[FecBaja],
		Ajuste
FROM	[Comprobante]
WHERE	[IdSucursal] = @IdSucursal











GO
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdTipoComprobante]    Script Date: 05/12/2019 0:12:29 ******/
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
		[FecBaja],
		Ajuste
FROM	[Comprobante]
WHERE	[IdTipoComprobante] = @IdTipoComprobante










GO
/****** Object:  StoredProcedure [dbo].[ComprobanteUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ConfigMailHostTraer]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorDeleteAllByIdEmpresa]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorSelectAllByIdEmpresa]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DescontarStockSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
	@IdTipoDireccion INT,
	@IdLocalidad INT
)

AS


INSERT INTo [Direccion]
(
	[Calle],
	[Numero],
	[Piso],
	[Departamento],
	[Localidad],
	[IdProvincia],
	[IdTipoDireccion],
	IdLocalidad
)
VALUES
(
	@Calle,
	@Numero,
	@Piso,
	@Departamento,
	@Localidad,
	@IdProvincia,
	@IdTipoDireccion,
	@IdLocalidad
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[DireccionSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIdProvincia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
	@IdProvincia INT,
	@IdTipoDireccion INT,
	@IdLocalidad INT
	

)

AS


UPDATE [Direccion]
SET [Calle] = @Calle,
	[Numero] = @Numero,
	[Piso] = @Piso,
	[Departamento] = @Departamento,
	[IdProvincia] = @IdProvincia,
	[IdTipoDireccion] = @IdTipoDireccion,
	IdLocalidad = @IdLocalidad
WHERE [IdDireccion] = @IdDireccion










GO
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByIdDireccion]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DireccionUsuarioUPDATE]
(
	@IdDireccion INT,
	@CUIT VARCHAR(50),
	@NombreUsuario varchar(100),
	@IdTipoDireccion INT
)
AS

	UPDATE [DireccionUsuario]
	SET Predeterminada = 0
	Where [CUIT] = @CUIT AND [NombreUsuario] = @NombreUsuario AND Predeterminada = 1
	and IdDireccion in
		(select dir.IdDireccion from DireccionUsuario diru
		inner join Direccion dir on dir.IdDireccion = diru.IdDireccion
		 where dir.IdTipoDireccion = @IdTipoDireccion)

	UPDATE [DireccionUsuario]
	SET [Predeterminada] = 1
	WHERE [IdDireccion] = @IdDireccion	AND [CUIT] = @CUIT	AND [NombreUsuario] = @NombreUsuario


	







GO
/****** Object:  StoredProcedure [dbo].[EmpresaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaBuscar]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaBuscar]
(
	@NombreFamilia varchar(50)
)


AS
BEGIN


SELECT fam.IdFamilia, fam.NombreFamilia
FROM Familia fam
WHERE fam.NombreFamilia = @NombreFamilia
	
END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliasSelectByCUITandNombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaTraerFamiliasHijas]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaTraerFamiliasHijas]
(
	@IdFamilia int
)

AS
BEGIN

	SELECT fam.IdFamilia, fam.NombreFamilia
	FROM Familia fam
	WHERE fam.IdFamilia IN
	(
		SELECT ff.IdFamiliaHijo
		FROM RelFamFam ff
		WHERE ff.IdFamiliaPadre = @IdFamilia
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaTraerPatentes]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaTraerPatentes]
(
	@IdFamilia int
)

AS
BEGIN

	SELECT pat.IdPatente, pat.NombrePatente
	FROM Patente pat
	WHERE pat.IdPatente IN
	(
		SELECT fp.IdPatente
		FROM PatenteFamilia fp
		WHERE fp.IdFamilia = @IdFamilia	
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaTraerTodas]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FamiliaTraerTodas]

AS
BEGIN

SELECT fam.IdFamilia, fam.NombreFamilia
	FROM Familia fam

	
END
GO
/****** Object:  StoredProcedure [dbo].[FamiliaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[Grafico5productosmasvendidos]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoComparacionVentasPeriodo]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoMontoVentas]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoProductosPorCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoVentasPeriodo]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlDeleteAllByIdLenguaje]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAllByIdLenguaje]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LocalidadSelectAll]

AS


select loc.IdLocalidad, loc.DescripcionLocalidad, pro.IdProvincia, pro.DescripcionProvincia from localidad loc
inner join provincia pro on pro.IdProvincia = loc.IdProvincia











GO
/****** Object:  StoredProcedure [dbo].[MarcaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarMailConfig]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByIdMoneda]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAllByIdMoneda]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdFormaPago]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoInsert]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagoInsert]
(
	@IdPedido INT,
	@FechaPago DATETIME,
	@IdFormaPago INT,
	@MontoPago decimal(18, 0),
	@CUIT VARCHAR(50)
)

AS

INSERT INTo [Pago]
(
	[IdPedido],
	[FechaPago],
	[IdFormaPago],
	[MontoPago],
	[CUIT]



)
VALUES
(
	@IdPedido,
	@FechaPago,
	@IdFormaPago,
	@MontoPago,
	@CUIT
)

SELECT SCOPE_IDENTITY()










GO
/****** Object:  StoredProcedure [dbo].[PagoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
	[CUIT],
	[FecBaja]
FROM [Pago]
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
	[CUIT],
	[FecBaja]
FROM [Pago]










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
	[CUIT],
	[FecBaja]
FROM [Pago]
WHERE [CUIT] = @CUIT










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdFormaPago]    Script Date: 05/12/2019 0:12:29 ******/
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
	[CUIT],
	[FecBaja]
FROM [Pago]
WHERE [IdFormaPago] = @IdFormaPago










GO
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
	[CUIT],
	[FecBaja]
FROM [Pago]
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PagoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
	@CUIT VARCHAR(50),
	@FecBaja DATETIME
)

AS

SET NOCOUNT ON

UPDATE [Pago]
SET [IdPedido] = @IdPedido,
	[FechaPago] = @FechaPago,
	[IdFormaPago] = @IdFormaPago,
	[MontoPago] = @MontoPago,
	[CUIT] = @CUIT,
	[FecBaja] = @FecBaja
	
WHERE [IdPago] = @IdPago










GO
/****** Object:  StoredProcedure [dbo].[PatenteDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdPatente]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAllByIdFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAllByIdPatente]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PatentesSelectByFamilia]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatentesSelectByFamilia]
@IdFamilia int
as
select patente.IdPatente,patente.NombrePatente from patente inner join PatenteFamilia on patente.IdPatente = PatenteFamilia.IdPatente where PatenteFamilia.IdFamilia = @IdFamilia

GO
/****** Object:  StoredProcedure [dbo].[PatentesTraerTodas]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PatentesTraerTodas]

AS
BEGIN

SELECT pat.IdPatente, pat.NombrePatente
	FROM Patente pat
	

	
END
GO
/****** Object:  StoredProcedure [dbo].[PatenteUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoActualizarNroTracking]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoActualizarNroTracking]
(
	@elIdPedido INT,
	@elNroTracking varchar(50)
)

AS


UPDATE [Pedido]
SET NumeroTracking = @elNroTracking
WHERE [IdPedido] = @elIdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleInsert]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoDetalleInsert]
(
	@IdPedido INT,
	@Cantidad INT,
	@PrecioUnitario decimal(18, 0),
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
	[IdProducto],
	[CUIT]
)
VALUES
(
	@IdPedido,
	@Cantidad,
	@PrecioUnitario,
	@IdProducto,
	@CUIT
)











GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdProducto],
	[FecBaja]
FROM [PedidoDetalle]
WHERE [IdPedido] = @IdPedido
	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PedidoDetalleSelectAllByIdPedido]
(
@IdPedido INT
)

AS

SELECT pdet.[IdPedidoDetalle],
pdet.[IdPedido],
pdet.[Cantidad],
pdet.[PrecioUnitario],
pdet.[FecBaja],
pdet.[CUIT],
pro.IdProducto,
pro.CodigoProducto,
pro.DescripProducto
FROM [PedidoDetalle] pdet
INNER JOIN Producto pro ON pro.IdProducto = pdet.IdProducto
WHERE [IdPedido] = @IdPedido
GO
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
	@IdProducto INT
)

AS

SET NOCOUNT ON

UPDATE [PedidoDetalle]
SET [Cantidad] = @Cantidad,
	[PrecioUnitario] = @PrecioUnitario,
	[IdProducto] = @IdProducto
WHERE [IdPedido] = @IdPedido	and [IdPedidoDetalle] = @IdPedidoDetalle










GO
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdEstadoPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsertFin]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdEstadoPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoInsert]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoInsert]
(
	@FechaPedido DATETIME,
	@FechaFinPedido DATETIME,
	@NombreUsuario varchar(100),
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
	@IdFormaEntrega,
	@CUIT,
	@NumeroTracking,
	@DireccionEntrega,
	@NroPedido
)

SELECT SCOPE_IDENTITY()











GO
/****** Object:  StoredProcedure [dbo].[PedidoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
	ent.[IdFormaEntrega],
	ent.DescripcionFormaEntrega,
	[CUIT],
	[NumeroTracking],
	dir.IdDireccion,
	ped.[FecBaja],
	ped.NroPedido
FROM [Pedido] ped
INNER JOIN FormaEntrega ent ON ent.IdFormaEntrega = ped.IdFormaEntrega
INNER JOIN Direccion dir ON dir.IdDireccion = ped.DireccionEntrega
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS


SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	ent.[IdFormaEntrega],
	ent.DescripcionFormaEntrega,
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	ped.[FecBaja],
	ped.NroPedido
FROM [Pedido] ped
INNER JOIN FormaEntrega ent ON ent.IdFormaEntrega = ped.IdFormaEntrega
WHERE [CUIT] = LTRIM(RTRIM(@CUIT))


GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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

SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	NroPedido,
	[NombreUsuario],
	ent.[IdFormaEntrega],
	ent.DescripcionFormaEntrega,
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	ped.[FecBaja]
FROM [Pedido] ped
INNER JOIN FormaEntrega ent ON ent.IdFormaEntrega = ped.IdFormaEntrega
WHERE [CUIT] = LTRIM(RTRIM(@CUIT))
	and [NombreUsuario] = @NombreUsuario










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByDireccionEntrega]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
FROM [Pedido]
WHERE [DireccionEntrega] = @DireccionEntrega










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByIdFormaEntrega]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdFormaEntrega],
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	[FecBaja]
FROM [Pedido]
WHERE [IdFormaEntrega] = @IdFormaEntrega










GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectByCUIT_IDPedido]    Script Date: 05/12/2019 0:12:29 ******/
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


SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	ent.[IdFormaEntrega],
	ent.DescripcionFormaEntrega,
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	ped.[FecBaja],
	ped.NroPedido
FROM [Pedido] ped
INNER JOIN FormaEntrega ent ON ent.IdFormaEntrega = ped.IdFormaEntrega
WHERE [CUIT] = LTRIM(RTRIM(@elCuit)) AND
     IdPedido = @elIdPedido

GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectByCUIT_NroPedido]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PedidoSelectByCUIT_NroPedido]
(
@CUIT VARCHAR(50),
@NroPedido bigint
)

AS


SELECT [IdPedido],
	[FechaPedido],
	[FechaFinPedido],
	[NombreUsuario],
	ent.[IdFormaEntrega],
	ent.DescripcionFormaEntrega,
	[CUIT],
	[NumeroTracking],
	[DireccionEntrega],
	ped.[FecBaja],
	ped.NroPedido
FROM [Pedido] ped
INNER JOIN FormaEntrega ent ON ent.IdFormaEntrega = ped.IdFormaEntrega
WHERE [CUIT] = LTRIM(RTRIM(@CUIT)) AND
     [NroPedido] = @NroPedido

GO
/****** Object:  StoredProcedure [dbo].[PedidoSelectMAXNroPedidoByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoTraerEstadoActual]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoUltimoEstadoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdFormaEntrega] = @IdFormaEntrega,
	[CUIT] = @CUIT,
	[NumeroTracking] = @NumeroTracking,
	[DireccionEntrega] = @DireccionEntrega
WHERE [IdPedido] = @IdPedido










GO
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAllByIdCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdIvaProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdMarca]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdIvaProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdMarca]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectByCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectByDescripProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectByIdProductoCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectMasVendidosByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductoSelectMasVendidosByCUIT]
(
	@CUIT VARCHAR(50)
)

AS


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
		WHERE ped.CUIT = @CUIT AND est.DescripcionEstadoPedido LIKE ('Entregado')
		Group By Pdet.IdProducto
		ORDER By SUM(Pdet.Cantidad) DESC
	)









GO
/****** Object:  StoredProcedure [dbo].[ProductoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[rankingEmpresas]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoUpdate]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ReportePedidosDeUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ReportePedidosPorFechayEstado]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectDireccionesDeUsuarioActuales]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SelectDireccionesDeUsuarioActuales]
(
	@elCUIT varchar(50),
	@elNombreUsuario varchar(100)
)

as


select dir.IdDireccion, dir.Calle, dir.Numero, dir.Piso, dir.Departamento, dir.IdTipoDireccion, dir.FecBaja, diru.Predeterminada, loc.IdLocalidad, loc.DescripcionLocalidad, pro.IdProvincia, pro.DescripcionProvincia
from direccion dir
INNER JOIN DireccionUsuario diru ON dir.IdDireccion = diru.IdDireccion
INNER JOIN Localidad loc ON loc.IdLocalidad = dir.IdLocalidad
INNER JOIN Provincia pro ON pro.IdProvincia = loc.IdProvincia
WHERE diru.CUIT = LTRIM(RTRIM(@elCUIT))
and diru.NombreUsuario = @elNombreUsuario
and diru.FecBaja is null
	










GO
/****** Object:  StoredProcedure [dbo].[StockSucursalDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByDireccionSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalSelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalTraerPorDireccionSucursal]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SucursalTraerPorDireccionSucursal]
(
	@DireccionSucursal INT,
	@CUIT VARCHAR(50)
)

AS

SELECT [IdSucursal],
	[DescripSucursal],
	[DireccionSucursal],
	[CUIT],
	[FecBaja]
FROM [Sucursal]
WHERE [DireccionSucursal] = @DireccionSucursal
AND CUIT = LTRIM(RTRIM(@CUIT))










GO
/****** Object:  StoredProcedure [dbo].[SucursalUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByIdTipoTarjeta]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelectAllByIdTipoTarjeta]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaSelectByNumero]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaSetearPredeterminada]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TarjetaSetearPredeterminada]
(
	@elIdTarjeta INT
)

AS

UPDATE [Tarjeta]
SET Predeterminada = 1
WHERE [IdTarjeta] = @elIdTarjeta

UPDATE [Tarjeta]
SET Predeterminada = 0
WHERE [IdTarjeta] != @elIdTarjeta










GO
/****** Object:  StoredProcedure [dbo].[TarjetaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIdTipoTel]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIdTipoTel]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoUpdateDatosPersonales]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[TraerDireccionPorIdSucursal]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[TraerDireccionPorIdSucursal]
(
	@elIdSucursal int
)

as

select *
from [Direccion] dir
where [IdDireccion] in
	(
	  SELECT suc.DireccionSucursal
	  FROM Sucursal suc
	  Where IdSucursal = @elIdSucursal
	)











GO
/****** Object:  StoredProcedure [dbo].[TraerSucursalesConStock]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdCondicionFiscal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuarioTipo]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteSeleccionadosByIdUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByIdFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAllByIdFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByIdPatente]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByCUIT_NombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByIdPatente]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByCUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdCondicionFiscal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuarioTipo_CUIT]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectByIdUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectByNombreUsuarioClave]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoDelete]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoInsert]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelect]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelectAll]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTraerFamilias]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioTraerFamilias]
(
	@elNomUsuario varchar(100),
	@elCUIT varchar(50)

)

AS
BEGIN

SELECT fam.IdFamilia, fam.NombreFamilia
FROM Familia fam
WHERE fam.IdFamilia IN 
	(	SELECT usfa.IdFamilia
		FROM UsuarioFamilia usfa
		WHERE usfa.NombreUsuario = @elNomUsuario
		and usfa.CUIT = @elCUIT
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioTraerPatentes]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioTraerPatentes]
(
	@elNomUsuario varchar(100),
	@elCUIT varchar(50)
)

AS
BEGIN

SELECT pat.IdPatente, pat.NombrePatente
FROM Patente pat
WHERE pat.IdPatente IN 
	(	SELECT uspa.IdPatente
		FROM UsuarioPatente uspa
		WHERE uspa.NombreUsuario = @elNomUsuario
		and uspa.CUIT = @elCUIT
	)

	
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUPDATE]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateClave]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateDatosPersonales]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateDatosPersonalesConDNI]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateNombreUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdatePermisosFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[BitacoraLog]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BitacoraLog](
	[IdBitacoraLog] [int] IDENTITY(1,1) NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[TipoLog] [varchar](10) NOT NULL,
	[Accion] [varchar](50) NOT NULL,
	[Mensaje] [varchar](5000) NOT NULL,
 CONSTRAINT [PK_BitacoraLog] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Comprobante]    Script Date: 05/12/2019 0:12:29 ******/
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
	[Ajuste] [decimal](18, 0) NOT NULL,
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
/****** Object:  Table [dbo].[ComprobanteDetalle]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[CondicionFiscal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[ConfigMailHost]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdLocalidad] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionUsuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[EstadoPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Familia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[FormaEntrega]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[FormaPago]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[IvaProducto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[LenguajeControl]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[LenguajeControl_Empresa]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[ListaDeseos]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Localidad]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidad](
	[IdLocalidad] [int] NOT NULL,
	[IdProvincia] [int] NOT NULL,
	[DescripcionLocalidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Moneda]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[MonedaEmpresa]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Pago]    Script Date: 05/12/2019 0:12:29 ******/
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
	[CUIT] [varchar](50) NOT NULL,
	[FecBaja] [datetime] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patente]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Pedido]    Script Date: 05/12/2019 0:12:29 ******/
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
	[IdFormaEntrega] [int] NOT NULL,
	[CUIT] [varchar](50) NOT NULL,
	[NumeroTracking] [varchar](50) NULL,
	[DireccionEntrega] [int] NOT NULL,
	[FecBaja] [datetime] NULL,
	[NroPedido] [bigint] NOT NULL,
 CONSTRAINT [PK_IdPedido] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[PedidoEstadoPedido]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[ProdCategoria]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Recurso]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[RelFamFam]    Script Date: 05/12/2019 0:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelFamFam](
	[IdFamiliaPadre] [int] NOT NULL,
	[IdFamiliaHijo] [int] NOT NULL,
 CONSTRAINT [PK_RelFamFam] PRIMARY KEY CLUSTERED 
(
	[IdFamiliaPadre] ASC,
	[IdFamiliaHijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockSucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Telefono]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[TipoTel]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[UsuarioPatente]    Script Date: 05/12/2019 0:12:29 ******/
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
/****** Object:  Table [dbo].[UsuarioTipo]    Script Date: 05/12/2019 0:12:29 ******/
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
SET IDENTITY_INSERT [dbo].[BitacoraLog] ON 

INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1, N'20344003646', N'pargi', CAST(0x0000AB0F0100789D AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (2, N'20344003646', N'pargi', CAST(0x0000AB0F0100E026 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (3, N'20344003646', N'pargi', CAST(0x0000AB0F0102323F AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (4, N'20344003646', N'pargi', CAST(0x0000AB0F01024E32 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (6, N'20344003646', N'pargi', CAST(0x0000AB0F010E78BD AS DateTime), N'Error', N'UsuarioTraerPermisos', N'
No se encontró el procedimiento almacenado ''FamiliaTraerFamiliasHijas''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CrearDataSet(SqlCommand unComando) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 106
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataSet(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 98
   en TFI.DAL.Services.DALFamilia.FamiliaTraerFamiliasHijas(IFamPat unaFamilia) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Services\DALFamilia.cs:línea 64
   en TFI.CORE.Servicios.BLLFamilia.FamiliaTraerSubPermisos(List`1 unasFamilias) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Servicios\BLLFamilia.cs:línea 35
   en TFI.CORE.Managers.UsuarioCore.UsuarioTraerPermisos(String elNomUsuario, String elCUIT) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\UsuarioCore.cs:línea 282')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (7, N'20344003646', N'pargi', CAST(0x0000AB0F0112260D AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (8, N'20344003646', N'pargi', CAST(0x0000AB0F011232D1 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (9, N'20344003646', N'pargi', CAST(0x0000AB0F0115163B AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (10, N'20344003646', N'jmartinez', CAST(0x0000AB0F01157A9C AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (11, N'20344003646', N'jmartinez', CAST(0x0000AB0F01176B5B AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (12, N'20344003646', N'pargi', CAST(0x0000AB0F0117744D AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (13, N'20344003646', N'pargi', CAST(0x0000AB0F014E2656 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (14, N'20344003646', N'pargi', CAST(0x0000AB0F01693200 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (15, N'20344003646', N'pargi', CAST(0x0000AB0F0169B723 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (16, N'20344003646', N'jmartinez', CAST(0x0000AB0F017791A5 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (17, N'20344003646', N'vco', CAST(0x0000AB0F01864D03 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (18, N'20344003646', N'pargi', CAST(0x0000AB1000124750 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (19, N'20344003646', N'pargi', CAST(0x0000AB1000182BD1 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (20, N'20344003646', N'jmartinez', CAST(0x0000AB100020D7F9 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (21, N'20344003646', N'administrador', CAST(0x0000AB1000ACAD1D AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (22, N'20344003646', N'pargi', CAST(0x0000AB1000D40C85 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (23, N'20344003646', N'pargi', CAST(0x0000AB1000D5E29F AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (24, N'20344003646', N'pargi', CAST(0x0000AB120033808B AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (25, N'20344003646', N'pargi', CAST(0x0000AB1301658B63 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (26, N'20344003646', N'pargi', CAST(0x0000AB150141A166 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1026, N'20344003646', N'pargi', CAST(0x0000AB16010C351A AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1027, N'20344003646', N'pargi', CAST(0x0000AB16010E6ACC AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1028, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB1601696220 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1029, N'20344003646', N'pargi', CAST(0x0000AB16016999D9 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1030, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16016DCA70 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1031, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16016DDAC3 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1032, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB1601726E0B AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1033, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017289BE AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1034, N'20344003646', N'pargi', CAST(0x0000AB160172F792 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1035, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017B8FD6 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1036, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017B936D AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1037, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017BA34E AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1038, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017BA639 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1039, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017BA8F8 AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1040, N'20344003646', N'SIN_USUARIO', CAST(0x0000AB16017BBC2E AS DateTime), N'Error', N'ConsultarStockWebMethod', N'
No se encontró el procedimiento almacenado ''StockSucursalSelectAllByIdProducto''.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable[] dataTables, Int32 startRecord, Int32 maxRecords, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataTable dataTable)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CreateDataTable(SqlCommand command) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 139
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataTable(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 62
   en TFI.DAL.DAL.StockSucursalDAL.SelectAllByIdProducto(Int32 idProducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Repositories\StockSucursalDAL.cs:línea 157
   en TFI.CORE.Managers.StockCore.SelectByIdProducto(Int32 idproducto) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Managers\StockCore.cs:línea 32
   en TFI.GUI.Producto.consultarStock(Int32 id) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Public\Forms\Producto.aspx.cs:línea 147')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1041, N'20344003646', N'pargi', CAST(0x0000AB160186E2DC AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1042, N'20344003646', N'pargi', CAST(0x0000AB1700140C05 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1043, N'20344003646', N'pargi', CAST(0x0000AB17016D68FD AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1044, N'20344003646', N'administrador', CAST(0x0000AB19013E98D8 AS DateTime), N'Evento', N'Restaurar', N'Restauración realizada correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1045, N'20344003646', N'pargi', CAST(0x0000AB19013EE6F8 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1046, N'20344003646', N'administrador', CAST(0x0000AB1901508FC5 AS DateTime), N'Error', N'Backup', N'
No se admite el formato proporcionado de la ruta de acceso.
Archivo: 
Linea: 0
   en System.Security.Util.StringExpressionSet.CanonicalizePath(String path, Boolean needFullPath)
   en System.Security.Util.StringExpressionSet.CreateListFromExpressions(String[] str, Boolean needFullPath)
   en System.Security.Permissions.FileIOPermission.AddPathList(FileIOPermissionAccess access, AccessControlActions control, String[] pathListOrig, Boolean checkForDuplicates, Boolean needFullPath, Boolean copyPathList)
   en System.Security.Permissions.FileIOPermission.AddPathList(FileIOPermissionAccess access, String[] pathListOrig, Boolean checkForDuplicates, Boolean needFullPath, Boolean copyPathList)
   en System.Security.Permissions.FileIOPermission..ctor(FileIOPermissionAccess access, String path)
   en System.Web.HttpRequest.MapPath(VirtualPath virtualPath, VirtualPath baseVirtualDir, Boolean allowCrossAppMapping)
   en System.Web.HttpServerUtility.MapPath(String path)
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 77')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1047, N'20344003646', N'administrador', CAST(0x0000AB190152A8EC AS DateTime), N'Error', N'Backup', N'
No se admite el formato proporcionado de la ruta de acceso.
Archivo: 
Linea: 0
   en System.Security.Util.StringExpressionSet.CanonicalizePath(String path, Boolean needFullPath)
   en System.Security.Util.StringExpressionSet.CreateListFromExpressions(String[] str, Boolean needFullPath)
   en System.Security.Permissions.FileIOPermission.AddPathList(FileIOPermissionAccess access, AccessControlActions control, String[] pathListOrig, Boolean checkForDuplicates, Boolean needFullPath, Boolean copyPathList)
   en System.Security.Permissions.FileIOPermission.AddPathList(FileIOPermissionAccess access, String[] pathListOrig, Boolean checkForDuplicates, Boolean needFullPath, Boolean copyPathList)
   en System.Security.Permissions.FileIOPermission..ctor(FileIOPermissionAccess access, String path)
   en System.Web.HttpRequest.MapPath(VirtualPath virtualPath, VirtualPath baseVirtualDir, Boolean allowCrossAppMapping)
   en System.Web.HttpServerUtility.MapPath(String path)
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 78')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1048, N'20344003646', N'administrador', CAST(0x0000AB190153561D AS DateTime), N'Error', N'Backup', N'
No se admite el formato proporcionado de la ruta de acceso.
Archivo: 
Linea: 0
   en System.Security.Util.StringExpressionSet.CanonicalizePath(String path, Boolean needFullPath)
   en System.Security.Util.StringExpressionSet.CreateListFromExpressions(String[] str, Boolean needFullPath)
   en System.Security.Permissions.FileIOPermission.AddPathList(FileIOPermissionAccess access, AccessControlActions control, String[] pathListOrig, Boolean checkForDuplicates, Boolean needFullPath, Boolean copyPathList)
   en System.Security.Permissions.FileIOPermission.AddPathList(FileIOPermissionAccess access, String[] pathListOrig, Boolean checkForDuplicates, Boolean needFullPath, Boolean copyPathList)
   en System.Security.Permissions.FileIOPermission..ctor(FileIOPermissionAccess access, String path)
   en System.Web.HttpRequest.MapPath(VirtualPath virtualPath, VirtualPath baseVirtualDir, Boolean allowCrossAppMapping)
   en System.Web.HttpServerUtility.MapPath(String path)
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 78')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1049, N'20344003646', N'administrador', CAST(0x0000AB190153D934 AS DateTime), N'Error', N'Backup', N'
No se puede hacer la copia de seguridad o restauración dentro de una transacción.
Fin anómalo de BACKUP DATABASE.
Archivo: 
Linea: 0
   en System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   en System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   en System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   en System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   en System.Data.SqlClient.SqlDataReader.get_MetaData()
   en System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteScalar()
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteScalar(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 214
   en TFI.SEGURIDAD.ServicioBackup.Respaldar(String Nombre, String Destino, String Obser) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Seguridad\ServicioBackup.cs:línea 44
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 80')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1050, N'20344003646', N'administrador', CAST(0x0000AB190154E0FD AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1051, N'20344003646', N'administrador', CAST(0x0000AB190154E8D9 AS DateTime), N'Error', N'Backup', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 86')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1052, N'20344003646', N'administrador', CAST(0x0000AB190154F182 AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1053, N'20344003646', N'administrador', CAST(0x0000AB190155A550 AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1054, N'20344003646', N'administrador', CAST(0x0000AB190155C339 AS DateTime), N'Error', N'Backup', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 86')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1055, N'20344003646', N'administrador', CAST(0x0000AB19015613E6 AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1056, N'20344003646', N'administrador', CAST(0x0000AB19015632A1 AS DateTime), N'Error', N'Backup', N'
Subproceso anulado.
Archivo: 
Linea: 0
   en System.Threading.Thread.AbortInternal()
   en System.Threading.Thread.Abort(Object stateInfo)
   en System.Web.HttpResponse.AbortCurrentThread()
   en TFI.GUI.Areas.Intranet.Forms.Backup.btnUpload_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\Backup.aspx.cs:línea 87')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1057, N'20344003646', N'administrador', CAST(0x0000AB1901584625 AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1058, N'20344003646', N'administrador', CAST(0x0000AB1901598B44 AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1059, N'20344003646', N'administrador', CAST(0x0000AB19015A8B67 AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1060, N'20344003646', N'administrador', CAST(0x0000AB19015AE4D6 AS DateTime), N'Evento', N'Backup', N'Backup realizado correctamente')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1061, N'20344003646', N'administrador', CAST(0x0000AB1901790743 AS DateTime), N'Error', N'Filtrar Logs', N'
Desbordamiento de SqlDateTime. Debe estar entre 1/1/1753 12:00:00 AM y 12/31/9999 11:59:59 PM.
Archivo: 
Linea: 0
   en System.Data.SqlClient.TdsParser.TdsExecuteRPC(_SqlRPC[] rpcArray, Int32 timeout, Boolean inSchema, SqlNotificationRequest notificationRequest, TdsParserStateObject stateObj, Boolean isCommandProc, Boolean sync, TaskCompletionSource`1 completion, Int32 startRpc, Int32 startParam)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CrearDataSet(SqlCommand unComando) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 106
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataSet(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 98
   en TFI.DAL.Services.DALBitacora.BitacoraVerLogs(String unTipoLog, Nullable`1 fechaInicio, Nullable`1 fechaFin) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Services\DALBitacora.cs:línea 26
   en TFI.CORE.Servicios.BLLBitacora.BitacoraVerLogs(String unTipoLog, Nullable`1 fechaInicio, Nullable`1 fechaFin) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Servicios\BLLBitacora.cs:línea 26
   en TFI.GUI.Areas.Intranet.Forms.VerLogs.btnFiltrarLogs_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\VerLogs.aspx.cs:línea 108')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1062, N'20344003646', N'administrador', CAST(0x0000AB1901795811 AS DateTime), N'Error', N'Filtrar Logs', N'
Desbordamiento de SqlDateTime. Debe estar entre 1/1/1753 12:00:00 AM y 12/31/9999 11:59:59 PM.
Archivo: 
Linea: 0
   en System.Data.SqlClient.TdsParser.TdsExecuteRPC(_SqlRPC[] rpcArray, Int32 timeout, Boolean inSchema, SqlNotificationRequest notificationRequest, TdsParserStateObject stateObj, Boolean isCommandProc, Boolean sync, TaskCompletionSource`1 completion, Int32 startRpc, Int32 startParam)
   en System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   en System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   en System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   en System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   en System.Data.Common.DbDataAdapter.Fill(DataSet dataSet)
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.CrearDataSet(SqlCommand unComando) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 106
   en TFI.FUNCIONES.Persistencia.SqlClientUtility.ExecuteDataSet(String connectionStringName, CommandType commandType, String commandText, SqlParameter[] parameters) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\FUNCIONES\Persistencia\SqlClientUtility.cs:línea 98
   en TFI.DAL.Services.DALBitacora.BitacoraVerLogs(String unTipoLog, Nullable`1 fechaInicio, Nullable`1 fechaFin) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\DAL\Services\DALBitacora.cs:línea 26
   en TFI.CORE.Servicios.BLLBitacora.BitacoraVerLogs(String unTipoLog, Nullable`1 fechaInicio, Nullable`1 fechaFin) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\CORE\Servicios\BLLBitacora.cs:línea 26
   en TFI.GUI.Areas.Intranet.Forms.VerLogs.btnFiltrarLogs_Click(Object sender, EventArgs e) en d:\DocumentosDescargas\uni\TFI\TFIRepo - JaviL\TFIRepo\TFISolucion\GUI\Areas\Intranet\Forms\VerLogs.aspx.cs:línea 108')
INSERT [dbo].[BitacoraLog] ([IdBitacoraLog], [CUIT], [NombreUsuario], [Fecha], [TipoLog], [Accion], [Mensaje]) VALUES (1063, N'20344003646', N'pargi', CAST(0x0000AB1A000291DF AS DateTime), N'Evento', N'Deslogueo', N'Deslogueo Correcto')
SET IDENTITY_INSERT [dbo].[BitacoraLog] OFF
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (2, N'20289082981', N'Empanadas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (3, N'20289082981', N'Facturas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (6, N'20289082981', N'Materias primas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (7, N'20377540582', N'CD', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (8, N'20377540582', N'DVD', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (9, N'20377540582', N'Vinilo', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (10, N'20344003646', N'Nafta', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (11, N'20344003646', N'Diesel', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (12, N'20344003646', N'Gas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (13, N'20344003646', N'Cabinados', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (14, N'20344003646', N'Monofasico', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (15, N'20344003646', N'Trifasico', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (16, N'20344003646', N'Injection2', CAST(0x0000AAF801797974 AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (17, N'20344003646', N'Injection', CAST(0x0000AAF80179A7DB AS DateTime))
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Comprobante] ON 

INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (141, 4, N'20344003646', 2, 1012, CAST(0x0000A70F0163BCD5 AS DateTime), 1030, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (141, 4, N'20344003646', 7, 2024, CAST(0x0000AAF800CD8E94 AS DateTime), 1030, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (142, 4, N'20344003646', 2, 1013, CAST(0x0000A70F016404DA AS DateTime), 1031, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (143, 4, N'20344003646', 2, 1014, CAST(0x0000A718015D936E AS DateTime), 1034, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (144, 4, N'20344003646', 2, 1015, CAST(0x0000A718017DF5F7 AS DateTime), 1035, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (145, 4, N'20344003646', 2, 1016, CAST(0x0000A71A011A047B AS DateTime), 1039, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (145, 4, N'20344003646', 7, 2031, CAST(0x0000AAF901587E52 AS DateTime), 1039, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (146, 4, N'20344003646', 2, 1017, CAST(0x0000A7310009ECB5 AS DateTime), 1042, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (147, 4, N'20344003646', 2, 1018, CAST(0x0000A731000AEC46 AS DateTime), 1043, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (147, 4, N'20344003646', 7, 1021, CAST(0x0000AAE70167497B AS DateTime), 1043, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (147, 4, N'20344003646', 9, 2033, CAST(0x0000AAF90158C17E AS DateTime), 1043, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (148, 4, N'20344003646', 2, 1019, CAST(0x0000A732013B26FF AS DateTime), 1044, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (149, 4, N'20344003646', 2, 1020, CAST(0x0000AAB1016ADD3C AS DateTime), 1047, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (149, 4, N'20344003646', 9, 3120, CAST(0x0000AB0E017F1669 AS DateTime), 1047, NULL, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (150, 4, N'20344003646', 2, 1022, CAST(0x0000AAF501736102 AS DateTime), 2051, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (151, 4, N'20344003646', 2, 1023, CAST(0x0000AAF5017458E4 AS DateTime), 2053, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (152, 4, N'20344003646', 2, 1024, CAST(0x0000AAF501851877 AS DateTime), 2054, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (152, 4, N'20344003646', 7, 2029, CAST(0x0000AAF90004FDB9 AS DateTime), 2054, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (152, 4, N'20344003646', 9, 2032, CAST(0x0000AAF901589E7F AS DateTime), 2054, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (153, 4, N'20344003646', 2, 2025, CAST(0x0000AAF800EFF429 AS DateTime), 3054, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (153, 4, N'20344003646', 7, 2028, CAST(0x0000AAF90003FBDE AS DateTime), 3054, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (154, 4, N'20344003646', 2, 2026, CAST(0x0000AAF800FEB9AE AS DateTime), 3055, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (154, 4, N'20344003646', 7, 2027, CAST(0x0000AAF90002FF9F AS DateTime), 3055, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (155, 4, N'20344003646', 2, 2030, CAST(0x0000AAF9015261F3 AS DateTime), 3059, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (156, 4, N'20344003646', 2, 2034, CAST(0x0000AB05013FA09F AS DateTime), 4089, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (157, 4, N'20344003646', 2, 2035, CAST(0x0000AB050141EB35 AS DateTime), 4090, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (158, 4, N'20344003646', 2, 2036, CAST(0x0000AB050143F95B AS DateTime), 4091, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (159, 4, N'20344003646', 2, 2037, CAST(0x0000AB0501446FDE AS DateTime), 4092, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (160, 4, N'20344003646', 2, 2038, CAST(0x0000AB050144CE37 AS DateTime), 4093, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (161, 5, N'20344003646', 2, 2039, CAST(0x0000AB07014FFA5F AS DateTime), 4097, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (162, 5, N'20344003646', 2, 2040, CAST(0x0000AB07015EB8CA AS DateTime), 4098, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (163, 6, N'20344003646', 2, 2041, CAST(0x0000AB070164E750 AS DateTime), 4099, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (164, 6, N'20344003646', 2, 2042, CAST(0x0000AB070165AA2B AS DateTime), 4100, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (165, 6, N'20344003646', 2, 2043, CAST(0x0000AB070166285B AS DateTime), 4101, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (166, 6, N'20344003646', 2, 2044, CAST(0x0000AB0701678ADD AS DateTime), 4102, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (167, 6, N'20344003646', 2, 2045, CAST(0x0000AB07016B1759 AS DateTime), 4103, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (168, 4, N'20344003646', 2, 2046, CAST(0x0000AB07016C8031 AS DateTime), 4104, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (169, 4, N'20344003646', 2, 2047, CAST(0x0000AB07016E38D4 AS DateTime), 4105, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (170, 4, N'20344003646', 2, 2048, CAST(0x0000AB0800C91E35 AS DateTime), 4106, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (171, 6, N'20344003646', 2, 2049, CAST(0x0000AB0800CB4721 AS DateTime), 4107, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (172, 4, N'20344003646', 2, 2050, CAST(0x0000AB0800CEEA00 AS DateTime), 4108, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (173, 5, N'20344003646', 2, 2051, CAST(0x0000AB0800CF7E57 AS DateTime), 4110, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (174, 6, N'20344003646', 2, 2052, CAST(0x0000AB0800D53EA4 AS DateTime), 4111, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (175, 4, N'20344003646', 2, 2053, CAST(0x0000AB0800D950E6 AS DateTime), 4115, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (176, 4, N'20344003646', 2, 2054, CAST(0x0000AB0800DC1AA7 AS DateTime), 4116, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (177, 4, N'20344003646', 2, 2055, CAST(0x0000AB0800E1BA21 AS DateTime), 4118, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (178, 4, N'20344003646', 2, 2056, CAST(0x0000AB0800E279E1 AS DateTime), 4119, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (179, 5, N'20344003646', 2, 2057, CAST(0x0000AB0800E2D972 AS DateTime), 4120, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (180, 5, N'20344003646', 2, 2058, CAST(0x0000AB0800E49184 AS DateTime), 4121, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (181, 5, N'20344003646', 2, 2059, CAST(0x0000AB0800E4B570 AS DateTime), 4122, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (182, 5, N'20344003646', 2, 2060, CAST(0x0000AB0800E52218 AS DateTime), 4123, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (183, 5, N'20344003646', 2, 2061, CAST(0x0000AB0800E8C1DC AS DateTime), 4124, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (184, 5, N'20344003646', 2, 2062, CAST(0x0000AB0800EE4AED AS DateTime), 4125, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (185, 6, N'20344003646', 2, 2063, CAST(0x0000AB0800EEA22A AS DateTime), 4126, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (186, 7, N'20344003646', 2, 2064, CAST(0x0000AB080130F177 AS DateTime), 4127, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (187, 8, N'20344003646', 2, 2065, CAST(0x0000AB0801311A78 AS DateTime), 4128, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (188, 8, N'20344003646', 2, 2066, CAST(0x0000AB09001141B1 AS DateTime), 4131, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (189, 8, N'20344003646', 2, 2067, CAST(0x0000AB090141480F AS DateTime), 4132, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (190, 8, N'20344003646', 2, 2071, CAST(0x0000AB0A0027B278 AS DateTime), 4136, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (191, 6, N'20344003646', 2, 2072, CAST(0x0000AB0A0028AEAA AS DateTime), 4137, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (192, 8, N'20344003646', 2, 2073, CAST(0x0000AB0A00290F62 AS DateTime), 4138, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (193, 5, N'20344003646', 2, 2074, CAST(0x0000AB0A00298A54 AS DateTime), 4139, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (194, 7, N'20344003646', 2, 2081, CAST(0x0000AB0A002ACF14 AS DateTime), 4140, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (195, 7, N'20344003646', 2, 2082, CAST(0x0000AB0A003B9926 AS DateTime), 4141, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (196, 8, N'20344003646', 2, 2083, CAST(0x0000AB0A003D69A1 AS DateTime), 4142, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (197, 6, N'20344003646', 2, 2084, CAST(0x0000AB0A010335AB AS DateTime), 4144, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (198, 5, N'20344003646', 2, 2085, CAST(0x0000AB0A010373F5 AS DateTime), 4143, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (199, 6, N'20344003646', 2, 2088, CAST(0x0000AB0A01047FDB AS DateTime), 4145, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (200, 7, N'20344003646', 2, 2090, CAST(0x0000AB0A01140BCD AS DateTime), 4146, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (201, 8, N'20344003646', 2, 2091, CAST(0x0000AB0B00CC4096 AS DateTime), 4147, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (202, 7, N'20344003646', 2, 2092, CAST(0x0000AB0B00DA39A5 AS DateTime), 4148, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (203, 7, N'20344003646', 2, 2093, CAST(0x0000AB0B010647C5 AS DateTime), 4149, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (204, 7, N'20344003646', 2, 3091, CAST(0x0000AB0B012FA5E4 AS DateTime), 5147, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (205, 4, N'20344003646', 2, 3092, CAST(0x0000AB0C00E9F50F AS DateTime), 5149, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (206, 5, N'20344003646', 2, 3093, CAST(0x0000AB0C0105C350 AS DateTime), 5163, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (207, 4, N'20344003646', 2, 3094, CAST(0x0000AB0C016DAE52 AS DateTime), 5168, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (208, 4, N'20344003646', 2, 3095, CAST(0x0000AB0C016E3563 AS DateTime), 5169, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (209, 5, N'20344003646', 2, 3096, CAST(0x0000AB0C016E5762 AS DateTime), 5166, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (210, 5, N'20344003646', 2, 3097, CAST(0x0000AB0D0111781B AS DateTime), 5171, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (211, 5, N'20344003646', 2, 3098, CAST(0x0000AB0E000BFDD3 AS DateTime), 5167, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (212, 4, N'20344003646', 2, 3099, CAST(0x0000AB0E000DD19B AS DateTime), 5162, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (213, 5, N'20344003646', 2, 3100, CAST(0x0000AB0E000DDA73 AS DateTime), 5164, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (214, 5, N'20344003646', 2, 3101, CAST(0x0000AB0E000DE130 AS DateTime), 5165, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (215, 4, N'20344003646', 2, 3102, CAST(0x0000AB0E0012A935 AS DateTime), 5175, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (216, 5, N'20344003646', 2, 3103, CAST(0x0000AB0E0012CE8C AS DateTime), 5177, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (217, 4, N'20344003646', 2, 3104, CAST(0x0000AB0E00139122 AS DateTime), 5178, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (218, 4, N'20344003646', 2, 3105, CAST(0x0000AB0E0013CD6D AS DateTime), 5179, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (219, 6, N'20344003646', 2, 3106, CAST(0x0000AB0E0013DE41 AS DateTime), 5180, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (220, 6, N'20344003646', 2, 3107, CAST(0x0000AB0E0014138A AS DateTime), 5181, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (221, 6, N'20344003646', 2, 3108, CAST(0x0000AB0E00143FB4 AS DateTime), 5182, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (222, 5, N'20344003646', 2, 3109, CAST(0x0000AB0E00147663 AS DateTime), 5183, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (222, 5, N'20344003646', 9, 3129, CAST(0x0000AB1000B889A2 AS DateTime), 5183, NULL, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (223, 6, N'20344003646', 2, 3110, CAST(0x0000AB0E0029071A AS DateTime), 5192, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (223, 6, N'20344003646', 9, 3128, CAST(0x0000AB0F00C5B66F AS DateTime), 5192, NULL, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (224, 5, N'20344003646', 2, 3111, CAST(0x0000AB0E00A38390 AS DateTime), 5186, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (225, 5, N'20344003646', 2, 3112, CAST(0x0000AB0E00B1114D AS DateTime), 5190, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (226, 4, N'20344003646', 2, 3113, CAST(0x0000AB0E00B29797 AS DateTime), 5188, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (226, 4, N'20344003646', 9, 3134, CAST(0x0000AB1000D430C7 AS DateTime), 5188, NULL, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (227, 6, N'20344003646', 2, 3114, CAST(0x0000AB0E00BE8B7C AS DateTime), 5184, NULL, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (228, 5, N'20344003646', 2, 3115, CAST(0x0000AB0E00DC12E1 AS DateTime), 5187, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (228, 5, N'20344003646', 9, 3133, CAST(0x0000AB1000C2445C AS DateTime), 5187, NULL, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (229, 4, N'20344003646', 2, 3116, CAST(0x0000AB0E00DCF878 AS DateTime), 5189, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (229, 4, N'20344003646', 9, 3125, CAST(0x0000AB0F00BC566D AS DateTime), 5189, NULL, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (230, 6, N'20344003646', 2, 3117, CAST(0x0000AB0E01334FD7 AS DateTime), 5193, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (230, 6, N'20344003646', 9, 3121, CAST(0x0000AB0E0185D3C2 AS DateTime), 5193, NULL, CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (231, 5, N'20344003646', 2, 3118, CAST(0x0000AB0E015007A9 AS DateTime), 5195, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (231, 5, N'20344003646', 9, 3119, CAST(0x0000AB0E01744EA4 AS DateTime), 5195, NULL, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (232, 4, N'20344003646', 2, 3132, CAST(0x0000AB1000C1BBDC AS DateTime), 5198, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (233, 5, N'20344003646', 2, 3135, CAST(0x0000AB1000D9EEB6 AS DateTime), 5196, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (234, 4, N'20344003646', 2, 3136, CAST(0x0000AB12002AC6FD AS DateTime), 5200, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (235, 4, N'20344003646', 2, 3137, CAST(0x0000AB1600BF7CA5 AS DateTime), 5201, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (236, 6, N'20344003646', 2, 3138, CAST(0x0000AB1600FD2054 AS DateTime), 5199, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (237, 5, N'20344003646', 2, 3139, CAST(0x0000AB17016EEFBA AS DateTime), 5202, NULL, CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Comprobante] OFF
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 141, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 141, 4, 7, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 142, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 143, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 144, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 145, 4, 2, N'20344003646', 4, 2, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 145, 4, 7, N'20344003646', 4, 2, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 146, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 147, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 147, 4, 7, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 147, 4, 9, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 148, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 149, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 149, 4, 9, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 150, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 151, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 152, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 152, 4, 7, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 152, 4, 9, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 153, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 153, 4, 7, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 154, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 154, 4, 7, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 155, 4, 2, N'20344003646', 34, 1, CAST(80000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 156, 4, 2, N'20344003646', 34, 1, CAST(80000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 157, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 158, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 159, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 160, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 161, 5, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 162, 5, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 163, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 164, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 165, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 166, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 167, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 168, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 169, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 170, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 171, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 172, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 173, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 174, 6, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 175, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 176, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 177, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 178, 4, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 179, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 180, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 181, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 182, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 183, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 184, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 185, 6, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 186, 7, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 187, 8, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 188, 8, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 189, 8, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 190, 8, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 191, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 192, 8, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 193, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 194, 7, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 195, 7, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 196, 8, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 197, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 198, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 199, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 200, 7, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 201, 8, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 202, 7, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 203, 7, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 204, 7, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 205, 4, 2, N'20344003646', 2, 2, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 206, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 207, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 208, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 209, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 210, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 211, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 212, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 213, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 214, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 215, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 216, 5, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 217, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 218, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 219, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 220, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 221, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 222, 5, 2, N'20344003646', 4, 1, CAST(75213 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 222, 5, 9, N'20344003646', 4, 1, CAST(75213 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 223, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 223, 6, 9, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 224, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 225, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 226, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 226, 4, 9, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 227, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 228, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 228, 5, 9, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 229, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 229, 4, 9, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 230, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 230, 6, 9, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 231, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 231, 5, 9, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 232, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 233, 5, 2, N'20344003646', 4, 1, CAST(75213 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 234, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 235, 4, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 236, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 237, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (2, 155, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (2, 233, 5, 2, N'20344003646', 3, 1, CAST(70652 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[CondicionFiscal] ON 

INSERT [dbo].[CondicionFiscal] ([IdCondicionFiscal], [Descripcion], [FecBaja]) VALUES (1, N'Consumidor Final', NULL)
INSERT [dbo].[CondicionFiscal] ([IdCondicionFiscal], [Descripcion], [FecBaja]) VALUES (2, N'Responsable Inscripto', NULL)
SET IDENTITY_INSERT [dbo].[CondicionFiscal] OFF
INSERT [dbo].[ConfigMailHost] ([Puerto], [Host], [Ssl], [Remitente], [Remps]) VALUES (587, N'smtp.gmail.com', 1, N'egenloys@gmail.com', N'AiygV/ZGapaFigH86qpbsw==')
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1, N'La calle', 23, NULL, N'', N'Merlo', 1, 1, CAST(0x0000A6B300E25DBB AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2, N'Calle1', 12, 1, N'a', N'Ituzaingo', 1, 1, CAST(0x0000A6B300F84398 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (3, N'Calle3', 12, 1, N'1', N'Ituzaingo', 1, 1, CAST(0x0000A6B300F8AF56 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (4, N'Calle4', 1, NULL, N'1', N'Itu', 1, 1, CAST(0x0000A6B501595277 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (5, N'123', 123, 123, N'123', N'123', 1, 1, CAST(0x0000A6B501594BBF AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (6, N'33', 11, NULL, N'33', N'33', 1, 1, CAST(0x0000A6B5015938B0 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (7, N'55', 55, 55, N'55', N'55', 1, 1, CAST(0x0000A6B30167538E AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (8, N'4', 4, 4, N'4', N'4', 1, 1, CAST(0x0000A6B5015945A2 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (9, N'33', 22, 11, N'11', N'11', 1, 1, CAST(0x0000A6B30175162D AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (10, N'11', 11, 11, N'11', N'11', 1, 1, CAST(0x0000A6B501592B68 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (11, N'11', 19, 22, N'11', N'11', 1, 1, CAST(0x0000A6B5015928B2 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (12, N'11', 11, 11, N'11', N'11', 1, 1, CAST(0x0000A6B501592D60 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (13, N'11', 11, 11, N'11', N'11', 1, 1, CAST(0x0000A6B501593040 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (14, N'88', 88, 88, N'88', N'88', 7, 1, CAST(0x0000A6B5015933E1 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (15, N'33', 333, 33, N'33', N'33', 1, 1, CAST(0x0000A6B501593214 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (16, N'Brown', 11, NULL, N'', N'11', 2, 1, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (17, N'56', 56, 56, N'56', N'56', 4, 1, CAST(0x0000A6B50159356E AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (18, N'12', 12, 12, N'12', N'12', 19, 1, CAST(0x0000A6B5015936CB AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (19, N'11', 11, NULL, N'', N'22', 2, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (20, N'12', 12, 12, N'12', N'12', 3, 1, CAST(0x0000AAF701679236 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (21, N'12', 12, 12, N'12', N'12', 3, 1, CAST(0x0000A6B501593A7F AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (22, N'13', 13, 13, N'13', N'13', 1, 1, CAST(0x0000A6B501593D10 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (23, N'13', 13, 13, N'13', N'13', 1, 1, CAST(0x0000A6B501594814 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (24, N'53', 53, 53, N'53', N'53', 1, 1, CAST(0x0000A6B501593F0F AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (25, N'53', 53, 53, N'53', N'53', 1, 1, CAST(0x0000A6B501594106 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (26, N'77', 77, 77, N'77', N'77', 17, 1, CAST(0x0000A6B5015942D5 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (27, N'46', 46, 46, N'46', N'46', 1, 1, CAST(0x0000A6B5015949E2 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (28, N'88', 88, 888, N'88', N'88', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (29, N'4', 4, 4, N'4', N'4', 4, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (30, N'1', 1, 1, N'1', N'1', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (31, N'2', 2, 2, N'2', N'2', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (32, N'88', 88, 88, N'88', N'88', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (33, N'14', 15, NULL, N'15', N'15', 1, 2, CAST(0x0000AB0D00E1E315 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (34, N'32', 32, NULL, N'32', N'32', 1, 2, CAST(0x0000AB0D00E50635 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (35, N'29', 29, 29, N'29', N'29', 9, 2, CAST(0x0000A6B501594D70 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (36, N'555', 55, 2, N'55', N'55', 1, 2, CAST(0x0000A6B501594F59 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (37, N'Belgrano', 402, NULL, N'', N'46', 3, 1, NULL, 299)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (38, N'11', 11, NULL, N'', N'11', 3, 1, NULL, 299)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (39, N'23', 23, 12, N'23', N'12', 1, 2, CAST(0x0000A6B5015957EC AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1037, N'Avenida1', 1, 1, N'1', N'1', 2, 1, CAST(0x0000A6BB002697EB AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1038, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1039, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1040, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1041, N'prueba', 1, 1, N'a', N'itu', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1042, N'hola', 1, 1, N'1', N'Itu', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1043, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1044, N'montefinal', 123, 1, N'A', N'Merlo', 17, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1045, N'Calle1', 12, NULL, NULL, N'Castelar', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1046, N'Calle1', 12, NULL, NULL, N'Castelar', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1047, N'Calle3', 1445, NULL, NULL, N'Castelar', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1048, N'Calle3', 1445, NULL, NULL, N'Castelar', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1049, N'asdf', 12, 3, N'a', N'as', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1050, N'asdf', 12, 3, N'a', N'as', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1051, N'ss', 12, 0, NULL, N'itu', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1052, N'ss', 12, 0, NULL, N'itu', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1053, N'Prueba', 334, 0, NULL, N'Castelar', 1, 1, CAST(0x0000AB15011FC6B3 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1054, N'Pruebados', 111, 0, NULL, N'Castelar', 1, 1, CAST(0x0000AAF701679C5B AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1055, N'Sufragio', 123, 0, NULL, N'Castelar', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (1056, N'Sufragio', 123, 0, NULL, N'Castelar', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2055, N'Calle1', 234, 0, NULL, N'Castelar', 1, 1, CAST(0x0000AB150121CC51 AS DateTime), 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2056, N'Acalle', 333, 0, NULL, N'Castelar', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2057, N'ACalle', 333, 0, NULL, N'Castelar', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2058, N'Calle11', 11, 0, NULL, N'Castelar', 1, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2059, N'Calle11', 11, 0, NULL, N'Castelar', 1, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2061, N'9 de Julio', 1600, 0, NULL, NULL, 2, 2, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2062, N'9 de Julio', 1600, 0, NULL, NULL, 2, 1, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2063, N'Belgrano', 808, 2, N'A', NULL, 2, 2, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2064, N'Arias', 211, 0, N'', NULL, 2, 1, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2065, N'Arias', 211, 0, NULL, NULL, 2, 2, NULL, 164)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2066, N'Rivadavia', 11203, 0, NULL, NULL, 2, 2, CAST(0x0000AB15017B23BF AS DateTime), 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2067, N'Cabildo', 300, 0, NULL, NULL, 2, 2, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2068, N'Mitre', 105, 3, N'B', NULL, 3, 1, CAST(0x0000AB1600015D27 AS DateTime), 313)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2069, N'Mitre', 105, 3, N'B', NULL, 3, 1, NULL, 313)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2070, N'Uruguay', 147, 8, N'D', NULL, 3, 1, NULL, 313)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2071, N'Brown', 1212, NULL, NULL, NULL, 2, 1, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2072, N'Brown', 1323, NULL, NULL, NULL, 2, 1, NULL, 219)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja], [IdLocalidad]) VALUES (2073, N'Brown', 1232, NULL, NULL, NULL, 2, 1, NULL, 219)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1, N'20344003646', N'pargi', CAST(0x0000A6B300E25DBE AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2, N'20344003646', N'pargi', CAST(0x0000A6B300F8439B AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (3, N'20344003646', N'pargi', CAST(0x0000A6B300F8AF58 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (4, N'20344003646', N'pargi', CAST(0x0000A6B501595278 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (5, N'20344003646', N'pargi', CAST(0x0000A6B501594BBF AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (6, N'20344003646', N'pargi', CAST(0x0000A6B5015938B0 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (7, N'20344003646', N'pargi', CAST(0x0000A6B301675391 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (8, N'20344003646', N'pargi', CAST(0x0000A6B5015945A2 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (9, N'20344003646', N'pargi', CAST(0x0000A6B301751630 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (10, N'20344003646', N'pargi', CAST(0x0000A6B501592B68 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (11, N'20344003646', N'pargi', CAST(0x0000A6B5015928B3 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (12, N'20344003646', N'pargi', CAST(0x0000A6B501592D60 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (13, N'20344003646', N'pargi', CAST(0x0000A6B501593040 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (14, N'20344003646', N'pargi', CAST(0x0000A6B5015933E1 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (15, N'20344003646', N'pargi', CAST(0x0000A6B501593214 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (16, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (17, N'20344003646', N'pargi', CAST(0x0000A6B50159356F AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (18, N'20344003646', N'pargi', CAST(0x0000A6B5015936CB AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (19, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (20, N'20344003646', N'pargi', CAST(0x0000AAF701679237 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (21, N'20344003646', N'pargi', CAST(0x0000A6B501593A7F AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (22, N'20344003646', N'pargi', CAST(0x0000A6B501593D10 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (23, N'20344003646', N'pargi', CAST(0x0000A6B501594814 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (24, N'20344003646', N'pargi', CAST(0x0000A6B501593F0F AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (25, N'20344003646', N'pargi', CAST(0x0000A6B501594106 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (26, N'20344003646', N'pargi', CAST(0x0000A6B5015942D5 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (27, N'20344003646', N'pargi', CAST(0x0000A6B5015949E2 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (33, N'20344003646', N'pargi', CAST(0x0000AB0D00E1E316 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (34, N'20344003646', N'pargi', CAST(0x0000AB0D00E50635 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (35, N'20344003646', N'pargi', CAST(0x0000A6B501594D71 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (36, N'20344003646', N'pargi', CAST(0x0000A6B501594F59 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (37, N'20344003646', N'pargi', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (38, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (39, N'20344003646', N'pargi', CAST(0x0000A6B5015957ED AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1037, N'20344003646', N'pargi', CAST(0x0000A6BB002697EC AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1043, N'20344003646', N'lrere', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1044, N'20344003646', N'lrere', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1045, N'20344003646', N'mlopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1046, N'20344003646', N'mlopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1047, N'20344003646', N'julopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1048, N'20344003646', N'julopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1049, N'20344003646', N'plola', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1050, N'20344003646', N'plola', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1051, N'20344003646', N'pepe', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1052, N'20344003646', N'pepe', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1053, N'20344003646', N'pargi', CAST(0x0000AB15011FC6B4 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1054, N'20344003646', N'pargi', CAST(0x0000AAF701679C5B AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1055, N'20344003646', N'pargidos', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1056, N'20344003646', N'pargidos', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2055, N'20344003646', N'pargi', CAST(0x0000AB150121CC52 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2056, N'20344003646', N'plopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2057, N'20344003646', N'plopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2058, N'20344003646', N'vco', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2059, N'20344003646', N'vco', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2061, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2062, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2063, N'20344003646', N'pargi', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2064, N'20344003646', N'tovd', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2065, N'20344003646', N'tovd', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2066, N'20344003646', N'tovd', CAST(0x0000AB15017B23C0 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2067, N'20344003646', N'tovd', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2068, N'20344003646', N'jmartinez', CAST(0x0000AB1600015D27 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2069, N'20344003646', N'jmartinez', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2072, N'20344003646', N'jmartinez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2073, N'20344003646', N'tovd', NULL, 1)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'123456', N'Empresa2', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20112223331', N'EmrpesaX', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20289082981', N'LIDOSA', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20326734390', N'MotoGraphics', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20344003646', N'Genloys', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20344364029', N'Scutural Suplementeos', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20377540582', N'Genezi Music', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'654321', N'Empresa3', NULL)
SET IDENTITY_INSERT [dbo].[EstadoPedido] ON 

INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (1, N'Pendiente de pago', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (2, N'Pago', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (3, N'En Camino', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (4, N'Listo para Retirar', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (5, N'Entregado', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (6, N'Cancelado', NULL)
SET IDENTITY_INSERT [dbo].[EstadoPedido] OFF
SET IDENTITY_INSERT [dbo].[Familia] ON 

INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (1, N'Publico', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (2, N'Cliente', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (3, N'Empleado', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (4, N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[Familia] OFF
SET IDENTITY_INSERT [dbo].[FormaEntrega] ON 

INSERT [dbo].[FormaEntrega] ([IdFormaEntrega], [DescripcionFormaEntrega], [FecBaja]) VALUES (1, N'A domicilio', NULL)
INSERT [dbo].[FormaEntrega] ([IdFormaEntrega], [DescripcionFormaEntrega], [FecBaja]) VALUES (2, N'Retiro en Sucursal', NULL)
SET IDENTITY_INSERT [dbo].[FormaEntrega] OFF
SET IDENTITY_INSERT [dbo].[FormaPago] ON 

INSERT [dbo].[FormaPago] ([IdFormaPago], [DescripFormaPago], [FecBaja]) VALUES (1, N'ECommerce', NULL)
INSERT [dbo].[FormaPago] ([IdFormaPago], [DescripFormaPago], [FecBaja]) VALUES (2, N'Externa', NULL)
SET IDENTITY_INSERT [dbo].[FormaPago] OFF
SET IDENTITY_INSERT [dbo].[IvaProducto] ON 

INSERT [dbo].[IvaProducto] ([IdIvaProducto], [PorcentajeIvaProd], [FecBaja]) VALUES (1, CAST(21.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[IvaProducto] ([IdIvaProducto], [PorcentajeIvaProd], [FecBaja]) VALUES (2, CAST(10.50 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[IvaProducto] OFF
SET IDENTITY_INSERT [dbo].[Lenguaje] ON 

INSERT [dbo].[Lenguaje] ([IdLenguaje], [DescripcionLenguaje], [FecBaja]) VALUES (1, N'Español', NULL)
INSERT [dbo].[Lenguaje] ([IdLenguaje], [DescripcionLenguaje], [FecBaja]) VALUES (2, N'English', NULL)
SET IDENTITY_INSERT [dbo].[Lenguaje] OFF
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'MailEmpresa', 1, N'Genloys@Genloys.com', NULL, N'20344003646')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'MailEmpresa', 1, N'Scutural@gmail.com', NULL, N'20344364029')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'MailEmpresa', 1, N'GeneziMusic@GMusic.com', NULL, N'20377540582')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'Mision', 1, N'Mision Genloys', NULL, N'20344003646')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'Mision', 1, N'Mision Scutural', NULL, N'20344364029')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'Mision', 1, N'Aca va la mision ACTUALIZADA', NULL, N'20377540582')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'QuienesSomos', 1, N'QuienesSomos Genloys', NULL, N'20344003646')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'QuienesSomos', 1, N'QuienesSomos Scutural', NULL, N'20344364029')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'QuienesSomos', 1, N'Aca va quienes somos', NULL, N'20377540582')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'TelEmpresa', 1, N'5423-2341', NULL, N'20344003646')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'TelEmpresa', 1, N'6532-1223', NULL, N'20344364029')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'TelEmpresa', 1, N'4334-0932', NULL, N'20377540582')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'Vision', 1, N'Vision Genloys', NULL, N'20344003646')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'Vision', 1, N'Vision Scutural', NULL, N'20344364029')
INSERT [dbo].[LenguajeControl] ([Texto], [IdLenguaje], [Valor], [FecBaja], [CUIT]) VALUES (N'Vision', 1, N'Aca va la vision', NULL, N'20377540582')
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344003646', N'MailEmpresa', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344003646', N'Mision', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344003646', N'QuienesSomos', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344003646', N'Vision', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344364029', N'MailEmpresa', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344364029', N'Mision', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344364029', N'QuienesSomos', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344364029', N'TelEmpresa', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20344364029', N'Vision', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20377540582', N'MailEmpresa', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20377540582', N'Mision', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20377540582', N'TelEmpresa', 1)
INSERT [dbo].[LenguajeControl_Empresa] ([CUIT], [Texto], [IdLenguaje]) VALUES (N'20377540582', N'Vision', 1)
SET IDENTITY_INSERT [dbo].[ListaDeseos] ON 

INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'administrador', 12, CAST(0x6B400B00 AS Date), 1246)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'jmartinez', 2, CAST(0x66400B00 AS Date), 220)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'jmartinez', 3, CAST(0x66400B00 AS Date), 222)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'jmartinez', 4, CAST(0x66400B00 AS Date), 218)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'jmartinez', 12, CAST(0x66400B00 AS Date), 219)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'julopez', 4, CAST(0x51400B00 AS Date), 221)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'julopez', 4, CAST(0x51400B00 AS Date), 1223)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'julopez', 12, NULL, 1224)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 1)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 14)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 19)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 23)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 35)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 37)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 43)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 46)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 48)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 66)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 67)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 69)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 74)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 77)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 79)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 84)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 107)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 108)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 109)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 111)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 113)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 115)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 118)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 119)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 121)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 123)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 126)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 127)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 129)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 131)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 133)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 136)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 137)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 139)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 141)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 142)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 144)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 146)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 148)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 150)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 151)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 152)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 153)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 155)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 156)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 158)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 160)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 162)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 164)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 166)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 168)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 170)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 172)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 174)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 175)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 177)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 179)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 181)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 183)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 185)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 186)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 188)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 190)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 191)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 193)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 195)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 197)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 199)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 201)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 203)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 205)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 207)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 208)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 210)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 213)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 1229)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 1233)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, CAST(0x67400B00 AS Date), 1241)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 2, NULL, 1250)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 2)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 7)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 8)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 15)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 36)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 49)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 53)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 59)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 62)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 64)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 70)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 72)
GO
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 75)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 81)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 82)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 85)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 94)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 99)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 100)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 102)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 103)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 104)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 1226)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 1232)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 1237)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 1242)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, NULL, 1251)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 3)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 5)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 9)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 11)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 12)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 16)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 17)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 21)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 22)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 26)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 27)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 29)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 31)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 33)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 38)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 39)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 41)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 44)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 47)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 50)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 52)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 55)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 56)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 57)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 60)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 63)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 65)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 68)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 73)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 76)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 80)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 83)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 86)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 88)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 90)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 92)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 95)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 96)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 98)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 101)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 105)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 106)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 110)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 112)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 114)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 116)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 117)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 120)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 122)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 124)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 125)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 128)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 130)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 132)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 134)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 135)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 138)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 140)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 143)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 145)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 147)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 149)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 154)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 157)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 159)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 161)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 163)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 165)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 167)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 169)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 171)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 173)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 176)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 178)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 180)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 182)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 184)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 187)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 189)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 192)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 194)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 196)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 198)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 200)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 202)
GO
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 204)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 206)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 209)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 211)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 212)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 223)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1225)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1227)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1230)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1231)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1234)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1235)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1236)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1243)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1244)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x71400B00 AS Date), 1249)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 4)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 6)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 10)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 13)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 18)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 20)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 24)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 25)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 28)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 30)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 32)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 34)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 40)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 42)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 45)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 51)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 54)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 58)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 61)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 71)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 78)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 87)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 89)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 91)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 93)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 97)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 1228)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 1238)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 1239)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 1247)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x71400B00 AS Date), 1248)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 34, CAST(0x71400B00 AS Date), 1240)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 34, CAST(0x71400B00 AS Date), 1245)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pdiez', 2, NULL, 215)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pdiez', 3, NULL, 214)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pdiez', 4, NULL, 216)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pepe', 3, NULL, 217)
SET IDENTITY_INSERT [dbo].[ListaDeseos] OFF
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1, 1, N'25 de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2, 1, N'3 de febrero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (3, 1, N'A. Alsina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (4, 1, N'A. Gonzáles Cháves')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (5, 1, N'Aguas Verdes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (6, 1, N'Alberti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (7, 1, N'Arrecifes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (8, 1, N'Ayacucho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (9, 1, N'Azul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (10, 1, N'Bahía Blanca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (11, 1, N'Balcarce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (12, 1, N'Baradero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (13, 1, N'Benito Juárez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (14, 1, N'Berisso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (15, 1, N'Bolívar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (16, 1, N'Bragado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (17, 1, N'Brandsen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (18, 1, N'Campana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (19, 1, N'Cañuelas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (20, 1, N'Capilla del Señor')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (21, 1, N'Capitán Sarmiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (22, 1, N'Carapachay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (23, 1, N'Carhue')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (24, 1, N'Cariló')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (25, 1, N'Carlos Casares')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (26, 1, N'Carlos Tejedor')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (27, 1, N'Carmen de Areco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (28, 1, N'Carmen de Patagones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (29, 1, N'Castelli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (30, 1, N'Chacabuco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (31, 1, N'Chascomús')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (32, 1, N'Chivilcoy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (33, 1, N'Colón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (34, 1, N'Coronel Dorrego')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (35, 1, N'Coronel Pringles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (36, 1, N'Coronel Rosales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (37, 1, N'Coronel Suarez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (38, 1, N'Costa Azul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (39, 1, N'Costa Chica')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (40, 1, N'Costa del Este')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (41, 1, N'Costa Esmeralda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (42, 1, N'Daireaux')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (43, 1, N'Darregueira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (44, 1, N'Del Viso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (45, 1, N'Dolores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (46, 1, N'Don Torcuato')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (47, 1, N'Ensenada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (48, 1, N'Escobar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (49, 1, N'Exaltación de la Cruz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (50, 1, N'Florentino Ameghino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (51, 1, N'Garín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (52, 1, N'Gral. Alvarado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (53, 1, N'Gral. Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (54, 1, N'Gral. Arenales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (55, 1, N'Gral. Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (56, 1, N'Gral. Guido')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (57, 1, N'Gral. Lamadrid')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (58, 1, N'Gral. Las Heras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (59, 1, N'Gral. Lavalle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (60, 1, N'Gral. Madariaga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (61, 1, N'Gral. Pacheco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (62, 1, N'Gral. Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (63, 1, N'Gral. Pinto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (64, 1, N'Gral. Pueyrredón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (65, 1, N'Gral. Rodríguez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (66, 1, N'Gral. Viamonte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (67, 1, N'Gral. Villegas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (68, 1, N'Guaminí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (69, 1, N'Guernica')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (70, 1, N'Hipólito Yrigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (71, 1, N'Ing. Maschwitz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (72, 1, N'Junín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (73, 1, N'La Plata')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (74, 1, N'Laprida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (75, 1, N'Las Flores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (76, 1, N'Las Toninas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (77, 1, N'Leandro N. Alem')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (78, 1, N'Lincoln')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (79, 1, N'Loberia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (80, 1, N'Lobos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (81, 1, N'Los Cardales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (82, 1, N'Los Toldos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (83, 1, N'Lucila del Mar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (84, 1, N'Luján')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (85, 1, N'Magdalena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (86, 1, N'Maipú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (87, 1, N'Mar Chiquita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (88, 1, N'Mar de Ajó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (89, 1, N'Mar de las Pampas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (90, 1, N'Mar del Plata')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (91, 1, N'Mar del Tuyú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (92, 1, N'Marcos Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (93, 1, N'Mercedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (94, 1, N'Miramar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (95, 1, N'Monte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (96, 1, N'Monte Hermoso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (97, 1, N'Munro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (98, 1, N'Navarro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (99, 1, N'Necochea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (100, 1, N'Olavarría')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (101, 1, N'Partido de la Costa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (102, 1, N'Pehuajó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (103, 1, N'Pellegrini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (104, 1, N'Pergamino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (105, 1, N'Pigüé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (106, 1, N'Pila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (107, 1, N'Pilar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (108, 1, N'Pinamar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (109, 1, N'Pinar del Sol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (110, 1, N'Polvorines')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (111, 1, N'Pte. Perón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (112, 1, N'Puán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (113, 1, N'Punta Indio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (114, 1, N'Ramallo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (115, 1, N'Rauch')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (116, 1, N'Rivadavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (117, 1, N'Rojas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (118, 1, N'Roque Pérez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (119, 1, N'Saavedra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (120, 1, N'Saladillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (121, 1, N'Salliqueló')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (122, 1, N'Salto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (123, 1, N'San Andrés de Giles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (124, 1, N'San Antonio de Areco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (125, 1, N'San Antonio de Padua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (126, 1, N'San Bernardo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (127, 1, N'San Cayetano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (128, 1, N'San Clemente del Tuyú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (129, 1, N'San Nicolás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (130, 1, N'San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (131, 1, N'San Vicente')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (132, 1, N'Santa Teresita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (133, 1, N'Suipacha')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (134, 1, N'Tandil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (135, 1, N'Tapalqué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (136, 1, N'Tordillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (137, 1, N'Tornquist')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (138, 1, N'Trenque Lauquen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (139, 1, N'Tres Lomas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (140, 1, N'Villa Gesell')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (141, 1, N'Villarino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (142, 1, N'Zárate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (143, 2, N'11 de Septiembre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (144, 2, N'20 de Junio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (145, 2, N'25 de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (146, 2, N'Acassuso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (147, 2, N'Adrogué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (148, 2, N'Aldo Bonzi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (149, 2, N'Área Reserva Cinturón Ecológico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (150, 2, N'Avellaneda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (151, 2, N'Banfield')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (152, 2, N'Barrio Parque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (153, 2, N'Barrio Santa Teresita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (154, 2, N'Beccar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (155, 2, N'Bella Vista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (156, 2, N'Berazategui')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (157, 2, N'Bernal Este')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (158, 2, N'Bernal Oeste')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (159, 2, N'Billinghurst')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (160, 2, N'Boulogne')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (161, 2, N'Burzaco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (162, 2, N'Carapachay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (163, 2, N'Caseros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (164, 2, N'Castelar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (165, 2, N'Churruca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (166, 2, N'Ciudad Evita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (167, 2, N'Ciudad Madero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (168, 2, N'Ciudadela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (169, 2, N'Claypole')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (170, 2, N'Crucecita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (171, 2, N'Dock Sud')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (172, 2, N'Don Bosco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (173, 2, N'Don Orione')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (174, 2, N'El Jagüel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (175, 2, N'El Libertador')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (176, 2, N'El Palomar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (177, 2, N'El Tala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (178, 2, N'El Trébol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (179, 2, N'Ezeiza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (180, 2, N'Ezpeleta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (181, 2, N'Florencio Varela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (182, 2, N'Florida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (183, 2, N'Francisco Álvarez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (184, 2, N'Gerli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (185, 2, N'Glew')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (186, 2, N'González Catán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (187, 2, N'Gral. Lamadrid')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (188, 2, N'Grand Bourg')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (189, 2, N'Gregorio de Laferrere')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (190, 2, N'Guillermo Enrique Hudson')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (191, 2, N'Haedo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (192, 2, N'Hurlingham')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (193, 2, N'Ing. Sourdeaux')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (194, 2, N'Isidro Casanova')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (195, 2, N'Ituzaingó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (196, 2, N'José C. Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (197, 2, N'José Ingenieros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (198, 2, N'José Marmol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (199, 2, N'La Lucila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (200, 2, N'La Reja')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (201, 2, N'La Tablada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (202, 2, N'Lanús')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (203, 2, N'Llavallol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (204, 2, N'Loma Hermosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (205, 2, N'Lomas de Zamora')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (206, 2, N'Lomas del Millón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (207, 2, N'Lomas del Mirador')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (208, 2, N'Longchamps')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (209, 2, N'Los Polvorines')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (210, 2, N'Luis Guillón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (211, 2, N'Malvinas Argentinas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (212, 2, N'Martín Coronado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (213, 2, N'Martínez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (214, 2, N'Merlo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (215, 2, N'Ministro Rivadavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (216, 2, N'Monte Chingolo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (217, 2, N'Monte Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (218, 2, N'Moreno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (219, 2, N'Morón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (220, 2, N'Muñiz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (221, 2, N'Olivos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (222, 2, N'Pablo Nogués')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (223, 2, N'Pablo Podestá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (224, 2, N'Paso del Rey')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (225, 2, N'Pereyra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (226, 2, N'Piñeiro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (227, 2, N'Plátanos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (228, 2, N'Pontevedra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (229, 2, N'Quilmes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (230, 2, N'Rafael Calzada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (231, 2, N'Rafael Castillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (232, 2, N'Ramos Mejía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (233, 2, N'Ranelagh')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (234, 2, N'Remedios de Escalada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (235, 2, N'Sáenz Peña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (236, 2, N'San Antonio de Padua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (237, 2, N'San Fernando')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (238, 2, N'San Francisco Solano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (239, 2, N'San Isidro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (240, 2, N'San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (241, 2, N'San Justo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (242, 2, N'San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (243, 2, N'San Miguel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (244, 2, N'Santos Lugares')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (245, 2, N'Sarandí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (246, 2, N'Sourigues')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (247, 2, N'Tapiales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (248, 2, N'Temperley')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (249, 2, N'Tigre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (250, 2, N'Tortuguitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (251, 2, N'Tristán Suárez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (252, 2, N'Trujui')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (253, 2, N'Turdera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (254, 2, N'Valentín Alsina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (255, 2, N'Vicente López')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (256, 2, N'Villa Adelina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (257, 2, N'Villa Ballester')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (258, 2, N'Villa Bosch')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (259, 2, N'Villa Caraza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (260, 2, N'Villa Celina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (261, 2, N'Villa Centenario')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (262, 2, N'Villa de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (263, 2, N'Villa Diamante')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (264, 2, N'Villa Domínico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (265, 2, N'Villa España')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (266, 2, N'Villa Fiorito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (267, 2, N'Villa Guillermina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (268, 2, N'Villa Insuperable')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (269, 2, N'Villa José León Suárez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (270, 2, N'Villa La Florida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (271, 2, N'Villa Luzuriaga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (272, 2, N'Villa Martelli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (273, 2, N'Villa Obrera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (274, 2, N'Villa Progreso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (275, 2, N'Villa Raffo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (276, 2, N'Villa Sarmiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (277, 2, N'Villa Tesei')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (278, 2, N'Villa Udaondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (279, 2, N'Virrey del Pino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (280, 2, N'Wilde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (281, 2, N'William Morris')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (282, 3, N'Agronomía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (283, 3, N'Almagro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (284, 3, N'Balvanera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (285, 3, N'Barracas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (286, 3, N'Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (287, 3, N'Boca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (288, 3, N'Boedo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (289, 3, N'Caballito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (290, 3, N'Chacarita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (291, 3, N'Coghlan')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (292, 3, N'Colegiales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (293, 3, N'Constitución')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (294, 3, N'Flores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (295, 3, N'Floresta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (296, 3, N'La Paternal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (297, 3, N'Liniers')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (298, 3, N'Mataderos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (299, 3, N'Monserrat')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (300, 3, N'Monte Castro')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (301, 3, N'Nueva Pompeya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (302, 3, N'Núñez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (303, 3, N'Palermo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (304, 3, N'Parque Avellaneda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (305, 3, N'Parque Chacabuco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (306, 3, N'Parque Chas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (307, 3, N'Parque Patricios')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (308, 3, N'Puerto Madero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (309, 3, N'Recoleta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (310, 3, N'Retiro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (311, 3, N'Saavedra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (312, 3, N'San Cristóbal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (313, 3, N'San Nicolás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (314, 3, N'San Telmo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (315, 3, N'Vélez Sársfield')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (316, 3, N'Versalles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (317, 3, N'Villa Crespo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (318, 3, N'Villa del Parque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (319, 3, N'Villa Devoto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (320, 3, N'Villa Gral. Mitre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (321, 3, N'Villa Lugano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (322, 3, N'Villa Luro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (323, 3, N'Villa Ortúzar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (324, 3, N'Villa Pueyrredón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (325, 3, N'Villa Real')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (326, 3, N'Villa Riachuelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (327, 3, N'Villa Santa Rita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (328, 3, N'Villa Soldati')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (329, 3, N'Villa Urquiza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (330, 4, N'Aconquija')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (331, 4, N'Ancasti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (332, 4, N'Andalgalá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (333, 4, N'Antofagasta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (334, 4, N'Belén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (335, 4, N'Capayán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (336, 4, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (337, 4, N'Chaquiago')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (338, 4, N'Corral Quemado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (339, 4, N'El Alto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (340, 4, N'El Rodeo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (341, 4, N'F.Mamerto Esquiú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (342, 4, N'Fiambalá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (343, 4, N'Hualfín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (344, 4, N'Huillapima')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (345, 4, N'Icaño')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (346, 4, N'La Puerta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (347, 4, N'Las Juntas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (348, 4, N'Londres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (349, 4, N'Los Altos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (350, 4, N'Los Varela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (351, 4, N'Mutquín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (352, 4, N'Paclín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (353, 4, N'Poman')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (354, 4, N'Pozo de La Piedra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (355, 4, N'Puerta de Corral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (356, 4, N'Puerta San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (357, 4, N'Recreo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (358, 4, N'Alijilan')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (359, 4, N'San Fernando')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (360, 4, N'San Fernando del Valle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (361, 4, N'San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (362, 4, N'Santa María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (363, 4, N'Santa Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (364, 4, N'Saujil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (365, 4, N'Tapso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (366, 4, N'Tinogasta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (367, 4, N'Valle Viejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (368, 4, N'Villa Vil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (369, 5, N'Aviá Teraí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (370, 5, N'Barranqueras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (371, 5, N'Basail')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (372, 5, N'Campo Largo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (373, 5, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (374, 5, N'Capitán Solari')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (375, 5, N'Charadai')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (376, 5, N'Charata')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (377, 5, N'Chorotis')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (378, 5, N'Ciervo Petiso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (379, 5, N'Cnel. Du Graty')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (380, 5, N'Col. Benítez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (381, 5, N'Col. Elisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (382, 5, N'Col. Popular')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (383, 5, N'Colonias Unidas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (384, 5, N'Concepción')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (385, 5, N'Corzuela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (386, 5, N'Cote Lai')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (387, 5, N'El Sauzalito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (388, 5, N'Enrique Urien')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (389, 5, N'Fontana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (390, 5, N'Fte. Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (391, 5, N'Gancedo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (392, 5, N'Gral. Capdevila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (393, 5, N'Gral. Pinero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (394, 5, N'Gral. San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (395, 5, N'Gral. Vedia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (396, 5, N'Hermoso Campo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (397, 5, N'I. del Cerrito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (398, 5, N'J.J. Castelli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (399, 5, N'La Clotilde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (400, 5, N'La Eduvigis')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (401, 5, N'La Escondida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (402, 5, N'La Leonesa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (403, 5, N'La Tigra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (404, 5, N'La Verde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (405, 5, N'Laguna Blanca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (406, 5, N'Laguna Limpia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (407, 5, N'Lapachito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (408, 5, N'Las Breñas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (409, 5, N'Las Garcitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (410, 5, N'Las Palmas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (411, 5, N'Los Frentones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (412, 5, N'Machagai')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (413, 5, N'Makallé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (414, 5, N'Margarita Belén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (415, 5, N'Miraflores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (416, 5, N'Misión N. Pompeya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (417, 5, N'Napenay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (418, 5, N'Pampa Almirón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (419, 5, N'Pampa del Indio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (420, 5, N'Pampa del Infierno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (421, 5, N'Pdcia. de La Plaza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (422, 5, N'Pdcia. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (423, 5, N'Pdcia. Roque Sáenz Peña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (424, 5, N'Pto. Bermejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (425, 5, N'Pto. Eva Perón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (426, 5, N'Puero Tirol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (427, 5, N'Puerto Vilelas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (428, 5, N'Quitilipi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (429, 5, N'Resistencia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (430, 5, N'Sáenz Peña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (431, 5, N'Samuhú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (432, 5, N'San Bernardo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (433, 5, N'Santa Sylvina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (434, 5, N'Taco Pozo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (435, 5, N'Tres Isletas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (436, 5, N'Villa Ángela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (437, 5, N'Villa Berthet')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (438, 5, N'Villa R. Bermejito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (439, 6, N'Aldea Apeleg')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (440, 6, N'Aldea Beleiro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (441, 6, N'Aldea Epulef')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (442, 6, N'Alto Río Sengerr')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (443, 6, N'Buen Pasto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (444, 6, N'Camarones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (445, 6, N'Carrenleufú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (446, 6, N'Cholila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (447, 6, N'Co. Centinela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (448, 6, N'Colan Conhué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (449, 6, N'Comodoro Rivadavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (450, 6, N'Corcovado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (451, 6, N'Cushamen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (452, 6, N'Dique F. Ameghino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (453, 6, N'Dolavón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (454, 6, N'Dr. R. Rojas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (455, 6, N'El Hoyo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (456, 6, N'El Maitén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (457, 6, N'Epuyén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (458, 6, N'Esquel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (459, 6, N'Facundo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (460, 6, N'Gaimán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (461, 6, N'Gan Gan')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (462, 6, N'Gastre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (463, 6, N'Gdor. Costa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (464, 6, N'Gualjaina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (465, 6, N'J. de San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (466, 6, N'Lago Blanco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (467, 6, N'Lago Puelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (468, 6, N'Lagunita Salada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (469, 6, N'Las Plumas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (470, 6, N'Los Altares')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (471, 6, N'Paso de los Indios')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (472, 6, N'Paso del Sapo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (473, 6, N'Pto. Madryn')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (474, 6, N'Pto. Pirámides')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (475, 6, N'Rada Tilly')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (476, 6, N'Rawson')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (477, 6, N'Río Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (478, 6, N'Río Pico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (479, 6, N'Sarmiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (480, 6, N'Tecka')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (481, 6, N'Telsen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (482, 6, N'Trelew')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (483, 6, N'Trevelin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (484, 6, N'Veintiocho de Julio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (485, 7, N'Achiras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (486, 7, N'Adelia Maria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (487, 7, N'Agua de Oro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (488, 7, N'Alcira Gigena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (489, 7, N'Aldea Santa Maria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (490, 7, N'Alejandro Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (491, 7, N'Alejo Ledesma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (492, 7, N'Alicia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (493, 7, N'Almafuerte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (494, 7, N'Alpa Corral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (495, 7, N'Alta Gracia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (496, 7, N'Alto Alegre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (497, 7, N'Alto de Los Quebrachos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (498, 7, N'Altos de Chipion')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (499, 7, N'Amboy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (500, 7, N'Ambul')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (501, 7, N'Ana Zumaran')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (502, 7, N'Anisacate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (503, 7, N'Arguello')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (504, 7, N'Arias')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (505, 7, N'Arroyito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (506, 7, N'Arroyo Algodon')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (507, 7, N'Arroyo Cabral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (508, 7, N'Arroyo Los Patos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (509, 7, N'Assunta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (510, 7, N'Atahona')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (511, 7, N'Ausonia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (512, 7, N'Avellaneda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (513, 7, N'Ballesteros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (514, 7, N'Ballesteros Sud')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (515, 7, N'Balnearia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (516, 7, N'Bañado de Soto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (517, 7, N'Bell Ville')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (518, 7, N'Bengolea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (519, 7, N'Benjamin Gould')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (520, 7, N'Berrotaran')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (521, 7, N'Bialet Masse')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (522, 7, N'Bouwer')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (523, 7, N'Brinkmann')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (524, 7, N'Buchardo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (525, 7, N'Bulnes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (526, 7, N'Cabalango')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (527, 7, N'Calamuchita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (528, 7, N'Calchin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (529, 7, N'Calchin Oeste')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (530, 7, N'Calmayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (531, 7, N'Camilo Aldao')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (532, 7, N'Caminiaga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (533, 7, N'Cañada de Luque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (534, 7, N'Cañada de Machado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (535, 7, N'Cañada de Rio Pinto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (536, 7, N'Cañada del Sauce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (537, 7, N'Canals')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (538, 7, N'Candelaria Sud')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (539, 7, N'Capilla de Remedios')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (540, 7, N'Capilla de Siton')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (541, 7, N'Capilla del Carmen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (542, 7, N'Capilla del Monte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (543, 7, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (544, 7, N'Capitan Gral B. O´Higgins')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (545, 7, N'Carnerillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (546, 7, N'Carrilobo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (547, 7, N'Casa Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (548, 7, N'Cavanagh')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (549, 7, N'Cerro Colorado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (550, 7, N'Chaján')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (551, 7, N'Chalacea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (552, 7, N'Chañar Viejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (553, 7, N'Chancaní')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (554, 7, N'Charbonier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (555, 7, N'Charras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (556, 7, N'Chazón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (557, 7, N'Chilibroste')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (558, 7, N'Chucul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (559, 7, N'Chuña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (560, 7, N'Chuña Huasi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (561, 7, N'Churqui Cañada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (562, 7, N'Cienaga Del Coro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (563, 7, N'Cintra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (564, 7, N'Col. Almada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (565, 7, N'Col. Anita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (566, 7, N'Col. Barge')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (567, 7, N'Col. Bismark')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (568, 7, N'Col. Bremen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (569, 7, N'Col. Caroya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (570, 7, N'Col. Italiana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (571, 7, N'Col. Iturraspe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (572, 7, N'Col. Las Cuatro Esquinas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (573, 7, N'Col. Las Pichanas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (574, 7, N'Col. Marina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (575, 7, N'Col. Prosperidad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (576, 7, N'Col. San Bartolome')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (577, 7, N'Col. San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (578, 7, N'Col. Tirolesa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (579, 7, N'Col. Vicente Aguero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (580, 7, N'Col. Videla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (581, 7, N'Col. Vignaud')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (582, 7, N'Col. Waltelina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (583, 7, N'Colazo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (584, 7, N'Comechingones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (585, 7, N'Conlara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (586, 7, N'Copacabana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (587, 7, N'7')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (588, 7, N'Coronel Baigorria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (589, 7, N'Coronel Moldes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (590, 7, N'Corral de Bustos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (591, 7, N'Corralito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (592, 7, N'Cosquín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (593, 7, N'Costa Sacate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (594, 7, N'Cruz Alta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (595, 7, N'Cruz de Caña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (596, 7, N'Cruz del Eje')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (597, 7, N'Cuesta Blanca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (598, 7, N'Dean Funes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (599, 7, N'Del Campillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (600, 7, N'Despeñaderos')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (601, 7, N'Devoto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (602, 7, N'Diego de Rojas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (603, 7, N'Dique Chico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (604, 7, N'El Arañado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (605, 7, N'El Brete')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (606, 7, N'El Chacho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (607, 7, N'El Crispín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (608, 7, N'El Fortín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (609, 7, N'El Manzano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (610, 7, N'El Rastreador')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (611, 7, N'El Rodeo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (612, 7, N'El Tío')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (613, 7, N'Elena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (614, 7, N'Embalse')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (615, 7, N'Esquina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (616, 7, N'Estación Gral. Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (617, 7, N'Estación Juárez Celman')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (618, 7, N'Estancia de Guadalupe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (619, 7, N'Estancia Vieja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (620, 7, N'Etruria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (621, 7, N'Eufrasio Loza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (622, 7, N'Falda del Carmen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (623, 7, N'Freyre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (624, 7, N'Gral. Baldissera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (625, 7, N'Gral. Cabrera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (626, 7, N'Gral. Deheza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (627, 7, N'Gral. Fotheringham')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (628, 7, N'Gral. Levalle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (629, 7, N'Gral. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (630, 7, N'Guanaco Muerto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (631, 7, N'Guasapampa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (632, 7, N'Guatimozin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (633, 7, N'Gutenberg')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (634, 7, N'Hernando')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (635, 7, N'Huanchillas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (636, 7, N'Huerta Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (637, 7, N'Huinca Renanco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (638, 7, N'Idiazabal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (639, 7, N'Impira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (640, 7, N'Inriville')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (641, 7, N'Isla Verde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (642, 7, N'Italó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (643, 7, N'James Craik')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (644, 7, N'Jesús María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (645, 7, N'Jovita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (646, 7, N'Justiniano Posse')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (647, 7, N'Km 658')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (648, 7, N'L. V. Mansilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (649, 7, N'La Batea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (650, 7, N'La Calera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (651, 7, N'La Carlota')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (652, 7, N'La Carolina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (653, 7, N'La Cautiva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (654, 7, N'La Cesira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (655, 7, N'La Cruz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (656, 7, N'La Cumbre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (657, 7, N'La Cumbrecita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (658, 7, N'La Falda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (659, 7, N'La Francia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (660, 7, N'La Granja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (661, 7, N'La Higuera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (662, 7, N'La Laguna')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (663, 7, N'La Paisanita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (664, 7, N'La Palestina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (665, 7, N'12')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (666, 7, N'La Paquita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (667, 7, N'La Para')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (668, 7, N'La Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (669, 7, N'La Playa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (670, 7, N'La Playosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (671, 7, N'La Población')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (672, 7, N'La Posta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (673, 7, N'La Puerta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (674, 7, N'La Quinta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (675, 7, N'La Rancherita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (676, 7, N'La Rinconada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (677, 7, N'La Serranita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (678, 7, N'La Tordilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (679, 7, N'Laborde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (680, 7, N'Laboulaye')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (681, 7, N'Laguna Larga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (682, 7, N'Las Acequias')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (683, 7, N'Las Albahacas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (684, 7, N'Las Arrias')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (685, 7, N'Las Bajadas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (686, 7, N'Las Caleras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (687, 7, N'Las Calles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (688, 7, N'Las Cañadas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (689, 7, N'Las Gramillas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (690, 7, N'Las Higueras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (691, 7, N'Las Isletillas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (692, 7, N'Las Junturas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (693, 7, N'Las Palmas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (694, 7, N'Las Peñas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (695, 7, N'Las Peñas Sud')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (696, 7, N'Las Perdices')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (697, 7, N'Las Playas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (698, 7, N'Las Rabonas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (699, 7, N'Las Saladas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (700, 7, N'Las Tapias')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (701, 7, N'Las Varas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (702, 7, N'Las Varillas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (703, 7, N'Las Vertientes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (704, 7, N'Leguizamón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (705, 7, N'Leones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (706, 7, N'Los Cedros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (707, 7, N'Los Cerrillos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (708, 7, N'Los Chañaritos (C.E)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (709, 7, N'Los Chanaritos (R.S)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (710, 7, N'Los Cisnes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (711, 7, N'Los Cocos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (712, 7, N'Los Cóndores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (713, 7, N'Los Hornillos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (714, 7, N'Los Hoyos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (715, 7, N'Los Mistoles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (716, 7, N'Los Molinos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (717, 7, N'Los Pozos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (718, 7, N'Los Reartes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (719, 7, N'Los Surgentes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (720, 7, N'Los Talares')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (721, 7, N'Los Zorros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (722, 7, N'Lozada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (723, 7, N'Luca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (724, 7, N'Luque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (725, 7, N'Luyaba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (726, 7, N'Malagueño')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (727, 7, N'Malena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (728, 7, N'Malvinas Argentinas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (729, 7, N'Manfredi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (730, 7, N'Maquinista Gallini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (731, 7, N'Marcos Juárez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (732, 7, N'Marull')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (733, 7, N'Matorrales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (734, 7, N'Mattaldi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (735, 7, N'Mayu Sumaj')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (736, 7, N'Media Naranja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (737, 7, N'Melo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (738, 7, N'Mendiolaza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (739, 7, N'Mi Granja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (740, 7, N'Mina Clavero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (741, 7, N'Miramar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (742, 7, N'Morrison')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (743, 7, N'Morteros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (744, 7, N'Mte. Buey')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (745, 7, N'Mte. Cristo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (746, 7, N'Mte. De Los Gauchos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (747, 7, N'Mte. Leña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (748, 7, N'Mte. Maíz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (749, 7, N'Mte. Ralo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (750, 7, N'Nicolás Bruzone')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (751, 7, N'Noetinger')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (752, 7, N'Nono')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (753, 7, N'Nueva 7')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (754, 7, N'Obispo Trejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (755, 7, N'Olaeta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (756, 7, N'Oliva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (757, 7, N'Olivares San Nicolás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (758, 7, N'Onagolty')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (759, 7, N'Oncativo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (760, 7, N'Ordoñez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (761, 7, N'Pacheco De Melo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (762, 7, N'Pampayasta N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (763, 7, N'Pampayasta S.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (764, 7, N'Panaholma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (765, 7, N'Pascanas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (766, 7, N'Pasco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (767, 7, N'Paso del Durazno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (768, 7, N'Paso Viejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (769, 7, N'Pilar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (770, 7, N'Pincén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (771, 7, N'Piquillín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (772, 7, N'Plaza de Mercedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (773, 7, N'Plaza Luxardo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (774, 7, N'Porteña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (775, 7, N'Potrero de Garay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (776, 7, N'Pozo del Molle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (777, 7, N'Pozo Nuevo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (778, 7, N'Pueblo Italiano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (779, 7, N'Puesto de Castro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (780, 7, N'Punta del Agua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (781, 7, N'Quebracho Herrado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (782, 7, N'Quilino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (783, 7, N'Rafael García')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (784, 7, N'Ranqueles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (785, 7, N'Rayo Cortado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (786, 7, N'Reducción')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (787, 7, N'Rincón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (788, 7, N'Río Bamba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (789, 7, N'Río Ceballos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (790, 7, N'Río Cuarto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (791, 7, N'Río de Los Sauces')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (792, 7, N'Río Primero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (793, 7, N'Río Segundo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (794, 7, N'Río Tercero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (795, 7, N'Rosales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (796, 7, N'Rosario del Saladillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (797, 7, N'Sacanta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (798, 7, N'Sagrada Familia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (799, 7, N'Saira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (800, 7, N'Saladillo')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (801, 7, N'Saldán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (802, 7, N'Salsacate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (803, 7, N'Salsipuedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (804, 7, N'Sampacho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (805, 7, N'San Agustín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (806, 7, N'San Antonio de Arredondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (807, 7, N'San Antonio de Litín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (808, 7, N'San Basilio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (809, 7, N'San Carlos Minas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (810, 7, N'San Clemente')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (811, 7, N'San Esteban')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (812, 7, N'San Francisco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (813, 7, N'San Ignacio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (814, 7, N'San Javier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (815, 7, N'San Jerónimo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (816, 7, N'San Joaquín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (817, 7, N'San José de La Dormida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (818, 7, N'San José de Las Salinas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (819, 7, N'San Lorenzo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (820, 7, N'San Marcos Sierras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (821, 7, N'San Marcos Sud')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (822, 7, N'San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (823, 7, N'San Pedro N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (824, 7, N'San Roque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (825, 7, N'San Vicente')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (826, 7, N'Santa Catalina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (827, 7, N'Santa Elena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (828, 7, N'Santa Eufemia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (829, 7, N'Santa Maria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (830, 7, N'Sarmiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (831, 7, N'Saturnino M.Laspiur')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (832, 7, N'Sauce Arriba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (833, 7, N'Sebastián Elcano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (834, 7, N'Seeber')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (835, 7, N'Segunda Usina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (836, 7, N'Serrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (837, 7, N'Serrezuela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (838, 7, N'Sgo. Temple')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (839, 7, N'Silvio Pellico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (840, 7, N'Simbolar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (841, 7, N'Sinsacate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (842, 7, N'Sta. Rosa de Calamuchita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (843, 7, N'Sta. Rosa de Río Primero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (844, 7, N'Suco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (845, 7, N'Tala Cañada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (846, 7, N'Tala Huasi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (847, 7, N'Talaini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (848, 7, N'Tancacha')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (849, 7, N'Tanti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (850, 7, N'Ticino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (851, 7, N'Tinoco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (852, 7, N'Tío Pujio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (853, 7, N'Toledo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (854, 7, N'Toro Pujio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (855, 7, N'Tosno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (856, 7, N'Tosquita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (857, 7, N'Tránsito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (858, 7, N'Tuclame')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (859, 7, N'Tutti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (860, 7, N'Ucacha')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (861, 7, N'Unquillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (862, 7, N'Valle de Anisacate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (863, 7, N'Valle Hermoso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (864, 7, N'Vélez Sarfield')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (865, 7, N'Viamonte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (866, 7, N'Vicuña Mackenna')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (867, 7, N'Villa Allende')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (868, 7, N'Villa Amancay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (869, 7, N'Villa Ascasubi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (870, 7, N'Villa Candelaria N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (871, 7, N'Villa Carlos Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (872, 7, N'Villa Cerro Azul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (873, 7, N'Villa Ciudad de América')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (874, 7, N'Villa Ciudad Pque Los Reartes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (875, 7, N'Villa Concepción del Tío')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (876, 7, N'Villa Cura Brochero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (877, 7, N'Villa de Las Rosas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (878, 7, N'Villa de María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (879, 7, N'Villa de Pocho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (880, 7, N'Villa de Soto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (881, 7, N'Villa del Dique')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (882, 7, N'Villa del Prado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (883, 7, N'Villa del Rosario')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (884, 7, N'Villa del Totoral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (885, 7, N'Villa Dolores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (886, 7, N'Villa El Chancay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (887, 7, N'Villa Elisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (888, 7, N'Villa Flor Serrana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (889, 7, N'Villa Fontana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (890, 7, N'Villa Giardino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (891, 7, N'Villa Gral. Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (892, 7, N'Villa Gutierrez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (893, 7, N'Villa Huidobro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (894, 7, N'Villa La Bolsa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (895, 7, N'Villa Los Aromos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (896, 7, N'Villa Los Patos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (897, 7, N'Villa María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (898, 7, N'Villa Nueva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (899, 7, N'Villa Pque. Santa Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (900, 7, N'Villa Pque. Siquiman')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (901, 7, N'Villa Quillinzo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (902, 7, N'Villa Rossi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (903, 7, N'Villa Rumipal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (904, 7, N'Villa San Esteban')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (905, 7, N'Villa San Isidro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (906, 7, N'Villa 21')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (907, 7, N'Villa Sarmiento (G.R)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (908, 7, N'Villa Sarmiento (S.A)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (909, 7, N'Villa Tulumba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (910, 7, N'Villa Valeria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (911, 7, N'Villa Yacanto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (912, 7, N'Washington')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (913, 7, N'Wenceslao Escalante')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (914, 7, N'Ycho Cruz Sierras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (915, 8, N'Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (916, 8, N'Bella Vista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (917, 8, N'Berón de Astrada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (918, 8, N'Bonpland')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (919, 8, N'Caá Cati')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (920, 8, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (921, 8, N'Chavarría')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (922, 8, N'Col. C. Pellegrini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (923, 8, N'Col. Libertad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (924, 8, N'Col. Liebig')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (925, 8, N'Col. Sta Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (926, 8, N'Concepción')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (927, 8, N'Cruz de Los Milagros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (928, 8, N'Curuzú-Cuatiá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (929, 8, N'Empedrado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (930, 8, N'Esquina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (931, 8, N'Estación Torrent')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (932, 8, N'Felipe Yofré')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (933, 8, N'Garruchos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (934, 8, N'Gdor. Agrónomo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (935, 8, N'Gdor. Martínez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (936, 8, N'Goya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (937, 8, N'Guaviravi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (938, 8, N'Herlitzka')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (939, 8, N'Ita-Ibate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (940, 8, N'Itatí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (941, 8, N'Ituzaingó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (942, 8, N'José Rafael Gómez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (943, 8, N'Juan Pujol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (944, 8, N'La Cruz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (945, 8, N'Lavalle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (946, 8, N'Lomas de Vallejos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (947, 8, N'Loreto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (948, 8, N'Mariano I. Loza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (949, 8, N'Mburucuyá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (950, 8, N'Mercedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (951, 8, N'Mocoretá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (952, 8, N'Mte. Caseros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (953, 8, N'Nueve de Julio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (954, 8, N'Palmar Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (955, 8, N'Parada Pucheta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (956, 8, N'Paso de La Patria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (957, 8, N'Paso de Los Libres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (958, 8, N'Pedro R. Fernandez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (959, 8, N'Perugorría')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (960, 8, N'Pueblo Libertador')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (961, 8, N'Ramada Paso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (962, 8, N'Riachuelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (963, 8, N'Saladas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (964, 8, N'San Antonio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (965, 8, N'San Carlos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (966, 8, N'San Cosme')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (967, 8, N'San Lorenzo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (968, 8, N'20 del Palmar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (969, 8, N'San Miguel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (970, 8, N'San Roque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (971, 8, N'Santa Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (972, 8, N'Santa Lucía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (973, 8, N'Santo Tomé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (974, 8, N'Sauce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (975, 8, N'Tabay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (976, 8, N'Tapebicuá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (977, 8, N'Tatacua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (978, 8, N'Virasoro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (979, 8, N'Yapeyú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (980, 8, N'Yataití Calle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (981, 9, N'Alarcón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (982, 9, N'Alcaraz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (983, 9, N'Alcaraz N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (984, 9, N'Alcaraz S.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (985, 9, N'Aldea Asunción')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (986, 9, N'Aldea Brasilera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (987, 9, N'Aldea Elgenfeld')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (988, 9, N'Aldea Grapschental')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (989, 9, N'Aldea Ma. Luisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (990, 9, N'Aldea Protestante')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (991, 9, N'Aldea Salto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (992, 9, N'Aldea San Antonio (G)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (993, 9, N'Aldea San Antonio (P)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (994, 9, N'Aldea 19')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (995, 9, N'Aldea San Miguel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (996, 9, N'Aldea San Rafael')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (997, 9, N'Aldea Spatzenkutter')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (998, 9, N'Aldea Sta. María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (999, 9, N'Aldea Sta. Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1000, 9, N'Aldea Valle María')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1001, 9, N'Altamirano Sur')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1002, 9, N'Antelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1003, 9, N'Antonio Tomás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1004, 9, N'Aranguren')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1005, 9, N'Arroyo Barú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1006, 9, N'Arroyo Burgos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1007, 9, N'Arroyo Clé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1008, 9, N'Arroyo Corralito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1009, 9, N'Arroyo del Medio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1010, 9, N'Arroyo Maturrango')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1011, 9, N'Arroyo Palo Seco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1012, 9, N'Banderas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1013, 9, N'Basavilbaso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1014, 9, N'Betbeder')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1015, 9, N'Bovril')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1016, 9, N'Caseros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1017, 9, N'Ceibas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1018, 9, N'Cerrito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1019, 9, N'Chajarí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1020, 9, N'Chilcas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1021, 9, N'Clodomiro Ledesma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1022, 9, N'Col. Alemana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1023, 9, N'Col. Avellaneda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1024, 9, N'Col. Avigdor')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1025, 9, N'Col. Ayuí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1026, 9, N'Col. Baylina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1027, 9, N'Col. Carrasco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1028, 9, N'Col. Celina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1029, 9, N'Col. Cerrito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1030, 9, N'Col. Crespo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1031, 9, N'Col. Elia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1032, 9, N'Col. Ensayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1033, 9, N'Col. Gral. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1034, 9, N'Col. La Argentina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1035, 9, N'Col. Merou')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1036, 9, N'Col. Oficial Nª3')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1037, 9, N'Col. Oficial Nº13')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1038, 9, N'Col. Oficial Nº14')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1039, 9, N'Col. Oficial Nº5')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1040, 9, N'Col. Reffino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1041, 9, N'Col. Tunas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1042, 9, N'Col. Viraró')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1043, 9, N'Colón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1044, 9, N'Concepción del Uruguay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1045, 9, N'Concordia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1046, 9, N'Conscripto Bernardi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1047, 9, N'Costa Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1048, 9, N'Costa San Antonio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1049, 9, N'Costa Uruguay N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1050, 9, N'Costa Uruguay S.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1051, 9, N'Crespo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1052, 9, N'Crucecitas 3ª')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1053, 9, N'Crucecitas 7ª')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1054, 9, N'Crucecitas 8ª')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1055, 9, N'Cuchilla Redonda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1056, 9, N'Curtiembre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1057, 9, N'Diamante')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1058, 9, N'Distrito 6º')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1059, 9, N'Distrito Chañar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1060, 9, N'Distrito Chiqueros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1061, 9, N'Distrito Cuarto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1062, 9, N'Distrito Diego López')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1063, 9, N'Distrito Pajonal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1064, 9, N'Distrito Sauce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1065, 9, N'Distrito Tala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1066, 9, N'Distrito Talitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1067, 9, N'Don Cristóbal 1ª Sección')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1068, 9, N'Don Cristóbal 2ª Sección')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1069, 9, N'Durazno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1070, 9, N'El Cimarrón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1071, 9, N'El Gramillal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1072, 9, N'El Palenque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1073, 9, N'El Pingo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1074, 9, N'El Quebracho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1075, 9, N'El Redomón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1076, 9, N'El Solar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1077, 9, N'Enrique Carbo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1078, 9, N'9')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1079, 9, N'Espinillo N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1080, 9, N'Estación Campos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1081, 9, N'Estación Escriña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1082, 9, N'Estación Lazo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1083, 9, N'Estación Raíces')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1084, 9, N'Estación Yerúa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1085, 9, N'Estancia Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1086, 9, N'Estancia Líbaros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1087, 9, N'Estancia Racedo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1088, 9, N'Estancia Solá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1089, 9, N'Estancia Yuquerí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1090, 9, N'Estaquitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1091, 9, N'Faustino M. Parera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1092, 9, N'Febre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1093, 9, N'Federación')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1094, 9, N'Federal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1095, 9, N'Gdor. Echagüe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1096, 9, N'Gdor. Mansilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1097, 9, N'Gilbert')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1098, 9, N'González Calderón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1099, 9, N'Gral. Almada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1100, 9, N'Gral. Alvear')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1101, 9, N'Gral. Campos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1102, 9, N'Gral. Galarza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1103, 9, N'Gral. Ramírez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1104, 9, N'Gualeguay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1105, 9, N'Gualeguaychú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1106, 9, N'Gualeguaycito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1107, 9, N'Guardamonte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1108, 9, N'Hambis')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1109, 9, N'Hasenkamp')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1110, 9, N'Hernandarias')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1111, 9, N'Hernández')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1112, 9, N'Herrera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1113, 9, N'Hinojal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1114, 9, N'Hocker')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1115, 9, N'Ing. Sajaroff')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1116, 9, N'Irazusta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1117, 9, N'Isletas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1118, 9, N'J.J De Urquiza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1119, 9, N'Jubileo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1120, 9, N'La Clarita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1121, 9, N'La Criolla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1122, 9, N'La Esmeralda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1123, 9, N'La Florida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1124, 9, N'La Fraternidad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1125, 9, N'La Hierra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1126, 9, N'La Ollita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1127, 9, N'La Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1128, 9, N'La Picada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1129, 9, N'La Providencia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1130, 9, N'La Verbena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1131, 9, N'Laguna Benítez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1132, 9, N'Larroque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1133, 9, N'Las Cuevas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1134, 9, N'Las Garzas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1135, 9, N'Las Guachas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1136, 9, N'Las Mercedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1137, 9, N'Las Moscas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1138, 9, N'Las Mulitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1139, 9, N'Las Toscas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1140, 9, N'Laurencena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1141, 9, N'Libertador San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1142, 9, N'Loma Limpia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1143, 9, N'Los Ceibos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1144, 9, N'Los Charruas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1145, 9, N'Los Conquistadores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1146, 9, N'Lucas González')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1147, 9, N'Lucas N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1148, 9, N'Lucas S. 1ª')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1149, 9, N'Lucas S. 2ª')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1150, 9, N'Maciá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1151, 9, N'María Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1152, 9, N'María Grande 2ª')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1153, 9, N'Médanos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1154, 9, N'Mojones N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1155, 9, N'Mojones S.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1156, 9, N'Molino Doll')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1157, 9, N'Monte Redondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1158, 9, N'Montoya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1159, 9, N'Mulas Grandes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1160, 9, N'Ñancay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1161, 9, N'Nogoyá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1162, 9, N'Nueva Escocia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1163, 9, N'Nueva Vizcaya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1164, 9, N'Ombú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1165, 9, N'Oro Verde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1166, 9, N'Paraná')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1167, 9, N'Pasaje Guayaquil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1168, 9, N'Pasaje Las Tunas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1169, 9, N'Paso de La Arena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1170, 9, N'Paso de La Laguna')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1171, 9, N'Paso de Las Piedras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1172, 9, N'Paso Duarte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1173, 9, N'Pastor Britos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1174, 9, N'Pedernal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1175, 9, N'Perdices')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1176, 9, N'Picada Berón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1177, 9, N'Piedras Blancas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1178, 9, N'Primer Distrito Cuchilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1179, 9, N'Primero de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1180, 9, N'Pronunciamiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1181, 9, N'Pto. Algarrobo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1182, 9, N'Pto. Ibicuy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1183, 9, N'Pueblo Brugo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1184, 9, N'Pueblo Cazes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1185, 9, N'Pueblo Gral. Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1186, 9, N'Pueblo Liebig')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1187, 9, N'Puerto Yeruá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1188, 9, N'Punta del Monte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1189, 9, N'Quebracho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1190, 9, N'Quinto Distrito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1191, 9, N'Raices Oeste')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1192, 9, N'Rincón de Nogoyá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1193, 9, N'Rincón del Cinto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1194, 9, N'Rincón del Doll')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1195, 9, N'Rincón del Gato')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1196, 9, N'Rocamora')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1197, 9, N'Rosario del Tala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1198, 9, N'San Benito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1199, 9, N'San Cipriano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1200, 9, N'San Ernesto')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1201, 9, N'San Gustavo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1202, 9, N'San Jaime')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1203, 9, N'San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1204, 9, N'San José de Feliciano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1205, 9, N'San Justo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1206, 9, N'San Marcial')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1207, 9, N'San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1208, 9, N'San Ramírez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1209, 9, N'San Ramón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1210, 9, N'San Roque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1211, 9, N'San Salvador')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1212, 9, N'San Víctor')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1213, 9, N'Santa Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1214, 9, N'Santa Anita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1215, 9, N'Santa Elena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1216, 9, N'Santa Lucía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1217, 9, N'Santa Luisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1218, 9, N'Sauce de Luna')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1219, 9, N'Sauce Montrull')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1220, 9, N'Sauce Pinto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1221, 9, N'Sauce Sur')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1222, 9, N'Seguí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1223, 9, N'Sir Leonard')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1224, 9, N'Sosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1225, 9, N'Tabossi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1226, 9, N'Tezanos Pinto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1227, 9, N'Ubajay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1228, 9, N'Urdinarrain')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1229, 9, N'Veinte de Septiembre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1230, 9, N'Viale')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1231, 9, N'Victoria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1232, 9, N'Villa Clara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1233, 9, N'Villa del Rosario')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1234, 9, N'Villa Domínguez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1235, 9, N'Villa Elisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1236, 9, N'Villa Fontana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1237, 9, N'Villa Gdor. Etchevehere')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1238, 9, N'Villa Mantero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1239, 9, N'Villa Paranacito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1240, 9, N'Villa Urquiza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1241, 9, N'Villaguay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1242, 9, N'Walter Moss')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1243, 9, N'Yacaré')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1244, 9, N'Yeso Oeste')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1245, 10, N'Buena Vista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1246, 10, N'Clorinda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1247, 10, N'Col. Pastoril')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1248, 10, N'Cte. Fontana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1249, 10, N'El Colorado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1250, 10, N'El Espinillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1251, 10, N'Estanislao Del Campo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1252, 10, N'10')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1253, 10, N'Fortín Lugones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1254, 10, N'Gral. Lucio V. Mansilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1255, 10, N'Gral. Manuel Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1256, 10, N'Gral. Mosconi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1257, 10, N'Gran Guardia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1258, 10, N'Herradura')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1259, 10, N'Ibarreta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1260, 10, N'Ing. Juárez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1261, 10, N'Laguna Blanca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1262, 10, N'Laguna Naick Neck')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1263, 10, N'Laguna Yema')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1264, 10, N'Las Lomitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1265, 10, N'Los Chiriguanos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1266, 10, N'Mayor V. Villafañe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1267, 10, N'Misión San Fco.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1268, 10, N'Palo Santo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1269, 10, N'Pirané')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1270, 10, N'Pozo del Maza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1271, 10, N'Riacho He-He')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1272, 10, N'San Hilario')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1273, 10, N'San Martín II')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1274, 10, N'Siete Palmas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1275, 10, N'Subteniente Perín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1276, 10, N'Tres Lagunas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1277, 10, N'Villa Dos Trece')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1278, 10, N'Villa Escolar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1279, 10, N'Villa Gral. Güemes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1280, 11, N'Abdon Castro Tolay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1281, 11, N'Abra Pampa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1282, 11, N'Abralaite')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1283, 11, N'Aguas Calientes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1284, 11, N'Arrayanal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1285, 11, N'Barrios')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1286, 11, N'Caimancito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1287, 11, N'Calilegua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1288, 11, N'Cangrejillos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1289, 11, N'Caspala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1290, 11, N'Catuá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1291, 11, N'Cieneguillas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1292, 11, N'Coranzulli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1293, 11, N'Cusi-Cusi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1294, 11, N'El Aguilar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1295, 11, N'El Carmen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1296, 11, N'El Cóndor')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1297, 11, N'El Fuerte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1298, 11, N'El Piquete')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1299, 11, N'El Talar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1300, 11, N'Fraile Pintado')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1301, 11, N'Hipólito Yrigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1302, 11, N'Huacalera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1303, 11, N'Humahuaca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1304, 11, N'La Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1305, 11, N'La Mendieta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1306, 11, N'La Quiaca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1307, 11, N'Ledesma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1308, 11, N'Libertador Gral. San Martin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1309, 11, N'Maimara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1310, 11, N'Mina Pirquitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1311, 11, N'Monterrico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1312, 11, N'Palma Sola')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1313, 11, N'Palpalá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1314, 11, N'Pampa Blanca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1315, 11, N'Pampichuela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1316, 11, N'Perico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1317, 11, N'Puesto del Marqués')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1318, 11, N'Puesto Viejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1319, 11, N'Pumahuasi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1320, 11, N'Purmamarca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1321, 11, N'Rinconada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1322, 11, N'Rodeitos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1323, 11, N'Rosario de Río Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1324, 11, N'San Antonio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1325, 11, N'San Francisco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1326, 11, N'San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1327, 11, N'San Rafael')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1328, 11, N'San Salvador')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1329, 11, N'Santa Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1330, 11, N'Santa Catalina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1331, 11, N'Santa Clara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1332, 11, N'Susques')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1333, 11, N'Tilcara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1334, 11, N'Tres Cruces')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1335, 11, N'Tumbaya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1336, 11, N'Valle Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1337, 11, N'Vinalito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1338, 11, N'Volcán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1339, 11, N'Yala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1340, 11, N'Yaví')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1341, 11, N'Yuto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1342, 12, N'Abramo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1343, 12, N'Adolfo Van Praet')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1344, 12, N'Agustoni')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1345, 12, N'Algarrobo del Aguila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1346, 12, N'Alpachiri')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1347, 12, N'Alta Italia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1348, 12, N'Anguil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1349, 12, N'Arata')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1350, 12, N'Ataliva Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1351, 12, N'Bernardo Larroude')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1352, 12, N'Bernasconi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1353, 12, N'Caleufú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1354, 12, N'Carro Quemado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1355, 12, N'Catriló')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1356, 12, N'Ceballos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1357, 12, N'Chacharramendi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1358, 12, N'Col. Barón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1359, 12, N'Col. Santa María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1360, 12, N'Conhelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1361, 12, N'Coronel Hilario Lagos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1362, 12, N'Cuchillo-Có')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1363, 12, N'Doblas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1364, 12, N'Dorila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1365, 12, N'Eduardo Castex')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1366, 12, N'Embajador Martini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1367, 12, N'Falucho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1368, 12, N'Gral. Acha')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1369, 12, N'Gral. Manuel Campos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1370, 12, N'Gral. Pico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1371, 12, N'Guatraché')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1372, 12, N'Ing. Luiggi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1373, 12, N'Intendente Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1374, 12, N'Jacinto Arauz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1375, 12, N'La Adela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1376, 12, N'La Humada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1377, 12, N'La Maruja')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1378, 12, N'12')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1379, 12, N'La Reforma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1380, 12, N'Limay Mahuida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1381, 12, N'Lonquimay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1382, 12, N'Loventuel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1383, 12, N'Luan Toro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1384, 12, N'Macachín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1385, 12, N'Maisonnave')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1386, 12, N'Mauricio Mayer')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1387, 12, N'Metileo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1388, 12, N'Miguel Cané')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1389, 12, N'Miguel Riglos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1390, 12, N'Monte Nievas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1391, 12, N'Parera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1392, 12, N'Perú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1393, 12, N'Pichi-Huinca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1394, 12, N'Puelches')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1395, 12, N'Puelén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1396, 12, N'Quehue')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1397, 12, N'Quemú Quemú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1398, 12, N'Quetrequén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1399, 12, N'Rancul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1400, 12, N'Realicó')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1401, 12, N'Relmo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1402, 12, N'Rolón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1403, 12, N'Rucanelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1404, 12, N'Sarah')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1405, 12, N'Speluzzi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1406, 12, N'Sta. Isabel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1407, 12, N'Sta. Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1408, 12, N'Sta. Teresa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1409, 12, N'Telén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1410, 12, N'Toay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1411, 12, N'Tomas M. de Anchorena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1412, 12, N'Trenel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1413, 12, N'Unanue')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1414, 12, N'Uriburu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1415, 12, N'Veinticinco de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1416, 12, N'Vertiz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1417, 12, N'Victorica')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1418, 12, N'Villa Mirasol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1419, 12, N'Winifreda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1420, 13, N'Arauco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1421, 13, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1422, 13, N'Castro Barros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1423, 13, N'Chamical')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1424, 13, N'Chilecito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1425, 13, N'Coronel F. Varela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1426, 13, N'Famatina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1427, 13, N'Gral. A.V.Peñaloza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1428, 13, N'Gral. Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1429, 13, N'Gral. J.F. Quiroga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1430, 13, N'Gral. Lamadrid')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1431, 13, N'Gral. Ocampo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1432, 13, N'Gral. San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1433, 13, N'Independencia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1434, 13, N'Rosario Penaloza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1435, 13, N'San Blas de Los Sauces')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1436, 13, N'Sanagasta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1437, 13, N'Vinchina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1438, 14, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1439, 14, N'Chacras de Coria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1440, 14, N'Dorrego')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1441, 14, N'Gllen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1442, 14, N'Godoy Cruz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1443, 14, N'Gral. Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1444, 14, N'Guaymallén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1445, 14, N'Junín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1446, 14, N'La Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1447, 14, N'Las Heras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1448, 14, N'Lavalle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1449, 14, N'Luján')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1450, 14, N'Luján De Cuyo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1451, 14, N'Maipú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1452, 14, N'Malargüe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1453, 14, N'Rivadavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1454, 14, N'San Carlos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1455, 14, N'San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1456, 14, N'San Rafael')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1457, 14, N'Sta. Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1458, 14, N'Tunuyán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1459, 14, N'Tupungato')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1460, 14, N'Villa Nueva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1461, 15, N'Alba Posse')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1462, 15, N'Almafuerte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1463, 15, N'Apóstoles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1464, 15, N'Aristóbulo Del Valle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1465, 15, N'Arroyo Del Medio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1466, 15, N'Azara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1467, 15, N'Bdo. De Irigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1468, 15, N'Bonpland')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1469, 15, N'Caá Yari')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1470, 15, N'Campo Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1471, 15, N'Campo Ramón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1472, 15, N'Campo Viera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1473, 15, N'Candelaria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1474, 15, N'Capioví')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1475, 15, N'Caraguatay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1476, 15, N'Cdte. Guacurarí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1477, 15, N'Cerro Azul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1478, 15, N'Cerro Corá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1479, 15, N'Col. Alberdi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1480, 15, N'Col. Aurora')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1481, 15, N'Col. Delicia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1482, 15, N'Col. Polana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1483, 15, N'Col. Victoria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1484, 15, N'Col. Wanda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1485, 15, N'Concepción De La Sierra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1486, 15, N'Corpus')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1487, 15, N'Dos Arroyos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1488, 15, N'Dos de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1489, 15, N'El Alcázar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1490, 15, N'El Dorado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1491, 15, N'El Soberbio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1492, 15, N'Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1493, 15, N'F. Ameghino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1494, 15, N'Fachinal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1495, 15, N'Garuhapé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1496, 15, N'Garupá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1497, 15, N'Gdor. López')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1498, 15, N'Gdor. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1499, 15, N'Gral. Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1500, 15, N'Gral. Urquiza')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1501, 15, N'Guaraní')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1502, 15, N'H. Yrigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1503, 15, N'Iguazú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1504, 15, N'Itacaruaré')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1505, 15, N'Jardín América')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1506, 15, N'Leandro N. Alem')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1507, 15, N'Libertad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1508, 15, N'Loreto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1509, 15, N'Los Helechos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1510, 15, N'Mártires')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1511, 15, N'15')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1512, 15, N'Mojón Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1513, 15, N'Montecarlo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1514, 15, N'Nueve de Julio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1515, 15, N'Oberá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1516, 15, N'Olegario V. Andrade')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1517, 15, N'Panambí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1518, 15, N'Posadas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1519, 15, N'Profundidad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1520, 15, N'Pto. Iguazú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1521, 15, N'Pto. Leoni')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1522, 15, N'Pto. Piray')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1523, 15, N'Pto. Rico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1524, 15, N'Ruiz de Montoya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1525, 15, N'San Antonio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1526, 15, N'San Ignacio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1527, 15, N'San Javier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1528, 15, N'San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1529, 15, N'San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1530, 15, N'San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1531, 15, N'San Vicente')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1532, 15, N'Santiago De Liniers')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1533, 15, N'Santo Pipo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1534, 15, N'Sta. Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1535, 15, N'Sta. María')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1536, 15, N'Tres Capones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1537, 15, N'Veinticinco de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1538, 15, N'Wanda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1539, 16, N'Aguada San Roque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1540, 16, N'Aluminé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1541, 16, N'Andacollo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1542, 16, N'Añelo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1543, 16, N'Bajada del Agrio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1544, 16, N'Barrancas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1545, 16, N'Buta Ranquil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1546, 16, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1547, 16, N'Caviahué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1548, 16, N'Centenario')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1549, 16, N'Chorriaca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1550, 16, N'Chos Malal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1551, 16, N'Cipolletti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1552, 16, N'Covunco Abajo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1553, 16, N'Coyuco Cochico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1554, 16, N'Cutral Có')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1555, 16, N'El Cholar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1556, 16, N'El Huecú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1557, 16, N'El Sauce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1558, 16, N'Guañacos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1559, 16, N'Huinganco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1560, 16, N'Las Coloradas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1561, 16, N'Las Lajas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1562, 16, N'Las Ovejas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1563, 16, N'Loncopué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1564, 16, N'Los Catutos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1565, 16, N'Los Chihuidos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1566, 16, N'Los Miches')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1567, 16, N'Manzano Amargo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1568, 16, N'16')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1569, 16, N'Octavio Pico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1570, 16, N'Paso Aguerre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1571, 16, N'Picún Leufú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1572, 16, N'Piedra del Aguila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1573, 16, N'Pilo Lil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1574, 16, N'Plaza Huincul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1575, 16, N'Plottier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1576, 16, N'Quili Malal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1577, 16, N'Ramón Castro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1578, 16, N'Rincón de Los Sauces')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1579, 16, N'San Martín de Los Andes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1580, 16, N'San Patricio del Chañar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1581, 16, N'Santo Tomás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1582, 16, N'Sauzal Bonito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1583, 16, N'Senillosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1584, 16, N'Taquimilán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1585, 16, N'Tricao Malal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1586, 16, N'Varvarco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1587, 16, N'Villa Curí Leuvu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1588, 16, N'Villa del Nahueve')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1589, 16, N'Villa del Puente Picún Leuvú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1590, 16, N'Villa El Chocón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1591, 16, N'Villa La Angostura')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1592, 16, N'Villa Pehuenia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1593, 16, N'Villa Traful')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1594, 16, N'Vista Alegre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1595, 16, N'Zapala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1596, 17, N'Aguada Cecilio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1597, 17, N'Aguada de Guerra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1598, 17, N'Allén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1599, 17, N'Arroyo de La Ventana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1600, 17, N'Arroyo Los Berros')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1601, 17, N'Bariloche')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1602, 17, N'Calte. Cordero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1603, 17, N'Campo Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1604, 17, N'Catriel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1605, 17, N'Cerro Policía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1606, 17, N'Cervantes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1607, 17, N'Chelforo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1608, 17, N'Chimpay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1609, 17, N'Chinchinales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1610, 17, N'Chipauquil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1611, 17, N'Choele Choel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1612, 17, N'Cinco Saltos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1613, 17, N'Cipolletti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1614, 17, N'Clemente Onelli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1615, 17, N'Colán Conhue')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1616, 17, N'Comallo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1617, 17, N'Comicó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1618, 17, N'Cona Niyeu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1619, 17, N'Coronel Belisle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1620, 17, N'Cubanea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1621, 17, N'Darwin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1622, 17, N'Dina Huapi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1623, 17, N'El Bolsón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1624, 17, N'El Caín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1625, 17, N'El Manso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1626, 17, N'Gral. Conesa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1627, 17, N'Gral. Enrique Godoy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1628, 17, N'Gral. Fernandez Oro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1629, 17, N'Gral. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1630, 17, N'Guardia Mitre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1631, 17, N'Ing. Huergo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1632, 17, N'Ing. Jacobacci')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1633, 17, N'Laguna Blanca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1634, 17, N'Lamarque')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1635, 17, N'Las Grutas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1636, 17, N'Los Menucos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1637, 17, N'Luis Beltrán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1638, 17, N'Mainqué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1639, 17, N'Mamuel Choique')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1640, 17, N'Maquinchao')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1641, 17, N'Mencué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1642, 17, N'Mtro. Ramos Mexia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1643, 17, N'Nahuel Niyeu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1644, 17, N'Naupa Huen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1645, 17, N'Ñorquinco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1646, 17, N'Ojos de Agua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1647, 17, N'Paso de Agua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1648, 17, N'Paso Flores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1649, 17, N'Peñas Blancas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1650, 17, N'Pichi Mahuida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1651, 17, N'Pilcaniyeu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1652, 17, N'Pomona')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1653, 17, N'Prahuaniyeu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1654, 17, N'Rincón Treneta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1655, 17, N'Río Chico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1656, 17, N'Río Colorado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1657, 17, N'Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1658, 17, N'San Antonio Oeste')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1659, 17, N'San Javier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1660, 17, N'Sierra Colorada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1661, 17, N'Sierra Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1662, 17, N'Sierra Pailemán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1663, 17, N'Valcheta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1664, 17, N'Valle Azul')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1665, 17, N'Viedma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1666, 17, N'Villa Llanquín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1667, 17, N'Villa Mascardi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1668, 17, N'Villa Regina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1669, 17, N'Yaminué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1670, 18, N'A. Saravia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1671, 18, N'Aguaray')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1672, 18, N'Angastaco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1673, 18, N'Animaná')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1674, 18, N'Cachi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1675, 18, N'Cafayate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1676, 18, N'Campo Quijano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1677, 18, N'Campo Santo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1678, 18, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1679, 18, N'Cerrillos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1680, 18, N'Chicoana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1681, 18, N'Col. Sta. Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1682, 18, N'Coronel Moldes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1683, 18, N'El Bordo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1684, 18, N'El Carril')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1685, 18, N'El Galpón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1686, 18, N'El Jardín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1687, 18, N'El Potrero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1688, 18, N'El Quebrachal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1689, 18, N'El Tala')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1690, 18, N'Embarcación')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1691, 18, N'Gral. Ballivian')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1692, 18, N'Gral. Güemes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1693, 18, N'Gral. Mosconi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1694, 18, N'Gral. Pizarro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1695, 18, N'Guachipas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1696, 18, N'Hipólito Yrigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1697, 18, N'Iruyá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1698, 18, N'Isla De Cañas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1699, 18, N'J. V. Gonzalez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1700, 18, N'La Caldera')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1701, 18, N'La Candelaria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1702, 18, N'La Merced')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1703, 18, N'La Poma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1704, 18, N'La Viña')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1705, 18, N'Las Lajitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1706, 18, N'Los Toldos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1707, 18, N'Metán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1708, 18, N'Molinos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1709, 18, N'Nazareno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1710, 18, N'Orán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1711, 18, N'Payogasta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1712, 18, N'Pichanal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1713, 18, N'Prof. S. Mazza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1714, 18, N'Río Piedras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1715, 18, N'Rivadavia Banda Norte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1716, 18, N'Rivadavia Banda Sur')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1717, 18, N'Rosario de La Frontera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1718, 18, N'Rosario de Lerma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1719, 18, N'Saclantás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1720, 18, N'18')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1721, 18, N'San Antonio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1722, 18, N'San Carlos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1723, 18, N'San José De Metán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1724, 18, N'San Ramón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1725, 18, N'Santa Victoria E.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1726, 18, N'Santa Victoria O.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1727, 18, N'Tartagal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1728, 18, N'Tolar Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1729, 18, N'Urundel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1730, 18, N'Vaqueros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1731, 18, N'Villa San Lorenzo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1732, 19, N'Albardón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1733, 19, N'Angaco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1734, 19, N'Calingasta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1735, 19, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1736, 19, N'Caucete')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1737, 19, N'Chimbas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1738, 19, N'Iglesia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1739, 19, N'Jachal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1740, 19, N'Nueve de Julio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1741, 19, N'Pocito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1742, 19, N'Rawson')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1743, 19, N'Rivadavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1744, 19, N'19')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1745, 19, N'San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1746, 19, N'Santa Lucía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1747, 19, N'Sarmiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1748, 19, N'Ullum')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1749, 19, N'Valle Fértil')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1750, 19, N'Veinticinco de Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1751, 19, N'Zonda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1752, 20, N'Alto Pelado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1753, 20, N'Alto Pencoso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1754, 20, N'Anchorena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1755, 20, N'Arizona')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1756, 20, N'Bagual')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1757, 20, N'Balde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1758, 20, N'Batavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1759, 20, N'Beazley')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1760, 20, N'Buena Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1761, 20, N'Candelaria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1762, 20, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1763, 20, N'Carolina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1764, 20, N'Carpintería')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1765, 20, N'Concarán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1766, 20, N'Cortaderas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1767, 20, N'El Morro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1768, 20, N'El Trapiche')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1769, 20, N'El Volcán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1770, 20, N'Fortín El Patria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1771, 20, N'Fortuna')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1772, 20, N'Fraga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1773, 20, N'Juan Jorba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1774, 20, N'Juan Llerena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1775, 20, N'Juana Koslay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1776, 20, N'Justo Daract')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1777, 20, N'La Calera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1778, 20, N'La Florida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1779, 20, N'La Punilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1780, 20, N'La Toma')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1781, 20, N'Lafinur')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1782, 20, N'Las Aguadas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1783, 20, N'Las Chacras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1784, 20, N'Las Lagunas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1785, 20, N'Las Vertientes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1786, 20, N'Lavaisse')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1787, 20, N'Leandro N. Alem')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1788, 20, N'Los Molles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1789, 20, N'Luján')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1790, 20, N'Mercedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1791, 20, N'Merlo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1792, 20, N'Naschel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1793, 20, N'Navia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1794, 20, N'Nogolí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1795, 20, N'Nueva Galia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1796, 20, N'Papagayos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1797, 20, N'Paso Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1798, 20, N'Potrero de Los Funes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1799, 20, N'Quines')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1800, 20, N'Renca')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1801, 20, N'Saladillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1802, 20, N'San Francisco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1803, 20, N'San Gerónimo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1804, 20, N'San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1805, 20, N'San Pablo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1806, 20, N'Santa Rosa de Conlara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1807, 20, N'Talita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1808, 20, N'Tilisarao')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1809, 20, N'Unión')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1810, 20, N'Villa de La Quebrada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1811, 20, N'Villa de Praga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1812, 20, N'Villa del Carmen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1813, 20, N'Villa Gral. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1814, 20, N'Villa Larca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1815, 20, N'Villa Mercedes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1816, 20, N'Zanjitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1817, 21, N'Calafate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1818, 21, N'Caleta Olivia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1819, 21, N'Cañadón Seco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1820, 21, N'Comandante Piedrabuena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1821, 21, N'El Calafate')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1822, 21, N'El Chaltén')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1823, 21, N'Gdor. Gregores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1824, 21, N'Hipólito Yrigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1825, 21, N'Jaramillo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1826, 21, N'Koluel Kaike')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1827, 21, N'Las Heras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1828, 21, N'Los Antiguos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1829, 21, N'Perito Moreno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1830, 21, N'Pico Truncado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1831, 21, N'Pto. Deseado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1832, 21, N'Pto. San Julián')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1833, 21, N'Pto. 21')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1834, 21, N'Río Cuarto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1835, 21, N'Río Gallegos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1836, 21, N'Río Turbio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1837, 21, N'Tres Lagos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1838, 21, N'Veintiocho De Noviembre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1839, 22, N'Aarón Castellanos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1840, 22, N'Acebal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1841, 22, N'Aguará Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1842, 22, N'Albarellos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1843, 22, N'Alcorta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1844, 22, N'Aldao')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1845, 22, N'Alejandra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1846, 22, N'Álvarez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1847, 22, N'Ambrosetti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1848, 22, N'Amenábar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1849, 22, N'Angélica')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1850, 22, N'Angeloni')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1851, 22, N'Arequito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1852, 22, N'Arminda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1853, 22, N'Armstrong')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1854, 22, N'Arocena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1855, 22, N'Arroyo Aguiar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1856, 22, N'Arroyo Ceibal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1857, 22, N'Arroyo Leyes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1858, 22, N'Arroyo Seco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1859, 22, N'Arrufó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1860, 22, N'Arteaga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1861, 22, N'Ataliva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1862, 22, N'Aurelia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1863, 22, N'Avellaneda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1864, 22, N'Barrancas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1865, 22, N'Bauer Y Sigel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1866, 22, N'Bella Italia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1867, 22, N'Berabevú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1868, 22, N'Berna')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1869, 22, N'Bernardo de Irigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1870, 22, N'Bigand')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1871, 22, N'Bombal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1872, 22, N'Bouquet')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1873, 22, N'Bustinza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1874, 22, N'Cabal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1875, 22, N'Cacique Ariacaiquin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1876, 22, N'Cafferata')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1877, 22, N'Calchaquí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1878, 22, N'Campo Andino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1879, 22, N'Campo Piaggio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1880, 22, N'Cañada de Gómez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1881, 22, N'Cañada del Ucle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1882, 22, N'Cañada Rica')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1883, 22, N'Cañada Rosquín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1884, 22, N'Candioti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1885, 22, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1886, 22, N'Capitán Bermúdez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1887, 22, N'Capivara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1888, 22, N'Carcarañá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1889, 22, N'Carlos Pellegrini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1890, 22, N'Carmen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1891, 22, N'Carmen Del Sauce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1892, 22, N'Carreras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1893, 22, N'Carrizales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1894, 22, N'Casalegno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1895, 22, N'Casas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1896, 22, N'Casilda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1897, 22, N'Castelar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1898, 22, N'Castellanos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1899, 22, N'Cayastá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1900, 22, N'Cayastacito')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1901, 22, N'Centeno')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1902, 22, N'Cepeda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1903, 22, N'Ceres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1904, 22, N'Chabás')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1905, 22, N'Chañar Ladeado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1906, 22, N'Chapuy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1907, 22, N'Chovet')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1908, 22, N'Christophersen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1909, 22, N'Classon')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1910, 22, N'Cnel. Arnold')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1911, 22, N'Cnel. Bogado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1912, 22, N'Cnel. Dominguez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1913, 22, N'Cnel. Fraga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1914, 22, N'Col. Aldao')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1915, 22, N'Col. Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1916, 22, N'Col. Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1917, 22, N'Col. Bicha')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1918, 22, N'Col. Bigand')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1919, 22, N'Col. Bossi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1920, 22, N'Col. Cavour')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1921, 22, N'Col. Cello')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1922, 22, N'Col. Dolores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1923, 22, N'Col. Dos Rosas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1924, 22, N'Col. Durán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1925, 22, N'Col. Iturraspe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1926, 22, N'Col. Margarita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1927, 22, N'Col. Mascias')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1928, 22, N'Col. Raquel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1929, 22, N'Col. Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1930, 22, N'Col. San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1931, 22, N'Constanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1932, 22, N'Coronda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1933, 22, N'Correa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1934, 22, N'Crispi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1935, 22, N'Cululú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1936, 22, N'Curupayti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1937, 22, N'Desvio Arijón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1938, 22, N'Diaz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1939, 22, N'Diego de Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1940, 22, N'Egusquiza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1941, 22, N'El Arazá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1942, 22, N'El Rabón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1943, 22, N'El Sombrerito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1944, 22, N'El Trébol')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1945, 22, N'Elisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1946, 22, N'Elortondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1947, 22, N'Emilia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1948, 22, N'Empalme San Carlos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1949, 22, N'Empalme Villa Constitucion')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1950, 22, N'Esmeralda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1951, 22, N'Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1952, 22, N'Estación Alvear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1953, 22, N'Estacion Clucellas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1954, 22, N'Esteban Rams')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1955, 22, N'Esther')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1956, 22, N'Esustolia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1957, 22, N'Eusebia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1958, 22, N'Felicia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1959, 22, N'Fidela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1960, 22, N'Fighiera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1961, 22, N'Firmat')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1962, 22, N'Florencia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1963, 22, N'Fortín Olmos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1964, 22, N'Franck')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1965, 22, N'Fray Luis Beltrán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1966, 22, N'Frontera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1967, 22, N'Fuentes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1968, 22, N'Funes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1969, 22, N'Gaboto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1970, 22, N'Galisteo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1971, 22, N'Gálvez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1972, 22, N'Garabalto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1973, 22, N'Garibaldi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1974, 22, N'Gato Colorado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1975, 22, N'Gdor. Crespo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1976, 22, N'Gessler')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1977, 22, N'Godoy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1978, 22, N'Golondrina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1979, 22, N'Gral. Gelly')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1980, 22, N'Gral. Lagos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1981, 22, N'Granadero Baigorria')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1982, 22, N'Gregoria Perez De Denis')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1983, 22, N'Grutly')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1984, 22, N'Guadalupe N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1985, 22, N'Gödeken')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1986, 22, N'Helvecia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1987, 22, N'Hersilia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1988, 22, N'Hipatía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1989, 22, N'Huanqueros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1990, 22, N'Hugentobler')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1991, 22, N'Hughes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1992, 22, N'Humberto 1º')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1993, 22, N'Humboldt')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1994, 22, N'Ibarlucea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1995, 22, N'Ing. Chanourdie')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1996, 22, N'Intiyaco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1997, 22, N'Ituzaingó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1998, 22, N'Jacinto L. Aráuz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (1999, 22, N'Josefina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2000, 22, N'Juan B. Molina')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2001, 22, N'Juan de Garay')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2002, 22, N'Juncal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2003, 22, N'La Brava')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2004, 22, N'La Cabral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2005, 22, N'La Camila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2006, 22, N'La Chispa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2007, 22, N'La Clara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2008, 22, N'La Criolla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2009, 22, N'La Gallareta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2010, 22, N'La Lucila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2011, 22, N'La Pelada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2012, 22, N'La Penca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2013, 22, N'La Rubia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2014, 22, N'La Sarita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2015, 22, N'La Vanguardia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2016, 22, N'Labordeboy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2017, 22, N'Laguna Paiva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2018, 22, N'Landeta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2019, 22, N'Lanteri')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2020, 22, N'Larrechea')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2021, 22, N'Las Avispas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2022, 22, N'Las Bandurrias')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2023, 22, N'Las Garzas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2024, 22, N'Las Palmeras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2025, 22, N'Las Parejas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2026, 22, N'Las Petacas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2027, 22, N'Las Rosas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2028, 22, N'Las Toscas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2029, 22, N'Las Tunas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2030, 22, N'Lazzarino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2031, 22, N'Lehmann')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2032, 22, N'Llambi Campbell')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2033, 22, N'Logroño')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2034, 22, N'Loma Alta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2035, 22, N'López')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2036, 22, N'Los Amores')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2037, 22, N'Los Cardos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2038, 22, N'Los Laureles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2039, 22, N'Los Molinos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2040, 22, N'Los Quirquinchos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2041, 22, N'Lucio V. Lopez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2042, 22, N'Luis Palacios')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2043, 22, N'Ma. Juana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2044, 22, N'Ma. Luisa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2045, 22, N'Ma. Susana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2046, 22, N'Ma. Teresa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2047, 22, N'Maciel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2048, 22, N'Maggiolo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2049, 22, N'Malabrigo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2050, 22, N'Marcelino Escalada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2051, 22, N'Margarita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2052, 22, N'Matilde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2053, 22, N'Mauá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2054, 22, N'Máximo Paz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2055, 22, N'Melincué')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2056, 22, N'Miguel Torres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2057, 22, N'Moisés Ville')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2058, 22, N'Monigotes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2059, 22, N'Monje')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2060, 22, N'Monte Obscuridad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2061, 22, N'Monte Vera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2062, 22, N'Montefiore')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2063, 22, N'Montes de Oca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2064, 22, N'Murphy')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2065, 22, N'Ñanducita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2066, 22, N'Naré')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2067, 22, N'Nelson')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2068, 22, N'Nicanor E. Molinas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2069, 22, N'Nuevo Torino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2070, 22, N'Oliveros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2071, 22, N'Palacios')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2072, 22, N'Pavón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2073, 22, N'Pavón Arriba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2074, 22, N'Pedro Gómez Cello')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2075, 22, N'Pérez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2076, 22, N'Peyrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2077, 22, N'Piamonte')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2078, 22, N'Pilar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2079, 22, N'Piñero')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2080, 22, N'Plaza Clucellas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2081, 22, N'Portugalete')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2082, 22, N'Pozo Borrado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2083, 22, N'Progreso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2084, 22, N'Providencia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2085, 22, N'Pte. Roca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2086, 22, N'Pueblo Andino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2087, 22, N'Pueblo Esther')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2088, 22, N'Pueblo Gral. San Martín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2089, 22, N'Pueblo Irigoyen')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2090, 22, N'Pueblo Marini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2091, 22, N'Pueblo Muñoz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2092, 22, N'Pueblo Uranga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2093, 22, N'Pujato')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2094, 22, N'Pujato N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2095, 22, N'Rafaela')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2096, 22, N'Ramayón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2097, 22, N'Ramona')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2098, 22, N'Reconquista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2099, 22, N'Recreo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2100, 22, N'Ricardone')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2101, 22, N'Rivadavia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2102, 22, N'Roldán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2103, 22, N'Romang')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2104, 22, N'Rosario')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2105, 22, N'Rueda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2106, 22, N'Rufino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2107, 22, N'Sa Pereira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2108, 22, N'Saguier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2109, 22, N'Saladero M. Cabal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2110, 22, N'Salto Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2111, 22, N'San Agustín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2112, 22, N'San Antonio de Obligado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2113, 22, N'San Bernardo (N.J.)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2114, 22, N'San Bernardo (S.J.)')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2115, 22, N'San Carlos Centro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2116, 22, N'San Carlos N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2117, 22, N'San Carlos S.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2118, 22, N'San Cristóbal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2119, 22, N'San Eduardo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2120, 22, N'San Eugenio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2121, 22, N'San Fabián')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2122, 22, N'San Fco. de Santa Fé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2123, 22, N'San Genaro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2124, 22, N'San Genaro N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2125, 22, N'San Gregorio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2126, 22, N'San Guillermo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2127, 22, N'San Javier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2128, 22, N'San Jerónimo del Sauce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2129, 22, N'San Jerónimo N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2130, 22, N'San Jerónimo S.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2131, 22, N'San Jorge')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2132, 22, N'San José de La Esquina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2133, 22, N'San José del Rincón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2134, 22, N'San Justo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2135, 22, N'San Lorenzo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2136, 22, N'San Mariano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2137, 22, N'San Martín de Las Escobas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2138, 22, N'San Martín N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2139, 22, N'San Vicente')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2140, 22, N'Sancti Spititu')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2141, 22, N'Sanford')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2142, 22, N'Santo Domingo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2143, 22, N'Santo Tomé')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2144, 22, N'Santurce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2145, 22, N'Sargento Cabral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2146, 22, N'Sarmiento')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2147, 22, N'Sastre')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2148, 22, N'Sauce Viejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2149, 22, N'Serodino')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2150, 22, N'Silva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2151, 22, N'Soldini')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2152, 22, N'Soledad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2153, 22, N'Soutomayor')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2154, 22, N'Sta. Clara de Buena Vista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2155, 22, N'Sta. Clara de Saguier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2156, 22, N'Sta. Isabel')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2157, 22, N'Sta. Margarita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2158, 22, N'Sta. Maria Centro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2159, 22, N'Sta. María N.')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2160, 22, N'Sta. Rosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2161, 22, N'Sta. Teresa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2162, 22, N'Suardi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2163, 22, N'Sunchales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2164, 22, N'Susana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2165, 22, N'Tacuarendí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2166, 22, N'Tacural')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2167, 22, N'Tartagal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2168, 22, N'Teodelina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2169, 22, N'Theobald')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2170, 22, N'Timbúes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2171, 22, N'Toba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2172, 22, N'Tortugas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2173, 22, N'Tostado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2174, 22, N'Totoras')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2175, 22, N'Traill')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2176, 22, N'Venado Tuerto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2177, 22, N'Vera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2178, 22, N'Vera y Pintado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2179, 22, N'Videla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2180, 22, N'Vila')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2181, 22, N'Villa Amelia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2182, 22, N'Villa Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2183, 22, N'Villa Cañas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2184, 22, N'Villa Constitución')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2185, 22, N'Villa Eloísa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2186, 22, N'Villa Gdor. Gálvez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2187, 22, N'Villa Guillermina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2188, 22, N'Villa Minetti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2189, 22, N'Villa Mugueta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2190, 22, N'Villa Ocampo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2191, 22, N'Villa San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2192, 22, N'Villa Saralegui')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2193, 22, N'Villa Trinidad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2194, 22, N'Villada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2195, 22, N'Virginia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2196, 22, N'Wheelwright')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2197, 22, N'Zavalla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2198, 22, N'Zenón Pereira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2199, 23, N'Añatuya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2200, 23, N'Árraga')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2201, 23, N'Bandera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2202, 23, N'Bandera Bajada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2203, 23, N'Beltrán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2204, 23, N'Brea Pozo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2205, 23, N'Campo Gallo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2206, 23, N'Capital')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2207, 23, N'Chilca Juliana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2208, 23, N'Choya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2209, 23, N'Clodomira')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2210, 23, N'Col. Alpina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2211, 23, N'Col. Dora')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2212, 23, N'Col. El Simbolar Robles')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2213, 23, N'El Bobadal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2214, 23, N'El Charco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2215, 23, N'El Mojón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2216, 23, N'Estación Atamisqui')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2217, 23, N'Estación Simbolar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2218, 23, N'Fernández')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2219, 23, N'Fortín Inca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2220, 23, N'Frías')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2221, 23, N'Garza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2222, 23, N'Gramilla')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2223, 23, N'Guardia Escolta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2224, 23, N'Herrera')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2225, 23, N'Icaño')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2226, 23, N'Ing. Forres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2227, 23, N'La Banda')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2228, 23, N'La Cañada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2229, 23, N'Laprida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2230, 23, N'Lavalle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2231, 23, N'Loreto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2232, 23, N'Los Juríes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2233, 23, N'Los Núñez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2234, 23, N'Los Pirpintos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2235, 23, N'Los Quiroga')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2236, 23, N'Los Telares')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2237, 23, N'Lugones')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2238, 23, N'Malbrán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2239, 23, N'Matara')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2240, 23, N'Medellín')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2241, 23, N'Monte Quemado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2242, 23, N'Nueva Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2243, 23, N'Nueva Francia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2244, 23, N'Palo Negro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2245, 23, N'Pampa de Los Guanacos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2246, 23, N'Pinto')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2247, 23, N'Pozo Hondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2248, 23, N'Quimilí')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2249, 23, N'Real Sayana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2250, 23, N'Sachayoj')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2251, 23, N'San Pedro de Guasayán')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2252, 23, N'Selva')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2253, 23, N'Sol de Julio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2254, 23, N'Sumampa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2255, 23, N'Suncho Corral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2256, 23, N'Taboada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2257, 23, N'Tapso')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2258, 23, N'Termas de Rio Hondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2259, 23, N'Tintina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2260, 23, N'Tomas Young')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2261, 23, N'Vilelas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2262, 23, N'Villa Atamisqui')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2263, 23, N'Villa La Punta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2264, 23, N'Villa Ojo de Agua')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2265, 23, N'Villa Río Hondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2266, 23, N'Villa Salavina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2267, 23, N'Villa Unión')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2268, 23, N'Vilmer')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2269, 23, N'Weisburd')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2270, 24, N'Río Grande')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2271, 24, N'Tolhuin')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2272, 24, N'Ushuaia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2273, 25, N'Acheral')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2274, 25, N'Agua Dulce')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2275, 25, N'Aguilares')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2276, 25, N'Alderetes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2277, 25, N'Alpachiri')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2278, 25, N'Alto Verde')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2279, 25, N'Amaicha del Valle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2280, 25, N'Amberes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2281, 25, N'Ancajuli')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2282, 25, N'Arcadia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2283, 25, N'Atahona')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2284, 25, N'Banda del Río Sali')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2285, 25, N'Bella Vista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2286, 25, N'Buena Vista')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2287, 25, N'Burruyacú')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2288, 25, N'Capitán Cáceres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2289, 25, N'Cevil Redondo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2290, 25, N'Choromoro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2291, 25, N'Ciudacita')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2292, 25, N'Colalao del Valle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2293, 25, N'Colombres')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2294, 25, N'Concepción')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2295, 25, N'Delfín Gallo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2296, 25, N'El Bracho')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2297, 25, N'El Cadillal')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2298, 25, N'El Cercado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2299, 25, N'El Chañar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2300, 25, N'El Manantial')
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2301, 25, N'El Mojón')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2302, 25, N'El Mollar')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2303, 25, N'El Naranjito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2304, 25, N'El Naranjo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2305, 25, N'El Polear')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2306, 25, N'El Puestito')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2307, 25, N'El Sacrificio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2308, 25, N'El Timbó')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2309, 25, N'Escaba')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2310, 25, N'Esquina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2311, 25, N'Estación Aráoz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2312, 25, N'Famaillá')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2313, 25, N'Gastone')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2314, 25, N'Gdor. Garmendia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2315, 25, N'Gdor. Piedrabuena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2316, 25, N'Graneros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2317, 25, N'Huasa Pampa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2318, 25, N'J. B. Alberdi')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2319, 25, N'La Cocha')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2320, 25, N'La Esperanza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2321, 25, N'La Florida')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2322, 25, N'La Ramada')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2323, 25, N'La Trinidad')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2324, 25, N'Lamadrid')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2325, 25, N'Las Cejas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2326, 25, N'Las Talas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2327, 25, N'Las Talitas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2328, 25, N'Los Bulacio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2329, 25, N'Los Gómez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2330, 25, N'Los Nogales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2331, 25, N'Los Pereyra')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2332, 25, N'Los Pérez')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2333, 25, N'Los Puestos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2334, 25, N'Los Ralos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2335, 25, N'Los Sarmientos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2336, 25, N'Los Sosa')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2337, 25, N'Lules')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2338, 25, N'M. García Fernández')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2339, 25, N'Manuela Pedraza')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2340, 25, N'Medinas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2341, 25, N'Monte Bello')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2342, 25, N'Monteagudo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2343, 25, N'Monteros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2344, 25, N'Padre Monti')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2345, 25, N'Pampa Mayo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2346, 25, N'Quilmes')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2347, 25, N'Raco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2348, 25, N'Ranchillos')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2349, 25, N'Río Chico')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2350, 25, N'Río Colorado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2351, 25, N'Río Seco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2352, 25, N'Rumi Punco')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2353, 25, N'San Andrés')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2354, 25, N'San Felipe')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2355, 25, N'San Ignacio')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2356, 25, N'San Javier')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2357, 25, N'San José')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2358, 25, N'San Miguel de 25')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2359, 25, N'San Pedro')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2360, 25, N'San Pedro de Colalao')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2361, 25, N'Santa Rosa de Leales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2362, 25, N'Sgto. Moya')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2363, 25, N'Siete de Abril')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2364, 25, N'Simoca')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2365, 25, N'Soldado Maldonado')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2366, 25, N'Sta. Ana')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2367, 25, N'Sta. Cruz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2368, 25, N'Sta. Lucía')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2369, 25, N'Taco Ralo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2370, 25, N'Tafí del Valle')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2371, 25, N'Tafí Viejo')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2372, 25, N'Tapia')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2373, 25, N'Teniente Berdina')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2374, 25, N'Trancas')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2375, 25, N'Villa Belgrano')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2376, 25, N'Villa Benjamín Araoz')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2377, 25, N'Villa Chiligasta')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2378, 25, N'Villa de Leales')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2379, 25, N'Villa Quinteros')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2380, 25, N'Yánima')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2381, 25, N'Yerba Buena')
INSERT [dbo].[Localidad] ([IdLocalidad], [IdProvincia], [DescripcionLocalidad]) VALUES (2382, 25, N'Yerba Buena (S)')
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (1, N'GENLOYS', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (2, N'MotoFx', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (3, N'LIDOSA', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (10, N'Universal Music', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (11, N'Sony Music', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (12, N'Warner Bros Music', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (13, N'Pop Art Discos', NULL)
SET IDENTITY_INSERT [dbo].[Marca] OFF
SET IDENTITY_INSERT [dbo].[Moneda] ON 

INSERT [dbo].[Moneda] ([IdMoneda], [Nombre], [SimboloMoneda], [FecBaja], [Url]) VALUES (1, N'ARS', N'$', NULL, NULL)
INSERT [dbo].[Moneda] ([IdMoneda], [Nombre], [SimboloMoneda], [FecBaja], [Url]) VALUES (2, N'USD', N'US$', NULL, NULL)
INSERT [dbo].[Moneda] ([IdMoneda], [Nombre], [SimboloMoneda], [FecBaja], [Url]) VALUES (3, N'URU', N'$', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Moneda] OFF
INSERT [dbo].[MonedaEmpresa] ([IdMoneda], [CUIT], [Cotizacion], [Fecha], [FecBaja], [Predeterminada]) VALUES (1, N'20344003646', CAST(1.00 AS Decimal(5, 2)), CAST(0x0000A6BE001287C0 AS DateTime), NULL, NULL)
INSERT [dbo].[MonedaEmpresa] ([IdMoneda], [CUIT], [Cotizacion], [Fecha], [FecBaja], [Predeterminada]) VALUES (2, N'20344003646', CAST(18.00 AS Decimal(5, 2)), CAST(0x0000A6BE000E3328 AS DateTime), NULL, NULL)
INSERT [dbo].[MonedaEmpresa] ([IdMoneda], [CUIT], [Cotizacion], [Fecha], [FecBaja], [Predeterminada]) VALUES (3, N'20344003646', CAST(1.84 AS Decimal(5, 2)), CAST(0x0000A6BD00000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pago] ON 

INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (6, 5187, CAST(0x0000AB0E00D977FD AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (7, 5187, CAST(0x0000AB0E00D99301 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (8, 5187, CAST(0x0000AB0E00000000 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (9, 5187, CAST(0x0000AB0E00DB4AB4 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (10, 5187, CAST(0x0000AB0E00DC12DE AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (11, 5189, CAST(0x0000AB0E00DCF878 AS DateTime), 2, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (12, 5193, CAST(0x0000AB0E01334FD5 AS DateTime), 1, CAST(22725 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (13, 5195, CAST(0x0000AB0E015007A7 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (14, 5196, CAST(0x0000AB1000BDB924 AS DateTime), 1, CAST(145865 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (15, 5197, CAST(0x0000AB1000BFF4EA AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (16, 5198, CAST(0x0000AB1000C1BBDB AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (17, 5196, CAST(0x0000AB1000D9EEB2 AS DateTime), 1, CAST(145865 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (18, 5200, CAST(0x0000AB12002AC6F9 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (19, 5201, CAST(0x0000AB1600BF7CA0 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (20, 5199, CAST(0x0000AB1600FD204F AS DateTime), 1, CAST(22725 AS Decimal(18, 0)), N'20344003646', NULL)
INSERT [dbo].[Pago] ([IdPago], [IdPedido], [FechaPago], [IdFormaPago], [MontoPago], [CUIT], [FecBaja]) VALUES (21, 5202, CAST(0x0000AB17016EEFB6 AS DateTime), 1, CAST(70652 AS Decimal(18, 0)), N'20344003646', NULL)
SET IDENTITY_INSERT [dbo].[Pago] OFF
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([IdPatente], [NombrePatente], [FecBaja]) VALUES (1, N'Desear', NULL)
SET IDENTITY_INSERT [dbo].[Patente] OFF
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia], [FecBaja]) VALUES (1, 2, NULL)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia], [FecBaja]) VALUES (1, 3, NULL)
INSERT [dbo].[PatenteFamilia] ([IdPatente], [IdFamilia], [FecBaja]) VALUES (1, 4, NULL)
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1, CAST(0x0000A6AE00000000 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 1)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2, CAST(0x0000A6BE004E3756 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 2)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3, CAST(0x0000A6BE00511E4A AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 3)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4, CAST(0x0000A6BE00538D57 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 4)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5, CAST(0x0000A6BE00CE2D48 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 5)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (6, CAST(0x0000A6BE0120C74C AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 6)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (7, CAST(0x0000A6BF01243AF9 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 7)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (8, CAST(0x0000A6C000E12AC0 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 8)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (9, CAST(0x0000A6C401511CC4 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 9)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (10, CAST(0x0000A6C4015E0432 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 10)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (11, CAST(0x0000A6C40162DB16 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 11)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (12, CAST(0x0000A6C40164C3DA AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 12)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (13, CAST(0x0000A6C401676AEC AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 13)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (14, CAST(0x0000A6C40167A7E8 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 14)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (15, CAST(0x0000A6C401701474 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 15)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (16, CAST(0x0000A6C40172D6E2 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 16)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (17, CAST(0x0000A6C401738E78 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 17)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (18, CAST(0x0000A6C401745F09 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 18)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (19, CAST(0x0000A6C401753005 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 19)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (20, CAST(0x0000A6C401819EC2 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 20)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (21, CAST(0x0000A6C401820DB3 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 21)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (22, CAST(0x0000A6C40182C2A2 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 22)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (23, CAST(0x0000A6C40183DDBF AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 23)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (24, CAST(0x0000A6C401848808 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 24)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (25, CAST(0x0000A6C40185BA86 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 25)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (26, CAST(0x0000A6C401864580 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 26)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (27, CAST(0x0000A6C40187453B AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 27)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (28, CAST(0x0000A6C40188B39F AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 28)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (29, CAST(0x0000A6C4018A2E42 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 29)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (30, CAST(0x0000A6C4018AE5CF AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 30)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (31, CAST(0x0000A6C50000BF0A AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 31)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (32, CAST(0x0000A6C50002863C AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 32)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1013, CAST(0x0000A6C50120DCE0 AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 33)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1014, CAST(0x0000A6C50122FEA8 AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 34)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1015, CAST(0x0000A6C50126DC3F AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 35)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1016, CAST(0x0000A6C50128CE5C AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 36)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1017, CAST(0x0000A6C5012A0538 AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 37)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1018, CAST(0x0000A6C5012A6F1E AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 38)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1019, CAST(0x0000A6C5012B66DB AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 39)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1020, CAST(0x0000A6C5012C2CD7 AS DateTime), NULL, N'cocacola', 2, N'20344003646', NULL, 4, NULL, 40)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1027, CAST(0x0000A70F015CFE85 AS DateTime), NULL, N'plola', 2, N'20344003646', NULL, 4, NULL, 41)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1028, CAST(0x0000A70F015D4F41 AS DateTime), NULL, N'plola', 2, N'20344003646', NULL, 4, NULL, 42)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1029, CAST(0x0000A70F015E15B7 AS DateTime), NULL, N'plola', 2, N'20344003646', NULL, 4, NULL, 43)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1030, CAST(0x0000A70F0163BA58 AS DateTime), NULL, N'plola', 2, N'20344003646', NULL, 4, NULL, 44)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1031, CAST(0x0000A70F0163F52F AS DateTime), NULL, N'plola', 2, N'20344003646', NULL, 4, NULL, 45)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1032, CAST(0x0000A7170153DD90 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 46)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1033, CAST(0x0000A71701541C9A AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 47)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1034, CAST(0x0000A718015D816D AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 48)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1035, CAST(0x0000A718017DF112 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 49)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1036, CAST(0x0000A71A01196A03 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 50)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1037, CAST(0x0000A71A0119AEAF AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 51)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1038, CAST(0x0000A71A0119CAEF AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 52)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1039, CAST(0x0000A71A0119D47F AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 53)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1040, CAST(0x0000A73100093B37 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 54)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1041, CAST(0x0000A731000950A3 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 55)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1042, CAST(0x0000A7310009E23A AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 56)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1043, CAST(0x0000A731000A6778 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 57)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1044, CAST(0x0000A732013AD473 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 58)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1045, CAST(0x0000A98001361DD2 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 59)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1046, CAST(0x0000AAA80183038D AS DateTime), NULL, N'pepe', 2, N'20344003646', NULL, 4, NULL, 60)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1047, CAST(0x0000AAB1016AD1DE AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 61)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1048, CAST(0x0000AAF50005B4EC AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 62)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2048, CAST(0x0000AAF5016FCF39 AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 63)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2049, CAST(0x0000AAF501721AC7 AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 64)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2050, CAST(0x0000AAF501731CE5 AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 65)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2051, CAST(0x0000AAF501734D77 AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 66)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2052, CAST(0x0000AAF501737EC0 AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 67)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2053, CAST(0x0000AAF50173D1EF AS DateTime), NULL, N'julopez', 1, N'20344003646', NULL, 1048, NULL, 68)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (2054, CAST(0x0000AAF50184DDCB AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 69)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3054, CAST(0x0000AAF800EFECD4 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 70)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3055, CAST(0x0000AAF800FEB582 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 71)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3056, CAST(0x0000AAF800FF3B78 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 72)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3057, CAST(0x0000AAF900DF93CF AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 73)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3058, CAST(0x0000AAF900F88BE2 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 74)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3059, CAST(0x0000AAF9015259D1 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 75)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (3060, CAST(0x0000AAFC013CCC3D AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 76)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4060, CAST(0x0000AB00013ABA35 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 77)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4061, CAST(0x0000AB00013DEAA0 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 78)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4062, CAST(0x0000AB000149F987 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 79)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4063, CAST(0x0000AB00014D7EE4 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 80)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4064, CAST(0x0000AB00014E6E00 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 81)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4065, CAST(0x0000AB00015042F4 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 82)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4066, CAST(0x0000AB000150EA38 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 83)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4067, CAST(0x0000AB0001525DC6 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 84)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4068, CAST(0x0000AB000152BC00 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 85)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4069, CAST(0x0000AB0100E89783 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 86)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4070, CAST(0x0000AB0100ED26A5 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 6, NULL, 87)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4071, CAST(0x0000AB010100D2B9 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 6, NULL, 88)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4072, CAST(0x0000AB010101450D AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 6, NULL, 89)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4073, CAST(0x0000AB010101D77C AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 6, NULL, 90)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4074, CAST(0x0000AB01010F8D2C AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 91)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4076, CAST(0x0000AB0101116CD9 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 92)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4077, CAST(0x0000AB0101120A91 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 93)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4078, CAST(0x0000AB01011B903C AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 94)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4079, CAST(0x0000AB010122EB55 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 95)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4080, CAST(0x0000AB0101291052 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 96)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4081, CAST(0x0000AB03014B4252 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 97)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4082, CAST(0x0000AB04014A4D14 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 98)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4083, CAST(0x0000AB040156E26E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 99)
GO
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4084, CAST(0x0000AB04015B2A6C AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 6, NULL, 100)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4085, CAST(0x0000AB04015BFDA3 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 4, NULL, 101)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4086, CAST(0x0000AB05013071C6 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 7, NULL, 102)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4087, CAST(0x0000AB0501313EBA AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 103)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4088, CAST(0x0000AB05013B9050 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 5, NULL, 104)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4089, CAST(0x0000AB05013D34BB AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 105)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4090, CAST(0x0000AB050141E486 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 106)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4091, CAST(0x0000AB050143F55B AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 107)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4092, CAST(0x0000AB0501446BED AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 108)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4093, CAST(0x0000AB050144C936 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 109)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4094, CAST(0x0000AB050150454A AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 110)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4097, CAST(0x0000AB07014FD226 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 111)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4098, CAST(0x0000AB07015E5327 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 112)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4099, CAST(0x0000AB070164DCF0 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 113)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4100, CAST(0x0000AB070165A307 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 114)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4101, CAST(0x0000AB070166251B AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 115)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4102, CAST(0x0000AB0701678395 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 116)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4103, CAST(0x0000AB07016B1009 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 117)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4104, CAST(0x0000AB07016C71CE AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 118)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4105, CAST(0x0000AB07016E2F54 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 119)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4106, CAST(0x0000AB0800C902A5 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 120)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4107, CAST(0x0000AB0800CB3F08 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 121)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4108, CAST(0x0000AB0800CEE59E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 122)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4109, CAST(0x0000AB0800CF0B50 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 123)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4110, CAST(0x0000AB0800CF74B5 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 124)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4111, CAST(0x0000AB0800D4DC07 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 125)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4112, CAST(0x0000AB0800D83DBF AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 126)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4113, CAST(0x0000AB0800D8547E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 127)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4114, CAST(0x0000AB0800D8A91E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 128)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4115, CAST(0x0000AB0800D8F81C AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 129)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4116, CAST(0x0000AB0800DBB71E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 130)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4117, CAST(0x0000AB0800DD0822 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 131)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4118, CAST(0x0000AB0800E19FB6 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 132)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4119, CAST(0x0000AB0800E26CA1 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 133)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4120, CAST(0x0000AB0800E2C4CC AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 134)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4121, CAST(0x0000AB0800E47130 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 135)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4122, CAST(0x0000AB0800E4AF3A AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 136)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4123, CAST(0x0000AB0800E51629 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 137)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4124, CAST(0x0000AB0800E8B55F AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 138)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4125, CAST(0x0000AB0800EE476E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 139)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4126, CAST(0x0000AB0800EE9F07 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 140)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4127, CAST(0x0000AB080130D786 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 33, NULL, 141)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4128, CAST(0x0000AB0801310FA6 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 142)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4129, CAST(0x0000AB080148AFDF AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 143)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4130, CAST(0x0000AB0801639865 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 144)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4131, CAST(0x0000AB090010E790 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 145)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4132, CAST(0x0000AB0901414420 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 146)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4133, CAST(0x0000AB0A001E5595 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 147)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4134, CAST(0x0000AB0A002155F3 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 7, NULL, 148)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4135, CAST(0x0000AB0A0026BE0A AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 8, NULL, 149)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4136, CAST(0x0000AB0A0026F9AE AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1055, NULL, 150)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4137, CAST(0x0000AB0A00289FD8 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1053, NULL, 151)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4138, CAST(0x0000AB0A002907B3 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1055, NULL, 152)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4139, CAST(0x0000AB0A0029819A AS DateTime), NULL, N'pargi', 2, N'20344003646', N'', 1056, NULL, 153)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4140, CAST(0x0000AB0A002AC818 AS DateTime), NULL, N'pargi', 1, N'20344003646', N'', 1054, NULL, 154)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4141, CAST(0x0000AB0A003B90FA AS DateTime), NULL, N'pargi', 2, N'20344003646', N'', 1054, NULL, 155)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4142, CAST(0x0000AB0A003D5FFC AS DateTime), NULL, N'pargi', 2, N'20344003646', N'', 1055, NULL, 156)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4143, CAST(0x0000AB0A00D63EBE AS DateTime), NULL, N'pargi', 1, N'20344003646', N'ttt213', 1056, NULL, 157)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4144, CAST(0x0000AB0A00DC1B2F AS DateTime), NULL, N'pargi', 1, N'20344003646', N'', 1053, NULL, 158)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4145, CAST(0x0000AB0A0104788A AS DateTime), NULL, N'pargi', 1, N'20344003646', N'OT667788', 1053, NULL, 159)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4146, CAST(0x0000AB0A011400AE AS DateTime), NULL, N'pargi', 1, N'20344003646', N'OT667788', 1054, NULL, 160)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4147, CAST(0x0000AB0B00CBCEB0 AS DateTime), NULL, N'pargi', 2, N'20344003646', N'OT667788', 1055, NULL, 161)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4148, CAST(0x0000AB0B00DA0DB3 AS DateTime), NULL, N'pargi', 1, N'20344003646', N'oot554665', 1054, NULL, 162)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (4149, CAST(0x0000AB0B0105516D AS DateTime), NULL, N'pargi', 1, N'20344003646', N'TNK9966784523234', 1054, NULL, 163)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5147, CAST(0x0000AB0B012F7D6C AS DateTime), NULL, N'pargi', 1, N'20344003646', N'TNK9966784523234', 1054, NULL, 164)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5148, CAST(0x0000AB0B0131E61F AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1054, NULL, 165)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5149, CAST(0x0000AB0C00E8145C AS DateTime), NULL, N'pargi', 1, N'20344003646', N'TNK9966784523234', 1, NULL, 166)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5150, CAST(0x0000AB0C00EE9A0B AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 167)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5151, CAST(0x0000AB0C00EF7C00 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 168)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5152, CAST(0x0000AB0C00F22F56 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 169)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5153, CAST(0x0000AB0C00F392C9 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 170)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5154, CAST(0x0000AB0C00F55A66 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 171)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5155, CAST(0x0000AB0C00F6F399 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 172)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5156, CAST(0x0000AB0C00FB22BA AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 173)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5157, CAST(0x0000AB0C00FD087A AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 174)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5158, CAST(0x0000AB0C00FD799A AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 175)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5159, CAST(0x0000AB0C00FF4397 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 176)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5160, CAST(0x0000AB0C01011790 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 177)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5161, CAST(0x0000AB0C0104AB16 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 178)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5162, CAST(0x0000AB0C0104C465 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 179)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5163, CAST(0x0000AB0C0105BF85 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 180)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5164, CAST(0x0000AB0C01066A54 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 181)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5165, CAST(0x0000AB0C01076009 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 182)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5166, CAST(0x0000AB0C01087433 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 183)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5167, CAST(0x0000AB0C010C3A53 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 184)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5168, CAST(0x0000AB0C010C6F40 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 185)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5169, CAST(0x0000AB0C016D24E1 AS DateTime), NULL, N'pargi', 1, N'20344003646', N'TNK9966784523234', 1, NULL, 186)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5170, CAST(0x0000AB0C016DE19E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 187)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5171, CAST(0x0000AB0C016F7291 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 188)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5172, CAST(0x0000AB0D011BA92B AS DateTime), NULL, N'plopez', 1, N'20344003646', NULL, 1, NULL, 189)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5173, CAST(0x0000AB0E000E5A08 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 190)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5174, CAST(0x0000AB0E000E717B AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1053, NULL, 191)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5175, CAST(0x0000AB0E0012A517 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 192)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5176, CAST(0x0000AB0E0012B973 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 193)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5177, CAST(0x0000AB0E0012CAD7 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 194)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5178, CAST(0x0000AB0E001388B6 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 195)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5179, CAST(0x0000AB0E0013C383 AS DateTime), NULL, N'pargi', 1, N'20344003646', N'TNK9966784523234', 1, NULL, 196)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5180, CAST(0x0000AB0E0013D9F2 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 197)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5181, CAST(0x0000AB0E00140F5B AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 198)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5182, CAST(0x0000AB0E0014225C AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 199)
GO
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5183, CAST(0x0000AB0E001458B7 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1056, NULL, 200)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5184, CAST(0x0000AB0E00148A09 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 201)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5185, CAST(0x0000AB0E0014AB86 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1055, NULL, 202)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5186, CAST(0x0000AB0E00153B75 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1056, NULL, 203)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5187, CAST(0x0000AB0E0016EA47 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1056, NULL, 204)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5188, CAST(0x0000AB0E001E4D43 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 205)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5189, CAST(0x0000AB0E001F0691 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 206)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5190, CAST(0x0000AB0E002545D0 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1056, NULL, 207)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5191, CAST(0x0000AB0E00268636 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 208)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5192, CAST(0x0000AB0E00290316 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 209)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5193, CAST(0x0000AB0E01334B44 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 210)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5194, CAST(0x0000AB0E01491B63 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 211)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5195, CAST(0x0000AB0E014FC251 AS DateTime), NULL, N'lrere', 2, N'20344003646', NULL, 1056, NULL, 212)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5196, CAST(0x0000AB1000BDB162 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1056, NULL, 213)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5197, CAST(0x0000AB1000BF27A8 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1, NULL, 214)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5198, CAST(0x0000AB1000C1B7C4 AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1, NULL, 215)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5199, CAST(0x0000AB1000D9FD4E AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1053, NULL, 216)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5200, CAST(0x0000AB12002ABA02 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 217)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5201, CAST(0x0000AB1600BF6FD2 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 218)
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5202, CAST(0x0000AB17016EDA4A AS DateTime), NULL, N'pargi', 2, N'20344003646', NULL, 1056, NULL, 219)
SET IDENTITY_INSERT [dbo].[Pedido] OFF
SET IDENTITY_INSERT [dbo].[PedidoDetalle] ON 

INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1, 1, 5, CAST(500 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2, 1, 10, CAST(500 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3, 1, 100, CAST(500 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4, 1, 200, CAST(500 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5, 1, 200, CAST(500 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (6, 1, 200, CAST(500 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (7, 2, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (8, 3, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (9, 3, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (10, 4, 2, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (11, 5, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (12, 5, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (13, 5, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (14, 6, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (15, 7, 2, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (16, 7, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (17, 8, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (18, 9, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (19, 9, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (20, 10, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (21, 11, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (22, 12, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (23, 13, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (24, 14, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (25, 15, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (26, 16, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (27, 17, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (28, 18, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (29, 19, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (30, 20, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (31, 21, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (32, 22, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (33, 23, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (34, 24, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (35, 25, 3, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (36, 25, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (37, 26, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (38, 26, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (39, 26, 4, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (40, 27, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (41, 27, 2, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (42, 28, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (43, 28, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (44, 28, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (45, 29, 2, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (46, 29, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (47, 29, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (48, 30, 2, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (49, 30, 2, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (50, 30, 2, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (51, 31, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (52, 32, 4, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (53, 32, 1, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1023, 1013, 4, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1024, 1014, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1025, 1014, 2, CAST(85324 AS Decimal(18, 0)), 12, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1026, 1015, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1027, 1015, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1028, 1016, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1029, 1017, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1030, 1018, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1031, 1019, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1032, 1020, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1033, 1027, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1034, 1028, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1035, 1029, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1036, 1030, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1037, 1031, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1038, 1032, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1039, 1033, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1040, 1034, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1041, 1035, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1042, 1036, 9, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1043, 1036, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1044, 1037, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1045, 1038, 3, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1046, 1039, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1047, 1040, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1048, 1041, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1049, 1042, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1050, 1043, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1051, 1044, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1052, 1045, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1053, 1046, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1054, 1047, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (1055, 1048, 3, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2055, 2048, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2056, 2049, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2057, 2050, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2058, 2051, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2059, 2052, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2060, 2053, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (2061, 2054, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3061, 3054, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3062, 3055, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3063, 3056, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3064, 3057, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3065, 3058, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3066, 3059, 1, CAST(80000 AS Decimal(18, 0)), 34, NULL, N'20344003646')
GO
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3067, 3059, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (3068, 3060, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4068, 4060, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4069, 4060, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4070, 4061, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4071, 4061, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4072, 4062, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4073, 4062, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4074, 4063, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4075, 4063, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4076, 4064, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4077, 4065, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4078, 4066, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4079, 4067, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4080, 4068, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4081, 4069, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4082, 4070, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4083, 4071, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4084, 4072, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4085, 4073, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4086, 4074, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4087, 4074, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4090, 4076, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4091, 4076, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4092, 4077, 2, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4093, 4077, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4094, 4078, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4095, 4079, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4096, 4080, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4097, 4081, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4098, 4082, 1, CAST(80000 AS Decimal(18, 0)), 34, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4099, 4083, 1, CAST(80000 AS Decimal(18, 0)), 34, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4100, 4084, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4101, 4085, 1, CAST(80000 AS Decimal(18, 0)), 34, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4102, 4086, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4103, 4087, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4104, 4088, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4105, 4089, 1, CAST(80000 AS Decimal(18, 0)), 34, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4106, 4090, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4107, 4091, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4108, 4092, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4109, 4093, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4110, 4094, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4111, 4097, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4112, 4098, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4113, 4099, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4114, 4100, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4115, 4101, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4116, 4102, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4117, 4103, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4118, 4104, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4119, 4105, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4120, 4106, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4121, 4107, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4122, 4108, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4123, 4109, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4124, 4110, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4125, 4111, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4126, 4112, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4127, 4113, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4128, 4114, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4129, 4115, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4130, 4116, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4131, 4117, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4132, 4118, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4133, 4119, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4134, 4120, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4135, 4121, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4136, 4122, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4137, 4123, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4138, 4124, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4139, 4125, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4140, 4126, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4141, 4127, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4142, 4128, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4143, 4129, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4144, 4129, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4145, 4130, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4146, 4131, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4147, 4132, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4148, 4133, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4149, 4134, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4150, 4135, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4151, 4136, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4152, 4137, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4153, 4138, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4154, 4139, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4155, 4140, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4156, 4141, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4157, 4142, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4158, 4143, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4159, 4144, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4160, 4145, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4161, 4146, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4162, 4147, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4163, 4148, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (4164, 4149, 1, CAST(75212 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5162, 5147, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5163, 5148, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5164, 5149, 2, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
GO
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5165, 5150, 1, CAST(75213 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5166, 5151, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5167, 5152, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5168, 5153, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5169, 5154, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5170, 5155, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5171, 5156, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5172, 5157, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5173, 5158, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5174, 5159, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5175, 5160, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5176, 5161, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5177, 5162, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5178, 5163, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5179, 5164, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5180, 5165, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5181, 5166, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5182, 5167, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5183, 5168, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5184, 5169, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5185, 5170, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5186, 5171, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5187, 5172, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5188, 5173, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5189, 5174, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5190, 5175, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5191, 5176, 1, CAST(75213 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5192, 5177, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5193, 5178, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5194, 5179, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5195, 5180, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5196, 5181, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5197, 5182, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5198, 5183, 1, CAST(75213 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5199, 5184, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5200, 5185, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5201, 5186, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5202, 5187, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5203, 5188, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5204, 5189, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5205, 5190, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5206, 5191, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5207, 5192, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5208, 5193, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5209, 5194, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5210, 5195, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5211, 5196, 1, CAST(75213 AS Decimal(18, 0)), 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5212, 5196, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5213, 5197, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5214, 5198, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5215, 5199, 1, CAST(22725 AS Decimal(18, 0)), 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5216, 5200, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5217, 5201, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [IdProducto], [FecBaja], [CUIT]) VALUES (5218, 5202, 1, CAST(70652 AS Decimal(18, 0)), 3, NULL, N'20344003646')
SET IDENTITY_INSERT [dbo].[PedidoDetalle] OFF
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1, 6, CAST(0x0000AAF800E18AF0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2, 2, CAST(0x0000AAF800EF9B61 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3, 1, CAST(0x0000A6BE00511E4A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4, 1, CAST(0x0000A6BE00538D57 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5, 1, CAST(0x0000A6BE00CE2D48 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (6, 1, CAST(0x0000A6BE0120C74C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (7, 1, CAST(0x0000A6BF01243AF9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (8, 1, CAST(0x0000A6C000E12AC0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (9, 1, CAST(0x0000A6C401511CC4 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (10, 1, CAST(0x0000A6C4015E0432 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (11, 1, CAST(0x0000A6C40162DB16 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (12, 1, CAST(0x0000A6C40164C3DA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (13, 1, CAST(0x0000A6C401676AEC AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (14, 1, CAST(0x0000A6C40167A7E8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (15, 1, CAST(0x0000A6C401701474 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (16, 1, CAST(0x0000A6C40172D6E2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (17, 1, CAST(0x0000A6C401738E78 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (18, 1, CAST(0x0000A6C401745F09 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (19, 1, CAST(0x0000A6C401753005 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (20, 1, CAST(0x0000A6C401819EC2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (21, 1, CAST(0x0000A6C401820DB3 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (22, 1, CAST(0x0000A6C40182C2A2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (23, 1, CAST(0x0000A6C40183DDBF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (24, 1, CAST(0x0000A6C401848808 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (25, 1, CAST(0x0000A6C40185BA86 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (26, 1, CAST(0x0000A6C401864580 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (27, 1, CAST(0x0000A6C40187453B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (28, 1, CAST(0x0000A6C40188B39F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (29, 1, CAST(0x0000A6C4018A2E42 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (30, 1, CAST(0x0000A6C4018AE5CF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (31, 1, CAST(0x0000A6C50000BF0A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (32, 1, CAST(0x0000A6C50002863C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1013, 6, CAST(0x0000A6C50120DCE0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1014, 6, CAST(0x0000A6C50122FEA8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1015, 6, CAST(0x0000A6C50126DC3F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1016, 6, CAST(0x0000A6C50128CE5C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1017, 6, CAST(0x0000A6C5012A0538 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1018, 6, CAST(0x0000A6C5012A6F1E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1019, 1, CAST(0x0000A6C5012B66DB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1019, 6, CAST(0x0000A6C5012B6983 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1020, 1, CAST(0x0000A6C5012C2CD7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1020, 6, CAST(0x0000A6C5012C31E1 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1027, 1, CAST(0x0000A70F015CFE85 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1027, 6, CAST(0x0000A70F015D11C5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1028, 1, CAST(0x0000A70F015D4F41 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1028, 6, CAST(0x0000A70F015D63A2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1029, 1, CAST(0x0000A70F015E15B7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1030, 1, CAST(0x0000A70F0163BA58 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1030, 6, CAST(0x0000A70F0163BCD8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1031, 1, CAST(0x0000A70F0163F52F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1031, 6, CAST(0x0000A70F016404DB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1032, 1, CAST(0x0000A7170153DD90 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1033, 1, CAST(0x0000A71701541C9A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1034, 1, CAST(0x0000A718015D816D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1034, 6, CAST(0x0000A718015D9371 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1035, 1, CAST(0x0000A718017DF112 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1035, 6, CAST(0x0000A718017DF5FB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1036, 1, CAST(0x0000A71A01196A03 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1037, 1, CAST(0x0000A71A0119AEAF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1038, 1, CAST(0x0000A71A0119CAEF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1039, 1, CAST(0x0000A71A0119D47F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1039, 6, CAST(0x0000A71A011A047E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1040, 1, CAST(0x0000A73100093B37 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1041, 2, CAST(0x0000A73100096764 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1042, 1, CAST(0x0000A7310009E23A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1042, 6, CAST(0x0000A7310009ECB9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1043, 1, CAST(0x0000A731000A6778 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1043, 6, CAST(0x0000A731000AEC48 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1044, 1, CAST(0x0000A732013AD473 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1044, 6, CAST(0x0000A732013B2705 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1045, 1, CAST(0x0000A98001361DD2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1046, 2, CAST(0x0000AAA801831A03 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1047, 1, CAST(0x0000AAB1016AD1DE AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1047, 6, CAST(0x0000AAB1016ADD46 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1048, 2, CAST(0x0000AAF500063152 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2048, 2, CAST(0x0000AAF5017000C3 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2049, 2, CAST(0x0000AAF501721EC0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2050, 2, CAST(0x0000AAF5017320AE AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2051, 1, CAST(0x0000AAF501734D77 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2051, 6, CAST(0x0000AAF501736106 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2052, 1, CAST(0x0000AAF501737EC0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2053, 1, CAST(0x0000AAF50173D1EF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2053, 6, CAST(0x0000AAF5017458E5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2054, 1, CAST(0x0000AAF50184DDCB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (2054, 6, CAST(0x0000AAF50185187B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3054, 1, CAST(0x0000AAF800EFECD4 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3054, 6, CAST(0x0000AAF800EFF42B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3055, 1, CAST(0x0000AAF800FEB582 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3055, 6, CAST(0x0000AAF800FEB9B0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3056, 2, CAST(0x0000AAF800FF7124 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3057, 1, CAST(0x0000AAF900DF93CF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3058, 1, CAST(0x0000AAF900F88BE2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3059, 1, CAST(0x0000AAF9015259D1 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3059, 6, CAST(0x0000AAF9015261F7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (3060, 1, CAST(0x0000AAFC013CCC3D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4060, 1, CAST(0x0000AB00013ABA35 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4061, 1, CAST(0x0000AB00013DEAA0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4062, 1, CAST(0x0000AB000149F987 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4063, 1, CAST(0x0000AB00014D7EE4 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4064, 1, CAST(0x0000AB00014E6E00 AS DateTime), NULL)
GO
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4065, 1, CAST(0x0000AB00015042F4 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4066, 1, CAST(0x0000AB000150EA38 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4067, 1, CAST(0x0000AB0001525DC6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4068, 1, CAST(0x0000AB000152BC00 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4069, 1, CAST(0x0000AB0100E89783 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4070, 1, CAST(0x0000AB0100ED26A5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4071, 1, CAST(0x0000AB010100D2B9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4072, 1, CAST(0x0000AB010101450D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4073, 1, CAST(0x0000AB010101D77C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4074, 1, CAST(0x0000AB01010F8D2C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4076, 1, CAST(0x0000AB0101116CD9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4077, 1, CAST(0x0000AB0101120A91 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4078, 1, CAST(0x0000AB01011B903C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4079, 1, CAST(0x0000AB010122EB55 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4080, 1, CAST(0x0000AB0101291052 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4081, 1, CAST(0x0000AB03014B4252 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4082, 1, CAST(0x0000AB04014A4D14 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4083, 1, CAST(0x0000AB040156E26E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4084, 1, CAST(0x0000AB04015B2A6C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4085, 1, CAST(0x0000AB04015BFDA3 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4086, 1, CAST(0x0000AB05013071C6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4087, 1, CAST(0x0000AB0501313EBA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4088, 1, CAST(0x0000AB05013B9050 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4089, 1, CAST(0x0000AB05013D34BB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4089, 6, CAST(0x0000AB05013FB5A5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4090, 1, CAST(0x0000AB050141E486 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4090, 6, CAST(0x0000AB050141EB3C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4091, 1, CAST(0x0000AB050143F55B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4091, 6, CAST(0x0000AB050143F98E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4092, 1, CAST(0x0000AB0501446BED AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4092, 6, CAST(0x0000AB0501446FE2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4093, 1, CAST(0x0000AB050144C936 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4093, 6, CAST(0x0000AB050144CE39 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4094, 1, CAST(0x0000AB050150454A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4097, 1, CAST(0x0000AB07014FD226 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4098, 1, CAST(0x0000AB07015E5327 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4099, 1, CAST(0x0000AB070164DCF0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4100, 1, CAST(0x0000AB070165A307 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4101, 1, CAST(0x0000AB070166251B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4102, 1, CAST(0x0000AB0701678395 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4103, 1, CAST(0x0000AB07016B1009 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4104, 1, CAST(0x0000AB07016C71CE AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4105, 1, CAST(0x0000AB07016E2F54 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4106, 1, CAST(0x0000AB0800C902A5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4107, 1, CAST(0x0000AB0800CB3F08 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4108, 1, CAST(0x0000AB0800CEE59E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4109, 1, CAST(0x0000AB0800CF0B50 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4110, 1, CAST(0x0000AB0800CF74B5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4111, 1, CAST(0x0000AB0800D4DC07 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4112, 1, CAST(0x0000AB0800D83DBF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4113, 1, CAST(0x0000AB0800D8547E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4114, 1, CAST(0x0000AB0800D8A91E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4115, 1, CAST(0x0000AB0800D8F81C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4116, 1, CAST(0x0000AB0800DBB71E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4117, 1, CAST(0x0000AB0800DD0822 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4118, 1, CAST(0x0000AB0800E19FB6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4119, 1, CAST(0x0000AB0800E26CA1 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4120, 1, CAST(0x0000AB0800E2C4CC AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4121, 1, CAST(0x0000AB0800E47130 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4122, 1, CAST(0x0000AB0800E4AF3A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4123, 1, CAST(0x0000AB0800E51629 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4124, 1, CAST(0x0000AB0800E8B55F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4125, 1, CAST(0x0000AB0800EE476E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4126, 1, CAST(0x0000AB0800EE9F07 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4127, 1, CAST(0x0000AB080130D786 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4128, 1, CAST(0x0000AB0801310FA6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4129, 1, CAST(0x0000AB080148AFDF AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4130, 1, CAST(0x0000AB0801639865 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4131, 1, CAST(0x0000AB090010E790 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4131, 2, CAST(0x0000AB090011A42F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4132, 1, CAST(0x0000AB0901414420 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4132, 2, CAST(0x0000AB0901414816 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4133, 1, CAST(0x0000AB0A001E5595 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4134, 1, CAST(0x0000AB0A002155F3 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4135, 1, CAST(0x0000AB0A0026BE0A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4136, 1, CAST(0x0000AB0A0026F9AE AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4136, 2, CAST(0x0000AB0A002801D5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4137, 1, CAST(0x0000AB0A00289FD8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4137, 2, CAST(0x0000AB0A0028AEAA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4138, 1, CAST(0x0000AB0A002907B3 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4138, 2, CAST(0x0000AB0A00290F67 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4139, 1, CAST(0x0000AB0A0029819A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4139, 2, CAST(0x0000AB0A00298A56 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4139, 4, CAST(0x0000AB0B01040619 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4140, 1, CAST(0x0000AB0A002AC818 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4140, 2, CAST(0x0000AB0A002ACF16 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4140, 3, CAST(0x0000AB0B01037C5D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4141, 1, CAST(0x0000AB0A003B90FA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4141, 2, CAST(0x0000AB0A003B9926 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4141, 4, CAST(0x0000AB0B010336D2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4141, 5, CAST(0x0000AB0B012887AD AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4142, 1, CAST(0x0000AB0A003D5FFC AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4142, 2, CAST(0x0000AB0A003D69A1 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4142, 4, CAST(0x0000AB0B0102BD57 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4142, 6, CAST(0x0000AB0B011F8E9D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4143, 1, CAST(0x0000AB0A00D63EBE AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4143, 2, CAST(0x0000AB0A010373F6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4143, 3, CAST(0x0000AB0B00F33569 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4143, 6, CAST(0x0000AB0B011F1802 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4144, 1, CAST(0x0000AB0A00DC1B2F AS DateTime), NULL)
GO
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4144, 2, CAST(0x0000AB0A010350FA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4144, 3, CAST(0x0000AB0B01033077 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4144, 5, CAST(0x0000AB0B011EC684 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4145, 1, CAST(0x0000AB0A0104788A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4145, 2, CAST(0x0000AB0A01047FDC AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4145, 3, CAST(0x0000AB0B00F2812A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4145, 5, CAST(0x0000AB0B0128283B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4146, 1, CAST(0x0000AB0A011400AE AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4146, 2, CAST(0x0000AB0A01140BD2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4146, 3, CAST(0x0000AB0B00F27B31 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4146, 5, CAST(0x0000AB0B0128022B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4147, 1, CAST(0x0000AB0B00CBCEB0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4147, 2, CAST(0x0000AB0B00CC4096 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4147, 4, CAST(0x0000AB0B00F25282 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4147, 5, CAST(0x0000AB0B0123E6E5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4148, 1, CAST(0x0000AB0B00DA0DB3 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4148, 2, CAST(0x0000AB0B00DA39A8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4148, 3, CAST(0x0000AB0B00F1BC8C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4148, 5, CAST(0x0000AB0B0123D9C1 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4149, 1, CAST(0x0000AB0B0105516D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4149, 2, CAST(0x0000AB0B010647C9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4149, 3, CAST(0x0000AB0B010647CA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4149, 5, CAST(0x0000AB0B0123E2EB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (4149, 6, CAST(0x0000AB0B013AA68A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5147, 1, CAST(0x0000AB0B012F7D6C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5147, 2, CAST(0x0000AB0B012FA5E7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5147, 3, CAST(0x0000AB0B012FA5E8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5147, 5, CAST(0x0000AB0B012FA5E8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5147, 6, CAST(0x0000AB0B012FB348 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5148, 1, CAST(0x0000AB0B0131E61F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5148, 6, CAST(0x0000AB0B013456ED AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5149, 1, CAST(0x0000AB0C00E8145C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5149, 2, CAST(0x0000AB0C00E9F513 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5149, 3, CAST(0x0000AB0C00E9FF02 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5150, 1, CAST(0x0000AB0C00EE9A0B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5151, 1, CAST(0x0000AB0C00EF7C00 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5152, 1, CAST(0x0000AB0C00F22F56 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5153, 1, CAST(0x0000AB0C00F392C9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5154, 1, CAST(0x0000AB0C00F55A66 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5155, 1, CAST(0x0000AB0C00F6F399 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5156, 1, CAST(0x0000AB0C00FB22BA AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5157, 1, CAST(0x0000AB0C00FD087A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5158, 1, CAST(0x0000AB0C00FD799A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5159, 1, CAST(0x0000AB0C00FF4397 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5160, 1, CAST(0x0000AB0C01011790 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5161, 1, CAST(0x0000AB0C0104AB16 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5162, 1, CAST(0x0000AB0C0104C465 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5162, 2, CAST(0x0000AB0E000DD19B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5163, 1, CAST(0x0000AB0C0105BF85 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5163, 2, CAST(0x0000AB0C0105C352 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5164, 1, CAST(0x0000AB0C01066A54 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5164, 2, CAST(0x0000AB0E000DDA73 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5165, 1, CAST(0x0000AB0C01076009 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5165, 2, CAST(0x0000AB0E000DE131 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5166, 1, CAST(0x0000AB0C01087433 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5166, 2, CAST(0x0000AB0C016E5762 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5167, 1, CAST(0x0000AB0C010C3A53 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5167, 2, CAST(0x0000AB0E000BFE07 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5168, 1, CAST(0x0000AB0C010C6F40 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5168, 2, CAST(0x0000AB0C016DAE57 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5169, 1, CAST(0x0000AB0C016D24E1 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5169, 2, CAST(0x0000AB0C016E3563 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5169, 3, CAST(0x0000AB0C016E3C87 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5169, 5, CAST(0x0000AB0C016E417B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5170, 1, CAST(0x0000AB0C016DE19E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5170, 6, CAST(0x0000AB0C016E2A89 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5171, 1, CAST(0x0000AB0C016F7291 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5171, 2, CAST(0x0000AB0D01117824 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5172, 1, CAST(0x0000AB0D011BA92B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5173, 1, CAST(0x0000AB0E000E5A08 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5174, 1, CAST(0x0000AB0E000E717B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5175, 1, CAST(0x0000AB0E0012A517 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5175, 2, CAST(0x0000AB0E0012A938 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5176, 1, CAST(0x0000AB0E0012B973 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5177, 1, CAST(0x0000AB0E0012CAD7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5177, 2, CAST(0x0000AB0E0012CE8D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5178, 1, CAST(0x0000AB0E001388B6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5178, 2, CAST(0x0000AB0E00139123 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5179, 1, CAST(0x0000AB0E0013C383 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5179, 2, CAST(0x0000AB0E0013CD6E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5179, 3, CAST(0x0000AB0E00FD0A04 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5179, 5, CAST(0x0000AB0E00FD0F3D AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5179, 6, CAST(0x0000AB0E00FD143A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5180, 1, CAST(0x0000AB0E0013D9F2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5180, 2, CAST(0x0000AB0E0013DE41 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5181, 1, CAST(0x0000AB0E00140F5B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5181, 2, CAST(0x0000AB0E0014138A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5182, 1, CAST(0x0000AB0E0014225C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5182, 2, CAST(0x0000AB0E00143FB5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5183, 1, CAST(0x0000AB0E001458B7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5183, 2, CAST(0x0000AB0E00147666 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5184, 1, CAST(0x0000AB0E00148A09 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5184, 2, CAST(0x0000AB0E00BE8B81 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5185, 1, CAST(0x0000AB0E0014AB86 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5186, 1, CAST(0x0000AB0E00153B75 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5186, 2, CAST(0x0000AB0E00A38399 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5187, 1, CAST(0x0000AB0E0016EA47 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5187, 2, CAST(0x0000AB0E00DC12E5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5188, 1, CAST(0x0000AB0E001E4D43 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5188, 2, CAST(0x0000AB0E00B29799 AS DateTime), NULL)
GO
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5189, 1, CAST(0x0000AB0E001F0691 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5189, 2, CAST(0x0000AB0E00DCF878 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5190, 1, CAST(0x0000AB0E002545D0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5190, 2, CAST(0x0000AB0E00B1114F AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5191, 1, CAST(0x0000AB0E00268636 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5191, 6, CAST(0x0000AB1000DA276C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5192, 1, CAST(0x0000AB0E00290316 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5192, 2, CAST(0x0000AB0E0029071E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5193, 1, CAST(0x0000AB0E01334B44 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5193, 2, CAST(0x0000AB0E01334FD9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5194, 1, CAST(0x0000AB0E01491B63 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5195, 1, CAST(0x0000AB0E014FC251 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5195, 2, CAST(0x0000AB0E015007AB AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5196, 1, CAST(0x0000AB1000BDB162 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5196, 2, CAST(0x0000AB1000D9EEB9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5196, 4, CAST(0x0000AB1000DA1AD6 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5197, 1, CAST(0x0000AB1000BF27A8 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5198, 1, CAST(0x0000AB1000C1B7C4 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5198, 2, CAST(0x0000AB1000C1BBDD AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5199, 1, CAST(0x0000AB1000D9FD4E AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5199, 2, CAST(0x0000AB1600FD2057 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5200, 1, CAST(0x0000AB12002ABA02 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5200, 2, CAST(0x0000AB12002AC700 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5201, 1, CAST(0x0000AB1600BF6FD2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5201, 2, CAST(0x0000AB1600BF7CA9 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5202, 1, CAST(0x0000AB17016EDA4A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5202, 2, CAST(0x0000AB17016EEFBD AS DateTime), NULL)
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (2, 10, NULL, N'20344003646')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (3, 10, NULL, N'20344003646')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (4, 14, NULL, N'20344003646')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (18, 2, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (19, 2, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (20, 3, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (21, 3, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (22, 6, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (23, 6, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (25, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (26, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (27, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (28, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (29, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (30, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (31, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (32, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (33, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (34, 12, CAST(0x0000AAF8011BD0D1 AS DateTime), N'20344003646')
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (2, N'GE8000MM', CAST(22725.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'Grupo Nafta 8000 Monofasico', N'GE8000.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (3, N'GE10000ME', CAST(70652.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'Grupo Nafta 10 Kva - Monofásico – Arranque Eléctrico', N'GE10000ME.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (4, N'GE12000ME', CAST(75213.000 AS Decimal(18, 3)), 1, N'20344003646', 1, N'Grupo Nafta 12 Kva - Monofásico – Arranque Eléctrico', N'GE12000ME.png', NULL, N'')
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (5, N'1234', CAST(22.000 AS Decimal(18, 3)), 1, N'123456', 1, N'Cereal Mix', N'1234.jpg', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (7, N'1122', CAST(57.000 AS Decimal(18, 3)), 1, N'123456', 1, N'Alfajor Cachafaz Dulce de Leche', N'alfajor-de-dulce-de-leche.jpg', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (12, N'GE15000ME', CAST(85324.000 AS Decimal(18, 3)), 1, N'20344003646', 1, N'Grupo Nafta 15 Kva - Monofásico – Arranque Eléctrico - Motor Honda', N'GE15000ME.jpg', NULL, N'')
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (13, N'IMP001', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 2', N'Imp001.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (14, N'IMP002', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 2', N'Imp002.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (15, N'IMP003', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 3', N'Imp003.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (16, N'IMP004', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 4', N'Imp004.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (17, N'IMP005', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 5', N'Imp005.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (18, N'EMP01', CAST(2.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Empanada de carne', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (19, N'EMP02', CAST(2.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Empanada de jamon y queso', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (20, N'FAC01', CAST(3.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Medialuna de grasa', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (21, N'FAC02', CAST(4.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Tortita negra', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (22, N'MAT01', CAST(18.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Bolsa de harina de trigo 000', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (23, N'MAT02', CAST(21.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Bolsa de harina de centeno', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (25, N'GMSM-0001', CAST(250.000 AS Decimal(18, 3)), 11, N'20377540582', 1, N'Rolling Stones: Flashpoint', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (26, N'GMSM-0002', CAST(250.000 AS Decimal(18, 3)), 11, N'20377540582', 1, N'Rolling Stones: Undercover', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (27, N'GMSM-0003', CAST(200.000 AS Decimal(18, 3)), 11, N'20377540582', 1, N'David Bowie: Lazarus ', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (28, N'GMWB-0001', CAST(250.000 AS Decimal(18, 3)), 12, N'20377540582', 1, N'Coldplay: Ghost Stories ', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (29, N'GMWB-0002', CAST(170.000 AS Decimal(18, 3)), 12, N'20377540582', 1, N'Cuarteto de nos: Habla tu espejo ', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (30, N'GMUM-0001', CAST(170.000 AS Decimal(18, 3)), 10, N'20377540582', 1, N'Bersuit Vergarabat: Libertinaje', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (31, N'GMUM-0002', CAST(280.000 AS Decimal(18, 3)), 10, N'20377540582', 1, N'Black Sabbath: 13', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (32, N'GMPM-0001', CAST(280.000 AS Decimal(18, 3)), 13, N'20377540582', 1, N'NTVG: El tiempo otra vez avanza', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (33, N'GMPM-0002', CAST(280.000 AS Decimal(18, 3)), 13, N'20377540582', 1, N'NTVG: El calor del pleno invierno', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (34, N'GE13000EC', CAST(80000.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'13000VA – Monofásico a Gas – Motor Honda 26 Hp a GAS – TTA – Insonorizado – Cabinado', N'GE13000EC.jpg', CAST(0x0000AAF8011BD0D1 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (1, N'Buenos Aires', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (2, N'Buenos Aires-GBA', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (3, N'CABA', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (4, N'Catamarca', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (5, N'Chaco', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (6, N'Chubut', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (7, N'Córdoba', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (8, N'Corrientes', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (9, N'Entre Ríos', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (10, N'Formosa', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (11, N'Jujuy', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (12, N'La Pampa', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (13, N'La Rioja', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (14, N'Mendoza', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (15, N'Misiones', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (16, N'Neuquén', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (17, N'Río Negro', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (18, N'Salta', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (19, N'San Juan', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (20, N'San Luis', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (21, N'Santa Cruz', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (22, N'Santa Fe', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (23, N'Santiago del Estero', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (24, N'Tierra del Fuego', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (25, N'Tucumán', NULL)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
INSERT [dbo].[Recurso] ([CUIT], [Recurso], [Url], [Activo]) VALUES (N'20344003646', N'Carrousel1', N'Recurso1.jpg', 1)
INSERT [dbo].[Recurso] ([CUIT], [Recurso], [Url], [Activo]) VALUES (N'20344003646', N'Carrousel2', N'Recurso2.jpg', 1)
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 4, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 5, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 6, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 7, 10, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 8, 9, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 4, 5, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 5, 4, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 6, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 7, 9, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 8, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 4, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 5, 6, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 6, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 7, 9, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 8, 1, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (12, 4, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (34, 4, 0, NULL, N'20344003646')
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (1, N'Deposito', 1, N'20289082981', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (2, N'Deposito', 1, N'20377540582', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (3, N'Deposito', 1, N'20344364029', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (4, N'Deposito', 1, N'20344003646', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (5, N'Deposito2', 1056, N'20344003646', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (6, N'Deposito3', 1053, N'20344003646', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (7, N'Deposito4', 1054, N'20344003646', NULL)
INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (8, N'Deposito5', 1055, N'20344003646', NULL)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdTipoTarjeta], [CUIT], [NombreUsuario], [Titular], [Vencimiento], [Numero], [CodSeguridad], [FecBaja], [Predeterminada]) VALUES (1, 1, N'20344003646', N'pargi', N'Juan Pepe', CAST(0x0000ACFD00000000 AS DateTime), 4509953566233704, 112, NULL, 1)
INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdTipoTarjeta], [CUIT], [NombreUsuario], [Titular], [Vencimiento], [Numero], [CodSeguridad], [FecBaja], [Predeterminada]) VALUES (2, 1, N'20344003646', N'julopez', N'Julio Lopez', CAST(0x0000B38800000000 AS DateTime), 4170068810108020, 123, NULL, 0)
INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdTipoTarjeta], [CUIT], [NombreUsuario], [Titular], [Vencimiento], [Numero], [CodSeguridad], [FecBaja], [Predeterminada]) VALUES (3, 1, N'20344003646', N'pargi', N'Juan Pepe', CAST(0x0000B4D600000000 AS DateTime), 4236690000941407, 222, NULL, 0)
INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdTipoTarjeta], [CUIT], [NombreUsuario], [Titular], [Vencimiento], [Numero], [CodSeguridad], [FecBaja], [Predeterminada]) VALUES (4, 1, N'20344003646', N'lrere', N'rere', CAST(0x0000B8E100000000 AS DateTime), 4236690000941407, 111, NULL, 0)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
INSERT [dbo].[Telefono] ([CUIT], [NombreUsuario], [NroTelefono], [CodArea], [IdTipoTel], [FecBaja]) VALUES (N'20344003646', N'jmartinez', N'44443232', N'011', 1, NULL)
INSERT [dbo].[Telefono] ([CUIT], [NombreUsuario], [NroTelefono], [CodArea], [IdTipoTel], [FecBaja]) VALUES (N'20344003646', N'lpruebados', N'1555225522', N'011', 2, NULL)
INSERT [dbo].[Telefono] ([CUIT], [NombreUsuario], [NroTelefono], [CodArea], [IdTipoTel], [FecBaja]) VALUES (N'20344003646', N'pargi', N'1566778877', N'011', 2, NULL)
SET IDENTITY_INSERT [dbo].[TipoComprobante] ON 

INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (1, N'Factura A', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (2, N'Factura B', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (3, N'Factura C', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (4, N'Factura M', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (5, N'Nota de Credito', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (6, N'Nota de Credito B', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (7, N'Nota de Credito C', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (8, N'Nota de Debito', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (9, N'Nota de Debito B', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (10, N'Nota de Debito C', NULL)
SET IDENTITY_INSERT [dbo].[TipoComprobante] OFF
SET IDENTITY_INSERT [dbo].[TipoDireccion] ON 

INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [DescripcionDireccion], [FecBaja]) VALUES (1, N'Facturacion', NULL)
INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [DescripcionDireccion], [FecBaja]) VALUES (2, N'Envio', NULL)
SET IDENTITY_INSERT [dbo].[TipoDireccion] OFF
INSERT [dbo].[TipoTarjeta] ([IdTipoTarjeta], [Descripcion], [FecBaja]) VALUES (1, N'Visa', NULL)
INSERT [dbo].[TipoTarjeta] ([IdTipoTarjeta], [Descripcion], [FecBaja]) VALUES (2, N'Master Card', NULL)
SET IDENTITY_INSERT [dbo].[TipoTel] ON 

INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (1, N'Casa', NULL)
INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (2, N'Celular', NULL)
INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (3, N'Trabajo', NULL)
INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (4, N'Otros', NULL)
SET IDENTITY_INSERT [dbo].[TipoTel] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1034, 1, 2, N'Admin', N'Admin', N'33222564', N'20344003646', N'admin@mm.com', N'administrador', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (20, 2, 1, N'Cocacola', N'Cocacola', N'234557883', N'20344003646', N'cocacola@cocacola.com', N'cocacola', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, N'cocaColaLogo.jpg')
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (5, 1, 2, N'Gustavo', N'Ripa', N'22556446', N'20344003646', N'gripa@gmail.com', N'gripa', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (13, 1, 1, N'hihi', N'hihi', N'', N'20344003646', N'hihi@hihi.com', N'hihi', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (7, 1, 2, N'asdf', N'asdf', N'22223345', N'20344003646', N'asdf@asdf.com', N'jlele', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000A6BE00E21F21 AS DateTime), NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (11, 1, 2, N'Juan', N'Lopal', N'22112445', N'20344003646', N'hola@hola.com', N'jlopal', N'Descargas123', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (3, 1, 2, N'Juan', N'Martinez', N'12121212', N'20344003646', N'martinez.juan.marcos@gmail.com', N'jmartinez', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (6, 1, 2, N'asdf', N'asdf', N'22223345', N'20344003646', N'asdf@asdf.com', N'jpepe', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000A6BE00E226E7 AS DateTime), NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (8, 1, 2, N'asdf', N'asdf', N'23451233', N'20344003646', N'asdf@asdf.com', N'jsere', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000A6BE00E1238F AS DateTime), NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (16, 1, 1, N'Julian', N'Lopez', N'30122564', N'20344003646', N'julopez@gmail.com', N'julopez', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (12, 1, 2, N'll', N'jj', N'', N'20344003646', N'jj@gg.com', N'klkl', N'Descargas123', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (24, 1, 2, N'Lola', N'Argi', N'22111545', N'20344003646', N'javi_lospiojos087@hotmail.com', N'largi', N'/3oxe091Pc5eoV7/G/lyS+WWSFE=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (26, 1, 1, N'lpruebados', N'lprudos', N'22555666', N'20344003646', N'lprudos@m2.com', N'lpruebados', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (25, 1, 1, N'Lpruuno', N'Pruebauno', N'22555666', N'20344003646', N'lpru1@mm.com', N'lpruebauno', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (9, 1, 1, N'Lele', N'Rere', N'27556464', N'20344003646', N'lele@rere.com', N'lrere', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (15, 1, 1, N'Mariana', N'Lopez', N'274556457', N'20344003646', N'mlopez@gmail.com', N'mlopez', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1, 1, 1, N'Pepe', N'Argi', N'34400364', N'20344003646', N'martinez.juan.marcos@gmail.com', N'pargi', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (29, 1, 1, N'pargidos', N'Argidos', N'50111929', N'20344003646', N'egenloys@gmail.com', N'pargidos', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (4, 1, 2, N'Pablo', N'Diez', N'27655233', N'20344003646', N'pdiez@gmail.com', N'pdiez', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (23, 1, 1, N'pepe', N'pepe', N'25666466', N'20344003646', N'pepe@gmai.com', N'pepe', N'/3oxe091Pc5eoV7/G/lyS+WWSFE=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (21, 1, 1, N'Pepe', N'Lola', N'22333111', N'20344003646', N'plola@gmail.com', N'plola', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (2, 1, 1, N'Pablo', N'Lopez', N'22111333', N'20344003646', N'pablo@mail.com', N'plopez', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (22, 1, 2, N'nomprua', N'apeprua', N'20333111', N'20344003646', N'prua@gmail.com', N'prua', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (10, 1, 2, N'Ramon', N'Perez', N'22111332', N'20344003646', N'rperez@gmail.com', N'rperez', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1035, 1, 1, N'tovd', N'tovd', N'31255646', N'20344003646', N'tovd@mm.com', N'tovd', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (28, 1, 1, N'uscuatro', N'pruebacuatro', N'20411111', N'20344003646', N'uscuatro@uscuatro.com', N'uspruebacuatro', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000AAFA00FF79FC AS DateTime), NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (27, 1, 1, N'ustres', N'pruebatres', N'22311111', N'20344003646', N'utres@utres.com', N'uspruebatres', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000AAFA00FF79FC AS DateTime), NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1029, 1, 1, N'vco', N'vco', N'22111223', N'20344003646', N'vco@mm.com', N'vco', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1032, 1, 2, N'vtcs', N'vtcs', N'52412645', N'20344003646', N'vtcs@mm.com', N'vtcs', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1033, 1, 2, N'vtcsd', N'vtcsd', N'41455899', N'20344003646', N'vtcsd@mm.com', N'vtcsd', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1030, 1, 2, N'vtcu', N'vtcu', N'22333455', N'20344003646', N'vtcu@mm.com', N'vtcu', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1031, 1, 2, N'vtcud', N'vtcud', N'22333456', N'20344003646', N'vtcud@mm.com', N'vtcud', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'administrador', 4, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'cocacola', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'gripa', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'hihi', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'jlele', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'jmartinez', 4, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'jpepe', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'jsere', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'julopez', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'klkl', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'largi', 3, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'lpruebados', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'lpruebauno', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'lrere', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'mlopez', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'pargi', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'pargidos', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'pdiez', 3, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'pepe', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'plola', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'prua', 3, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'rperez', 3, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'tovd', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'uspruebacuatro', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'uspruebatres', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'vco', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'vtcs', 3, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'vtcsd', 4, NULL)
SET IDENTITY_INSERT [dbo].[UsuarioTipo] ON 

INSERT [dbo].[UsuarioTipo] ([IdUsuarioTipo], [Descripcion], [FecBaja]) VALUES (1, N'Cliente', NULL)
INSERT [dbo].[UsuarioTipo] ([IdUsuarioTipo], [Descripcion], [FecBaja]) VALUES (2, N'Empleado', NULL)
SET IDENTITY_INSERT [dbo].[UsuarioTipo] OFF
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
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[Localidad] ([IdLocalidad])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Localidad]
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
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
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
ALTER TABLE [dbo].[RelFamFam]  WITH CHECK ADD  CONSTRAINT [FK_RelFamFam_Familia] FOREIGN KEY([IdFamiliaPadre])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[RelFamFam] CHECK CONSTRAINT [FK_RelFamFam_Familia]
GO
ALTER TABLE [dbo].[RelFamFam]  WITH CHECK ADD  CONSTRAINT [FK_RelFamFam_Familia1] FOREIGN KEY([IdFamiliaHijo])
REFERENCES [dbo].[Familia] ([IdFamilia])
GO
ALTER TABLE [dbo].[RelFamFam] CHECK CONSTRAINT [FK_RelFamFam_Familia1]
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
