<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="ListaDeDeseos.aspx.cs" Inherits="TFI.GUI.ListaDeDeseos" %>

<%@ MasterType VirtualPath="~/Shared/MiCuenta.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">


    <style>
        .img-Logo {
            height: 80%;
            max-height: 40px;
            border-radius: 0px;
            width: 80%;
            max-width: 30px;
            margin: 0 auto;
        }
    </style>

    <link href="/Content/css/propios/Pedido.css" rel="stylesheet" />
    <div class="col-lg-12">
        <h1 class="page-header"><asp:Label ID="lbldestacados" runat="server" Text="<%$Resources:Global, ListaDeseos %>"></asp:Label><small><asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, MiCuenta %>"></asp:Label></small>
        </h1>
    </div>



    <div>

        <table class="table-bordered col-md-12" id="tlbPedido">
            <thead>
                <tr>
                    <th class="text-center" id="txtProducto"><asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, Producto %>"></asp:Label></th>
                    <th class="text-center" id="txtDescripcion"><asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, Descripcion %>"></asp:Label></th>
                    <th class="text-center" id="txtPrecioUnitario"><asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, PrecioUnitario %>"></asp:Label></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <tbody id="cuerpoTablaDeseos">
<%--                <asp:Repeater ID="lstProductos" runat="server">
                    <ItemTemplate>
                        <tr class=<%#Eval("IdProducto")%>>
                            <td class="text-center" style="padding: 7px;">
                                <div class="img-thumbnail img-thumbnail-cart">
                                    <img class="img-responsive" src="/Content/Images/Productos/<%#Eval("URL")%>" style="vertical-align: middle;" />
                                </div>
                            </td>
                            <td class="product-descripcion">
                                <h4><%#Eval("DescripProducto")%></h4>
                                <small>SKU: <%#Eval("CodigoProducto")%></small>
                            </td>
                            <td class="text-center">
                                <p>
                                    <span>ARS</span> <span>$</span> <span><%#Eval("PrecioUnitario")%></span>
                                </p>
                            </td>
                            <td class="text-center">
                                  <asp:button CssClass="btn btn-info" ID="btnComprar2" runat="server" data-producto2='<%#Eval("IdProducto")%>' Text="<%$Resources:Global, Comprar %>" OnClientClick="onBtnComprar(this)" />--%>
                                <%--<asp:button CssClass="btn btn-info" ID="Button1" runat="server" data-producto2='<%#Eval("IdProducto")%>' Text="<%$Resources:Global, Comprar %>" OnClientClick="return onBtnComprar(this)" onClick="ComprarListaDeseos" />--%>
   <%--                         </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>--%>

                <%--//PRUEBA - COMENTAR AL EJECUTAR--%>
<%--                "<tr class="\{0}\">" +
                            "<td class=\"text-center\" style=\"padding: 7px;\">" + 
                                "<div class=\"img-thumbnail img-thumbnail-cart\">" + 
                                    "<img class=\"img-responsive\" src=\"/Content/Images/Productos/{1}\" style=\"vertical-align: middle;\" />" + 
                                "</div>" + 
                            "</td>" + 
                            "<td class=\"product-descripcion\">" + 
                                "<h4>{2}</h4>" + 
                                "<small>SKU: {3}</small>" + 
                            "</td>" + 
                            "<td class="\text-center\">" + 
                                "<p>" + 
                                    "<span>ARS</span> <span>$</span> <span>{4}</span>" + 
                                "</p>" + 
                            "</td>" + 
                            "<td class=\"text-center\">" + 
                                  "<asp:button CssClass=\"btn btn-info\" ID=\"btnComprar2\" runat=\"server\" data-producto2='{5}' Text=\"Comprar\" OnClientClick=\"return onBtnComprar(this)\" />" + 
                            "</td>" + 
                        "</tr>";--%>
                <%--ENDPRUEBA--%>


            </tbody>
            <tfoot>
            </tfoot>
        </table>

    </div>

    <div class="modal fade" tabindex="-1" role="dialog">
        <form id="mdl_pedido_agregado">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          <h3 class="modal-title" style="color: #29ab29;"><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, Felicitaciones %>"></asp:Label></h3>
                    </div>
                    <div class="modal-body text-center">
                         <h4 id="mdl_pedido_titulo" style="color: black;"><asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, ElProducto %>"></asp:Label> <span id="prod"></span><asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, ProductoCorrectamenteAgregadoAlCarrito %>"></asp:Label></h4>
                    </div>
                    <div class="modal-footer">
                        <%--<div class="text-center">
                            <button type="button" id="btn-pedidos" class="btn btn-warning" style="width: 200px;">Ir a Pedidos</button>
                            <button type="button" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal">Seguir Comprado</button>
                        </div>--%>
                    </div>
                </div>
            </div>
        </form>
    </div>


    <script>


       
    </script>



</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">


    <script>

        actualizarDeseos();
        //updateDeseos();
        //updateProductos();
    </script>

</asp:Content>
