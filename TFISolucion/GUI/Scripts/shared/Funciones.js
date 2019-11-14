﻿//$('#btnDesear').click(function () { onBtnAddClick(this) })

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
    StartHeartBeat();
    updateProductos();
    updateCompras();
    updateDeseos();
};


//END*********Load de MasterBasic en Cliente****************END

//************PARA MANTENER SESION ACTIVA*****************
var HeartBeatTimer;

function StartHeartBeat() {
    // pulse every 10 seconds
    if (HeartBeatTimer == null)
        HeartBeatTimer = setInterval("HeartBeat()", 114000 * 10);
};

function HeartBeat() {
    // note: ScriptManger must have: EnablePageMethods="true"
    PageMethods.MantenerSesion();
};
//END************PARA MANTENER SESION ACTIVA*****************END

//Para agregar un Deseo
function onBtnAddClick(btn) {
    var control = $(btn);
    var idProd = control.data('producto');

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


$('#btn-pedidos').click(function () {
    app.redirect('Pedidos.aspx')
});


//******Para colocar producto de lista deseos en Pedidos al hacer click en Comprar en un produto Deseado*********
function onBtnComprar(btn2) {
    var control = $(btn2);
    var idProdComprar = control.data('producto2');

    consultarStockClickComprar(idProdComprar, function (stockActual) {
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
                }
            });
        }
        else {
            alert("NO HAY STOCK");
        }
    });
    //return true;

    actualizarDeseos();
    updateDeseos(); //Para cargar los deseos al inicial la página
    updateProductos();//Para cargar los productos en el pedido al inicial la página
    app.reload();
};
//END******Para colocar producto de lista deseos en Pedidos al hacer click en Comprar en un produto Deseado*********END


//Todos los class="btn-comprar" vienen primero aca
$('.btn-comprar').click(function () {
    var control = $(this);
    var idProducto = control.data('producto');//Viene desde el .aspx propiedad: data-producto
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
                    alert(error);
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
            var cant = data.d.length;
            //LIMPIO DROP
            container.empty();
            //MUESTRO CANTIDAD
            if (cant > 0)
                $('#cantProd').text('   (' + cant + ')');
            else
                $('#cantProd').empty();
            //REGENERO EL DROP
            console.log(data.d.length);
            container.append(data.d);
            container.append("<li><div class=\"text-center drop-btn\"><a href=\"Pedidos.aspx\" class=\"btn btn-primary\">Ir a pedidos</a></div></li>");
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
            var cant = data.d.length;
            //LIMPIO DROP
            container.empty();
            //MUESTRO CANTIDAD
            if (cant > 0)
                $('#cantDeseos').text('   (' + cant + ')');
            //REGENERO EL DROP
            console.log(data.d.length);
            container.append(data.d);
            container.append("<li><div class=\"text-center drop-btn\"><a href=\"ListaDeDeseos.aspx\" class=\"btn btn-primary\">Ver los Deseos</a></div></li>");

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
            if (data.d > 0)
                $('#cantComprasPagar').text('   (' + data.d + ')');
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
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "Producto.aspx/consultarStock",
                data: JSON.stringify({
                    id: id,
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
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
                }
            });
        });
        return stockActual; // CON ESTO RETORNO SI HAY STOCK O NO A LA FUNCION btnComprar.CLick y onbtncomprar
    };





    var actualizarDeseos = function () {
        $.ajax({
            type: "POST",
            url: "/Areas/Public/Forms/ListaDeDeseos.aspx/ObtenerDeseosSession",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
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