<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutGeneral.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TFI.GUI.CatalogoPrinc" %>

<asp:Content ID="ContenidoCategorias" ContentPlaceHolderID="ContentPlaceHolderCategorias" runat="server">
        <p class="lead">Shop Name</p>
        <div class="list-group">
            <a href="#" class="list-group-item">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
        </div>
</asp:Content> 


<asp:Content ID="ContenidoCuerpo" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
    
  
    <div class="row carousel-holder">

        <div class="col-md-12">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img class="slide-image" src="http://placehold.it/800x300" alt="">
                    </div>
                    <div class="item">
                        <img class="slide-image" src="http://placehold.it/800x300" alt="">
                    </div>
                    <div class="item">
                        <img class="slide-image" src="http://placehold.it/800x300" alt="">
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>

    </div>

    <div class="row">

        <asp:Repeater ID="lstBusquedaProductos" ClientIDMode="Static" runat="server">
            <ItemTemplate>
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src='<%#Eval("URL")%>' class="img-responsive col-md-12" alt="" />
                        <div class="caption">
                            <h4><a runat="server" class="responsive" href="#"><%#Eval("DescripProducto")%></a></h4>
                            <h4>$<%#Eval("PrecioUnitario")%></h4>  <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
                        </div>
                        <div class="btn-group">
                            <row>
                                <div class="col-sm-3 col-lg-5 col-lg-offset-1 col-md-5">
                                    <asp:Button CssClass="btn btn-success" ID="btnComprar" runat="server" Text="Comprar" />      
                                </div>
                                <div class="col-sm-3 col-lg-6 col-md-5">
                                <asp:Button CssClass="btn btn-info" ID="btnVerDetalle" runat="server" Text="Ver más" />
                                </div>
                            </row>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                <img src="http://placehold.it/320x150" alt="">
                <div class="caption">
                    <h4 class="pull-right">$64.99</h4>
                    <h4><a href="#">Second Product</a>
                    </h4>
                    <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">12 reviews</p>
                    <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                <img src="http://placehold.it/320x150" alt="">
                <div class="caption">
                    <h4 class="pull-right">$74.99</h4>
                    <h4><a href="#">Third Product</a>
                    </h4>
                    <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">31 reviews</p>
                    <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                <img src="http://placehold.it/320x150" alt="">
                <div class="caption">
                    <h4 class="pull-right">$84.99</h4>
                    <h4><a href="#">Fourth Product</a>
                    </h4>
                    <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">6 reviews</p>
                    <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                <img src="http://placehold.it/320x150" alt="">
                <div class="caption">
                    <h4 class="pull-right">$94.99</h4>
                    <h4><a href="#">Fifth Product</a>
                    </h4>
                    <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">18 reviews</p>
                    <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </p>
                </div>
            </div>
        </div>

       

    </div>

   


</asp:Content>
