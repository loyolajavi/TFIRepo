create database Ecommercetfiv13
go

use Ecommercetfiv13
go


--*************EstadoPago*****************
CREATE TABLE EstadoPago
(	IdEstadoPago INT NOT NULL identity(1,1),
	DescripEstadoPago VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_EstadoPago] PRIMARY KEY(IdEstadoPago))

--**********PAGO**************************
CREATE TABLE Pago
(	IdPago INT NOT NULL identity(1,1),
	IdPedido INT NOT NULL,
	FechaPago DATETIME NOT NULL,
	IdEstadoPago INT NOT NULL,
	IdFormaPago INT NOT NULL,
	MontoPago DECIMAL NOT NULL,
	NroComprobante INT NOT NULL,
	IdSucursal INT NOT NULL,
	IdTipoComprobante INT NOT NULL,
	CUIT INT NOT NULL, 
	CONSTRAINT [PK_Pago] PRIMARY KEY(IdPago))


--************EMPRESA********************
CREATE TABLE Empresa
(	CUIT INT NOT NULL,
	NombreEmpresa VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_Empresa] PRIMARY KEY(CUIT))


--*************FormaPago********************
CREATE TABLE FormaPago
(	IdFormaPago INT NOT NULL identity (1,1),
	DescripFormaPago VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_FormaPago] PRIMARY KEY(IdFormaPago))

--******************TipoComprobante**************
CREATE TABLE TipoComprobante
(	IdTipoComprobante INT NOT NULL identity(1,1),
	DescripTipoComprobante VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_TipoComprobante] PRIMARY KEY(IdTipoComprobante))

--********************Comprobante******************
CREATE TABLE Comprobante
(	NroComprobante INT NOT NULL,
	IdSucursal INT NOT NULL,
	CUIT INT NOT NULL,
	IdTipoComprobante INT NOT NULL,
	IdComprobante INT NOT NULL,
	FechaComprobante DATETIME NOT NULL,
	IdPedido INT NOT NULL,
	CONSTRAINT [PK_Comprobante] PRIMARY KEY(NroComprobante, IdSucursal, IdTipoComprobante, CUIT))



--****************ComprobanteDetalle**********************
CREATE TABLE ComprobanteDetalle
(	IdComprobanteDetalle INT NOT NULL,
	NroComprobante INT NOT NULL,
	IdSucursal INT NOT NULL,
	IdTipoComprobante INT NOT NULL,
	CUIT INT NOT NULL,
	IdProducto INT NOT NULL,
	CantidadProducto INT NOT NULL,
	PrecioUnitarioFact DECIMAL NOT NULL,
	CONSTRAINT [PK_ComprobanteDetalle] PRIMARY KEY(IdComprobanteDetalle, NroComprobante, IdSucursal, IdTipoComprobante, CUIT))


--*****************Sucursal***********************
CREATE TABLE Sucursal
(	IdSucursal INT NOT NULL identity (1,1),
	DescripSucursal VARCHAR(200) NOT NULL,
	DireccionSucursal INT NOT NULL,
	CUIT INT NOT NULL,
	CONSTRAINT [PK_Sucursal] PRIMARY KEY(IdSucursal))


--***************Producto_Categoria****************
CREATE TABLE ProdCategoria
(	IdProducto INT NOT NULL,
	IdCategoria INT NOT NULL,
	CONSTRAINT [PK_ProdCategoria] PRIMARY KEY(IdProducto, IdCategoria))

--******************Categoria***********************
CREATE TABLE Categoria
(	IdCategoria INT NOT NULL identity (1,1),
	DescripCategoria VARCHAR (200) NOT NULL,
	CONSTRAINT [PK_Categoria] PRIMARY KEY(IdCategoria))


--*******************IvaProducto**************************
CREATE TABLE IvaProducto
(	IdIvaProducto INT NOT NULL identity (1,1),
	PorcentajeIvaProd INT NOT NULL,
	CONSTRAINT [PK_IvaProducto] PRIMARY KEY(IdIvaProducto))


--*******************Pedido**************************
CREATE TABLE Pedido
 (IdPedido INT NOT NULL identity (1,1),
 FechaPedido Datetime NOT NULL,
  FechaFinPedido Datetime NULL,
  NombreUsuario VARCHAR (100) NOT NULL,
  PlazoEntrega int null,
  IdEstadoPedido int not null,
  IdFormaEntrega int null,
  CUIT int not null,
  NumeroTracking varchar(50) null,
  DireccionEntrega int not null,
  CONSTRAINT [PK_IdPedido] PRIMARY KEY([IdPedido])
	)


