USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDelete]    Script Date: 30/10/2016 21:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListaDeseosDelete]
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









