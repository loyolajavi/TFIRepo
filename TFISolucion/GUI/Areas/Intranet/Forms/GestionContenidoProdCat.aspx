<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoProdCat.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoProdCat"  EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
     <div class="col-lg-12">
        <h1 class="page-header">Categorias de Productos<small>Gestion de Contenidos</small>
        </h1>
    </div>

    <div class="form-group">
    <asp:TextBox ID="txtProductoaBuscar" CssClass="form-control" placeholder="Ingreso codigo de producto" runat="server"></asp:TextBox> <br />
    <asp:Button ID="brnConsultar" CssClass="form-control" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
    

      <div class="col-lg-6">
            <div class="form-group">
                <label for="grillacatprod"></label>
                <asp:GridView ID="grillacatprod" CssClass="table" runat="server" OnRowDeleting="grillacatprod_RowDeleting">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True"/>
                        <asp:BoundField DataField="IdProducto" HeaderText="Id de Producto" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion de Producto" />
                        <asp:BoundField DataField="IdCategoria" HeaderText="Id de Categoria" />
                        <asp:BoundField DataField="DescripCategoria" HeaderText="Descripcion de Categoria" />
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
                <a href="#modalProdCategoria" class="btn btn-primary" data-toggle="modal">Agregar Categoria a Producto</a>
            </div>
        </div>
    </div>

     <div class="modal fade" id="modalProdCategoria">
        <div class="modal-dialog">
            <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
            <%--<ContentTemplate>--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar Categoria</h2>
                    <div id="notificationprodcategoria">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalProdCategoria">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarAsociacion" />
                        </Triggers>
                        <ContentTemplate>

                            <form role="form">
                                 <div class="form-group">
                                    <label for="ddlProducto">Producto</label>
                                    <asp:DropDownList ID="ddlProducto" runat="server" clientidmode="static"></asp:DropDownList>
                                </div>
                                 <div class="form-group">
                                    <label for="ddlCategoria">Categoria</label>
                                    <asp:DropDownList ID="ddlCategoria" runat="server" clientidmode="static"></asp:DropDownList>
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                    <asp:Button runat="server" ID="btnGrabarAsociacion" ClientIDMode="static" Text="Aceptar"  OnClientClick="return onbtnAsociarCategoria(this)" OnClick="btnGrabarAsociacion_Click"/>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
     <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
