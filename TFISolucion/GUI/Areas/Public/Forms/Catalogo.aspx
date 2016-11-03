<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Catalogo.aspx.cs" Inherits="TFI.GUI.Catalogo" %>
<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>

<%--<asp:Content ID="ContenidoCategorias" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
        <p class="lead">Shop Name</p>
        <div class="list-group">
            <a href="#" class="list-group-item">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
        </div>
</asp:Content> --%>


<asp:Content ID="ContenidoCuerpo" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
    
  
   <style>
        .item-toolbar {
            margin: 10px;
            text-align: center;
        }
        .btn {
            width: 100px;
        }
        .precio {
            font: 400 19px/27px "Open Sans", "Roboto", sans-serif;
            color: #424242;
        }
    </style>

    <div class="container">

        <div class="col-md-3">
            <p class="lead">Categorias</p>
            <div class="list-group">
            </div>
        </div>
        <div class="col-md-9">
            <div id="catalogoContainer" class="row">

                <%-- ITEMS --%>
                <asp:Repeater ID="catalogo" ClientIDMode="Static" runat="server">
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
            </div>
        </div>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog">
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
                    <%--<div class="modal-body">
                       <%-- <%if (producto != null)
                          { %>
                        <div><%=producto.CodigoProducto%></div>
                        <% }
                          else
                          { %>
                        <div>NO DATA TO SHOW</div>
                        <% } %>
                    </div>--%>
                    <div class="modal-footer">
                        <div class="text-center">
                            <button type="button" id="btn-pedidos" class="btn btn-warning" style="width:200px;">Ir a Pedidos</button>
                            <button type="button" class="btn" style="width:200px; background-color: black; color: #fff;" data-dismiss="modal">Seguir Comprado</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>


    <%--ESTO ESTABA EN CODIGO JAVI 02/11/2016--%>
       <%-- <asp:Repeater ID="lstBusquedaProductos" ClientIDMode="Static" runat="server">
            <ItemTemplate>
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="" />
                        <div class="caption">
                            <h4><a runat="server" class="responsive" href="#"><%#Eval("DescripProducto")%></a></h4>
                            <h4>$<%#Eval("PrecioUnitario")%></h4>  <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
      <%--                      <asp:Button CssClass="btn btn-success" ID="btnComprar" runat="server" Text="Comprar" />      
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>--%>

               

   <%-- </div>--%>

   


</asp:Content>


<asp:Content ID="Scripts" ClientIDMode="Static" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>
        $('.btn-info').click(function () {
            var id = $(this).data('producto');
            app.redirect("Producto.aspx?IdProducto=" + id);
        });
        $('#btn-pedidos').click(function () {
            app.redirect('Pedidos.aspx')
        });
        $('.btn-comprar').click(function () {
            var control = $(this);
            var idProducto = control.data('producto');
            $.ajax({
                type: "POST",
                url: "Catalogo.aspx/AgregarItem",
                data: '{ id: ' + idProducto + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (result) {
                    var $modal = $('.modal');
                    $modal.find('#prod').text(result.d);
                    $modal.modal("show");
                }
            });
        });
    </script>
</asp:Content>