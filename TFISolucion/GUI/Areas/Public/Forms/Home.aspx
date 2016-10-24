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
						<a href="#panel-810103" data-toggle="tab">Destacados de la semana</a>
					</li>
					<li>
						<a href="#panel-132440" data-toggle="tab">Los más vendidos</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-810103">
                          
                          <div class="row">
                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="thumbnail">
                                        <img src="http://placehold.it/320x150" alt="">
                                        <div class="caption">
                                            <h4 class="pull-right">$24.99</h4>
                                            <h4><a href="#">First Product</a>
                                            </h4>
                                            <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                                        </div>
                                        <div class="ratings">
                                            <p class="pull-right">15 reviews</p>
                                            <p>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>


                              <%--<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>


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


                            </div> <%--Tab1 Row FIN--%>

					</div>
					<div class="tab-pane" id="panel-132440"> <%--tab2 MAS VENDIDOS--%>
                            <div class="row">

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="thumbnail">
                                        <img src="http://placehold.it/320x150" alt="">
                                        <div class="caption">
                                            <h4 class="pull-right">$2.99</h4>
                                            <h4><a href="#">Mas Vendido!!</a>
                                            </h4>
                                        </div>
                                        <div class="ratings">
                                            <p class="pull-right">15 reviews</p>
                                            <p>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                                <span class="glyphicon glyphicon-star"></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="thumbnail">
                                        <img src="http://placehold.it/320x150" alt="">
                                        <div class="caption">
                                            <h4 class="pull-right">$3.99</h4>
                                            <h4><a href="#">Mas Vendido!!</a>
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
                                            <h4 class="pull-right">$4.99</h4>
                                            <h4><a href="#">Mas Vendido!!</a>
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
                                            <h4 class="pull-right">$4.99</h4>
                                            <h4><a href="#">Mas Vendido!!</a>
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
                                            <h4 class="pull-right">$4.99</h4>
                                            <h4><a href="#">Mas Vendido!!</a>
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

                                
                            </div> <%--Tab2 Row FIN--%>

					</div>
				</div>
			</div>
        </div>





    


</asp:Content>
