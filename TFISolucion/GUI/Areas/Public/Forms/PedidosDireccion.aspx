<%@ Page Title="Datos Personales" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="PedidosDireccion.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosDireccion" %>

<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ClientIDMode="Static" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">


    <% if (logueado == null)
        { %>

    <div>
        <h1><%=Resources.Global.Ingresar%></h1>
        <hr />
    </div>
    <div class="row">

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title"><%=Resources.Global.CrearUnaCuenta%></h4>
                <hr class="barras" />
                <p id="msgRegistro"><%=Resources.Global.CompletarRegistroParaSeguir%></p>
                <div class="clearfix">
                    <br />
                    <label for="box-registro"><%=Resources.Global.Registro%></label>
                    <br />
                    <a href="RegistroCliente.aspx" id="btnNuevoRegistro" class="btn btn-warning btn-box-registro"><i class="glyphicon glyphicon-lock"></i>&nbsp;<%=Resources.Global.RegistrarseComoCliente%></a>
                    <br />
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title"><%=Resources.Global.IniciarSesion%></h4>
                <hr class="barras" />

                <div class="clearfix">
                    <label for="box-registro"><%=Resources.Global.Usuario%></label>
                    <br />
                    <%--<input type="text" name="name" id="txtUser" />--%>
                    <input type="text" runat="server" class="form-control" id="txtUsuario" placeholder="Usuario" />
                    <label for="box-registro"><%=Resources.Global.Contrasena%></label>
                    <br />
                    <%--<input type="password" id="txtPass" name="name" />--%>
                    <input type="password" runat="server" class="form-control" id="txtClave" placeholder="Clave" />
                    <br />
                    <div>
                        <%--<i class="glyphicon glyphicon-user"></i>&nbsp;<%=Resources.Global.IniciarSesion%>--%>
                        <asp:Button CssClass="btn btn-success btn-box-registro" ID="btnRegistro" OnClick="btnRegistro_Click" runat="server" Text="<%$Resources:Global, IniciarSesion %>" ></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% }
        else
        { %>
    <div>
        <h1><%=Resources.Global.DatosPersonales%></h1>
        <hr />
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title"><%=Resources.Global.DireccionesDeEnvio%></h4>
                <hr class="barras" />
                <%if (direccionEnvio != null)
                    { %>
                <div>
                    <table>
                        <tr>
                            <td id="lblNombre" class="td-lbl"><%=Resources.Global.Destinatario%> : </td>
                            <td><%=string.Format("{0} {1}", logueado.Nombre , logueado.Apellido)%></td>
                        </tr>
                        <tr>
                            <td id="lblcalle" class="td-lbl"><%=Resources.Global.Calle%> </td>
                            <td><%=direccionEnvio.Calle %>  <%=direccionEnvio.Numero %></td>
                        </tr>
                        <tr>
                            <td id="lblProvincia" class="td-lbl"><%=Resources.Global.Provincia%> </td>
                            <td><%=direccionEnvio.Provincia.DescripcionProvincia%></td>
                        </tr>
                        <tr>
                            <td id="lblLocalidad" class="td-lbl"><%=Resources.Global.Localidad%> </td>
                            <td><%=direccionEnvio.Localidad%></td>
                        </tr>
                        <tr>
                            <td id="lblTelefono" class="td-lbl"><%=Resources.Global.Telefono%> </td>
                            <td><%if (telefonoContacto != null)
                                    { %> <%=telefonoContacto.NroTelefono%>
                                <% }
                                else
                                { %> 
                                Sin teléfono
                                <%} %></td>
                        </tr>
                    </table>
                </div>
                <% }
                    else
                    {%>
                <div>
                    <p><%=Resources.Global.NoExisteDireccionDeEnvio%> </p>
                </div>
                <%} %>
                <div style="margin-top: 40px;">
                    <a class="btn btn-warning" href="DatosPersonales.aspx"><%=Resources.Global.ActualizarDireccion%></a>
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title"><%=Resources.Global.DireccionDeFacturacion%></h4>
                <hr class="barras" />
                <%if (direccionFacturacion != null)
                    { %>
                <div>
                    <table>
                        <tr>
                            <td id="lblFacturacionNombre" class="td-lbl"><%=Resources.Global.Destinatario%></td>
                            <td><%=string.Format("{0} {1}", logueado.Nombre , logueado.Apellido)%></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacioncalle" class="td-lbl"><%=Resources.Global.Calle%> </td>
                            <td><%=direccionFacturacion.Calle %>  <%=direccionEnvio.Numero %></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacionProvincia" class="td-lbl"><%=Resources.Global.Provincia%> </td>
                            <td><%=direccionFacturacion.Provincia.DescripcionProvincia%></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacionLocalidad" class="td-lbl"><%=Resources.Global.Localidad%> </td>
                            <td><%=direccionFacturacion.Localidad%></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacionTelefono" class="td-lbl"><%=Resources.Global.Telefono%> </td>
                            <td><%if (telefonoContacto != null)
                                    { %> <%=telefonoContacto.NroTelefono%>
                                <% }
                                else
                                { %> 
                                Sin teléfono
                                <%} %></td>
                        </tr>
                    </table>
                </div>
                <% }
                    else
                    {%>
                <div>
                    <p><%=Resources.Global.NoExisteDireccionDeFacturacion%></p>
                </div>
                <%} %>
                <div style="margin-top: 40px;">
                    <a class="btn btn-warning" href="DatosPersonales.aspx"><%=Resources.Global.ActualizarDireccion%></a>
                </div>

            </div>
        </div>
    </div>


    <% } %>

    <div class="row" style="margin-bottom: 50px;">
        <div class="pasos">
            <a class="btn btn-lg btn-warning pull-right btn-caja" href="PedidosEnvio.aspx"><%=Resources.Global.Enviar%></a>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Scripts" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>

        //$('#btnRegistro').click(function () {

        //    var elUsuario = $('#txtUser').val();
        //    var laClave = $('#txtPass').val();

        //    $.ajax({
        //        type: "POST",
        //        url: "LayoutBasico.master/RealizarLogueo",
        //        data: JSON.stringify({
        //            elUsuario: elUsuario,
        //            laClave: laClave
        //        }),
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        error: function (xhr, status, error) {
        //            alert(error);
        //        },
        //        success: function () { app.reload(); }
        //    });
        //});
    </script>
</asp:Content>
