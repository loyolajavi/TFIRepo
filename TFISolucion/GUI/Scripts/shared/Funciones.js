//$('#btnDesear').click(function () { onBtnAddClick(this) })

//function onBtnAddClick(btn) {
//    var control = $(btn);
//    var idProd = control.data('producto')

//    $.ajax({
//        type: "POST",
//        url: "Home.aspx/AgregarDeseo",
//        data: '{ idProducto: ' + idProd + '}',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json"
//    });
//    return true;
//};

//*********Load de MasterBasic en Cliente****************
function LoadMasterBasic() {
    updateProductos();
    updateCompras();
    updateDeseos();
};


//END*********Load de MasterBasic en Cliente****************END

//************PARA MANTENER SESION ACTIVA*****************
//var HeartBeatTimer;

//function StartHeartBeat() {
//    // pulse every 10 seconds
//    if (HeartBeatTimer == null)
//        HeartBeatTimer = setInterval("HeartBeat()", 114000 * 10);
//};

//function HeartBeat() {
//    // note: ScriptManger must have: EnablePageMethods="true"
//    PageMethods.MantenerSesion();
//};
//END************PARA MANTENER SESION ACTIVA*****************END

//Para agregar un Deseo
function onBtnAddClick(btn) {
    var control = $(btn);
    var idProd = control.data('producto');
    if (idProd == null)
        idProd = $('#IdProductoComprarServer').val();
    $.ajax({
        type: "POST",
        url: "Home.aspx/AgregarDeseo",
        data: '{ idProducto: ' + idProd + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (result) {
            updateDeseos();

            //var $modal = $('.modal');
            //$modal.find('#prod').text(result.d);
            //$modal.modal("show");


        }
    });
};

//********Para quitar productos de Lista Deseos*************
function onbtnEliminarDeseo(lapagina) {
    var control = $(lapagina);
    var idProd = control.data('prodeliminar');

    $.ajax({
        type: "POST",
        url: "ListaDeDeseos.aspx/QuitarDeseo",
        data: '{ idProducto: ' + idProd + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (result) {
            updateDeseos();
            //var $modal = $('.modal');
            //$modal.find('#prod').text(result.d);
            //$modal.modal("show");
        }
    });
};
//END********Para quitar productos de Lista Deseos*************END

$('#btn-pedidos').click(function () {
    app.redirect('Pedidos.aspx');
});


//******Para colocar producto de lista deseos en Pedidos al hacer click en Comprar en un produto Deseado*********
function onBtnComprar(btn2) {
    var control = $(btn2);
    var idProdComprar = control.data('producto2');

    consultarStockClickComprarEnDesear(idProdComprar, function (stockActual) {
        if (stockActual > 0) {
            $.ajax({
                type: "POST",
                url: "/Areas/Public/Forms/ListaDeDeseos.aspx/ComprarProducto",
                data: '{ IdProdC: ' + idProdComprar + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (result) {
                    //var $modal = $('.modal');
                    //$modal.find('#prod').text(result.d);
                    //$modal.modal("show");
                    //updateProductos();
                    actualizarDeseos();
                    updateDeseos(); //Para cargar los deseos al inicial la página
                    updateProductos();//Para cargar los productos en el pedido al inicial la página
                    app.reload();
                }
            });
        }
        else {
            alert("NO HAY STOCK");
        }
    });
    //return true;


};
//END******Para colocar producto de lista deseos en Pedidos al hacer click en Comprar en un produto Deseado*********END


//Todos los class="btn-comprar" vienen primero aca
$('.btn-comprar').click(function () {
    var control = $(this);
    var idProducto = control.data('producto');//Viene desde el .aspx propiedad: data-producto
    if(idProducto == null)
        idProducto = $('#IdProductoComprarServer').val();
    //Llama a la función
    consultarStockClickComprar(idProducto, function (stockActual) {
        if (stockActual > 0) {
            $.ajax({
                type: "POST",
                url: "Pedidos.aspx/AgregarItem",//Ingresa en AgregarItem de Pedidos.aspx.cs y retorna el nombre del producto
                data: '{ id: ' + idProducto + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    //alert(error);
                    alert("Error al agregar Producto al Pedido, por favor reintente");
                },
                success: function (result) { //result es el nombre del producto agregado
                    updateProductos();

                    var $modal = $('.modal');
                    $modal.find('#prod').text(result.d);
                    $modal.modal("show");


                }
            });
        }
        else {
            alert("NO HAY STOCK");
        }
    });

});

    var app = {
        redirect: function (url) {
            window.location.href = url;
        },

        reload: function () {
            window.location.reload();
        }

    };


