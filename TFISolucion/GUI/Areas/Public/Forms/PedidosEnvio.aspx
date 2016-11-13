<%@ Page Title="Envio" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="PedidosEnvio.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosEnvio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <input value="<%=seleccionado%>" id="selId"  hidden="hidden"/>

    <div>
        <h1>Datos Personales</h1>
        <hr />
    </div>
    <div class="col-md-12 col-sm-6">
        <div class="box">
            <h4 class="box-title">Selección forma de retiro:</h4>
            <hr class="barras" />
            <div>
                <table class="table table-bordered">
                    <tr>
                        <td style="vertical-align: middle">
                            <div class="td-centrado">
                                <input type="radio" id="rdCorreo" />
                            </div>
                        </td>
                        <td style="vertical-align: middle">
                            <div class="td-centrado">
                                <h4>Correo</h4>
                            </div>
                        </td>
                        <td>
                            <h4>Correo a todo el Pais</h4>
                            <h5>Tiempo estimado de entrega 3 a 5 dias.</h5>
                        </td>
                        <td style="vertical-align: middle">
                            <div class="td-centrado">
                                <span class="precio">$ 200</span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle;">
                            <div class="td-centrado">
                                <input type="radio" id="rdRetiro" />
                            </div>
                        </td>
                        <td style="vertical-align: middle; max-width: 60px;">
                            <div class="td-centrado">
                                <h4>Sucursal</h4>
                            </div>
                        </td>
                        <td>
                            <h4>Retiro por sucursal</h4>
                            <h5>Tiempo de entrega: INMEDIATA, solo titular de tarjeta de crédito con DNI.</h5>
                        </td>
                        <td style="vertical-align: middle">
                            <div class="td-centrado">
                                <span class="precio"></span>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="sucursales" hidden="hidden">
                <h4 class="box-title">Selección forma de retiro:</h4>
                <hr class="barras" />
                <table class="table table-bordered">
                    <tr>
                        <td><h5>Sucursales disponibles:</h5></td>
                        <td>
                            <select id="sucursalesDisponibles" style="padding:10px; width: 300px;">
                                <option value="">Seleccione...</option>
                                <% if (sucursalesDisponibles.Any()) {
                                       foreach (var suc in sucursalesDisponibles)
                                       {%>
                                        <option value="<%=suc.IdSucursal%>" <%if (suc.IdSucursal == seleccionado) {%> selected="selected"<% } %>><%=suc.DescripSucursal%> | <%=suc.Direccion.Calle%> <%=suc.Direccion.Numero %> </option>
                                    <%}
                                   } %>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    <div class="row" style="margin: 20px;">
        <div class="pasos">
             <button class="btn btn-lg btn-warning pull-right btn-caja" type="button" id="btnConfirmar">Confirmar Pago</button>
        </div>
    </div>

    </div>

   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>

        

        var sel = function() {
            if ($('#selId').val() != "")
            {
                $('#rdRetiro').prop('checked', 'true');
                $('#sucursales').removeAttr('hidden');
            }
        };

        sel();

        $('#rdCorreo').click(function () {
            if ($(this).prop('checked')) {
                $('#rdRetiro').prop('checked', false);
                $('#sucursales').prop('hidden', 'hidden');
            }
        });

        $('#rdRetiro').click(function () {
            if ($(this).prop('checked')) {
                $('#rdCorreo').prop('checked', false);
                $('#sucursales').removeAttr('hidden');
            }
        });

        $('#sucursalesDisponibles').on('change', function () {
            seleccionar($(this).val());
        })

        $('#btnConfirmar').click(function () {
            app.redirect('PedidosConfirmacion.aspx');
        });


        var seleccionar = function (id) {

            $.ajax({
                type: "POST",
                url: "PedidosEnvio.aspx/Seleccionar",
                data: JSON.stringify({
                    id: id
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                }                
            });

        }


    </script>
</asp:Content>