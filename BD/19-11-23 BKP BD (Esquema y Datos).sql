USE [master]
GO
/****** Object:  Database [Ecommerce]    Script Date: 23/11/2019 2:38:18 ******/
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
/****** Object:  Login [tecnologia]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [tecnologia] WITH PASSWORD=N'7¨¦)z¥Xüíõ1BéÞ;=GM®£¥CrDµ2', DEFAULT_DATABASE=[Artec], DEFAULT_LANGUAGE=[Español], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [tecnologia] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [Javi-PC\Javi]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [Javi-PC\Javi] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [BUILTIN\Usuarios]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [BUILTIN\Usuarios] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'ì¢êP|î¤äÕç¦þ¾´õc9õã¬¬~ÐEs', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 23/11/2019 2:38:18 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'l7>Á+~Û,+µ°VíÁuWzIü7ì@UÖË6¬', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogSelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[BitacoraLogUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaDeleteAllByIdCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriASelectAllByIdCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoriaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDeleteAllByIdTipoComprobante]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteDetalleUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteInsertSeleccionar]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteNDInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByCUIT_NroComprobante]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteSelectAllByIdTipoComprobante]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ComprobanteUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[CondicionFiscalUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ConfigMailHostTraer]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorDeleteAllByIdEmpresa]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorSelectAllByIdEmpresa]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ControladorUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DescontarStockSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIdProvincia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioSelectAllByIdDireccion]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUsuarioUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPagoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPagoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPagoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPagoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPagoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[EstadoPedidoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaSelectNombreFamiliaByIdUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliasSelectByCUITandNombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaEntregaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[FormaPagoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[Grafico5productosmasvendidos]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoComparacionVentasPeriodo]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoMontoVentas]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoProductosPorCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[GraficoVentasPeriodo]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[IvaProductoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlDeleteAllByIdLenguaje]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlSelectAllByIdLenguaje]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeControlUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[LenguajeUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaDeseosUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MarcaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarMailConfig]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaDeleteAllByIdMoneda]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresASelectAllByIdMoneda]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaEmpresaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[MonedaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdFormaPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByIdTarjeta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDeleteAllByIdEstadoPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoDeleteAllByIdPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAllByIdEstadoPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoSelectAllByIdPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoEstadoPagoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdFormaPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByIdTarjeta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PagoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaDeleteAllByIdPatente]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAllByIdFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliASelectAllByIdPatente]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteFamiliaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatenteSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PatentesSelectByFamilia]    Script Date: 23/11/2019 2:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PatentesSelectByFamilia]
@IdFamilia int
as
select patente.IdPatente,patente.NombrePatente from patente inner join PatenteFamilia on patente.IdPatente = PatenteFamilia.IdPatente where PatenteFamilia.IdFamilia = @IdFamilia

GO
/****** Object:  StoredProcedure [dbo].[PatenteUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoActualizarNroTracking]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleDeleteAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleSelectAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoDetalleUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdEstadoPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoDeleteAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoInsertFin]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdEstadoPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoSelectAllByIdPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoEstadoPedidoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByDireccionEntrega]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectAllByIdFormaEntrega]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectByCUIT_IDPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectByCUIT_NroPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoSelectMAXNroPedidoByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoTraerEstadoActual]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoUltimoEstadoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[PedidoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaDeleteAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAllByIdCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriASelectAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProdCategoriaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdIvaProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdMarca]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoDeleteAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdIvaProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdMarca]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectByCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectByDescripProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectByIdProductoCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoSelectMasVendidosByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[rankingEmpresas]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[RecursoUpdate]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ReportePedidosDeUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[ReportePedidosPorFechayEstado]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalDeleteAllByIdSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalSelectAllByIdSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[StockSucursalUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalDeleteAllByDireccionSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalSelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalTraerPorDireccionSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[SucursalUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaDeleteAllByIdTipoTarjeta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetASelectAllByIdTipoTarjeta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaSelectByNumero]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaSetearPredeterminada]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TarjetaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIdTipoTel]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIdTipoTel]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoUpdateDatosPersonales]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoComprobanteUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoDireccionUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTarjetaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TipoTelUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TraerDireccionPorIdSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[TraerSucursalesConStock]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdCondicionFiscal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteAllByIdUsuarioTipo]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteSeleccionadosByIdUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaDeleteAllByIdFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliASelectAllByIdFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioFamiliaUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteDeleteAllByIdPatente]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByCUIT_NombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteSelectAllByIdPatente]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioPatenteUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByCUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdCondicionFiscal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectAllByIdUsuarioTipo_CUIT]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectByIdUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioSelectByNombreUsuarioClave]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoDelete]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoInsert]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelect]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoSelectAll]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioTipoUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUPDATE]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateClave]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateDatosPersonales]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateDatosPersonalesConDNI]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdateNombreUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdatePermisosFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[BitacoraLog]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Comprobante]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[ComprobanteDetalle]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[CondicionFiscal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[ConfigMailHost]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[DireccionUsuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Empresa]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Encuesta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Encuesta_Usuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[EstadoPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[EstadoPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Familia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[FormaEntrega]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[FormaPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[IvaProducto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Lenguaje]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[LenguajeControl]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[LenguajeControl_Empresa]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[ListaDeseos]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Moneda]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[MonedaEmpresa]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Pago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[PagoEstadoPago]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Patente]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[PatenteFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Pedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[PedidoEstadoPedido]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[ProdCategoria]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Recurso]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Respuesta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[StockSucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Telefono]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[TipoDireccion]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[TipoTarjeta]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[TipoTel]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[UsuarioFamilia]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[UsuarioPatente]    Script Date: 23/11/2019 2:38:19 ******/
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
/****** Object:  Table [dbo].[UsuarioTipo]    Script Date: 23/11/2019 2:38:19 ******/
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

INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (141, 4, N'20344003646', 2, 1012, CAST(0x0000A70F0163BCD5 AS DateTime), 1030, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (141, 4, N'20344003646', 7, 2024, CAST(0x0000AAF800CD8E94 AS DateTime), 1030, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (142, 4, N'20344003646', 2, 1013, CAST(0x0000A70F016404DA AS DateTime), 1031, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (143, 4, N'20344003646', 2, 1014, CAST(0x0000A718015D936E AS DateTime), 1034, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (144, 4, N'20344003646', 2, 1015, CAST(0x0000A718017DF5F7 AS DateTime), 1035, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (145, 4, N'20344003646', 2, 1016, CAST(0x0000A71A011A047B AS DateTime), 1039, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (145, 4, N'20344003646', 7, 2031, CAST(0x0000AAF901587E52 AS DateTime), 1039, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (146, 4, N'20344003646', 2, 1017, CAST(0x0000A7310009ECB5 AS DateTime), 1042, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (147, 4, N'20344003646', 2, 1018, CAST(0x0000A731000AEC46 AS DateTime), 1043, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (147, 4, N'20344003646', 7, 1021, CAST(0x0000AAE70167497B AS DateTime), 1043, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (147, 4, N'20344003646', 9, 2033, CAST(0x0000AAF90158C17E AS DateTime), 1043, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (148, 4, N'20344003646', 2, 1019, CAST(0x0000A732013B26FF AS DateTime), 1044, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (149, 4, N'20344003646', 2, 1020, CAST(0x0000AAB1016ADD3C AS DateTime), 1047, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (150, 4, N'20344003646', 2, 1022, CAST(0x0000AAF501736102 AS DateTime), 2051, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (151, 4, N'20344003646', 2, 1023, CAST(0x0000AAF5017458E4 AS DateTime), 2053, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (152, 4, N'20344003646', 2, 1024, CAST(0x0000AAF501851877 AS DateTime), 2054, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (152, 4, N'20344003646', 7, 2029, CAST(0x0000AAF90004FDB9 AS DateTime), 2054, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (152, 4, N'20344003646', 9, 2032, CAST(0x0000AAF901589E7F AS DateTime), 2054, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (153, 4, N'20344003646', 2, 2025, CAST(0x0000AAF800EFF429 AS DateTime), 3054, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (153, 4, N'20344003646', 7, 2028, CAST(0x0000AAF90003FBDE AS DateTime), 3054, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (154, 4, N'20344003646', 2, 2026, CAST(0x0000AAF800FEB9AE AS DateTime), 3055, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (154, 4, N'20344003646', 7, 2027, CAST(0x0000AAF90002FF9F AS DateTime), 3055, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (155, 4, N'20344003646', 2, 2030, CAST(0x0000AAF9015261F3 AS DateTime), 3059, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (156, 4, N'20344003646', 2, 2034, CAST(0x0000AB05013FA09F AS DateTime), 4089, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (157, 4, N'20344003646', 2, 2035, CAST(0x0000AB050141EB35 AS DateTime), 4090, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (158, 4, N'20344003646', 2, 2036, CAST(0x0000AB050143F95B AS DateTime), 4091, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (159, 4, N'20344003646', 2, 2037, CAST(0x0000AB0501446FDE AS DateTime), 4092, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (160, 4, N'20344003646', 2, 2038, CAST(0x0000AB050144CE37 AS DateTime), 4093, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (161, 5, N'20344003646', 2, 2039, CAST(0x0000AB07014FFA5F AS DateTime), 4097, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (162, 5, N'20344003646', 2, 2040, CAST(0x0000AB07015EB8CA AS DateTime), 4098, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (163, 6, N'20344003646', 2, 2041, CAST(0x0000AB070164E750 AS DateTime), 4099, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (164, 6, N'20344003646', 2, 2042, CAST(0x0000AB070165AA2B AS DateTime), 4100, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (165, 6, N'20344003646', 2, 2043, CAST(0x0000AB070166285B AS DateTime), 4101, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (166, 6, N'20344003646', 2, 2044, CAST(0x0000AB0701678ADD AS DateTime), 4102, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (167, 6, N'20344003646', 2, 2045, CAST(0x0000AB07016B1759 AS DateTime), 4103, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (168, 4, N'20344003646', 2, 2046, CAST(0x0000AB07016C8031 AS DateTime), 4104, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (169, 4, N'20344003646', 2, 2047, CAST(0x0000AB07016E38D4 AS DateTime), 4105, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (170, 4, N'20344003646', 2, 2048, CAST(0x0000AB0800C91E35 AS DateTime), 4106, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (171, 6, N'20344003646', 2, 2049, CAST(0x0000AB0800CB4721 AS DateTime), 4107, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (172, 4, N'20344003646', 2, 2050, CAST(0x0000AB0800CEEA00 AS DateTime), 4108, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (173, 5, N'20344003646', 2, 2051, CAST(0x0000AB0800CF7E57 AS DateTime), 4110, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (174, 6, N'20344003646', 2, 2052, CAST(0x0000AB0800D53EA4 AS DateTime), 4111, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (175, 4, N'20344003646', 2, 2053, CAST(0x0000AB0800D950E6 AS DateTime), 4115, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (176, 4, N'20344003646', 2, 2054, CAST(0x0000AB0800DC1AA7 AS DateTime), 4116, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (177, 4, N'20344003646', 2, 2055, CAST(0x0000AB0800E1BA21 AS DateTime), 4118, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (178, 4, N'20344003646', 2, 2056, CAST(0x0000AB0800E279E1 AS DateTime), 4119, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (179, 5, N'20344003646', 2, 2057, CAST(0x0000AB0800E2D972 AS DateTime), 4120, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (180, 5, N'20344003646', 2, 2058, CAST(0x0000AB0800E49184 AS DateTime), 4121, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (181, 5, N'20344003646', 2, 2059, CAST(0x0000AB0800E4B570 AS DateTime), 4122, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (182, 5, N'20344003646', 2, 2060, CAST(0x0000AB0800E52218 AS DateTime), 4123, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (183, 5, N'20344003646', 2, 2061, CAST(0x0000AB0800E8C1DC AS DateTime), 4124, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (184, 5, N'20344003646', 2, 2062, CAST(0x0000AB0800EE4AED AS DateTime), 4125, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (185, 6, N'20344003646', 2, 2063, CAST(0x0000AB0800EEA22A AS DateTime), 4126, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (186, 7, N'20344003646', 2, 2064, CAST(0x0000AB080130F177 AS DateTime), 4127, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (187, 8, N'20344003646', 2, 2065, CAST(0x0000AB0801311A78 AS DateTime), 4128, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (188, 8, N'20344003646', 2, 2066, CAST(0x0000AB09001141B1 AS DateTime), 4131, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (189, 8, N'20344003646', 2, 2067, CAST(0x0000AB090141480F AS DateTime), 4132, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (190, 8, N'20344003646', 2, 2071, CAST(0x0000AB0A0027B278 AS DateTime), 4136, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (191, 6, N'20344003646', 2, 2072, CAST(0x0000AB0A0028AEAA AS DateTime), 4137, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (192, 8, N'20344003646', 2, 2073, CAST(0x0000AB0A00290F62 AS DateTime), 4138, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (193, 5, N'20344003646', 2, 2074, CAST(0x0000AB0A00298A54 AS DateTime), 4139, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (194, 7, N'20344003646', 2, 2081, CAST(0x0000AB0A002ACF14 AS DateTime), 4140, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (195, 7, N'20344003646', 2, 2082, CAST(0x0000AB0A003B9926 AS DateTime), 4141, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (196, 8, N'20344003646', 2, 2083, CAST(0x0000AB0A003D69A1 AS DateTime), 4142, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (197, 6, N'20344003646', 2, 2084, CAST(0x0000AB0A010335AB AS DateTime), 4144, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (198, 5, N'20344003646', 2, 2085, CAST(0x0000AB0A010373F5 AS DateTime), 4143, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (199, 6, N'20344003646', 2, 2088, CAST(0x0000AB0A01047FDB AS DateTime), 4145, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (200, 7, N'20344003646', 2, 2090, CAST(0x0000AB0A01140BCD AS DateTime), 4146, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (201, 8, N'20344003646', 2, 2091, CAST(0x0000AB0B00CC4096 AS DateTime), 4147, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (202, 7, N'20344003646', 2, 2092, CAST(0x0000AB0B00DA39A5 AS DateTime), 4148, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (203, 7, N'20344003646', 2, 2093, CAST(0x0000AB0B010647C5 AS DateTime), 4149, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (204, 7, N'20344003646', 2, 3091, CAST(0x0000AB0B012FA5E4 AS DateTime), 5147, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (205, 4, N'20344003646', 2, 3092, CAST(0x0000AB0C00E9F50F AS DateTime), 5149, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (206, 5, N'20344003646', 2, 3093, CAST(0x0000AB0C0105C350 AS DateTime), 5163, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (207, 4, N'20344003646', 2, 3094, CAST(0x0000AB0C016DAE52 AS DateTime), 5168, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (208, 4, N'20344003646', 2, 3095, CAST(0x0000AB0C016E3563 AS DateTime), 5169, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (209, 5, N'20344003646', 2, 3096, CAST(0x0000AB0C016E5762 AS DateTime), 5166, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (210, 5, N'20344003646', 2, 3097, CAST(0x0000AB0D0111781B AS DateTime), 5171, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (211, 5, N'20344003646', 2, 3098, CAST(0x0000AB0E000BFDD3 AS DateTime), 5167, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (212, 4, N'20344003646', 2, 3099, CAST(0x0000AB0E000DD19B AS DateTime), 5162, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (213, 5, N'20344003646', 2, 3100, CAST(0x0000AB0E000DDA73 AS DateTime), 5164, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (214, 5, N'20344003646', 2, 3101, CAST(0x0000AB0E000DE130 AS DateTime), 5165, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (215, 4, N'20344003646', 2, 3102, CAST(0x0000AB0E0012A935 AS DateTime), 5175, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (216, 5, N'20344003646', 2, 3103, CAST(0x0000AB0E0012CE8C AS DateTime), 5177, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (217, 4, N'20344003646', 2, 3104, CAST(0x0000AB0E00139122 AS DateTime), 5178, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (218, 4, N'20344003646', 2, 3105, CAST(0x0000AB0E0013CD6D AS DateTime), 5179, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (219, 6, N'20344003646', 2, 3106, CAST(0x0000AB0E0013DE41 AS DateTime), 5180, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (220, 6, N'20344003646', 2, 3107, CAST(0x0000AB0E0014138A AS DateTime), 5181, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (221, 6, N'20344003646', 2, 3108, CAST(0x0000AB0E00143FB4 AS DateTime), 5182, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (222, 5, N'20344003646', 2, 3109, CAST(0x0000AB0E00147663 AS DateTime), 5183, NULL, NULL)
INSERT [dbo].[Comprobante] ([NroComprobante], [IdSucursal], [CUIT], [IdTipoComprobante], [IdComprobante], [FechaComprobante], [IdPedido], [FecBaja], [Ajuste]) VALUES (223, 6, N'20344003646', 2, 3110, CAST(0x0000AB0E0029071A AS DateTime), 5192, NULL, NULL)
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
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (1, 223, 6, 2, N'20344003646', 2, 1, CAST(22725 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ComprobanteDetalle] ([IdComprobanteDetalle], [NroComprobante], [IdSucursal], [IdTipoComprobante], [CUIT], [IdProducto], [CantidadProducto], [PrecioUnitarioFact], [FecBaja]) VALUES (2, 155, 4, 2, N'20344003646', 4, 1, CAST(75212 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[CondicionFiscal] ON 

INSERT [dbo].[CondicionFiscal] ([IdCondicionFiscal], [Descripcion], [FecBaja]) VALUES (1, N'Consumidor Final', NULL)
INSERT [dbo].[CondicionFiscal] ([IdCondicionFiscal], [Descripcion], [FecBaja]) VALUES (2, N'Responsable Inscripto', NULL)
SET IDENTITY_INSERT [dbo].[CondicionFiscal] OFF
INSERT [dbo].[ConfigMailHost] ([Puerto], [Host], [Ssl], [Remitente], [Remps]) VALUES (587, N'smtp.gmail.com', 1, N'egenloys@gmail.com', N'AiygV/ZGapaFigH86qpbsw==')
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1, N'La calle', 23, NULL, N'', N'Merlo', 1, 1, CAST(0x0000A6B300E25DBB AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (2, N'Calle1', 12, 1, N'a', N'Ituzaingo', 1, 1, CAST(0x0000A6B300F84398 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (3, N'Calle3', 12, 1, N'1', N'Ituzaingo', 1, 1, CAST(0x0000A6B300F8AF56 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (4, N'Calle4', 1, NULL, N'1', N'Itu', 1, 1, CAST(0x0000A6B501595277 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (5, N'123', 123, 123, N'123', N'123', 1, 1, CAST(0x0000A6B501594BBF AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (6, N'33', 11, NULL, N'33', N'33', 1, 1, CAST(0x0000A6B5015938B0 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (7, N'55', 55, 55, N'55', N'55', 1, 1, CAST(0x0000A6B30167538E AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (8, N'4', 4, 4, N'4', N'4', 1, 1, CAST(0x0000A6B5015945A2 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (9, N'33', 22, 11, N'11', N'11', 1, 1, CAST(0x0000A6B30175162D AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (10, N'11', 11, 11, N'11', N'11', 1, 1, CAST(0x0000A6B501592B68 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (11, N'11', 19, 22, N'11', N'11', 1, 1, CAST(0x0000A6B5015928B2 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (12, N'11', 11, 11, N'11', N'11', 1, 1, CAST(0x0000A6B501592D60 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (13, N'11', 11, 11, N'11', N'11', 1, 1, CAST(0x0000A6B501593040 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (14, N'88', 88, 88, N'88', N'88', 7, 1, CAST(0x0000A6B5015933E1 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (15, N'33', 333, 33, N'33', N'33', 1, 1, CAST(0x0000A6B501593214 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (16, N'11', 11, NULL, N'11', N'11', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (17, N'56', 56, 56, N'56', N'56', 4, 1, CAST(0x0000A6B50159356E AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (18, N'12', 12, 12, N'12', N'12', 19, 1, CAST(0x0000A6B5015936CB AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (19, N'11', 11, 22, N'22', N'22', 5, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (20, N'12', 12, 12, N'12', N'12', 3, 1, CAST(0x0000AAF701679236 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (21, N'12', 12, 12, N'12', N'12', 3, 1, CAST(0x0000A6B501593A7F AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (22, N'13', 13, 13, N'13', N'13', 1, 1, CAST(0x0000A6B501593D10 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (23, N'13', 13, 13, N'13', N'13', 1, 1, CAST(0x0000A6B501594814 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (24, N'53', 53, 53, N'53', N'53', 1, 1, CAST(0x0000A6B501593F0F AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (25, N'53', 53, 53, N'53', N'53', 1, 1, CAST(0x0000A6B501594106 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (26, N'77', 77, 77, N'77', N'77', 17, 1, CAST(0x0000A6B5015942D5 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (27, N'46', 46, 46, N'46', N'46', 1, 1, CAST(0x0000A6B5015949E2 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (28, N'88', 88, 888, N'88', N'88', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (29, N'4', 4, 4, N'4', N'4', 4, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (30, N'1', 1, 1, N'1', N'1', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (31, N'2', 2, 2, N'2', N'2', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (32, N'88', 88, 88, N'88', N'88', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (33, N'14', 15, NULL, N'15', N'15', 1, 2, CAST(0x0000AB0D00E1E315 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (34, N'32', 32, NULL, N'32', N'32', 1, 2, CAST(0x0000AB0D00E50635 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (35, N'29', 29, 29, N'29', N'29', 9, 2, CAST(0x0000A6B501594D70 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (36, N'555', 55, 2, N'55', N'55', 1, 2, CAST(0x0000A6B501594F59 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (37, N'46', 46, NULL, N'46', N'46', 7, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (38, N'11', 11, 11, N'11', N'11', 4, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (39, N'23', 23, 12, N'23', N'12', 1, 2, CAST(0x0000A6B5015957EC AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1037, N'Avenida1', 1, 1, N'1', N'1', 2, 1, CAST(0x0000A6BB002697EB AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1038, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1039, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1040, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1041, N'prueba', 1, 1, N'a', N'itu', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1042, N'hola', 1, 1, N'1', N'Itu', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1043, N'montefinal', 123, 1, N'A', N'Merlo', 17, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1044, N'montefinal', 123, 1, N'A', N'Merlo', 17, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1045, N'Calle1', 12, NULL, NULL, N'Castelar', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1046, N'Calle1', 12, NULL, NULL, N'Castelar', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1047, N'Calle3', 1445, NULL, NULL, N'Castelar', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1048, N'Calle3', 1445, NULL, NULL, N'Castelar', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1049, N'asdf', 12, 3, N'a', N'as', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1050, N'asdf', 12, 3, N'a', N'as', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1051, N'ss', 12, 0, NULL, N'itu', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1052, N'ss', 12, 0, NULL, N'itu', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1053, N'Prueba', 334, 0, NULL, N'Castelar', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1054, N'Pruebados', 111, 0, NULL, N'Castelar', 1, 1, CAST(0x0000AAF701679C5B AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1055, N'Sufragio', 123, 0, NULL, N'Castelar', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1056, N'Sufragio', 123, 0, NULL, N'Castelar', 1, 2, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (2055, N'Calle1', 234, 0, NULL, N'Castelar', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (2056, N'Acalle', 333, 0, NULL, N'Castelar', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (2057, N'ACalle', 333, 0, NULL, N'Castelar', 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1, N'20344003646', N'pargi', CAST(0x0000A6B300E25DBE AS DateTime), 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2, N'20344003646', N'pargi', CAST(0x0000A6B300F8439B AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (3, N'20344003646', N'pargi', CAST(0x0000A6B300F8AF58 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (4, N'20344003646', N'pargi', CAST(0x0000A6B501595278 AS DateTime), 1)
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
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (16, N'20344003646', N'pargi', NULL, 1)
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
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (33, N'20344003646', N'pargi', CAST(0x0000AB0D00E1E316 AS DateTime), 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (34, N'20344003646', N'pargi', CAST(0x0000AB0D00E50635 AS DateTime), 1)
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
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1053, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1054, N'20344003646', N'pargi', CAST(0x0000AAF701679C5B AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1055, N'20344003646', N'pargidos', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1056, N'20344003646', N'pargidos', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2055, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2056, N'20344003646', N'plopez', NULL, 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2057, N'20344003646', N'plopez', NULL, 1)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'123456', N'Empresa2', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20112223331', N'EmrpesaX', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20289082981', N'LIDOSA', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20326734390', N'MotoGraphics', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20344003646', N'Genloys', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20344364029', N'Scutural Suplementeos', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20377540582', N'Genezi Music', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'654321', N'Empresa3', NULL)
SET IDENTITY_INSERT [dbo].[Encuesta] ON 

INSERT [dbo].[Encuesta] ([IdEncuesta], [NombreEncuesta], [FechaCreacion]) VALUES (1, N'Primer Encuesta', CAST(0x0000A6AC00000000 AS DateTime))
INSERT [dbo].[Encuesta] ([IdEncuesta], [NombreEncuesta], [FechaCreacion]) VALUES (2, N'Segunda Encuesta', CAST(0x0000A6AC00000000 AS DateTime))
INSERT [dbo].[Encuesta] ([IdEncuesta], [NombreEncuesta], [FechaCreacion]) VALUES (4, N'Encuesta LIDOSA', CAST(0x0000A6AC00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Encuesta] OFF
SET IDENTITY_INSERT [dbo].[EstadoPago] ON 

INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (1, N'Pendiente', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (2, N'Aprobado', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (3, N'Rechazado', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (4, N'Suspendido', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (5, N'Cancelado', NULL)
SET IDENTITY_INSERT [dbo].[EstadoPago] OFF
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

INSERT [dbo].[FormaPago] ([IdFormaPago], [DescripFormaPago], [FecBaja]) VALUES (1, N'Tarjeta', NULL)
INSERT [dbo].[FormaPago] ([IdFormaPago], [DescripFormaPago], [FecBaja]) VALUES (2, N'Efectivo', NULL)
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
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 75)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 3, CAST(0x67400B00 AS Date), 81)
GO
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
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 3)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 5)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 9)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 11)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 12)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 16)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 17)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 21)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 22)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 26)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 27)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 29)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 31)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 33)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 38)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 39)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 41)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 44)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 47)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 50)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 52)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 55)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 56)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 57)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 60)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 63)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 65)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 68)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 73)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 76)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 80)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 83)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 86)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 88)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 90)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 92)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 95)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 96)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 98)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 101)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 105)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 106)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 110)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 112)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 114)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 116)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 117)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 120)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 122)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 124)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 125)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 128)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 130)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 132)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 134)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 135)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 138)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 140)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 143)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 145)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 147)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 149)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 154)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 157)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 159)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 161)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 163)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 165)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 167)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 169)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 171)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 173)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 176)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 178)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 180)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 182)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 184)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 187)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 189)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 192)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 194)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 196)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 198)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 200)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 202)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 204)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 206)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 209)
GO
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 211)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 212)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 223)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1225)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1227)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1230)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1231)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1234)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1235)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1236)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, CAST(0x68400B00 AS Date), 1243)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 4, NULL, 1244)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 4)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 6)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 10)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 13)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 18)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 20)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 24)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 25)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 28)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 30)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 32)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 34)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 40)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 42)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 45)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 51)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 54)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 58)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 61)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 71)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 78)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 87)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 89)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 91)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 93)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 97)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 1228)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 1238)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 12, CAST(0x67400B00 AS Date), 1239)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 34, CAST(0x67400B00 AS Date), 1240)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pargi', 34, NULL, 1245)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pdiez', 2, NULL, 215)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pdiez', 3, NULL, 214)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pdiez', 4, NULL, 216)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja], [IdDeseo]) VALUES (N'20344003646', N'pepe', 3, NULL, 217)
SET IDENTITY_INSERT [dbo].[ListaDeseos] OFF
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
INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (5179, CAST(0x0000AB0E0013C383 AS DateTime), NULL, N'pargi', 1, N'20344003646', NULL, 1, NULL, 196)
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
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5180, 1, CAST(0x0000AB0E0013D9F2 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5180, 2, CAST(0x0000AB0E0013DE41 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5181, 1, CAST(0x0000AB0E00140F5B AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5181, 2, CAST(0x0000AB0E0014138A AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5182, 1, CAST(0x0000AB0E0014225C AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5182, 2, CAST(0x0000AB0E00143FB5 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5183, 1, CAST(0x0000AB0E001458B7 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5183, 2, CAST(0x0000AB0E00147666 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5184, 1, CAST(0x0000AB0E00148A09 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5185, 1, CAST(0x0000AB0E0014AB86 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5186, 1, CAST(0x0000AB0E00153B75 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5187, 1, CAST(0x0000AB0E0016EA47 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5188, 1, CAST(0x0000AB0E001E4D43 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5189, 1, CAST(0x0000AB0E001F0691 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5190, 1, CAST(0x0000AB0E002545D0 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5191, 1, CAST(0x0000AB0E00268636 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5192, 1, CAST(0x0000AB0E00290316 AS DateTime), NULL)
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (5192, 2, CAST(0x0000AB0E0029071E AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IdPregunta], [TextoPregunta], [FechaCreacion], [IdEncuesta]) VALUES (1, N'Cuan satisfecho esta en general con la compra', CAST(0x0000A6AC00000000 AS DateTime), 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [TextoPregunta], [FechaCreacion], [IdEncuesta]) VALUES (2, N'Cuan facil le fue comprar', CAST(0x0000A6AC00000000 AS DateTime), 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [TextoPregunta], [FechaCreacion], [IdEncuesta]) VALUES (3, N'Cree que debamos morar', CAST(0x0000A6AC00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
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
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (2, N'Catamarca', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (3, N'Chaco', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (4, N'Chubut', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (5, N'Cordoba', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (6, N'Corrientes', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (7, N'Entre Rios', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (8, N'Formosa', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (9, N'Jujuy', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (10, N'La Pampa', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (11, N'La Rioja', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (12, N'Mendoza', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (13, N'Misiones', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (14, N'Neuquen', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (15, N'Rio Negro', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (16, N'Salta', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (17, N'San Juan', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (18, N'San Luis', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (19, N'Santa Cruz', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (20, N'Santa Fe', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (21, N'Santiago Del Estero', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (22, N'Tierra Del Fuego', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (23, N'Tucuman', NULL)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
INSERT [dbo].[Recurso] ([CUIT], [Recurso], [Url], [Activo]) VALUES (N'20344003646', N'Carrousel1', N'Recurso1.jpg', 1)
INSERT [dbo].[Recurso] ([CUIT], [Recurso], [Url], [Activo]) VALUES (N'20344003646', N'Carrousel2', N'Recurso2.jpg', 1)
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 4, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 5, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 6, 3, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 7, 10, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (2, 8, 9, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 4, 9, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 5, 7, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 6, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 7, 9, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (3, 8, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 4, 0, NULL, N'20344003646')
INSERT [dbo].[StockSucursal] ([IdProducto], [IdSucursal], [CantidadProducto], [FecBaja], [CUIT]) VALUES (4, 5, 7, NULL, N'20344003646')
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
INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdTipoTarjeta], [CUIT], [NombreUsuario], [Titular], [Vencimiento], [Numero], [CodSeguridad], [FecBaja], [Predeterminada]) VALUES (2, 1, N'20344003646', N'julopez', N'Julio Lopez', CAST(0x0000B38800000000 AS DateTime), 4170068810108020, 123, NULL, 1)
INSERT [dbo].[Tarjeta] ([IdTarjeta], [IdTipoTarjeta], [CUIT], [NombreUsuario], [Titular], [Vencimiento], [Numero], [CodSeguridad], [FecBaja], [Predeterminada]) VALUES (3, 1, N'20344003646', N'pargi', N'Juan Pepe', CAST(0x0000B4D600000000 AS DateTime), 4236690000941407, 222, NULL, 0)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
INSERT [dbo].[Telefono] ([CUIT], [NombreUsuario], [NroTelefono], [CodArea], [IdTipoTel], [FecBaja]) VALUES (N'20344003646', N'jmartinez', N'44443232', N'011', 1, NULL)
INSERT [dbo].[Telefono] ([CUIT], [NombreUsuario], [NroTelefono], [CodArea], [IdTipoTel], [FecBaja]) VALUES (N'20344003646', N'lpruebados', N'1555225522', N'011', 2, NULL)
SET IDENTITY_INSERT [dbo].[TipoComprobante] ON 

INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (1, N'Factura A', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (2, N'Factura B', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (3, N'Factura C', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (4, N'Factura M', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (5, N'Nota de Credito', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (6, N'Nota de Debito', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (7, N'Nota de Credito B', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (8, N'Nota de Credito C', NULL)
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
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (28, 1, 1, N'uscuatro', N'pruebacuatro', N'20411111', N'20344003646', N'uscuatro@uscuatro.com', N'uspruebacuatro', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000AAFA00FF79FC AS DateTime), NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (27, 1, 1, N'ustres', N'pruebatres', N'22311111', N'20344003646', N'utres@utres.com', N'uspruebatres', N'UKzsB3Va4zhiFw2f1gwqdObIcUk=', CAST(0x0000AAFA00FF79FC AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'uspruebacuatro', 2, NULL)
INSERT [dbo].[UsuarioFamilia] ([CUIT], [NombreUsuario], [IdFamilia], [FecBaja]) VALUES (N'20344003646', N'uspruebatres', 2, NULL)
SET IDENTITY_INSERT [dbo].[UsuarioTipo] ON 

INSERT [dbo].[UsuarioTipo] ([IdUsuarioTipo], [Descripcion], [FecBaja]) VALUES (1, N'Cliente', NULL)
INSERT [dbo].[UsuarioTipo] ([IdUsuarioTipo], [Descripcion], [FecBaja]) VALUES (2, N'Empleado', NULL)
SET IDENTITY_INSERT [dbo].[UsuarioTipo] OFF
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