//********Para agregar productos al pedido dropdown (en el Load por ej)*************
var updateProductos = function () {
    $.ajax({
        type: "POST",
        url: "Pedidos.aspx/ObtenerProductosPedido",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            var container = $('#ulPedidos');
            var containerLink = $('#LinkUlPedido');
            var cant = data.d.length;
            //LIMPIO DROP
            container.empty();
            //MUESTRO CANTIDAD
            if (cant > 0) {
                $('#cantProd').text('   (' + cant + ')');
                //REGENERO EL DROP
                console.log(data.d.length);
                containerLink.attr("data-toggle", "dropdown");
                container.append(data.d);
                container.append("<li><div class=\"text-center drop-btn\"><a href=\"Pedidos.aspx\" class=\"btn btn-primary\">Ir a pedidos</a></div></li>");
            }
            else {
                $('#cantProd').empty();
                containerLink.removeAttr("data-toggle");
            }
            // container.append("<li><div class=\"text-center drop-btn\"><a href=\"Pedidos.aspx\" class=\"btn btn-primary\"><%=Resources.Global.MiCuenta%></a></div></li>");
        }
    });
};
//END********Para agregar productos al pedido dropdown (en el Load por ej)*************END



//*********Para Agregar Deseos al dropdown******************
var updateDeseos = function () {
    $.ajax({
        type: "POST",
        url: "/Areas/Public/Forms/Home.aspx/ObtenerProductosDeseos",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            var container = $('#ulDeseos');
            var containerLink = $('#LinkUlDeseos');
            var cant = data.d.length;
            //LIMPIO DROP
            container.empty();
            //MUESTRO CANTIDAD
            if (cant > 0) {
                $('#cantDeseos').text('   (' + cant + ')');
                //REGENERO EL DROP
                console.log(data.d.length);
                containerLink.attr("data-toggle", "dropdown");
                container.append(data.d);
                container.append("<li><div class=\"text-center drop-btn\"><a href=\"ListaDeDeseos.aspx\" class=\"btn btn-primary\">Ver los Deseos</a></div></li>");
            }
            else {
                $('#cantDeseos').empty();
                containerLink.removeAttr("data-toggle");
            }
        }
    });
};
//END*********Para Agregar Deseos al dropdown******************END

//*********Para Agregar las Compras al dropdown******************
var updateCompras = function () {
    $.ajax({
        type: "POST",
        url: "/Areas/Public/Forms/UltimosPedidos.aspx/ObtenerComprasDrop",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            //MUESTRO CANTIDAD
            if (data.d > 0) {
                $('#cantComprasPagar').text('   (' + data.d + ')');
            }
            else {
                $('#cantComprasPagar').empty();
            }
            console.log(data);
        }
    });
};
//END*********Para Agregar las Compras al dropdown******************END

    //$(function () {
    //    $("#ddlTipoUsuario").change(function () {
    //        ToggleDropdown();
    //    });
    //    ToggleDropdown(); // Done to ensure correct hiding/showing on page reloads due to validation errors
    //});

    //function ToggleDropdown() {
    //    if ($("#ddlTipoUsuario").val() == "Empleado") {
    //        $("#divFiscal").show();
    //        $("#btnAltaEmpleado").show();
    //        $("#divDirFacturacion").hide();
    //        $("#divDirEnvio").hide();
    //        $("#btnAltaCliente").hide();



    //    } else if ($("#ddlTipoUsuario").val() == "Cliente") {
    //        $("#divFiscal").hide();
    //        $("#btnAltaEmpleado").hide();
    //        $("#divDirFacturacion").show(); 
    //        $("#divDirEnvio").show();
    //        $("#btnAltaCliente").show();
    //    }
    //};



    //Para Mostrar Detalle Productos
    $('.linkProducto').click(function () {
        var id = $(this).data('producto');
        app.redirect("Producto.aspx?IdProducto=" + id);
    });

    //PARA CONSULTAR STOCK AL CLICKEAR EN COMPRAR
    function consultarStockClickComprar(id, my_callback) {
        var stockActual = 0;
        //Para consultar el stock va a codigo Producto.aspx.cs método consultarStock (que es un webMethod, ..
        //..no lee las variables locales de la clase Producto.aspx.cs), osea al server
        
            $.ajax({
                type: "POST",
                url: "Producto.aspx/consultarStock",
                data: '{ id: ' + id + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    //alert(error);
                    alert("Error al consultar stock, por favor reintente");
                },
                success: function (data) {

                    var stockActual = data.d;

                    //if (stockActual >= 1) {
                    //    flagStock = true;
                    //}
                    //else {
                    //    flagStock = false;
                    //}
                    //my_callback(flagStock);
                    my_callback(stockActual);
                    return stockActual;
                }
            });
        //return stockActual; // CON ESTO RETORNO SI HAY STOCK O NO A LA FUNCION btnComprar.CLick y onbtncomprar
    };


    //PARA CONSULTAR STOCK AL CLICKEAR COMPRAR EN DESEAR
    function consultarStockClickComprarEnDesear(id, my_callback) {
        var stockActual = 0;
        //Para consultar el stock va a codigo Producto.aspx.cs método consultarStock (que es un webMethod, ..
        //..no lee las variables locales de la clase Producto.aspx.cs), osea al server

        $.ajax({
            type: "POST",
            url: "/Areas/Public/Forms/ListaDeDeseos.aspx/consultarStock",
            data: '{ id: ' + id + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            error: function (xhr, status, error) {
                //alert(error);
                alert("Error al consultar stock, por favor reintente");
            },
            success: function (data) {

                var stockActual = data.d;

                //if (stockActual >= 1) {
                //    flagStock = true;
                //}
                //else {
                //    flagStock = false;
                //}
                //my_callback(flagStock);
                my_callback(stockActual);
                return stockActual;
            }
        });
        //return stockActual; // CON ESTO RETORNO SI HAY STOCK O NO A LA FUNCION btnComprar.CLick y onbtncomprar
    };



    var actualizarDeseos = function () {
        $.ajax({
            type: "POST",
            url: "/Areas/Public/Forms/ListaDeDeseos.aspx/ObtenerDeseosSession",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            
            error: function (xhr, status, error) {
                alert(error);
            },
            success: function (data) {
                var container = $('#cuerpoTablaDeseos');
                var cant = data.d.length;
                //LIMPIO DROP
                container.empty();
                //REGENERO EL DROP
                console.log(data.d.length);
                container.append(data.d);
                

            }
        });
    };


    //Ocultar Breadcumb curso del Pedido
    function OcultarBreadcrumb() {
        $('.breadcrumb').attr("hidden", "hidden");
    };
    

