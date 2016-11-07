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
                    <img class="slide-image" src="/Content/Images/Recursos/<%=r %>" alt="CARR" />
                </div>

                <%
                                   primero = false;
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
                        <a href="#panel-810103" data-toggle="tab">Destacados de la semana</a>
                    </li>
                    <li>
                        <a href="#panel-132440" data-toggle="tab">Los más vendidos</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-810103">
                        <div class="row">
                            <asp:Repeater ID="lstProductosDestacados" ClientIDMode="Static" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-4 col-lg-4 col-md-4">
                                        <div class="thumbnail" style="text-align: center;">
                                            <img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="IMAGE" />
                                            <div class="caption">
                                                <h4><a runat="server" class="responsive" href="#"><%#Eval("DescripProducto")%></a></h4>
                                                <h5 class="precio"><span>$</span><span><%#Eval("PrecioUnitario")%></span></h5>
                                                <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
                                            </div>
                                            <div class="item-toolbar">
                                                <input type="button" value="Comprar" clientidmode="static" class="btn btn-success btn-comprar" runat="server" data-producto='<%#Eval("IdProducto")%>' />
                                                <%if (this.Master.usuario != null)
                                                  {%>
                                                <asp:Button CssClass="btn btn-info" ID="btnDesear" runat="server" data-producto='<%#Eval("IdProducto")%>' Text="Desear" OnClientClick="return onBtnAddClick(this)" OnClick="btnDesear_Click" />
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
                                            <img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="" />
                                            <div class="caption">
                                                <h4><a runat="server" class="responsive" href="#"><%#Eval("DescripProducto")%></a></h4>
                                                <h4>$<%#Eval("PrecioUnitario")%></h4>
                                                <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
                                                <input type="button" value="Comprar" clientidmode="static" class="btn btn-success btn-comprar" runat="server" data-producto='<%#Eval("IdProducto")%>' />
                                                <%--<asp:Button CssClass="btn btn-success" ID="btnComprar" runat="server" Text="Comprar" />--%>
                                                <%if (this.Master.usuario != null)
                                                  {%>
                                                <asp:Button CssClass="btn btn-info" ID="btnDesear" runat="server" data-producto='<%#Eval("IdProducto")%>' Text="Desear" OnClientClick="return onBtnAddClick(this)" OnClick="btnDesear_Click" />
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
    </div>

</asp:Content>
