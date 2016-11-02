$('#btnDesear').click(function () { onBtnAddClick(this) })
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


//function ActDropDownDeseo() {
    
//    $.ajax({
//        type: "POST",
//        url: "LayoutBasico.Master/ActualizarDeseos",
//        data: '{ idProducto: ' + idProd + '}',
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (Valor) {
//            //alert("Entre");              
//            ActDropDownDeseo();

//        }
//    });
//}; ActDropDownDeseo