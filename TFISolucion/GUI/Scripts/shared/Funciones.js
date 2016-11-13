//$('#btnDesear').click(function () { onBtnAddClick(this) })
function onBtnAddClick(btn) {
    var control = $(btn);
    var idProd = control.data('producto')

    $.ajax({
        type: "POST",
        url: "Home.aspx/AgregarDeseo",
        data: '{ idProducto: ' + idProd + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
    return true;
};


$('#btn-pedidos').click(function () {
    app.redirect('Pedidos.aspx')
});


function onBtnComprar(btn2) {
    var control = $(btn2);
    var idProdComprar = control.data('producto2');

    $.ajax({
        type: "POST",
        url: "ListaDeDeseos.aspx/ComprarProducto",
        data: '{ IdProdC: ' + idProdComprar + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (result) {
            var $modal = $('.modal');
            $modal.find('#prod').text(result.d);
            $modal.modal("show");
        }
    });
    return true;
};


$('.btn-comprar').click(function () {
    var control = $(this);
    var idProducto = control.data('producto');
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
});

var app = {
    redirect: function (url) {
        window.location.href = url;
    },

    reload: function () {
        window.location.reload();
    }

};

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
            container.append("<li><div class=\"text-center drop-btn\"><a href=\"Pedidos.aspx\" class=\"btn btn-primary\">Ir a pedidos</a></div></li>")

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
        $("#divFiscal").hide();


    } else {
        $("#divFiscal").show();
    }
};



