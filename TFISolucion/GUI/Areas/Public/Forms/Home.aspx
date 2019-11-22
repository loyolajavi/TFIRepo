<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Home.aspx.cs" Inherits="TFI.GUI.Home" %>

<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>


<asp:Content ID="ContenidoCuerpo" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">




    <div class="row carousel-holder">

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <% if (listaRecursos != null)
                    {
                        bool primero = true;
                        foreach (var r in listaRecursos)
                        {%>
                        <div class="item <%if (primero)
                            {%> active <% } %>">
                            <img class="slide-image" src="/Content/Images/Recursos/<%=r %>" alt="CARR" style="max-height:380px;" />
                        </div>
                        <%primero = false;
                    }
                } %>
            </div>

            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="tabbable" id="tabs-322426">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-810103" data-toggle="tab"><asp:Label ID="lbldestacados" runat="server" Text="<%$Resources:Global, Destacados %>"></asp:Label></a>
                    </li>
                    <li>
                        <a href="#panel-132440" data-toggle="tab"><asp:Label ID="lblmasvendios" runat="server" Text="<%$Resources:Global, MasVendidos %>"></asp:Label></a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-810103">
                        <div class="row">
                            <asp:Repeater ID="lstProductosDestacados" ClientIDMode="Static" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-4 col-lg-4 col-md-4">
                                        <div class="thumbnail" style="text-align: center;">
                                            <a runat="server" class="linkProducto" href='<%#Eval("IdProducto","Producto.aspx?IdProducto={0}")%>'><img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12 linkProducto" alt="IMAGE" /></a>
                                            <div class="caption">
                                                <h4><a runat="server" class="responsive" href='<%#Eval("IdProducto","Producto.aspx?IdProducto={0}")%>'><%#Eval("DescripProducto")%></a></h4>
                                               <h5 class="precio"><span><%=moneda.SimboloMoneda%></span><span><%#Eval("PrecioUnitario")%></span></h5>
                                                
                                            </div>
                                            <div class="item-toolbar">
                                                <input type="button" value="<%$Resources:Global, Comprar %>" clientidmode="static" class="btn btn-success btn-comprar" runat="server" data-producto='<%#Eval("IdProducto")%>' />
                                                <% if (this.Master.Autenticacion() > TFI.Entidades.FamiliaEntidad.PermisoFamilia.Publico)
                                                    {%>
                                                <input type="button" class="btn btn-info" clientidmode="static" runat="server" data-producto='<%#Eval("IdProducto")%>' value= "<%$Resources:Global, Desear %>"  onclick="onBtnAddClick(this)" />
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <%--Tab1 Row FIN--%>
                    </div>

                    <div class="tab-pane" id="panel-132440">
                        <%--tab2 MAS VENDIDOS--%>
                        <div class="row">

                            <asp:Repeater ID="lstMasVendidos" ClientIDMode="Static" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-4 col-lg-4 col-md-4">
                                        <div class="thumbnail">
                                            <a runat="server" class="linkProducto" href='<%#Eval("IdProducto","Producto.aspx?IdProducto={0}")%>'><img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12 linkProducto" alt="IMAGE" /></a>
                                            <div class="caption">
                                                <h4><a runat="server" class="responsive" href='<%#Eval("IdProducto","Producto.aspx?IdProducto={0}")%>'><%#Eval("DescripProducto")%></a></h4>
                                               <h5 class="precio"><span><%=moneda.SimboloMoneda%></span><span><%#Eval("PrecioUnitario")%></span></h5>
                                                <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
                                                <input type="button" value="<%$Resources:Global, Comprar %>" clientidmode="static" class="btn btn-success btn-comprar" runat="server" data-producto='<%#Eval("IdProducto")%>' />
                                                <% if (this.Master.Autenticacion() > TFI.Entidades.FamiliaEntidad.PermisoFamilia.Publico)
                                                    {%>
                                                <%--<input type="button" class="btn btn-info" clientidmode="static" runat="server" data-producto='<%#Eval("IdProducto")%>' value="Desear" onclick="onBtnAddClick(this)" />--%>
                                                <input type="button" class="btn btn-info" clientidmode="static" runat="server" data-producto='<%#Eval("IdProducto")%>' value= "<%$Resources:Global, Desear %>" onclick="onBtnAddClick(this)"/>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <%--Tab2 Row FIN--%>
                    </div>
                </div>
            </div>
        </div>

    </div>


        <div class="modal fade" tabindex="-1" role="dialog">
        <form id="mdl_pedido_agregado">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" style="color: #29ab29;"><asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Felicitaciones %>"></asp:Label></h3>
                    </div>
                    <div class="modal-body text-center">
                        <h4 id="mdl_pedido_titulo" style="color: black;"><asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, ElProducto %>"></asp:Label> <span id="prod"></span><asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, ProductoCorrectamenteAgregadoAlCarrito %>"></asp:Label></h4>
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
                            <%--<button type="button" id="btn-pedidos" class="btn btn-warning" style="width: 200px;">Ir a Pedidos</button>--%>
                            <button type="button" id="btn-pedidos" class="btn btn-warning" style="width: 200px;"><asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, IrAPedidos %>"></asp:Label></button>
                            <%--<button type="button" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal">Seguir Comprado</button>--%>
                            <asp:Button ID="Button1" runat="server" Text="<%$Resources:Global, SeguirComprando %>" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>




</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptSection" ID="Scripts" ClientIDMode="Static" runat="server">
    <script>
        OcultarBreadcrumb();

    </script>
</asp:Content>