<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true"  CodeBehind="ListaDeDeseos.aspx.cs" Inherits="TFI.GUI.ListaDeDeseos" %>

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
        <h1 class="page-header">Lista de desos <small>Mi Cuenta</small>
        </h1>
    </div>
<%--    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h3 id="myModalLabel">Eliminar</h3>
        </div>
        <div class="modal-body">
            <p></p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
            <button data-dismiss="modal" class="btn red" id="btnYes">Confirmar</button>
        </div>
    </div>--%>


    <div>

        <table class="table-bordered col-md-12" id="tlbPedido">
            <thead>
                <tr>
                    <th class="text-center" id="txtProducto">Producto</th>
                    <th class="text-center" id="txtDescripcion">Descripción</th>
                    <th class="text-center" id="txtPrecioUnitario">Precio Unitario</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <asp:Repeater ID="lstProductos" ClientIDMode="Static" runat="server">
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
                                <asp:button Cssclass="btn btn-info" ID="btnComprar2" runat="server" data-producto2='<%#Eval("IdProducto")%>' Text="Comprar" OnClientClick="return onBtnComprar(this)" onClick="btnComprarListaDeseos" />
                            </td>
                        </tr>

                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
            <tfoot>
            </tfoot>
        </table>

    </div>

<%--    <div class="modal fade" tabindex="-1" role="dialog">
        <form id="mdl_pedido_agregado">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" style="color: #29ab29;">Felicitaciones!</h3>
                    </div>
                    <div class="modal-body text-center">
                        <h4 id="mdl_pedido_titulo" style="color: black;">El producto <span id="prod"></span>fue correctamente agregado en tu carrito!</h4>
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
                            <button type="button" id="btn-pedidos" class="btn btn-warning" style="width: 200px;">Ir a Pedidos</button>
                            <button type="button" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal">Seguir Comprado</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>--%>




</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
