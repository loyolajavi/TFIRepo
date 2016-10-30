$('#btnDesear').click(function () { onBtnAddClick(this) })
function onBtnAddClick(btn) {
    var control = $(btn);
    var idProd = control.data('producto')

    $.ajax({
        type: "POST",
        url: "Home.aspx/AddItem",
        data: '{ id: ' + idProd + '}',
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
};