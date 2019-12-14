<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="RegistrarAdquisicion.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.RegistrarAdquisicion" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Adquisicion %>"> </asp:Label>
                </h2>
            </div>
        </div>
        <div class="form-group col-md-4 col-md-offset-2">
            <label class="control-label">Sucursal</label>
            <asp:DropDownList ID="cboSucursal" runat="server" CssClass="form-control"></asp:DropDownList>
            <label class="control-label">Nro Remito</label>
            <input id="txtRemito" name="txtRemito" type="text" class="form-control" required="required">
            <label class="control-label">Producto</label>
            <input id="txtProd" name="txtProd" type="text" class="form-control" required="required">
            <label class="control-label">Cantidad</label>
            <input id="txtCant" name="txtCant" type="text" class="form-control" required="required">
            <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-info" Text="Agregar" />
            <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-success" Text="Registrar" />

        </div>
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="grillaProductos" AutoGenerateColumns="false" BorderStyle="NotSet" CssClass="table table-hover table-responsive table-striped" GridLines="None" DataKeyNames="IdProducto" runat="server" OnRowCommand="grillaProductos_RowCommand" >
                        <Columns>
                            <asp:BoundField DataField="DescripcionProducto" HeaderText="<%$Resources:Global, Producto %>" HeaderStyle-CssClass="bg-primary" />
                            <asp:BoundField DataField="Cantidad" HeaderText="<%$Resources:Global, Cantidad %>" HeaderStyle-CssClass="bg-primary" />
                            <asp:TemplateField HeaderText="<%$Resources:Global, GenerarND %>" HeaderStyle-CssClass="bg-primary">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CommandArgument='<%#((GridViewRow)Container).RowIndex%>' CommandName="GenerarNDeb" Text="<%$Resources:Global, GenerarND %>" ButtonType="Button" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-info" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:ButtonField CommandName="GenerarNDeb" HeaderText="<%$Resources:Global, GenerarND %>" Text="<%$Resources:Global, GenerarND %>" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />--%>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
