USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ProductoSelectMasVendidosByCUIT]    Script Date: 30/10/2016 0:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ProductoSelectMasVendidosByCUIT]
(
	@CUIT VARCHAR(50)
)

AS

SET NOCOUNT ON

--6 Productos mas vendidos
SELECT [IdProducto],
	[CodigoProducto],
	[PrecioUnitario],
	[IdMarca],
	[CUIT],
	[IdIvaProducto],
	[DescripProducto],
	[URL],
	[FecBaja],
	[DescripLarga]
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




	--********************************
	USE [Ecommerce]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeseosDetalleInsert]    Script Date: 30/10/2016 12:34:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ListaDeseosDetalleInsert]
(
	@IdListaDeseos INT,
	@IdProducto INT,
	@CUIT varchar(50),
	@FechaDeseoDetalle DATETIME
)

AS

SET NOCOUNT ON

INSERT INTo [ListaDeseosDetalle]
(
	[IdListaDeseos],
	[IdProducto],
	[CUIT]
	[FechaDeseoDetalle]
)
VALUES
(
	@IdListaDeseos,
	@IdProducto,
	@CUIT,
	@FechaDeseoDetalle
)

SELECT SCOPE_IDENTITY()




