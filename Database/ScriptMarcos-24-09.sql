

alter table ListaDeseos 
	add foreign key(IdUsuario) 
		references Usuario



alter table ListaDeseosDetalle 
	add foreign key(IdListaDeseos) references ListaDeseos

alter table ListaDeseosDetalle 
	add foreign key (IdProducto) references Producto




alter table Telefono 
	add foreign key(IdUsuario) 
		references Usuario
alter table Telefono 
	add foreign key(IdTipoTelefono)
		references TipoTel





