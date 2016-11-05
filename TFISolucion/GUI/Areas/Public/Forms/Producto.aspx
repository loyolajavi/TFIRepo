<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="TFI.GUI.Producto" %>

<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="BodyProducto" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <style>
        .title {
            margin-bottom: 100px;
            margin-top: 40px;
        }

        .btn {
            border-radius: 0px;
        }

        .btn-comprar {
            width: 200px;
            color: #fff;
            background-color: #002c04;
        }

            .btn-comprar:hover {
                color: #fff;
            }

        .inner {
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>

    <div class="container">

        <div class="row">
            <div>
                <div class="col-md-5">
                    <p class="text-center">
                        <img id="imgProducto" clientidmode="static" runat="server" src="" style="width: 450px" />
                    </p>
                </div>

                <div class="col-md-4 form-group">
                    <h2><%=producto.DescripProducto %></h2>
                    <h5><%=producto.CodigoProducto %></h5>
                    <br />

                    <div>
                        <label><%=producto.DescripLarga%></label>
                    </div>
                </div>

                <div class="col-md-3" style="border: #eee 1px solid; background-color: #fafafa; margin-top: 30px;">
                    <div>
                        <h2 class="title text-center"><strong>$ <%=producto.PrecioUnitario%></strong></h2>
                    </div>
                    <p class="text-center">
                        <button id="btnComprar" runat="server" class="btn btn-comprar">COMPRAR</button>
                        <br />
                        <br />
                        <button class=" btn btn-green"><i class=" glyphicon glyphicon-heart"></i></button>
                        Agregar a Favoritos
                    </p>
                    <p>
                    </p>

                    <div class="bg-info inner">
                        <div>
                            <label>Medios de Pago</label>
                            <i class="glyphicon glyphicon-credit-card"></i>
                            <br />
                            <span>
                                <img src="/Content/Images/Iconos/visa_xs.png" alt="" style="width: 40px;" />
                            </span>
                            <span>
                                <img src="/Content/Images/Iconos/master.png" alt="" style="width: 40px;" />
                            </span>
                            <span>
                                <img src="/Content/Images/Iconos/paypal.png" alt="" style="width: 70px;" />
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>