USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelect]    Script Date: 30/10/2016 20:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListaDeseosSelect]
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









