<%@ Page Title="Pedido" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.Pedidos" %>

<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />

    <style>
        .btn-caja {
            border-radius: 0px;
        }
    </style>

    <div>

        <h1><asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, ProductosEnSuPedido %>"></asp:Label></h1>


        <hr />
        <div id="test" runat="server">
            <% if (productos != null && productos.Any())
                {
            %>
            <table class="table-bordered col-md-12" id="tlbPedido">
                <thead>
                    <tr>
                        <th class="text-center" id="txtProducto"><asp:Label ID="lblApellido" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Producto %>"></asp:Label></th>
                        <th class="text-center" id="txtDescripcion"><asp:Label ID="Label1" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Descripcion %>"></asp:Label></th>
                        <th class="text-center" id="txtDiponibilidad"><asp:Label ID="Label2" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Disponibilidad %>"></asp:Label></th>
                        <th class="text-center" id="txtPrecioUnitario"><asp:Label ID="Label3" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, PrecioUnitario %>"></asp:Label></th>
                        <th class="text-center" id="txtCantidad"><asp:Label ID="Label5" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Cantidad %>"></asp:Label>.</th>
                        <th></th>
                        <th class="text-right" id="txtTotal"><asp:Label ID="Label4" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, TotalPorProducto %>"></asp:Label></th>
                    </tr>
                </thead>

                <tbody>
                    <% foreach (var p in lista)
                        {
                    %>
                    <tr class="<%=p.Producto.IdProducto%>">
                        <td class="text-center" style="padding: 7px;">
                            <div class="img-thumbnail img-thumbnail-cart">
                                <img class="img-responsive" src="/Content/Images/Productos/<%=p.Producto.URL%>" style="vertical-align: middle;" />
                            </div>
                        </td>
                        <td class="product-descripcion">
                            <h4><%=p.Producto.DescripProducto%></h4>
                            <small>SKU: <%=p.Producto.CodigoProducto%></small>
                        </td>
                        <td class="text-center">
                            <p>
                                <%if (p.Stock)
                                    { %><span>En Stock</span><% }
                                                                 else
                                                                 { %> <span>Sin Stock</span><% } %>
                            </p>
                        </td>
                        <td class="text-center">
                            <p>
                                <span><%=moneda.SimboloMoneda%></span> <span><%=p.Producto.PrecioUnitario %></span>
                            </p>
                        </td>
                        <td class="text-center">
                            <div class="selection-div">
                                <input size="2" type="text" data-prod="<%=p.Producto.IdProducto%>" class="input-cart-cantidad" value="<%=p.Cantidad%>" disabled />
                                <div>
                                    <a class="cart btn btn-default btn-resta" href="#" title="Menos">-</a>
                                    <a class="cart btn btn-default btn-agrega" id="Mas" href="#" title="Mas">+</a>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-default delete-cart" data-producto="<%=p.Producto.IdProducto%>">
                                <i class=" glyphicon glyphicon-trash"></i>
                            </button>
                        </td>
                        <td class="text-center unitario">
                            <div>
                                <p>
                                    <span><%=moneda.SimboloMoneda%></span> <span id="unitario"><%=p.Producto.PrecioUnitario * p.Cantidad %></span>
                                </p>
                            </div>
                        </td>
                    </tr>

                    <%
                        } %>
                </tbody>
            </table>

            <div class="pasos">
                <input type="button" class="btn btn-lg btn-warning pull-right btn-caja" id="IdContinuarDatosPersonales" value="<%$Resources:Global, ContinuarDatosPersonales %>" runat="server" onclick="ChequearStockPedido()" />
            </div>

            <%
                } %>
        </div>

        <div class="col-lg-12 message" id="notificacionCarritoVacio" runat="server" hidden="hidden"><asp:Label ID="lbldestacados" runat="server" Text="<%$Resources:Global, CarritoVacio %>"></asp:Label></div>
    </div>
    <asp:HiddenField ID="SumaResta" ClientIDMode="Static" runat="server" Value="0" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">


    <script>

        $('.btn-agrega').click(function () {

            var parentInput = $(this).parents('td').find('input');
            var idProducto = parentInput.data('prod');
            var operacion = 1;

            consultarStock(idProducto, (Number(parentInput.val())) + 1, $(this), operacion);
            parentInput = null;
            idProducto = null;
        });

        $('.btn-resta').click(function () {

            var parentInput = $(this).parents('td').find('input');
            var idProducto = parentInput.data('prod');
            var operacion = 0;

            if (Number(parentInput.val() > 1)) {
                consultarStock(idProducto, (Number(parentInput.val())) - 1, $(this), operacion);
                parentInput = null;
                idProducto = null;
            };
        });

        $('.delete-cart').click(function () {
            $.ajax({
                type: "POST",
                url: "Pedidos.aspx/DeleteItem",
                data: '{ id: ' + $(this).data('producto') + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function () {
                    app.reload();

                }
            });
        });


        var consultarStock = function (id, cantidad, control, operacion) {

            $.ajax({
                type: "POST",
                url: "Producto.aspx/consultarStock",
                data: JSON.stringify({
                    id: id,
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (data) {

                    var stockActual = data.d;

                    if (stockActual >= cantidad) {
                        $("#SumaResta").val(1);
                        ActualizarPrecioItem(id, cantidad, control, stockActual, operacion);
                    }
                    else {
                        $("#SumaResta").val(0);
                        alert("No hay más stock");
                    }
                }
            });

        }


        var ActualizarPrecioItem = function (id, cantidad, control, stockActual, operacion) {

            $.ajax({
                type: "POST",
                url: "Pedidos.aspx/ActualizarPrecioItem",
                data: JSON.stringify({
                    id: id,
                    cantidad: cantidad,
                    stockActual: stockActual
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (data) {
                    var parentInput = control.parents('td').find('input');

                    var flagStock = $("#SumaResta").val();
                    if (flagStock == 1) {
                        if (operacion == 1) {
                            parentInput.val(Number(parentInput.val()) + 1);
                        }
                        else if (operacion == 0) {
                            parentInput.val(Number(parentInput.val()) - 1);
                        }
                        
                    }
                    
                    control.parents('tr').find('#unitario').text(parseFloat(data.d).toFixed(2));
                }
            });

        }







    </script>
</asp:Content>
