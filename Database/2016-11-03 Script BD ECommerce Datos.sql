USE [Ecommerce]
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (1, N'GENLOYS', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (2, N'MotoFx', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (3, N'LIDOSA', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (10, N'Universal Music', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (11, N'Sony Music', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (12, N'Warner Bros Music', NULL)
INSERT [dbo].[Marca] ([IdMarca], [DescripcionMarca], [FecBaja]) VALUES (13, N'Pop Art Discos', NULL)
SET IDENTITY_INSERT [dbo].[Marca] OFF
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'123456', N'Empresa2', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20112223331', N'EmrpesaX', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20289082981', N'LIDOSA', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20326734390', N'MotoGraphics', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20344003646', N'Genloys', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20344364029', N'Scutural Suplementeos', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'20377540582', N'Genezi Music', NULL)
INSERT [dbo].[Empresa] ([CUIT], [NombreEmpresa], [FecBaja]) VALUES (N'654321', N'Empresa3', NULL)
SET IDENTITY_INSERT [dbo].[IvaProducto] ON 

INSERT [dbo].[IvaProducto] ([IdIvaProducto], [PorcentajeIvaProd], [FecBaja]) VALUES (1, CAST(21.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[IvaProducto] ([IdIvaProducto], [PorcentajeIvaProd], [FecBaja]) VALUES (2, CAST(10.50 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[IvaProducto] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (2, N'GE8000MM
', CAST(22725.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'Grupo Nafta 8000 Monofasico', N'GE8000.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (3, N'GE10000ME', CAST(70652.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'Grupo Nafta 10 Kva - Monofásico – Arranque Eléctrico', N'GE10000ME.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (4, N'GE12000ME
', CAST(75212.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'Grupo Nafta 12 Kva - Monofásico – Arranque Eléctrico
', N'GE12000ME
.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (5, N'1234', CAST(22.000 AS Decimal(18, 3)), 1, N'123456', 1, N'Cereal Mix', N'1234.jpg', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (7, N'1122', CAST(57.000 AS Decimal(18, 3)), 1, N'123456', 1, N'Alfajor Cachafaz Dulce de Leche', N'alfajor-de-dulce-de-leche.jpg', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (12, N'GE15000ME
', CAST(85324.000 AS Decimal(18, 3)), 1, N'20344003646', 2, N'Grupo Nafta 15 Kva - Monofásico – Arranque Eléctrico
', N'GE15000ME.jpg', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (13, N'IMP001', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 2', N'Imp001.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (14, N'IMP002', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 2', N'Imp002.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (15, N'IMP003', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 3', N'Imp003.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (16, N'IMP004', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 4', N'Imp004.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (17, N'IMP005', CAST(22725.000 AS Decimal(18, 3)), 2, N'20326734390', 2, N'Producto Importado 5', N'Imp005.png', NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (18, N'EMP01', CAST(2.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Empanada de carne', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (19, N'EMP02', CAST(2.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Empanada de jamon y queso', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (20, N'FAC01', CAST(3.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Medialuna de grasa', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (21, N'FAC02', CAST(4.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Tortita negra', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (22, N'MAT01', CAST(18.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Bolsa de harina de trigo 000', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (23, N'MAT02', CAST(21.000 AS Decimal(18, 3)), 3, N'20289082981', 1, N'Bolsa de harina de centeno', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (25, N'GMSM-0001', CAST(250.000 AS Decimal(18, 3)), 11, N'20377540582', 1, N'Rolling Stones: Flashpoint', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (26, N'GMSM-0002', CAST(250.000 AS Decimal(18, 3)), 11, N'20377540582', 1, N'Rolling Stones: Undercover', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (27, N'GMSM-0003', CAST(200.000 AS Decimal(18, 3)), 11, N'20377540582', 1, N'David Bowie: Lazarus ', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (28, N'GMWB-0001', CAST(250.000 AS Decimal(18, 3)), 12, N'20377540582', 1, N'Coldplay: Ghost Stories ', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (29, N'GMWB-0002', CAST(170.000 AS Decimal(18, 3)), 12, N'20377540582', 1, N'Cuarteto de nos: Habla tu espejo ', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (30, N'GMUM-0001', CAST(170.000 AS Decimal(18, 3)), 10, N'20377540582', 1, N'Bersuit Vergarabat: Libertinaje', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (31, N'GMUM-0002', CAST(280.000 AS Decimal(18, 3)), 10, N'20377540582', 1, N'Black Sabbath: 13', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (32, N'GMPM-0001', CAST(280.000 AS Decimal(18, 3)), 13, N'20377540582', 1, N'NTVG: El tiempo otra vez avanza', NULL, NULL, NULL)
INSERT [dbo].[Producto] ([IdProducto], [CodigoProducto], [PrecioUnitario], [IdMarca], [CUIT], [IdIvaProducto], [DescripProducto], [URL], [FecBaja], [DescripLarga]) VALUES (33, N'GMPM-0002', CAST(280.000 AS Decimal(18, 3)), 13, N'20377540582', 1, N'NTVG: El calor del pleno invierno', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Moneda] ON 

INSERT [dbo].[Moneda] ([IdMoneda], [Nombre], [SimboloMoneda], [FecBaja]) VALUES (1, N'Peso', N'$', NULL)
INSERT [dbo].[Moneda] ([IdMoneda], [Nombre], [SimboloMoneda], [FecBaja]) VALUES (2, N'Dolar', N'US$', NULL)
SET IDENTITY_INSERT [dbo].[Moneda] OFF
SET IDENTITY_INSERT [dbo].[UsuarioTipo] ON 

INSERT [dbo].[UsuarioTipo] ([IdUsuarioTipo], [Descripcion], [FecBaja]) VALUES (1, N'Empleado', NULL)
INSERT [dbo].[UsuarioTipo] ([IdUsuarioTipo], [Descripcion], [FecBaja]) VALUES (2, N'Cliente', NULL)
SET IDENTITY_INSERT [dbo].[UsuarioTipo] OFF
SET IDENTITY_INSERT [dbo].[CondicionFiscal] ON 

INSERT [dbo].[CondicionFiscal] ([IdCondicionFiscal], [Descripcion], [FecBaja]) VALUES (1, N'Consumidor Final', NULL)
INSERT [dbo].[CondicionFiscal] ([IdCondicionFiscal], [Descripcion], [FecBaja]) VALUES (2, N'Responsable Inscripto', NULL)
SET IDENTITY_INSERT [dbo].[CondicionFiscal] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [IdCondicionFiscal], [IdUsuarioTipo], [Nombre], [Apellido], [NroIdentificacion], [CUIT], [Email], [NombreUsuario], [Clave], [FecBaja], [URI]) VALUES (1, 1, 2, N'Pepe', N'Argi', N'34400364', N'20344003646', N'pargi@gmail.com', N'pargi', N'Descargas234', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[TipoDireccion] ON 

INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [DescripcionDireccion], [FecBaja]) VALUES (1, N'Facturacion', NULL)
INSERT [dbo].[TipoDireccion] ([IdTipoDireccion], [DescripcionDireccion], [FecBaja]) VALUES (2, N'Envio', NULL)
SET IDENTITY_INSERT [dbo].[TipoDireccion] OFF
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (1, N'Buenos Aires', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (2, N'Catamarca', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (3, N'Chaco', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (4, N'Chubut', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (5, N'Cordoba', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (6, N'Corrientes', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (7, N'Entre Rios', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (8, N'Formosa', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (9, N'Jujuy', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (10, N'La Pampa', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (11, N'La Rioja', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (12, N'Mendoza', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (13, N'Misiones', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (14, N'Neuquen', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (15, N'Rio Negro', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (16, N'Salta', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (17, N'San Juan', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (18, N'San Luis', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (19, N'Santa Cruz', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (20, N'Santa Fe', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (21, N'Santiago Del Estero', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (22, N'Tierra Del Fuego', NULL)
INSERT [dbo].[Provincia] ([IdProvincia], [DescripcionProvincia], [FecBaja]) VALUES (23, N'Tucuman', NULL)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (1, N'La calle', 23, NULL, N'', N'Merlo', 1, 1, CAST(0x0000A6B300E25DBB AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (2, N'Calle1', 12, 1, N'a', N'Ituzaingo', 1, 1, CAST(0x0000A6B300F84398 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (3, N'Calle3', 12, 1, N'1', N'Ituzaingo', 1, 1, CAST(0x0000A6B300F8AF56 AS DateTime))
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (4, N'Calle4', 1, 1, N'1', N'Itu', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (5, N'123', 123, 123, N'123', N'123', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (6, N'33', 33, 33, N'33', N'33', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (7, N'55', 55, 55, N'55', N'55', 1, 1, NULL)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [Piso], [Departamento], [Localidad], [IdProvincia], [IdTipoDireccion], [FecBaja]) VALUES (8, N'4', 4, 4, N'4', N'4', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
SET IDENTITY_INSERT [dbo].[FormaEntrega] ON 

INSERT [dbo].[FormaEntrega] ([IdFormaEntrega], [DescripcionFormaEntrega], [FecBaja]) VALUES (1, N'A domicilio', NULL)
INSERT [dbo].[FormaEntrega] ([IdFormaEntrega], [DescripcionFormaEntrega], [FecBaja]) VALUES (2, N'Retiro en Sucursal', NULL)
SET IDENTITY_INSERT [dbo].[FormaEntrega] OFF
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([IdPedido], [FechaPedido], [FechaFinPedido], [NombreUsuario], [PlazoEntrega], [IdFormaEntrega], [CUIT], [NumeroTracking], [DireccionEntrega], [FecBaja], [NroPedido]) VALUES (1, CAST(0x0000A6AE00000000 AS DateTime), NULL, N'pargi', 2, 1, N'20344003646', NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Pedido] OFF
INSERT [dbo].[TipoTarjeta] ([IdTipoTarjeta], [Descripcion], [FecBaja]) VALUES (1, N'Visa', NULL)
INSERT [dbo].[TipoTarjeta] ([IdTipoTarjeta], [Descripcion], [FecBaja]) VALUES (2, N'Master Card', NULL)
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [DescripSucursal], [DireccionSucursal], [CUIT], [FecBaja]) VALUES (1, N'Deposito', 1, N'20289082981', NULL)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[TipoComprobante] ON 

INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (1, N'Factura A', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (2, N'Factura B', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (3, N'Factura C', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (4, N'Factura M', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (5, N'Nota de Credito', NULL)
INSERT [dbo].[TipoComprobante] ([IdTipoComprobante], [DescripTipoComprobante], [FecBaja]) VALUES (6, N'Nota de Debito', NULL)
SET IDENTITY_INSERT [dbo].[TipoComprobante] OFF
SET IDENTITY_INSERT [dbo].[FormaPago] ON 

INSERT [dbo].[FormaPago] ([IdFormaPago], [DescripFormaPago], [FecBaja]) VALUES (1, N'Tarjeta', NULL)
INSERT [dbo].[FormaPago] ([IdFormaPago], [DescripFormaPago], [FecBaja]) VALUES (2, N'Efectivo', NULL)
SET IDENTITY_INSERT [dbo].[FormaPago] OFF
SET IDENTITY_INSERT [dbo].[EstadoPago] ON 

INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (1, N'Pendiente', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (2, N'Aprobado', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (3, N'Rechazado', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (4, N'Suspendido', NULL)
INSERT [dbo].[EstadoPago] ([IdEstadoPago], [DescripEstadoPago], [FecBaja]) VALUES (5, N'Cancelado', NULL)
SET IDENTITY_INSERT [dbo].[EstadoPago] OFF
SET IDENTITY_INSERT [dbo].[EstadoPedido] ON 

INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (1, N'Pendiente de pago', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (2, N'Cancelado', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (3, N'Aprobado', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (4, N'Autorizado', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (5, N'Rechazado', NULL)
INSERT [dbo].[EstadoPedido] ([IdEstadoPedido], [DescripcionEstadoPedido], [FecBaja]) VALUES (6, N'Finalizado', NULL)
SET IDENTITY_INSERT [dbo].[EstadoPedido] OFF
INSERT [dbo].[PedidoEstadoPedido] ([IdPedido], [IdEstadoPedido], [Fecha], [FecBaja]) VALUES (1, 6, CAST(0x0000A6AE00000000 AS DateTime), NULL)
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [Descuento], [IdProducto], [FecBaja], [CUIT]) VALUES (1, 1, 5, CAST(500 AS Decimal(18, 0)), NULL, 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [Descuento], [IdProducto], [FecBaja], [CUIT]) VALUES (2, 1, 10, CAST(500 AS Decimal(18, 0)), NULL, 3, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [Descuento], [IdProducto], [FecBaja], [CUIT]) VALUES (3, 1, 100, CAST(500 AS Decimal(18, 0)), NULL, 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [Descuento], [IdProducto], [FecBaja], [CUIT]) VALUES (4, 1, 200, CAST(500 AS Decimal(18, 0)), NULL, 4, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [Descuento], [IdProducto], [FecBaja], [CUIT]) VALUES (5, 1, 200, CAST(500 AS Decimal(18, 0)), NULL, 2, NULL, N'20344003646')
INSERT [dbo].[PedidoDetalle] ([IdPedidoDetalle], [IdPedido], [Cantidad], [PrecioUnitario], [Descuento], [IdProducto], [FecBaja], [CUIT]) VALUES (6, 1, 200, CAST(500 AS Decimal(18, 0)), NULL, 4, NULL, N'20344003646')
SET IDENTITY_INSERT [dbo].[Familia] ON 

INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (1, N'Admin', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (2, N'Supervisor', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (3, N'Empleado', NULL)
INSERT [dbo].[Familia] ([IdFamilia], [NombreFamilia], [FecBaja]) VALUES (4, N'Cliente', NULL)
SET IDENTITY_INSERT [dbo].[Familia] OFF
SET IDENTITY_INSERT [dbo].[Encuesta] ON 

INSERT [dbo].[Encuesta] ([IdEncuesta], [NombreEncuesta], [FechaCreacion]) VALUES (1, N'Primer Encuesta', CAST(0x0000A6AC00000000 AS DateTime))
INSERT [dbo].[Encuesta] ([IdEncuesta], [NombreEncuesta], [FechaCreacion]) VALUES (2, N'Segunda Encuesta', CAST(0x0000A6AC00000000 AS DateTime))
INSERT [dbo].[Encuesta] ([IdEncuesta], [NombreEncuesta], [FechaCreacion]) VALUES (4, N'Encuesta LIDOSA', CAST(0x0000A6AC00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Encuesta] OFF
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IdPregunta], [TextoPregunta], [FechaCreacion], [IdEncuesta]) VALUES (1, N'Cuan satisfecho esta en general con la compra', CAST(0x0000A6AC00000000 AS DateTime), 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [TextoPregunta], [FechaCreacion], [IdEncuesta]) VALUES (2, N'Cuan facil le fue comprar', CAST(0x0000A6AC00000000 AS DateTime), 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [TextoPregunta], [FechaCreacion], [IdEncuesta]) VALUES (3, N'Cree que debamos morar', CAST(0x0000A6AC00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
SET IDENTITY_INSERT [dbo].[TipoTel] ON 

INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (1, N'Casa', NULL)
INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (2, N'Celular', NULL)
INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (3, N'Trabajo', NULL)
INSERT [dbo].[TipoTel] ([IdTipoTel], [DescripcionTipoTel], [FecBaja]) VALUES (4, N'Otros', NULL)
SET IDENTITY_INSERT [dbo].[TipoTel] OFF
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (1, N'20344003646', N'pargi', CAST(0x0000A6B300E25DBE AS DateTime), 1)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (2, N'20344003646', N'pargi', CAST(0x0000A6B300F8439B AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (3, N'20344003646', N'pargi', CAST(0x0000A6B300F8AF58 AS DateTime), 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (4, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (5, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (6, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (7, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[DireccionUsuario] ([IdDireccion], [CUIT], [NombreUsuario], [FecBaja], [Predeterminada]) VALUES (8, N'20344003646', N'pargi', NULL, 0)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja]) VALUES (N'20344003646', N'pargi', 2, NULL)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja]) VALUES (N'20344003646', N'pargi', 3, NULL)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja]) VALUES (N'20344003646', N'pargi', 4, NULL)
INSERT [dbo].[ListaDeseos] ([CUIT], [NombreUsuario], [IdProducto], [FecBaja]) VALUES (N'20344003646', N'pargi', 12, NULL)
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (2, N'20289082981', N'Empanadas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (3, N'20289082981', N'Facturas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (6, N'20289082981', N'Materias primas', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (7, N'20377540582', N'CD', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (8, N'20377540582', N'DVD', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [CUIT], [DescripCategoria], [FecBaja]) VALUES (9, N'20377540582', N'Vinilo', NULL)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (18, 2, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (19, 2, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (20, 3, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (21, 3, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (22, 6, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (23, 6, NULL, N'20289082981')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (25, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (26, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (27, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (28, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (29, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (30, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (31, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (32, 7, NULL, N'20377540582')
INSERT [dbo].[ProdCategoria] ([IdProducto], [IdCategoria], [FecBaja], [CUIT]) VALUES (33, 7, NULL, N'20377540582')
SET IDENTITY_INSERT [dbo].[Lenguaje] ON 

INSERT [dbo].[Lenguaje] ([IdLenguaje], [DescripcionLenguaje], [FecBaja]) VALUES (1, N'Español', NULL)
INSERT [dbo].[Lenguaje] ([IdLenguaje], [DescripcionLenguaje], [FecBaja]) VALUES (2, N'English', NULL)
SET IDENTITY_INSERT [dbo].[Lenguaje] OFF
