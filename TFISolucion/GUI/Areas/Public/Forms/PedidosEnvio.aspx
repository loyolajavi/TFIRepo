<%@ Page Title="Envio" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="PedidosEnvio.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosEnvio" %>

<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <input value="<%=seleccionado%>" id="selId" hidden="hidden" />
    <input value="<%=formaEnvioId%>" id="formaEnvioId" hidden="hidden" />

    <div>
        <h1><%=Resources.Global.DatosPersonales%>/h1>
        <hr />
    </div>
    <div class="col-md-12 col-sm-6">
        <div class="box">
            <h4 class="box-title"><%=Resources.Global.SeleccionaMetodoDeRetiro%></h4>
            <hr class="barras" />
            <div>
                <table class="table table-bordered">
                    <tr>
                        <td style="vertical-align: middle">
                            <div class="td-centrado">
                                <input type="radio" id="rdCorreo" data-envio="1" />
                            </div>
                        </td>
                        <td style="vertical-align: middle">
                            <div class="td-centrado">
                                <h4><%=Resources.Global.Correo%></h4>
                            </div>
                        </td>
                        <td>
                            <h4><%=Resources.Global.EnvioTodoPais %></h4>
                            <h5><%=Resources.Global.EstimacionEnvio %></h5>
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
                                <input type="radio" id="rdRetiro" data-envio="2" />
                            </div>
                        </td>
                        <td style="vertical-align: middle; max-width: 60px;">
                            <div class="td-centrado">
                                <h4><%=Resources.Global.Sucursal%></h4>
                            </div>
                        </td>
                        <td>
                            <h4><%=Resources.Global.RetiroPorSucursal%></h4>
                            <h5><%=Resources.Global.TiempoEntregaSucursal%></h5>
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
                <h4 class="box-title"><%=Resources.Global.SeleccionaMetodoDeRetiro%></h4>
                <hr class="barras" />
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <h5><%=Resources.Global.SucursalDisponibles%></h5>
                        </td>
                        <td>
                            <select id="sucursalesDisponibles" style="padding: 10px; width: 400px;">
                                <option value=""><%=Resources.Global.Seleccione%></option>
                                <% if (sucursalesDisponibles.Any())
                                    {
                                        foreach (var suc in sucursalesDisponibles)
                                        {%>
                                <option value="<%=suc.IdSucursal%>" <%if (suc.IdSucursal == seleccionado)
                                    {%>
                                    selected="selected" <% } %>><%=suc.DescripSucursal%> | <%=suc.Direccion.Calle%> <%=suc.Direccion.Numero %> | <%=suc.Direccion.Localidad %> </option>
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
                <button class="btn btn-lg btn-warning pull-right btn-caja" type="button" id="btnConfirmar"><%=Resources.Global.ConfirmacionPago%></button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>

        var sel = function () {
            var formaEnvio = $('#formaEnvioId').val();

            if (formaEnvio == 1) {
                $('#rdCorreo').prop('checked', 'true');
            }
            else if (formaEnvio == 2) {
                $('#rdRetiro').prop('checked', 'true');
                $('#sucursales').removeAttr('hidden');
            }
        };

        sel();

        $('#rdCorreo').click(function () {
            if ($(this).prop('checked')) {
                updateFormaEnvio($(this).data('envio'));
                $('#rdRetiro').prop('checked', false);
                $('#sucursales').prop('hidden', 'hidden');
            }
        });

        $('#rdRetiro').click(function () {

            if ($(this).prop('checked')) {
                updateFormaEnvio($(this).data('envio'));
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

        var EjecutarAjax = function (id, accion) {
            $.ajax({
                type: "POST",
                url: "PedidosEnvio.aspx/" + accion,
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

        var seleccionar = function (id) {
            EjecutarAjax(id, "Seleccionar");
        }

        var updateFormaEnvio = function (id) {
            EjecutarAjax(id, "FormaEnvio");

        }
    </script>
</asp:Content>
