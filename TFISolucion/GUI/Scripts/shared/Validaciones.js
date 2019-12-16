var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
var $notif = $('#notification');
var $notifAtencion = $('#notificationAtencion');
var $form = $('#formPass');
var $passNueva = $('#passnueva');
var $passVieja = $('#passanterior');
var $passConf = $('#passnuevarepetida');

$('#btnCambiarPassPersonal').on("click", function () {

    ClearModal();
    ClearNotifications();
    $("#modalCambiarPassPersonal").modal("show");
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
    $('#ddlLocalidadAltaFact').val('');
    $('#ddlProvincia').val('');
    $("#modalDireccionFacturacion").modal("hide");
}

function ClearModalEnvio() {
    ClearNotifications();
    $('#calleenvio').val('');
    $('#numeroenvio').val('');
    $('#pisoenvio').val('');
    $('#departamentoenvio').val('');
    $('#ddlLocalidadAltaEnvio').val('');
    $('#ddlProvinciaAltaEnvio').val('');
    $("#modalDireccionenvio").modal("hide");
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

function MsjAtencion(mensaje) {
    $notifAtencion.empty();
    var msj = '<p class="alert-danger">' + mensaje + '</p>';
    $notifAtencion.append(msj);
}


/***********PRUEBA DE AJAX PARA MODAL CAMBIAR CONTRASEÑA************************************/

$('#btnCambiarClave').click(function (e) {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var passnueva = $("#passnueva").val();
    var passRepetida = $("#passnuevarepetida").val();
    var parametros = {
        passVieja: $('#passanterior').val(),
        passNueva: $('#passnueva').val(),
        passRepetida: $('#passnuevarepetida').val()
    };
    if (passnueva == "" | passRepetida == "")
    {
        ClearNotifications();
        Error("Por favor revisar los campos de la nueva contraseña");
        return;
    }
        if(passnueva == passRepetida) {
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
                if (data.d == true)
                {
                    ClearNotifications();
                    Exito("Se ha cambiado la contraseña con exito");
                    ClearModal();
                }
                else
                {
                    ClearNotifications();
                    Error("La contraseña actual no es correcta");
                }
                
                
            },
            error: function (data) {          // función que se va a ejecutar si el pedido falla

                Error("No se ha podido realizar la consulta");

            }
        });
    }
    else
    {
        ClearNotifications();
        Error("Las contraseñas no coinciden");
    }
    
});

/**************Ajax para Agregar direccion de facturacion*******/
//$('#btnGrabarDireccionDeFacturacion').click(function (e) { onBtnGrabarClick(this) })

function onBtnGrabarClick() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

    var parametros = {
        calle: $('#calle').val(),
        numero: $('#numero').val(),
        piso: $('#piso').val(),
        departamento: $('#departamento').val(),
        ddllocalidad: $('#ddlLocalidadAltaFact').val(),
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
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            return false;
        }
    });
    return true;
};


/**************Ajax para Agregar direccion de facturacion*******/
//$('#btnGrabarDireccionDeEnvio').click(function (e) {
//e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea

function onbtnGrabarEnvio() {

    var parametros = {
        calleEnvio: $('#calleenvio').val(),
        numeroEnvio: $('#numeroenvio').val(),
        pisoEnvio: $('#pisoenvio').val(),
        departamentoEnvio: $('#departamentoenvio').val(),
        ddllocalidadEnvio: $('#ddlLocalidadAltaEnvio').val(),
        ddlprovinciaEnvio: $('#ddlProvinciaAltaEnvio').val()
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
            ClearModalEnvio();
            //Exito("Se ha cambiado la contraseña con exito");
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            return false;

        }
    });
    return true;
};

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

    if ($('#preciounitario').val() > 0) {

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
    } else {
        alert("El producto no puede tenes un precio igual o menor a cero.");
    }
};


function onbtnGrabarCategoria() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var parametros = {
        descripcion: $('#descripcion').val()
};
    var Esnumero = $.isNumeric(descripcion);
    //if ((!($('#descripcion').val() == '') || (!Esnumero))) {

        // Ahora hacemos la llamada tipo AJAX utilizando jQuery
        $.ajax({
            type: 'POST', // tipo de llamada (POST, GET)
            url: 'GestionContenidoCategorias.aspx/GrabarCategoria',
            dataType: "json", // el URL del método que vamos a llamar
            // los parámetros en formato JSON
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(parametros), // tipo de datos enviados al servidor
            success: function(data) { // función que se va a ejecutar si el pedido resulta exitoso
                // $('#notification').text('La información ha sido guardada exitosamente.');
                //window.location.reload();
                //Exito("Se ha cambiado la contraseña con exito");
            },
            error: function(data) { // función que se va a ejecutar si el pedido falla
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

function onbtnGrabarStock() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var parametros = {
        IdSuc: $('#hIdSuc').val(),
        IdProd: $('#hIdProd').val(),
        IdAdq: $('#NroAdq').val(),
        ajuste: $('#ajuste').val()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'GestionStock.aspx/AjustarStock',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            if (data.d)
                alert("Ajuste aplicado correctamente");
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

//Comentado a partir del uso de StatePedido
//function onbtnModificarEstado() {
//    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
//    var parametros = {
//        pedido: $('#idpedido').val(),
//        estado: $('#ddlestados').val()
//    };


//    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
//    $.ajax({
//        type: 'POST',                               // tipo de llamada (POST, GET)
//        url: 'OrdenesPedido.aspx/CambiarEstado',
//        dataType: "json",  // el URL del método que vamos a llamar
//        // los parámetros en formato JSON
//        contentType: "application/json; charset=utf-8",
//        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
//        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
//            // $('#notification').text('La información ha sido guardada exitosamente.');
//            //window.location.reload();
//            //Exito("Se ha cambiado la contraseña con exito");
//        },
//        error: function (data) {          // función que se va a ejecutar si el pedido falla
//            alert("ERROR ");
//            //  Error("No se ha podido realizar la consulta");

//        }
//    });
//    return true;
//};


function onbtnGrabarTelefono() {
    //e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
    var parametros = {
        telefono: $('#txtNumero').val(),
        tipoTel: $('#ddlTipoTel').val(),
        codigo: $('#txtCodigo').val()
    };


    // Ahora hacemos la llamada tipo AJAX utilizando jQuery
    $.ajax({
        type: 'POST',                               // tipo de llamada (POST, GET)
        url: 'DatosPersonales.aspx/GrabarTelefono',
        dataType: "json",  // el URL del método que vamos a llamar
        // los parámetros en formato JSON
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parametros),                        // tipo de datos enviados al servidor
        success: function (data) {                      // función que se va a ejecutar si el pedido resulta exitoso
            // $('#notification').text('La información ha sido guardada exitosamente.');
            //window.location.reload();
            //Exito("Se ha cambiado la contraseña con exito");
            location.reload(true);
        },
        error: function (data) {          // función que se va a ejecutar si el pedido falla
            alert("ERROR ");
            //  Error("No se ha podido realizar la consulta");
        }
    });
    
};


//Para permitir multiple grupos de validación en ASP
function IsValidationGroupMatch(control, validationGroup) {
    if ((typeof (validationGroup) == "undefined") || (validationGroup == null)) {
        return true;
    }
    var controlGroup = "";
    if (typeof (control.validationGroup) == "string") {
        controlGroup = control.validationGroup;
    }

    //return (controlGroup == validationGroup);

    var controlValidationGroups = controlGroup.split(",");
    return (controlValidationGroups.indexOf(validationGroup) > -1);
}
