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
                        <img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="" />
                        <div class="caption">
                            <h4><a runat="server" class="responsive" href="#"><%#Eval("DescripProducto")%></a></h4>
                            <h4>$<%#Eval("PrecioUnitario")%></h4>  <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
                            <asp:Button CssClass="btn btn-success" ID="btnComprar" runat="server" Text="Comprar" />      
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

               

    </div>

   


</asp:Content>
