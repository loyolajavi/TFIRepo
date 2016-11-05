<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" CodeBehind="ListaDeDeseos.aspx.cs" Inherits="TFI.GUI.ListaDeDeseos" %>
<%@ MasterType VirtualPath="~/Shared/MiCuenta.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">

    <div class="col-lg-12">
        <h1 class="page-header">Lista de desos <small>Mi Cuenta</small>
        </h1>
    </div>
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
    </div>

    <%--<asp:Repeater ID="rptProductosListaDeseo" ClientIDMode="Static" runat="server">
            <ItemTemplate>
        <table class="table table-striped table-hover table-users">
        <thead>
            <tr>

                <th class="hidden-phone">Producto</th>
                <th></th>
                <th>Precio</th>
                <th></th>
                <th></th>
            </tr>
        </thead>

        <tbody>

            <tr>
                <td><img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="IMAGE" /></td>
                <td class="hidden-phone">Producto ejemplo 1</td>
                <td>22.50</td>
                <td><a class="btn mini blue-stripe" href="{site_url()}admin/editFront/1">Comprar</a></td>

                <td><a href="#" class="confirm-delete btn mini red-stripe" role="button" data-title="johnny" data-id="1">Comprar</a></td>
            </tr>
            <tr>

                <td class="hidden-phone">Producto ejemplo 2</td>
                <td>41.00</td>


                <td><a class="btn mini blue-stripe" href="{site_url()}admin/editFront/2">Eliminar</a></td>

                <td><a href="#" class="confirm-delete btn mini red-stripe" role="button" data-title="kitty" data-id="2">Eliminar</a></td>
            </tr>

        </tbody>

    </table>
                         </ItemTemplate>
        </asp:Repeater>
    </div>--%>



    <%--<div id="ListaDeseosContainer" class="row">
        <%-- ITEMS --%>
      <%--  <asp:Repeater ID="rptProductosListaDeseo" ClientIDMode="Static" runat="server">
            <ItemTemplate>
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail" style="text-align: center;">
                        <img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="IMAGE" />
                        <div class="caption">
                            <h4><a runat="server" class="responsive" href='<%#Eval("IdProducto","Producto.aspx?IdProducto={0}")%>'><%#Eval("DescripProducto")%></a></h4>
                            <h5 class="precio"><span>$</span> <span><%#Eval("PrecioUnitario")%></span></h5>
                        </div>
                        <div class="item-toolbar">
                            <input type="button" value="Comprar" clientidmode="static" class="btn btn-success btn-comprar" runat="server" data-producto='<%#Eval("IdProducto")%>' />
                            <input type="button" value="Mas" data-producto='<%#Eval("IdProducto")%>' clientidmode="static" class="btn btn-info" runat="server" onclick="btnInfoClick" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>--%>



            <div id="test" runat="server">
            <% if (unosProductosListaDeseo != null && unosProductosListaDeseo.Any())
               {
            %>
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
                    <% foreach (var p in unosProductosListaDeseo)
                       {
                    %>
                    <tr class="<%=p.IdProducto%>">
                        <td class="text-center" style="padding: 7px;">
                            <div class="img-thumbnail">
                                <img class="img-responsive" src="/Content/Images/Productos/<%=p.URL%>" />
                            </div>
                        </td>
                        <td class="product-descripcion">
                            <h4><%=p.DescripProducto%></h4>
                            <small>SKU: <%=p.CodigoProducto%></small>
                        </td>
                        <td class="text-center">
                            <p>
                                <span>ARS</span> <span>$</span> <span><%=p.PrecioUnitario %></span>
                            </p>
                        </td>
                        <td class="text-center">
                            <button class="btn btn-default delete-cart" data-producto="<%=p.IdProducto%>">
                                <i class=" glyphicon glyphicon-trash"></i>
                            </button>
                        </td>
                    </tr>

                    <%
                       } %>
                    <%--FIN FOR EACH Productos Lista Deseos--%>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
            <%
               } %>
                <%--FIN IF--%>
        </div>



    <div id="ListaDeseosContainer" class="container">

        <ul></ul>

    </div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
