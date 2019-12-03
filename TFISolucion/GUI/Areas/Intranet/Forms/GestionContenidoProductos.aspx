<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoProductos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoProductos" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Productos %>"></asp:Label>
                    <small>
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, GestionContenidos %>"></asp:Label></small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="grillaproductos"></label>
                    <asp:GridView ID="grillaproductos" CssClass="table" runat="server" OnRowCancelingEdit="grillaproductos_RowCancelingEdit" OnRowDataBound="grillaproductos_RowDataBound" OnRowDeleting="grillaproductos_RowDeleting" OnRowUpdating="grillaproductos_RowUpdating" OnRowEditing="grillaproductos_RowEditing" OnPageIndexChanging="grillaproductos_PageIndexChanging" AllowPaging="true">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="CodigoProducto" HeaderText="<%$Resources:Global, CodigoProducto %>" />
                            <asp:BoundField DataField="Descripcion" HeaderText="<%$Resources:Global, Descripcion %>" />
                            <asp:TemplateField HeaderText="<%$Resources:Global, Marca %>">
                                <ItemTemplate>
                                    <asp:DropDownList ID="dropdownMarca" runat="server"></asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IVA">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlIVA" runat="server" disabled="true"></asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PrecioUnitario" HeaderText="<%$Resources:Global, PrecioUnitario %>" />
                            <asp:BoundField DataField="URL" HeaderText="URL" />
                            <asp:BoundField DataField="DescripLarga" HeaderText="<%$Resources:Global, Detalle %>" />

                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText=" First > " PreviousPageText=" Previous > " NextPageText=" Next > " LastPageText=" Last " />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>

                <br />

                <div class=" text-center">
                    <a href="#modalProducto" class="btn btn-primary" data-toggle="modal">
                        <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, AgregarProducto %>"></asp:Label></a>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="modalProducto">
        <div class="modal-dialog">
            <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
            <%--<ContentTemplate>--%>
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>
                        <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, AgregarProducto %>"></asp:Label></h2>
                    <div id="notificationproducto">
                        <p id="not" runat="server"></p>
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalProducto">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarProducto" />
                        </Triggers>
                        <ContentTemplate>

                            <form role="form" id="form" data-toggle="validator">
                                <div class="form-group">
                                    <label for="codigo">
                                        <asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, CodigoProducto %>"></asp:Label></label>
                                    <input type="text" class="form-control" id="codigo" placeholder="Ingrese codigo de producto" runat="server" clientidmode="static" required="" maxlength="20" />
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">
                                        <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, Descripcion %>"></asp:Label></label>
                                    <input type="text" class="form-control" id="descripcion" runat="server" placeholder="Ingrese la descripcion" clientidmode="static" maxlength="100" required="" />
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <label for="ddlMarcaModal">
                                        <asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, Marca %>"></asp:Label></label>
                                    <asp:DropDownList ID="ddlmarcamodal" runat="server" CssClass="form-control" ClientIDMode="static"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategoriaModal">
                                        <asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, Categoria %>"></asp:Label></label>
                                    <asp:DropDownList ID="ddlcategoriamodal" runat="server" ClientIDMode="static" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ddlIVA">Iva</label>
                                    <asp:DropDownList ID="ddlivamodal" runat="server" CssClass="form-control" ClientIDMode="static"></asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label for="preciounitario">
                                        <asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, PrecioUnitario %>"></asp:Label></label>
                                    <input type="number" class="form-control" id="preciounitario" pattern="^[0-9]{1,}$" maxlength="7" data-pattern-error="Ingrese un precio razonable"   placeholder="Ingrese el precio unitario" runat="server" clientidmode="static" required="" />
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <label for="url">URL</label>
                                    <input type="text" class="form-control" id="url" runat="server" placeholder="Ingrese la URL" clientidmode="static" />

                                </div>
                                <div class="form-group">
                                    <label for="descriplarga">
                                        <asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, Detalle %>"></asp:Label></label>
                                    <textarea type="text" class="form-control" id="descriplarga" runat="server" placeholder="Ingrese el detalle del producto" clientidmode="static" />
                                    <div class="help-block with-errors"></div>
                                </div>


                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                    <div style="text-align: center;">
                        <asp:Button runat="server" class="btn btn-success" ID="btnGrabarProducto" ClientIDMode="static" Text="<%$Resources:Global, Aceptar %>" OnClientClick="return onbtnGrabarProducto(this)" OnClick="btnGrabarProducto_Click" />
                    </div>
                </div>
            </div>


        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
