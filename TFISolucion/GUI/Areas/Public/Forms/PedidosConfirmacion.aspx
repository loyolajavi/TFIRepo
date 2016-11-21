<%@ Page Title="Pago" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="PedidosConfirmacion.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosConfirmacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ClientIDMode="Static" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <input type="text" id="pedidoId" value="<%=pedido%>" hidden="hidden" />

    <div>
        <h1>Confirmación Pago</h1>
        <hr />
    </div>

    <div class="col-md-12 col-sm-6">
        <div class="box" id="resumenBox" style="padding-bottom: 70px;">
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
                        <% if (FormaEntrega != null)
                           {
                        %>
                        <tr>
                            <td colspan="2">Envio <strong><%=((TFI.Entidades.FormaEntregaEntidad.Options)FormaEntrega).ToString() %></strong></td>
                            <td class="td-centrado"><%if (FormaEntrega == 1)
                                                      {%> 200.00 <% }
                                                      else
                                                      { %> Gratis! <%} %></td>
                        </tr>
                        <% } %>
                        <tr>
                            <td colspan="2">
                                <h4><%=Resources.Global.Total%></h4>
                            </td>
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
                    style="margin-bottom: 30px;">
                    <%=Resources.Global.ConfiirmarPedido%>
                </button>
            </div>
        </div>
        <div id="pagos" class="box text-center" hidden="hidden" style="padding-bottom: 180px;">
            <div class="col-md-8">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th colspan="2" class="text-center">Medios de Pago:
                            </th>
                        </tr>
                    </thead>
                    <tr>
                        <td>Transferencia</td>
                        <td>
                            <button type="button" class="btn btn-success" id="btTrasnferencia">Enviar Datos</button>
                        </td>
                    </tr>
                    <tr>
                        <td>Mercado Pago</td>
                        <td>

                            <%@ Import Namespace="mercadopago" %>
                            <%@ Import Namespace="System.Collections" %>

                            <%
                                MP mp = new MP("3663689865954092", "beN3ndKWpKW2QYdFl0iF8LsU6i05wXhg");

                                var Current = HttpContext.Current;

                                var prods = (List<TFI.GUI.Helpers.DTO.PedidoLista>)Current.Session["Pedido"];
                                
                                var count = 0;
                                string list = "";
                                foreach (var p in prods)
                                {
                                    var o = new
                                    {
                                        title = p.Producto.DescripProducto,
                                        quantity = p.Cantidad,
                                        currency_id = "ARS",
                                        unit_price = p.Producto.PrecioUnitario
                                    };
                                    var coma = "";
                                    if(count < prods.Count-1)
                                        coma = ",";                                    
                                    list = list + Newtonsoft.Json.JsonConvert.SerializeObject(o) + coma;
                                    count++;
                                };
                                
                                string preferenceData = "{\"items\":" +
                                                            "[" + list + "]" +
                                                         "}";

                                Hashtable preference = mp.createPreference(preferenceData);

                            %>
                            <a class="btn btn-success" href="<%Response.Write(((Hashtable)preference["response"])["init_point"]); %>" id="btnPagarMP">Pagar con MP</a>
                        </td>
                        <td>
                            <asp:Button CssClass="btn btn-success" ID="btnPagar" runat="server" OnClick="btnPagar_Click" Text="Pagar"></asp:Button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div id="mdl_pedido" class="modal fade" tabindex="-1" role="dialog">

        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" style="color: #de5900;">Felicitaciones!</h3>
                </div>
                <div class="modal-body text-center">
                    <h4 id="mdl_pedido_titulo" style="color: black;">El pedido N° : <span id="prod"></span>fue correctamente generado!</h4>
                    <h4>Por favor seleccione una la forma de pago que desee.</h4>
                </div>
                <div class="modal-footer">
                    <div class="text-center">
                        <button type="button" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal">Continuar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="mdl_transferencia" class="modal fade" tabindex="-1" role="dialog">

        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h3 class="modal-title" style="color: #de5900;">Enviado!</h3>
                </div>
                <div class="modal-body text-center">
                    <h4>Mail con datos transferencia enviado satisfactoriamente.</h4>
                </div>
                <div class="modal-footer">
                    <div class="text-center">
                        <a class="btn" style="width: 200px; background-color: black; color: #fff;" href="Home.aspx" id="btnContinuarCierre">Continuar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>

        function redimensionar() {
            $('#resumenBox').removeAttr("style");
            $('#pagos').removeAttr('hidden');
        };

        function Validar() {
            if ($('#pedidoId').val() != "") {
                $('.pasos').hide();
                redimensionar();
            }

        };

        Validar();

        $('#btnConfirmar').click(function () {

            $.ajax({
                type: "POST",
                url: "PedidosConfirmacion.aspx/GenerarPedido",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (data) {
                    $('#pagos').removeAttr('hidden');
                    $('.pasos').hide();
                    $('#pedidoId').val(data.d);
                    redimensionar();
                    showSuccess(data.d);
                }
            });
        });

        var showSuccess = function (id) {
            var $modal = $('#mdl_pedido');
            $modal.find('#prod').text(id);
            $modal.modal("show");
        };

        var showComplete = function () {
            var $modal = $('#mdl_transferencia');
            $modal.modal("show");
        }

        $('#btTrasnferencia').click(function () {
            $.ajax({
                type: "POST",
                url: "PedidosConfirmacion.aspx/EnviarMailTrasnferencia",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function () {
                    showComplete();
                }
            });
        });


        var limpiarPedido = function () {
            $.ajax({
                type: "POST",
                url: "PedidosConfirmacion.aspx/LimpiarPedido",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },

            });
        }

        $('#btnPagarMP').click(function () {
            limpiarPedido();
        })

        $('#mdl_transferencia').on('hidden.bs.modal', function () {
            limpiarPedido();
        })

        $('#btnContinuarCierre').click(function () {
            limpiarPedido();
        });


    </script>
</asp:Content>