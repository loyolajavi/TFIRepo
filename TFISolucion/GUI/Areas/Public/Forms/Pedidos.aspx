<%@ Page Title="Pedido" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <style>
        th {
            padding: 7px 8px 9px 8px;
        }

        .message {
            height: 35px;
            background-color: #1c2069;
            padding: 10px;
            color: white;
            font-size: 11px;
            font-weight: bold;
        }

        .space {
            height: 50px;
            margin-bottom: 100px;
        }

        .img-thumbnail {
            height: 90px;
            width: 90px;

        }

        .product-descripcion {
            padding: 10px;
        }

        .cart_quantity_input {
            height: 30px;
            line-height: 27px;
            padding: 0;
            text-align: center;
            width: 48px;
            background: #fbfbfb;
            text-align: center;
        }

        .cart {
            margin-top: 4px;
            border-radius: 0px;
            width: 22px;
            text-align: center;
            vertical-align: middle;
            padding: 1px;
        }
    </style>
    
    <div>

        <h1>Productos en su pedido</h1>
        <hr />
        <div id="test" runat="server">
            <% if (productos != null && productos.Any())
               {
            %>
            <table class="table-bordered col-md-12" id="tlbPedido">
                <thead>
                    <tr>
                        <th class="text-center" id="txtProducto">Producto</th>
                        <th class="text-center" id="txtDescripcion">Descripción</th>
                        <th class="text-center" id="txtDiponibilidad">Disponibilidad</th>
                        <th class="text-center" id="txtPrecioUnitario">Precio Unitario</th>
                        <th class="text-center" id="txtCantidad">Cant.</th>
                        <th></th>
                        <th class="text-right" id="txtTotal">Total</th>
                    </tr>
                </thead>

                <tbody>
                    <% foreach (var p in lista)
                       {
                    %>
                    <tr class="<%=p.Producto.IdProducto%>">
                        <td class="text-center" style="padding: 7px;">
                            <div class="img-thumbnail">
                                <img class="img-responsive" src="/Content/Images/Productos/<%=p.Producto.URL%>" />
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
                                <span>ARS</span> <span>$</span> <span><%=p.Producto.PrecioUnitario %></span>
                            </p>
                        </td>
                        <td class="text-center">
                            <div class="selection-div">
                                <input size="2" type="text" data-prod="<%=p.Producto.IdProducto%>" class="cart_quantity_input" value="<%=p.Cantidad%>" />
                                <div>
                                    <a class="cart btn btn-default btn-resta" href="#" title="Less">-</a>
                                    <a class="cart btn btn-default btn-agrega" href="#" title="Add">+</a>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-default delete-cart" data-producto="<%=p.Producto.IdProducto%>">
                                <i class=" glyphicon glyphicon-trash"></i>
                            </button>
                        </td>
                        <td class="text-center unitario" >
                            <div >
                                <p>
                                    <span>ARS</span> <span>$</span> <span><%=p.Producto.PrecioUnitario %></span>
                                </p>
                            </div>
                        </td>
                    </tr>

                    <%
                       } %>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
            <%
               } %>
        </div>
        <hr />
        <div class="col-lg-12 message" id="notificacionCarritoVacio" runat="server" hidden="hidden">d</div>
    </div>
    <br class="space" />

    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>



        $('.btn-agrega').click(function () {

            var parentInput = $(this).parents('td').find('input');

            parentInput.val(Number(parentInput.val()) + 1);
        });

        $('.btn-resta').click(function () {

            var parentInput = $(this).parents('td').find('input');

            if (Number(parentInput.val() != 1)) {
                parentInput.val(Number(parentInput.val()) - 1);
            };
        });

        var getIds = function () {

        }

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
    </script>
</asp:Content>