<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TFI.GUI.Home" %>



<asp:Content ID="ContenidoCuerpo" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
    
               

             <div class="row carousel-holder">

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
    


        <div class="row">
            <div class="tabbable" id="tabs-322426">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-810103" data-toggle="tab">Destacados de la semana (GENLOYS)</a>
					</li>
					<li>
						<a href="#panel-132440" data-toggle="tab">Los más vendidos (DIETETICA SER)</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-810103">
                          
                          <div class="row">
                                <asp:Repeater ID="lstProductosDestacados" ClientIDMode="Static" runat="server">
                                    <ItemTemplate>
                                        <div class="col-sm-4 col-lg-4 col-md-4">
                                            <div class="thumbnail">
                                                <img src='/Content/Images/Productos/<%#Eval("URL")%>' class="img-responsive col-md-12" alt="" />
                                                <div class="caption">
                                                    <h4><a runat="server" class="responsive" href="#"><%#Eval("DescripProducto")%></a></h4>
                                                    <h4>$<%#Eval("PrecioUnitario")%></h4>  <%--ESTO HAY QUE CORREGIRLO PARA QUE LA MONEDA PUEDA SER OTRA Y NO ESTE HARDCOREADA--%>
                                                    <asp:Button CssClass="btn btn-success" ID="btnComprar" runat="server" Text="Comprar" OnClick="btnComprar_Click" />      
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div> <%--Tab1 Row FIN--%>
					</div>

					<div class="tab-pane" id="panel-132440"> <%--tab2 MAS VENDIDOS--%>
                            <div class="row">

                                <asp:Repeater ID="lstMasVendidos" ClientIDMode="Static" runat="server">
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

                            </div> <%--Tab2 Row FIN--%>

					</div>
				</div>
			</div>
        </div>





    


</asp:Content>
