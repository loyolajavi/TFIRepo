﻿<%@ Page Title="Datos Personales" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="PedidosDireccion.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosDireccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ClientIDMode="Static" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">


    <% if (logueado == null)
       { %>

    <div>
        <h1>Ingreso</h1>
        <hr />
    </div>
    <div class="row">

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title">CREAR UNA CUENTA</h4>
                <hr class="barras" />
                <p id="msgRegistro">Por favor completar registro para poder continuar:</p>
                <div class="clearfix">
                    <br />
                    <label for="box-registro">Registro</label>
                    <br />
                    <a href="RegistroCliente.aspx" id="btnNuevoRegistro" class="btn btn-warning btn-box-registro"><i class="glyphicon glyphicon-lock"></i>&nbsp;Registrarse como Cliente</a>
                    <br />
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title">INICIAR SESION</h4>
                <hr class="barras" />

                <div class="clearfix">
                    <label for="box-registro">Usuario</label>
                    <br />
                    <input type="text" name="name" id="txtUser" />
                    <br />
                    <br />
                    <label for="box-registro">Contraseña</label>
                    <br />
                    <input type="password" id="txtPass" name="name" />
                    <br />
                    <a class="link" href="#">Olvido su contraseña?</a>
                    <br />
                    <br />
                    <div>
                        <a class="btn btn-success btn-box-registro" id="btnRegistro" href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;Iniciar Sesion</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% }
       else
       { %>
    <div>
        <h1>Datos Personales</h1>
        <hr />
    </div>
    <div class="row">
         <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title">Dirección de Envio</h4>
                <hr class="barras" />
                <%if (direccionEnvio != null)
                  { %>
                <div>
                    <table>
                        <tr>
                            <td id="lblNombre" class="td-lbl">Destinatario : </td>
                            <td><%=string.Format("{0} {1}", logueado.Nombre , logueado.Apellido)%></td>
                        </tr>
                        <tr>
                            <td id="lblcalle" class="td-lbl">Calle : </td>
                            <td><%=direccionEnvio.Calle %>  <%=direccionEnvio.Numero %></td>
                        </tr>
                        <tr>
                            <td id="lblProvincia" class="td-lbl">Provincia : </td>
                            <td><%=direccionEnvio.Provincia.DescripcionProvincia%></td>
                        </tr>
                        <tr>
                            <td id="lblLocalidad" class="td-lbl">Localidad : </td>
                            <td><%=direccionEnvio.Localidad%></td>
                        </tr>
                        <tr>
                            <td id="lblTelefono" class="td-lbl">Telefono : </td>
                            <td><%if (telefonoContacto != null)
                                  { %> <%=telefonoContacto.NroTelefono%>
                                <% } else{ %> 
                                Sin teléfono
                                <%} %></td>
                        </tr>
                    </table>
                </div>
                <% }
                  else
                  {%>
                <div>
                    <p>No existe una direccion para envio, por favor cree una.</p>
                </div>
                <%} %>
                <div style="margin-top:40px;">
                    <a class="btn btn-warning" href="DatosPersonales.aspx" >Actualizar Direccion</a>
                </div>
            </div>
        </div>

         <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title">Dirección de Facturación</h4>
                <hr class="barras" />
                <%if (direccionFacturacion != null)
                  { %>
                <div>
                    <table>
                        <tr>
                            <td id="lblFacturacionNombre" class="td-lbl">Destinatario : </td>
                            <td><%=string.Format("{0} {1}", logueado.Nombre , logueado.Apellido)%></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacioncalle" class="td-lbl">Calle : </td>
                            <td><%=direccionFacturacion.Calle %>  <%=direccionEnvio.Numero %></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacionProvincia" class="td-lbl">Provincia : </td>
                            <td><%=direccionFacturacion.Provincia.DescripcionProvincia%></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacionLocalidad" class="td-lbl">Localidad : </td>
                            <td><%=direccionFacturacion.Localidad%></td>
                        </tr>
                        <tr>
                            <td id="lblFacturacionTelefono" class="td-lbl">Telefono : </td>
                            <td><%if (telefonoContacto != null)
                                  { %> <%=telefonoContacto.NroTelefono%>
                                <% } else{ %> 
                                Sin teléfono
                                <%} %></td>
                        </tr>
                    </table>
                </div>
                <% }
                  else
                  {%>
                <div>
                    <p>No existe una direccion para facturación, por favor cree una.</p>
                </div>
                <%} %>
                <div style="margin-top:40px;">
                    <a class="btn btn-warning" href="DatosPersonales.aspx" >Actualizar Direccion</a>
                </div>

            </div>
        </div>
    </div>
    
    
    <% } %>

    <div class="row" style="margin-bottom: 50px;">
        <div class="pasos">
             <a class="btn btn-lg btn-warning pull-right btn-caja" href="PedidosEnvio.aspx">Envio</a>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Scripts" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>

        $('#btnRegistro').click(function () {

            var user = $('#txtUser').val();
            var pass = $('#txtPass').val();

            $.ajax({
                type: "POST",
                url: "PedidosDireccion.aspx/Login",
                data: JSON.stringify({
                    user: user,
                    pass: pass
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function () { app.reload(); }
            });
        });
    </script>
</asp:Content>