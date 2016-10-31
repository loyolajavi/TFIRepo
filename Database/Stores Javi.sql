-- *************************************************************************************************
--************SP Para Mostrar Los productos mas vendidos de una empresa**************************
-- *************************************************************************************************

USE [Ecommerce]
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



	USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectAllByCUIT]    Script Date: 30/10/2016 1:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ProductoSelectAllByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

SELECT *
FROM [Producto]
WHERE [CUIT] = @CUIT