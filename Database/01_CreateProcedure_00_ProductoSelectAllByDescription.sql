
CREATE PROCEDURE [dbo].[ProductoSelectAllByDescripcion]
(
	@CUIT VARCHAR(50),
	@Descripcion varchar(100)
)
AS
SET NOCOUNT ON
SELECT *
FROM Producto
WHERE [CUIT] = @CUIT AND DescripProducto LIKE '%'+ @Descripcion +'%'








