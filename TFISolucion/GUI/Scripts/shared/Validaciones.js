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
//$('#btnGrabarDireccionDeFacturacion').click(function (e) { onBtnGrabarClick(this) })

function onBtnGrabarClick()
{
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
            //window.location.reload();
            ClearModalFacturacion();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
    return true;
};


/**************Ajax para Agregar direccion de facturacion*******/
//$('#btnGrabarDireccionDeEnvio').click(function (e) {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

function onbtnGrabarEnvio (){

    var parametros = {
        calleEnvio: $('#calleenvio').val(),
        numeroEnvio: $('#numeroenvio').val(),
        pisoEnvio: $('#pisoenvio').val(),
        departamentoEnvio: $('#departamentoenvio').val(),
        localidadEnvio: $('#localidadenvio').val(),
        ddlprovinciaEnvio: $('#ddlProvinciaEnvio').val()
        //ddlprovincia: $("#ddlProvincia option:selected").text()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'DatosPersonales.aspx/GrabarDireccionDeEnvio',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            //window.location.reload();
            ClearModalFacturacion();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
    return true;
};

/***************************** FUNCIONES LUCAS  **************//////////////

/***************************** FUNCIONES DE CONTENIDO QUIENES SOMOS  **************//////////////
function onbtnActualizar() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

    var parametros = {
        NombreEmpresa: $('#NombreEmpresa').val(),
        TelefonoEmpresa: $('#TelefonoEmpresa').val(),
        MailEmpresa: $('#MailEmpresa').val(),
        QuienesSomos: $('#QuienesSomos').val(),
        Mision: $('#Mision').val(),
        Vision: $('#Vision').val()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'GestionContenidoQuienesSomos.aspx/ActualizarContenidoQuienesSomos',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            //window.location.reload();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
    return true;
};


function onbtnGrabarProducto() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var parametros = {
        codigoproducto: $('#codigo').val(),
        descripcion: $('#descripcion').val(),
        marca: $('#ddlmarcamodal').val(),
        iva: $('#ddlivamodal').val(),
        precio: $('#preciounitario').val(),
        url: $('#url').val(),
        detalle: $('#descriplarga').val(),
        categoria: $('#ddlcategoriamodal').val()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'GestionContenidoProductos.aspx/GrabarProducto',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            //window.location.reload();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
    return true;
};


function onbtnGrabarCategoria() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var parametros = {
        descripcion: $('#descripcion').val()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'GestionContenidoCategorias.aspx/GrabarCategoria',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            //window.location.reload();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
    return true;
};

function onbtnAsociarCategoria() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var parametros = {
        producto: $('#ddlProducto').val(),
        categoria: $('#ddlCategoria').val()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'GestionContenidoProdCat.aspx/GrabarAsociacion',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            //window.location.reload();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");

        }
    });
    return true;
};