USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]    Script Date: 30/10/2016 18:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListaDeseosSelectAllByCUIT_NombreUsuario]
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









