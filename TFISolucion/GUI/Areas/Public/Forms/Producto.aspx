<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Producto.aspx.cs" Inherits="TFI.GUI.Producto" %>

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
                    <h5> <%=Resources.Global.Descripcion%></h5>
                    <br />
                    <div>
                        <h6><%=producto.DescripLarga%></h6>
                    </div>
                </div>

                <div class="col-md-3" style="border: #eee 1px solid; background-color: #fafafa; margin-top: 30px;">
                    <div>
                        <h2 class="title text-center"><strong><%=moneda.SimboloMoneda%></strong><strong> <%=producto.PrecioUnitario%></strong></h2>
                    </div>
                    <div class="item-toolbar">
                         <asp:HiddenField ID="IdProductoComprarServer" runat="server" ClientIDMode="Static" />
                        <input type="button" id="btnComprarProducto" value="<%$Resources:Global, Comprar %>" clientidmode="static" class="btn btn-success btn-comprar" runat="server" />
                        <%if (this.Master.Autenticar("Desear"))
                        {%>
                        <br />
                        <br />
                            <input type="button" class="btn btn-info" clientidmode="static" runat="server" value="<%$Resources:Global, Desear %>" onclick="onBtnAddClick(this)" />
                        <%}%>
                    </div>

                    <div class="bg-info inner">
                        <div>
                            <label> <%=Resources.Global.MediosDePago%></label>
                            <i class="glyphicon glyphicon-credit-card"></i>
                            <br />
                            <span>
                                <img src="/Content/Images/Iconos/visa_xs.png" alt="" style="width: 40px;" />
                            </span>
                            <span>
                                <img src="/Content/Images/Iconos/master.png" alt="" style="width: 40px;" />
                            </span>
                            <span>
                                <img src="/Content/Images/Iconos/mercadopago.png" alt="" style="width: 40px;" />
                            </span>
                        </div>
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
                        <h3 class="modal-title" style="color: #29ab29;"> <%=Resources.Global.Felicitaciones%></h3>
                    </div>
                    <div class="modal-body text-center">
                        <h4 id="mdl_pedido_titulo" style="color: black;"> <%=Resources.Global.ElProducto%><span id="prod"></span> <%=Resources.Global.ProductoCorrectamenteAgregadoAlCarrito%></h4>
                    </div>
                    <div class="modal-footer">
                        <div class="text-center">
                            <button type="button" id="btn-pedidos" class="btn btn-warning" style="width: 200px;"> <%=Resources.Global.IrAPedidos%></button>
                            <button type="button" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal"> <%=Resources.Global.SeguirComprando%></button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>