<%@ Page Title="Pago" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="PedidosConfirmacion.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosConfirmacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <div>
        <h1>Confirmación Pago</h1>
        <hr />
    </div>

    <div class="col-md-12 col-sm-6">
        <div class="box">
            <h4 class="box-title">Selección forma de Pago:</h4>
            <hr class="barras" />
            <div>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th colspan="3">RESUMEN</th>
                        </tr>
                        <tr>
                            <td><%=Resources.Global.Descripcion%></td>
                            <td class="td-centrado"><%=Resources.Global.Cantidad%></td>
                            <td class="td-centrado"><%=Resources.Global.Total%></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%if (lista.Any())
                          {
                              foreach (var item in lista)
                              {%>
                                <tr>
                                    <td><%=item.Producto.DescripProducto%></td>
                                    <td class="td-centrado"><%=item.Cantidad%></td>
                                    <td class="td-centrado"><%=item.Cantidad * item.Producto.PrecioUnitario%></td>
                                </tr>
                            <%}
                          }%>
                           
                    </tbody>
                    <tfoot>
                        <% if (FormaEntrega != null) {
                             %>
                            <tr>
                                <td colspan="2">Envio <strong><%=((TFI.Entidades.FormaEntregaEntidad.Options)FormaEntrega).ToString() %></strong></td>
                                <td class="td-centrado"><%if (FormaEntrega == 1) {%> 200.00 <% }else{ %> Gratis! <%} %></td>
                            </tr>
                        <% } %>
                        <tr>
                            <td colspan="2"><h4><%=Resources.Global.Total%></h4></td>
                            <td class="td-centrado"><%=Math.Round(totalizado,2) %></td>
                        </tr>
                    </tfoot>
                </table>

            </div>
            <div class="pasos" style="margin-bottom: 20px;">
                <button class="btn btn-lg btn-warning pull-right btn-caja" 
                        type="button" 
                        runat="server" 
                        id="btnConfirmar"
                        style="margin-bottom:30px;"><%=Resources.Global.ConfiirmarPedido%>
                </button>
            </div>
            <div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th colspan="3">Medios de Pago:
                            </th>
                        </tr>
                    </thead>
                    <tr>
                        <td>
                            <input type="radio" id="transferencia" />
                        </td>
                        <td>Transferencia</td>
                        <td>boton</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" id="mercadoPago" />
                        </td>
                        <td>Mercado Pago</td>
                        <td>boton</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>
        $('#btnConfirmar').click(function () {

        });
    </script>

</asp:Content>