//*************PedidosConfirmacion.aspx**********************************************************************************************************************************************************
//***********************************************************************************************************************************************************************************************
//*********Boton Confirmar Pedido en PedidosConfirmación.aspx****************
    $('#btnConfirmar').click(function () {

        $.ajax({
            type: "POST",
            url: "PedidosConfirmacion.aspx/GenerarPedido",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            error: function (xhr, status, error) {
                alert(error);
            },
            success: function (data) {
                $('#pagos').removeAttr('hidden');
                $('.pasos').hide();
                $('#pedidoId').val(data.d);
                redimensionar();
                updateCompras();
                updateProductos();
                showSuccess(data.d);
            }
        });
    });
//END*********Boton Confirmar Pedido en PedidosConfirmación.aspx****************END

//*********Mostrar modal de Pedido realizado correctamente (llamada por #btnConfirmarClick)****************
    var showSuccess = function (id) {
        var $modal = $('#mdl_pedido');
        $modal.find('#prod').text(id);
        $modal.modal("show");
    };
//END*********Mostrar modal de Pedido realizado correctamente (llamada por #btnConfirmarClick)****************END

    function redimensionar() {
        $('#resumenBox').removeAttr("style");
        $('#pagos').removeAttr('hidden');
        OcultarBreadcrumb();
    };

    function Validar() {
        if ($('#pedidoId').val() != "") {
            $('.pasos').hide();
            redimensionar();
        }

    };


//END*************PedidosConfirmacion.aspx*******************
//END********************************************************


//*********FacturasCliente.aspx get montoNotaDebito y generarla por webmethod****************
    $('#btnGenerarNotaDeb').click(function () {
        //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
        var MontoNotaDebito = $('#MontoNotaDebito').val();
        var parametros = {
            MontoNotaDebito: $('#MontoNotaDebito').val(),
            NroFactAsocND: $('#NroFactAsocND').val()
        };
        if (MontoNotaDebito != '') {
            // Ahora hacemos la llamada tipo AJAX utilizando jQuery
            $.ajax({
                type: 'POST',                               // tipo de llamada (POST, GET)
                url: 'FacturasCliente.aspx/GenerarNotaDebWebMethod',
                dataType: "json",  // el URL del método que vamos a llamar
                // los parámetros en formato JSON
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
                success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
                    // $('#notification').text('La información ha sido guardada exitosamente.');

                    //window.location.reload();
                    if (data.d == true) {
                        alert('Nota de debito generada');
                        $('#mdl_MontoNotaDebito').modal('hide');
                    }
                    else {
                        alert('Ocurrió un error al intentar generar la Nota de crédito');
                        $('#mdl_MontoNotaDebito').modal('hide');
                    }
                },
                error: function (data) {          // función que se va a ejecutar si el pedido falla

                    alert("No se ha podido realizar la nota de crédito");
                    $('#mdl_MontoNotaDebito').modal('hide');
                }
            });
        }
        else {
            alert("Ingrese el monto del ajuste a aplicar");
        }
    });



//*************PedidosDireccion.aspx**********************************************
//****************************************************************************
//*********Boton Continuar a Forma Envio (PedidosEnvio.aspx)******************
//$('#IdContinuarDatosPersonales').click(function () {
function ChequearStockPedido(){
    $.ajax({
        type: "POST",
        url: "Pedidos.aspx/ChequearPedido",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            if (data.d == true) {
                app.redirect('PedidosDireccion.aspx');
            }
            else {
                alert('No se puede realizar el Pedido con la cantidad de Productos solicitada, por favor comuníquese con nosotros');
            }
        }
    });
};
//END*********PedidosDireccion.aspx - Boton Continuar a Forma Envio (PedidosEnvio.aspx)****************END

