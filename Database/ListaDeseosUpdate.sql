USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosUPDATE]    Script Date: 30/10/2016 21:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListaDeseosUPDATE]
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