--*******************PedidoDetalle**************************
CREATE TABLE PedidoDetalle
(	IdPedidoDetalle INT NOT NULL,      
    IdPedido INT NOT NULL,                         
	Cantidad int not null,
	PrecioUnitario decimal not null,
	Descuento int null,
	IdProducto int not null,
	CONSTRAINT [PK_IdPedidoDetalle] PRIMARY KEY(IdPedido, IdPedidoDetalle)
	)


--*******************Reserva**************************
CREATE TABLE Reserva
(IdReserva INT NOT NULL IDENTITY (1,1),	
IdPedido INT NOT NULL,
IdPedidoDetalle INT NOT NULL,
	IdSucursal INT,
	Activo bit NOT NULL,
	Fecha datetime NOT NULL,
	CONSTRAINT [PK_Reserva] PRIMARY KEY(IdReserva))


--*******************Producto**************************
CREATE TABLE Producto
(
	IdProducto INT NOT NULL identity(1,1),
	CodigoProducto VARCHAR(50) NOT NULL,
	PrecioUnitario decimal not null,
	IdMarca int not null,
	CUIT INT not null,
	IdIvaProducto INT NOT NULL,
	CONSTRAINT [PK_Producto] PRIMARY KEY(IdProducto))


--*******************Marca**************************
CREATE TABLE Marca
(
	IdMarca INT NOT NULL identity(1,1),
	DescripcionMarca VARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Marca] PRIMARY KEY(IdMarca))


--*******************ListaDeseos**************************
create table ListaDeseos
(
IdListaDeseos int NOT NULL identity(1,1),
CUIT INT NOT NULL,
NombreUsuario VARCHAR(100) NOT NULL,
CONSTRAINT [PK_ListaDeseos] PRIMARY KEY(IdListaDeseos)
)


--*******************ListaDeseosDetalle**************************
create table ListaDeseosDetalle
(
IdListaDeseos int NOT NULL,
IdListaDeseosDetalle int NOT NULL identity(1,1),
IdProducto int NOT NULL,
FechaDeseoDetalle datetime NOT NULL,
CONSTRAINT [PK_ListaDeseosDetalle] PRIMARY KEY(IdListaDeseos,IdListaDeseosDetalle))


--*******************Telefono**************************
create table Telefono
(
CUIT INT NOT NULL,
NombreUsuario VARCHAR (100) NOT NULL,
NroTelefono varchar(12) NOT NULL,
CodArea varchar(10) NOT NULL,
IdTipoTel int NOT NULL,
CONSTRAINT [PK_Telefono] PRIMARY KEY(CUIT, NombreUsuario, NroTelefono,CodArea,IdTipoTel))

--*******************TipoTel**************************
create table TipoTel(
IdTipoTel int NOT NULL identity(1,1),
DescripcionTipoTel varchar(20) NOT NULL,
CONSTRAINT [PK_TipoTel] PRIMARY KEY(IdTipoTel))


--*******************EstadoPedido**************************
create table EstadoPedido(
IdEstadoPedido int NOT NULL identity(1,1),
DescripcionEstadoPedido varchar(20) NOT NULL,
CONSTRAINT [PK_EstadoPedido] PRIMARY KEY(IdEstadoPedido))



--*******************FormaEntrega**************************
create table FormaEntrega(
IdFormaEntrega int NOT NULL identity(1,1),
DescripcionFormaEntrega varchar(20) NOT NULL,
CONSTRAINT [PK_FormaEntrega] PRIMARY KEY(IdFormaEntrega))


--*******************UsuarioTipo**************************
CREATE TABLE UsuarioTipo
(	IdUsuarioTipo INT NOT NULL identity (1,1),
	Descripcion VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_UsuarioTipo] PRIMARY KEY(IdUsuarioTipo))


--*******************CondicionFiscal**************************
CREATE TABLE CondicionFiscal
(	IdCondicionFiscal INT NOT NULL identity(1,1),
	Descripcion VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_CondicionFiscal] PRIMARY KEY(IdCondicionFiscal))


--*******************Usuario**************************
CREATE TABLE Usuario
(	IdUsuario INT NOT NULL identity (1,1),
	IdCondicionFiscal INT,
	IdUsuarioTipo INT NOT NULL,
	Nombre VARCHAR(200) NOT NULL,
	Apellido VARCHAR(200) NOT NULL,
	Dni VARCHAR(10),
	CUIT INT NOT NULL,
	Email VARCHAR(400) NOT NULL,
	NombreUsuario VARCHAR(100) NOT NULL,
	Clave VARCHAR(200) NOT NULL
	CONSTRAINT [PK_Usuario] PRIMARY KEY(CUIT, NombreUsuario))
	

