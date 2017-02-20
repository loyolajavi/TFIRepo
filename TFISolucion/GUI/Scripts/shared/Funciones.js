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


function onBtnComprar(btn2) {
    var control = $(btn2);
    var idProdComprar = control.data('producto2');

    consultarStockClickComprar(idProdComprar, function (flagStock) {
        if (flagStock) {
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
    updateDeseos();
    updateProductos();
    app.reload();
};


$('.btn-comprar').click(function () {
    var control = $(this);
    var idProducto = control.data('producto');

    consultarStockClickComprar(idProducto, function(flagStock) {
        if (flagStock) {
            $.ajax({
                type: "POST",
                url: "Catalogo.aspx/AgregarItem",
                data: '{ id: ' + idProducto + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (result) {
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

    //Para agregar productos al pedido dropdown
    var updateProductos = function () {
        $.ajax({
            type: "POST",
            url: "/Areas/Public/Forms/Home.aspx/ObtenerProductosPedido",
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
                //REGENERO EL DROP
                console.log(data.d.length);
                container.append(data.d);
               container.append("<li><div class=\"text-center drop-btn\"><a href=\"Pedidos.aspx\" class=\"btn btn-primary\">Ir a pedidos</a></div></li>");
               // container.append("<li><div class=\"text-center drop-btn\"><a href=\"Pedidos.aspx\" class=\"btn btn-primary\"><%=Resources.Global.MiCuenta%></a></div></li>");
            }
        });
    };

    //Para Agregar Deseos al dropdown
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

    $(function () {
        $("#ddlTipoUsuario").change(function () {
            ToggleDropdown();
        });
        ToggleDropdown(); // Done to ensure correct hiding/showing on page reloads due to validation errors
    });

    function ToggleDropdown() {
        if ($("#ddlTipoUsuario").val() == "Empleado") {
            $("#divFiscal").show();
            $("#btnAltaEmpleado").show();
            $("#divDirFacturacion").hide();
            $("#divDirEnvio").hide();
            $("#btnAltaCliente").hide();



        } else if ($("#ddlTipoUsuario").val() == "Cliente") {
            $("#divFiscal").hide();
            $("#btnAltaEmpleado").hide();
            $("#divDirFacturacion").show(); 
            $("#divDirEnvio").show();
            $("#btnAltaCliente").show();
        }
    };



    //Para Mostrar Detalle Productos
    $('.linkProducto').click(function () {
        var id = $(this).data('producto');
        app.redirect("Producto.aspx?IdProducto=" + id);
    });



    //PARA CONSULTAR STOCK AL CLICKEAR EN COMPRAR
    function consultarStockClickComprar(id, my_callback) {
        var flagStock = false;
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "Pedidos.aspx/consultarStock",
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

                    if (stockActual >= 1) {
                        flagStock = true;
                    }
                    else {
                        flagStock = false;
                    }
                    my_callback(flagStock);
                }
            });
        });
        return flagStock; // CON ESTO RETORNO SI HAY STOCK O NO A LA FUNCION btnComprar.CLick y onbtncomprar
    }





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