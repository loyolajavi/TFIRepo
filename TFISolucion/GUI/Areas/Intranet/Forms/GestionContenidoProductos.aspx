<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoProductos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoProductos" EnableEventValidation="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <div class="col-lg-12">
        <h1 class="page-header">Productos <small>Gestion de Contenidos</small>
        </h1>
    </div>

    <div class="col-lg-6">
            <div class="form-group">
                <label for="grillaproductos"></label>
                <asp:GridView ID="grillaproductos" CssClass="table" runat="server" OnRowCancelingEdit="grillaproductos_RowCancelingEdit" OnRowDataBound="grillaproductos_RowDataBound" OnRowDeleting="grillaproductos_RowDeleting" OnRowUpdating="grillaproductos_RowUpdating" OnRowEditing="grillaproductos_RowEditing">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="CodigoProducto" HeaderText="Codigo de Producto" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                        <asp:TemplateField HeaderText="Marca">
                            <ItemTemplate>
                                <asp:DropDownList ID="dropdownMarca" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IVA">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlIVA" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PrecioUnitario" HeaderText="PrecioUnitario" />
                        <asp:BoundField DataField="URL" HeaderText="URL" />
                        <asp:BoundField DataField="DescripLarga" HeaderText="Detalle" />
                       
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
                <a href="#modalProducto" class="btn btn-primary" data-toggle="modal">Agregar Producto</a>
            </div>
        </div>


      <div class="modal fade" id="modalProducto">
        <div class="modal-dialog">
            <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
            <%--<ContentTemplate>--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar Producto</h2>
                    <div id="notificationproducto">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalProducto">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarProducto" />
                        </Triggers>
                        <ContentTemplate>

                            <form role="form">
                                <div class="form-group">
                                    <label for="codigo">Codigo de Producto</label>
                                    <input type="text" class="form-control" id="codigo" placeholder="Ingrese codigo de producto" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="descripcion">Descripcion</label>
                                    <input type="text" class="form-control" id="descripcion" runat="server" placeholder="Ingrese la descripcion" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="ddlMarcaModal">Marca</label>
                                    <asp:DropDownList ID="ddlmarcamodal" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ddlCategoriaModal">Categoria</label>
                                    <asp:DropDownList ID="ddlcategoriamodal" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="ddlIVA">Iva Producto</label>
                                       <asp:DropDownList ID="ddlivamodal" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                                
                                <div class="form-group">
                                    <label for="preciounitario">Precio Unitario</label>
                                    <input type="number" class="form-control" id="preciounitario" placeholder="Ingrese el precio unitario" runat="server" clientidmode="static" />
                                </div>
                                 <div class="form-group">
                                    <label for="url">URL Imagen</label>
                                    <input type="text" class="form-control" id="url" runat="server" placeholder="Ingrese la URL" clientidmode="static" />

                                </div>
                                 <div class="form-group">
                                    <label for="descriplarga">Detalle</label>
                                    <textarea type="text" class="form-control" id="descriplarga" runat="server" placeholder="Ingrese el detalle del producto" clientidmode="static" />

                                </div>
                               

                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                    <asp:Button runat="server" ID="btnGrabarProducto" ClientIDMode="static" Text="Guardar"  OnClientClick="return onbtnGrabarProducto(this)" OnClick="btnGrabarProducto_Click"/>
                </div>
            </div>


        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
        <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