--*******************Lenguaje**************************
CREATE TABLE Lenguaje
(
	IdLenguaje INT NOT NULL identity (1,1),
	DescripcionLenguaje VARCHAR(200) NOT NULL,
	CONSTRAINT [PK_Lenguaje] PRIMARY KEY(IdLenguaje))


--*******************LenguajeControl**************************
CREATE TABLE LenguajeControl
(
	Texto VARCHAR(400) NOT NULL,
	IdLenguaje INT NOT NULL,
	Valor VARCHAR(400) NOT NULL
	CONSTRAINT [PK_LenguajeControl_Lenguaje] PRIMARY KEY(Texto, IdLenguaje))


--*******************Patente**************************
CREATE TABLE Patente
(
	IdPatente INT NOT NULL identity(1,1),
	NombrePatente VARCHAR(200) NOT NULL
	CONSTRAINT [PK_Patente] PRIMARY KEY(IdPatente))


--*******************Familia**************************
CREATE TABLE Familia
(
	IdFamilia INT NOT NULL identity (1,1),
	NombreFamilia VARCHAR(200) NOT NULL
	CONSTRAINT [PK_Familia] PRIMARY KEY(IdFamilia))


--*******************PatenteFamilia**************************
CREATE TABLE PatenteFamilia
(
	IdPatente INT NOT NULL,
	IdFamilia INT NOT NULL
	CONSTRAINT [PK_Patente_Familia] PRIMARY KEY(IdPatente,IdFamilia))


--*******************UsuarioFamilia**************************
CREATE TABLE UsuarioFamilia
(
CUIT INT NOT NULL,
NombreUsuario VARCHAR (100) NOT NULL,
	IdFamilia INT NOT NULL
	CONSTRAINT [PK_Usuario_Familia] PRIMARY KEY(CUIT, NombreUsuario,IdFamilia))


--*******************UsuarioPatente**************************
CREATE TABLE UsuarioPatente
(
CUIT INT NOT NULL,
NombreUsuario VARCHAR (100) NOT NULL,
	IdPatente INT NOT NULL
	CONSTRAINT [PK_Usuario_Patente] PRIMARY KEY(CUIT, NombreUsuario,IdPatente))


--*******************Direccion**************************
CREATE TABLE Direccion
(
	IdDireccion INT NOT NULL identity(1,1),
	Calle VARCHAR(200) NOT NULL,
	Numero INT NOT NULL,
	Piso INT,
	Departamento VARCHAR(100),
	Localidad VARCHAR(200),
	IdProvincia INT NOT NULL,
	IdTipoDireccion INT NOT NULL,

	CONSTRAINT [PK_Direccion] PRIMARY KEY(IdDireccion))


--*******************DireccionTipo**************************
CREATE TABLE TipoDireccion
(
	IdTipoDireccion INT NOT NULL,
	DescripcionDireccion VARCHAR(200) NOT NULL
	CONSTRAINT [PK_TipoDireccion] PRIMARY KEY(IdTipoDireccion))


--*******************Provincia**************************
CREATE TABLE Provincia
(
 IdProvincia INT NOT NULL,
 DescripcionProvincia VARCHAR(200) NOT NULL

 CONSTRAINT [PK_Provincia] PRIMARY KEY (IdProvincia)
)


--*******************DireccionUsuario**************************
CREATE TABLE DireccionUsuario
(
	IdDireccion INT NOT NULL,
	CUIT INT NOT NULL,
NombreUsuario VARCHAR (100) NOT NULL,
	CONSTRAINT [PK_Direccion_Cliente] PRIMARY KEY(IdDireccion,CUIT, NombreUsuario))


--*******************BitacoraLog**************************
CREATE TABLE BitacoraLog
(
	IdBitacoraLog INT NOT NULL,
	CUIT INT NOT NULL,
	NombreUsuario VARCHAR (100) NOT NULL,
	Evento VARCHAR(200) NOT NULL,
	FechaEvento Datetime NOT NULL,

	CONSTRAINT [PK_BitacoraLog] PRIMARY KEY(IdBitacoraLog))





-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************************************************************
--**********FORANEAS***************************************************************************************************************
--*********************************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------


--**Foraneas de Pago************************************************************

ALTER TABLE Pago ADD CONSTRAINT [FK_Pago_Pedido] 
FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)

