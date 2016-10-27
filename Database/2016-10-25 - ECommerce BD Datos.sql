USE [ECommerce]
GO
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'123456', N'Empresa2', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20112223331', N'Genloys', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'654321', N'Empresa3', NULL)
SET IDENTITY_INSERT [dbo].[IvaProducto] ON 

INSERT [dbo].[IvaProducto] ([IdIvaProducto], [PorcentajeIvaProd], [FecBaja]) VALUES (1, 21, NULL)
INSERT [dbo].[IvaProducto] ([IdIvaProducto], [PorcentajeIvaProd], [FecBaja]) VALUES (2, 105, NULL)
SET IDENTITY_INSERT [dbo].[IvaProducto] OFF
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (1, N'GENLOYS', NULL)
SET IDENTITY_INSERT [dbo].[Marca] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja]) VALUES (2, N'GE8000MM
', CAST(22725 AS Decimal(18, 0)), 1, N'20112223331', 2, N'Grupo Nafta 8000 Monofasico', N'GE8000.png', NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja]) VALUES (3, N'GE10000ME', CAST(70652 AS Decimal(18, 0)), 1, N'20112223331', 2, N'Grupo Nafta 10 Kva - Monofásico – Arranque Eléctrico', N'GE10000ME.png', NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja]) VALUES (4, N'GE12000ME
', CAST(75212 AS Decimal(18, 0)), 1, N'20112223331', 2, N'Grupo Nafta 12 Kva - Monofásico – Arranque Eléctrico
', N'GE12000ME
.png', NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja]) VALUES (5, N'1234', CAST(22 AS Decimal(18, 0)), 1, N'123456', 1, N'Cereal Mix', N'1234.jpg', NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja]) VALUES (7, N'1122', CAST(57 AS Decimal(18, 0)), 1, N'123456', 1, N'Alfajor Cachafaz Dulce de Leche', N'alfajor-de-dulce-de-leche.jpg', NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja]) VALUES (12, N'GE15000ME
', CAST(85324 AS Decimal(18, 0)), 1, N'20112223331', 2, N'Grupo Nafta 15 Kva - Monofásico – Arranque Eléctrico
', N'GE15000ME.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Producto] OFF
