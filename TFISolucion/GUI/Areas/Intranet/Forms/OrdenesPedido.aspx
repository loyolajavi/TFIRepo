<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="OrdenesPedido.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.OrdenesPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link href="/Scripts/thirdparty/Autocomplete/jquery-ui.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <div class="row">
        <div class="list-group col-md-4">
            <div class="form-group">
                <label for="txtClienteBusqueda" class="control-label">Cliente</label>

                <asp:TextBox ID="txtClienteBusqueda" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                <asp:Button ID="btnBuscarCliente" runat="server" Text="Buscar" CssClass="form-control col-md-" />

            </div>

            <asp:DropDownList ID="ddlEstadoPedido" CssClass="form-control" runat="server"></asp:DropDownList>

        </div>



        <div class="row" runat="server" id="contenedorsinpedidos">
            <div class="col-md-9">
                <div class="alert alert-info alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <i class="fa fa-info-circle"></i>
                    <div id="sinpedidos" runat="server"></div>
                </div>
            </div>
        </div>

        <hr />


        <div class="col-md-8">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="grilladeultimospedidos" AllowPaging="true" OnPageIndexChanging="grilladeultimospedidos_PageIndexChanging" CssClass="tablesorter table table-striped table-hover table-users" DataKeyNames="NroPedido" runat="server" OnRowCommand="grilladeultimospedidos_RowCommand" PageSize="4">
                        <Columns>
                            <asp:ButtonField CommandName="VerDetalle" HeaderText="Ver Detalle" Text="Ver Detalle" ButtonType="Button" ControlStyle-CssClass="btn-info" />
                            <asp:BoundField DataField="NroPedido" HeaderText="Número de Pedido" />
                            <asp:BoundField DataField="FechaPedido" HeaderText="Fecha de Pedido" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Cliente" />
                            <asp:BoundField DataField="Total" HeaderText="Total" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>



        <div id="currentdetail" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                            ×</button>
                        <h3 id="myModalLabel">Detalle de pedido</h3>
                    </div>
                    <div class="modal-body">

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DetailsView ID="DetailsView1" runat="server"
                                    CssClass="table table-bordered table-hover"
                                    BackColor="White" ForeColor="Black"
                                    FieldHeaderStyle-Wrap="false"
                                    FieldHeaderStyle-Font-Bold="true"
                                    FieldHeaderStyle-BackColor="LavenderBlush"
                                    FieldHeaderStyle-ForeColor="Black"
                                    BorderStyle="Groove" AutoGenerateRows="False">
                                    <Fields>
                                        <asp:BoundField DataField="NroPedido" HeaderText="Número de pedido" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:GridView ID="grilladedetallesdelpedido" runat="server"></asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="grilladeultimospedidos" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal"
                                aria-hidden="true">
                                Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Scripts" ContentPlaceHolderID="ScriptSection" runat="server">

    <script src="/Scripts/thirdparty/Autocomplete/jquery-ui.js"></script>
    <script src="/Scripts/thirdparty/Autocomplete/jquery-ui.js"></script>

    <script>





        var obtenerTags = function () {
            var result;
            $.ajax({
                type: "POST",
                url: "OrdenesPedido.aspx/ObtenerClientes",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function (data) {
                    result = data.d;
                }
            });

            return result;
        }

        var availableTags = obtenerTags();

        //$("#txtClienteBusqueda").change(function () {
        //    $(this).autocomplete({
        //        source: availableTags
        //    });
        //});

        $("#txtClienteBusqueda").autocomplete({
            source: availableTags
        });
    </script>

</asp:Content>
