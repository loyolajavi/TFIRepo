var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
var $notif = $('#notification');
var $form = $('#formPass');
var $passNueva = $('#passnueva');
var $passVieja = $('#passanterior');
var $passConf = $('#passnuevarepetida');

$('#btnLogin').on("click", function () {

    ClearModal();
    $("#modalLogin").modal("show");
    $passVieja.focus;
});

$passVieja.blur(function () {
    ClearNotifications();
    var valid = ValidarVacio(this, "Anterior");
    if (valid)
        ValidarPass(this);
});
$passNueva.blur(function () {
    ClearNotifications();
    var valid = ValidarVacio(this, "Nueva");
    if (valid)
        ValidarPass(this);
});
$passConf.blur(function () {
    ClearNotifications();
    var valid = ValidarVacio(this, "Confirmacion");
    if (valid)
        ValidarPass(this);
});

function ValidarPass(control) {
    if (!control.value.match(passw)) {
        Error("La contraseña debe tener al menos una mayuscula, una minuscula, un numero y un simbolo.");
        control.focus();
    }
}

function ValidarVacio(control, campo) {
    var msj = 'El campo no debe estar vacio';

    if (campo)
        msj = 'El campo ' + campo + ' no debe estar vacio'

    if (control.value == "") {
        Error(msj);
        control.focus();
        return false;
    }
    return true;
}

function ClearModal() {
    ClearNotifications();
    $('#passanterior').val('');
    $('#passnuevarepetida').val('');
    $('#passnueva').val('');
}

function ClearModalFacturacion() {
    ClearNotifications();
    $('#calle').val('');
    $('#numero').val('');
    $('#piso').val('');
    $('#departamento').val('');
    $('#localidad').val('');
    $('#provincia').val('');

}

function ClearNotifications() {
    $('#notification').empty();
}

function Error(mensaje) {
    var msj = '<p class="alert-danger">' + mensaje + '</p>';
    $notif.append(msj);
}

function Exito(mensaje) {
    var msj = '<p class="alert-success">' + mensaje + '</p>';
    $notif.append(msj);
}


/***********PRUEBA DE AJAX PARA MODAL CAMBIAR CONTRASEÑA************************************/

$('#btnCambiarClave').click(function (e) {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

    var parametros = {
        passVieja: $('#passanterior').val(),
        passNueva: $('#passnueva').val(),
        passRepetida: $('#passnuevarepetida').val()
    };

    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'DatosPersonales.aspx/CambiarClave',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');

            //window.location.reload();
            ClearModal();
            Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla

            Error("No se ha podido realizar la consulta");

        }
    });
});

/**************Ajax para Agregar direccion de facturacion*******/
$('#btnGrabarDireccionDeFacturacion').click(function (e) {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

    var parametros = {
        calle: $('#calle').val(),
        numero: $('#numero').val(),
        piso: $('#piso').val(),
        departamento: $('#departamento').val(),
        localidad: $('#localidad').val(),
        ddlprovincia: $('#ddlProvincia').val()
        //ddlprovincia: $("#ddlProvincia option:selected").text()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'DatosPersonales.aspx/GrabarDireccionDeFacturacion',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            alert("Holaaa entre");
            //window.location.reload();
            ClearModalFacturacion();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
});


/**************Ajax para Agregar direccion de facturacion*******/
$('#btnGrabarDireccionDeEnvio').click(function (e) {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

    var parametros = {
        calleEnvio: $('#calleEnvio').val(),
        numeroEnvio: $('#numeroEnvio').val(),
        pisoEnvio: $('#pisoEnvio').val(),
        departamentoEnvio: $('#departamentoEnvio').val(),
        localidadEnvio: $('#localidadEnvio').val(),
        ddlprovinciaEnvio: $('#ddlProvinciaEnvio').val()
        //ddlprovincia: $("#ddlProvincia option:selected").text()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'DatosPersonales.aspx/btnGrabarDireccionDeEnvio',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            alert("Holaaa entre");
            //window.location.reload();
            ClearModalFacturacion();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
});