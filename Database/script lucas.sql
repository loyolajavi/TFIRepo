CREATE TABLE Pedido
 (IdPedido INT NOT NULL,
 FechaPedido Datetime NOT NULL,
  FechaFinPedido Datetime NULL,
  IdCliente int NOT NULL,
  PlazoEntrega int null,
  IdEstadoPedido int not null,
  IdFormaEntrega int null,
  CUIT varchar(11) not null,
  NumeroTracking varchar(50) null,
  DireccionEntrega int not null,
  CONSTRAINT [PK_IdPedido] PRIMARY KEY([IdPedido])
	)




CREATE TABLE PedidoDetalle
(	IdPedidoDetalle INT NOT NULL,
    IdPedido INT NOT NULL,
	Cantidad int not null,
	PrecioUnitario decimal not null,
	Descuento int null,
	IdProducto int not null,
	CONSTRAINT [PK_IdPedidoDetalle] PRIMARY KEY(IdPedidoDetalle,IdPedido)
	)





CREATE TABLE Reserva
(IdReserva INT NOT NULL,	
IdPedidoDetalle INT NOT NULL,
	IdSucursal INT,
	Activo bit NOT NULL,
	Fecha datetime NOT NULL,
	CONSTRAINT [PK_Reserva] PRIMARY KEY(IdReserva))


CREATE TABLE Producto
(
	IdProducto INT NOT NULL,
	CodigoProducto VARCHAR(50) NOT NULL,
	PrecioUnitario decimal not null,
	IdMarca int not null,
	CUITEmpresa varchar(11) not null,
	CONSTRAINT [PK_Producto] PRIMARY KEY(IdProducto))

	


CREATE TABLE Marca
(
	IdMarca INT NOT NULL,
	Descripcion VARCHAR(50) NOT NULL
	CONSTRAINT [PK_Marca] PRIMARY KEY(IdMarca))


		ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY (IdCliente) REFERENCES Usuario(IdUsuario)
	ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_EstadoPedido] FOREIGN KEY (IdEstadoPedido) REFERENCES EstadoPedido(IdEstadoPedido)
	ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_FormaEntrega] FOREIGN KEY (IdFormaEntrega) REFERENCES FormaEntrega(IdFormaEntrega)
	ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_Empresa] FOREIGN KEY (CUIT) REFERENCES Empresa(CUIT)
	ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_Direccion] FOREIGN KEY (DireccionEntrega) REFERENCES Direccion(IdDireccion)

	ALTER TABLE Producto ADD CONSTRAINT [FK_Producto_Marca] FOREIGN KEY (IdMarca) REFERENCES Marca(IdMarca)

	
	ALTER TABLE Reserva ADD CONSTRAINT [FK_Reserva_PedidoDetalle] FOREIGN KEY (IdPedidoDetalle) REFERENCES PedidoDetalle(IdPedidoDetalle)
	ALTER TABLE Reserva ADD CONSTRAINT [FK_Reserva_Sucursal] FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)

  ALTER TABLE PedidoDetalle ADD CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)
	ALTER TABLE PedidoDetalle ADD CONSTRAINT [FK_PedidoDetalle_Producto] FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)