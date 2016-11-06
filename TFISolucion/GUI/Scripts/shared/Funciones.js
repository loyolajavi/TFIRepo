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



function onBtnComprar(btn2) {
    var control = $(btn2);
    var idProdComprar = control.data('producto2');

    $.ajax({
        type: "POST",
        url: "listadedeseos.aspx/ComprarProducto",
        data: '{ IdProdC: ' + idProdComprar + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
    return true;
};


var app = {
    redirect: function (url) {
        window.location.href = url;
    },

    reload: function () {
        window.location.reload();
    }

};





