<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="RegistrarAdquisicion.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.RegistrarAdquisicion" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Adquisicion %>"> </asp:Label>
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
             <asp:Button ID="btnRegistrar" runat="server" ClientIDMode="Static" CssClass="btn btn-success" Text="<%$Resources:Global, Registrar %>" OnClick="btnRegistrar_Click" />
                </div>
         </div>
        <br />
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <label class="control-label"><%=Resources.Global.Sucursal %></label>
                <asp:DropDownList ID="cboSucursal" runat="server" CssClass="form-control"></asp:DropDownList>
                <label class="control-label"><%=Resources.Global.Remito %></label>
                <input id="txtRemito" name="txtRemito" runat="server" type="text" class="form-control" required="required">
                <b>
                    <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, Fecha %>"> </asp:Label></b>
                <input runat="server" type="date" name="nFechaInicio" id="elIdFechaInicio" class="hasDatepicker form-control " required="required" />
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <label class="control-label"><%=Resources.Global.Producto %></label>
                <asp:TextBox ID="txtProd" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                <%--<input id="txtProd" name="txtProd" type="text" class="form-control" required="required">--%>
                <label class="control-label"><%=Resources.Global.Cantidad %></label>
                <input id="txtCant" name="txtCant" runat="server" type="number" class="form-control" required="required">
                <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-info" Text="<%$Resources:Global, Agregar %>" OnClick="btnAgregar_Click" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <label class="control-label"><%=Resources.Global.Detalle %></label>
                        <asp:GridView ID="grillaDetallesAdq" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="Ingrese un Producto a registrar" BorderStyle="NotSet" CssClass="table table-hover table-responsive table-striped" GridLines="None" runat="server" >
                            <Columns>
                                <asp:CommandField ShowEditButton="True" ButtonType="Image" EditImageUrl="../../../Content/Images/Iconos/boton-de-edicion-de-lapiz.png" ItemStyle-Width="5%" HeaderStyle-CssClass="bg-primary" />
                                <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="../../../Content/Images/Iconos/eliminar -16.png" HeaderStyle-CssClass="bg-primary" />
                                <asp:BoundField DataField="DescripProducto" HeaderText="<%$Resources:Global, Producto %>" HeaderStyle-CssClass="bg-primary" />
                                <asp:BoundField DataField="Cantidad" HeaderText="<%$Resources:Global, Cantidad %>" HeaderStyle-CssClass="bg-primary" />
                            </Columns>
                        </asp:GridView>
            </div>
        </div>
    </div>

    <%--Modal AdqCreada--%>
    <div id="mdlAdqCreada" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title" style="color: #de5900;"><%=Resources.Global.Adquisicion%></h3>
                </div>
                <div class="modal-body text-center">
                    <h4><%=Resources.Global.AdqCreada%></h4>
                </div>
                <div class="modal-footer">
                    <div class="text-center">
                        <a class="btn btn-success" href="#" id="nousado"><%=Resources.Global.Continuar%></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $("#txtProd").autocomplete({
            source: availableTags
        });
    </script>
</asp:Content>