ALTER TABLE Pago ADD CONSTRAINT [FK_Pago_EstadoPago] 
FOREIGN KEY (IdEstadoPago) REFERENCES EstadoPago(IdEstadoPago)

ALTER TABLE Pago ADD CONSTRAINT [FK_Pago_FormaPago] 
FOREIGN KEY (IdFormaPago) REFERENCES FormaPago(IdFormaPago)

ALTER TABLE Pago ADD CONSTRAINT [FK_Pago_Comprobante] 
FOREIGN KEY (NroComprobante, IdSucursal, IdTipoComprobante, CUIT) REFERENCES Comprobante(NroComprobante, IdSucursal, IdTipoComprobante, CUIT)

ALTER TABLE Pago ADD CONSTRAINT [FK_Pago_Empresa] 
FOREIGN KEY (CUIT) REFERENCES Empresa(CUIT)


--**Foraneas de Comprobante***************************************************

ALTER TABLE Comprobante ADD CONSTRAINT [FK_Comprobante_Sucursal] 
FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)

ALTER TABLE Comprobante ADD CONSTRAINT [FK_Comprobante_Empresa] 
FOREIGN KEY (CUIT) REFERENCES Empresa(CUIT)

ALTER TABLE Comprobante ADD CONSTRAINT [FK_Comprobante_Pedido] 
FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)

ALTER TABLE Comprobante ADD CONSTRAINT [FK_Comprobante_TipoComprobante] 
FOREIGN KEY (IdTipoComprobante) REFERENCES TipoComprobante(IdTipoComprobante)


--**Foraneas de ComprobanteDetalle******************************************************

ALTER TABLE ComprobanteDetalle ADD CONSTRAINT [FK_ComprobanteDetalle_Comprobante] 
FOREIGN KEY (NroComprobante, IdSucursal, IdTipoComprobante, CUIT) REFERENCES Comprobante(NroComprobante, IdSucursal, IdTipoComprobante, CUIT)

ALTER TABLE ComprobanteDetalle ADD CONSTRAINT [FK_ComprobanteDetalle_Producto] 
FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)


--**Foraneas de Sucursal************************************************************************

ALTER TABLE Sucursal ADD CONSTRAINT [FK_Sucursal_Empresa] 
FOREIGN KEY (CUIT) REFERENCES Empresa(CUIT)

ALTER TABLE Sucursal ADD CONSTRAINT [FK_Sucursal_Direccion] 
FOREIGN KEY (DireccionSucursal) REFERENCES Direccion(IdDireccion)


--**Foraneas de ProdCategoria************************************************************************

ALTER TABLE ProdCategoria ADD CONSTRAINT [FK_ProductoCateg_Producto] 
FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)

ALTER TABLE ProdCategoria ADD CONSTRAINT [FK_ProductoCateg_Categoria] 
FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)


--**Foraneas de Pedido************************************************************************
ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY (CUIT, NombreUsuario) REFERENCES Usuario(CUIT, NombreUsuario)
ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_EstadoPedido] FOREIGN KEY (IdEstadoPedido) REFERENCES EstadoPedido(IdEstadoPedido)
ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_FormaEntrega] FOREIGN KEY (IdFormaEntrega) REFERENCES FormaEntrega(IdFormaEntrega)
ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_Empresa] FOREIGN KEY (CUIT) REFERENCES Empresa(CUIT)
ALTER TABLE Pedido ADD CONSTRAINT [FK_Pedido_Direccion] FOREIGN KEY (DireccionEntrega) REFERENCES Direccion(IdDireccion)


--**Foraneas de Producto************************************************************************
ALTER TABLE Producto ADD CONSTRAINT [FK_Producto_Marca] FOREIGN KEY (IdMarca) REFERENCES Marca(IdMarca)
ALTER TABLE Producto ADD CONSTRAINT [FK_Producto_IvaProducto] FOREIGN KEY (IdIvaProducto) REFERENCES IvaProducto(IdIvaProducto)


--**Foraneas de Reserva************************************************************************
ALTER TABLE Reserva ADD CONSTRAINT [FK_Reserva_PedidoDetalle] FOREIGN KEY (IdPedido, IdPedidoDetalle) REFERENCES PedidoDetalle(IdPedido, IdPedidoDetalle)
ALTER TABLE Reserva ADD CONSTRAINT [FK_Reserva_Sucursal] FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)


--**Foraneas de PedidoDetalle************************************************************************
ALTER TABLE PedidoDetalle ADD CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)
ALTER TABLE PedidoDetalle ADD CONSTRAINT [FK_PedidoDetalle_Producto] FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)


