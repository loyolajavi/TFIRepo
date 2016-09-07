# TFIRepo
Es el repositorio para crear el Ecommerce de TFI con arquitectura de Vilaboa


Esto es por si queremos usar el IIS posta y no el IIS Express del visual studio:
Para configurar Proyecto en IIS Local se debe :

1) Agregar dentro del IIS local el sitio: Sitios > Agregar Sitio Web...

2) Configurar:

Nombre de sitio: tfiNegocio.
Ruta Física: D:\WorkGit\UAI\negocioTFI\NegocioTFI\Presentation.WebSite.
(Ruta en donde se encuntra el proyecto web de Visual Studio).
Nombre de Host: dev.tfisystem.com.
Todo lo demas va por default.

3) Ir a grupos de aplicaciones. Buscar tfiNegocio > boton derecho > Configuracion Basica... Version NET: (Seleccionar) NET V4.0

4) Ir a C:\Windows\system32\drivers\etc\ Abrir archivo host Agregar dentro de las paginas: 127.0.0.1 dev.tfisystem.com
