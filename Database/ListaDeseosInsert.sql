USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosInsert]    Script Date: 30/10/2016 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListaDeseosInsert]
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