--**Foraneas de ListaDeseos************************************************************************
alter table ListaDeseos ADD CONSTRAINT [FK_ListaDeseos_Usuario] foreign key(CUIT, NombreUsuario) references Usuario(CUIT, NombreUsuario)


--**Foraneas de ListaDeseosDetalle************************************************************************		
alter table ListaDeseosDetalle ADD CONSTRAINT [FK_ListaDeseosDetalle_ListaDeseos] foreign key(IdListaDeseos) references ListaDeseos(IdListaDeseos)
alter table ListaDeseosDetalle ADD CONSTRAINT [FK_ListaDeseosDetalle_Producto] foreign key (IdProducto) references Producto(IdProducto)


--**Foraneas de Telefono************************************************************************
alter table Telefono ADD CONSTRAINT [FK_Telefono_Usuario] foreign key (CUIT, NombreUsuario) references Usuario(CUIT, NombreUsuario)
alter table Telefono ADD CONSTRAINT [FK_Telefono_TipoTel] foreign key(IdTipoTel) references TipoTel(IdTipoTel)




--**Foraneas de Usuario************************************************************************
ALTER TABLE Usuario ADD CONSTRAINT [FK_Usuario_UsuarioTipo] FOREIGN KEY (IdUsuarioTipo) REFERENCES UsuarioTipo(IdUsuarioTipo)
ALTER TABLE Usuario ADD CONSTRAINT [FK_Usuario_CondFiscal] FOREIGN KEY (IdCondicionFiscal) REFERENCES CondicionFiscal(IdCondicionFiscal)

--**Foraneas de LanguajeControl************************************************************************
ALTER TABLE LenguajeControl ADD CONSTRAINT [FK_LenguageControl_Lenguage] FOREIGN KEY (IdLenguaje) REFERENCES Lenguaje(IdLenguaje)


--**Foraneas de Direccion************************************************************************
ALTER TABLE Direccion ADD CONSTRAINT [FK_Direccion_DireccionTipo] FOREIGN KEY (IdTipoDireccion) REFERENCES TipoDireccion(IdTipoDireccion)


--**Foraneas de DireccionUsuario************************************************************************
ALTER TABLE DireccionUsuario ADD CONSTRAINT [FK_DireccionUsuario_Direccion] FOREIGN KEY (IdDireccion) REFERENCES Direccion(IdDireccion)
ALTER TABLE DireccionUsuario ADD CONSTRAINT [FK_DireccionUsuario_Cliente] FOREIGN KEY (CUIT, NombreUsuario) REFERENCES Usuario(CUIT, NombreUsuario)


--**Foraneas de PatenteFamilia************************************************************************
ALTER TABLE PatenteFamilia ADD CONSTRAINT [FK_PatenteFamilia_Patente] FOREIGN KEY (IdPatente) REFERENCES Patente(IdPatente)
ALTER TABLE PatenteFamilia ADD CONSTRAINT [FK_PatenteFamilia_Familia] FOREIGN KEY (IdFamilia) REFERENCES Familia(IdFamilia)


--**Foraneas de UsuarioFamilia************************************************************************
ALTER TABLE UsuarioFamilia ADD CONSTRAINT [FK_UsuarioFamilia_Usuario] FOREIGN KEY (CUIT, NombreUsuario) REFERENCES Usuario(CUIT, NombreUsuario)
ALTER TABLE UsuarioFamilia ADD CONSTRAINT [FK_UsuarioFamilia_Familia] FOREIGN KEY (IdFamilia) REFERENCES Familia(IdFamilia)


--**Foraneas de UsuarioPatente************************************************************************
ALTER TABLE UsuarioPatente ADD CONSTRAINT [FK_UsuarioPatente_Patente] FOREIGN KEY (IdPatente) REFERENCES Patente(IdPatente)
ALTER TABLE UsuarioPatente ADD CONSTRAINT [FK_UsuarioPatente_Usuario] FOREIGN KEY (CUIT, NombreUsuario) REFERENCES Usuario(CUIT, NombreUsuario)


--**Foraneas de Direccion************************************************************************
ALTER TABLE Direccion ADD CONSTRAINT [FK_Direccion_Provincia] FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia)


--**Foraneas de BitacoraLog************************************************************************
ALTER TABLE BitacoraLog ADD CONSTRAINT [FK_BitacoraLog_Usuario] FOREIGN KEY (CUIT, NombreUsuario) REFERENCES Usuario(CUIT, NombreUsuario)


