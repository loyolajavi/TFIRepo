USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ProductoSelect]    Script Date: 31/10/2016 2:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ProductoSelect]
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









