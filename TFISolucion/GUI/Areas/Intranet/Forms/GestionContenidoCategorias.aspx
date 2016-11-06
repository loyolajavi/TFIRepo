<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoCategorias.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoCategorias" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <div class="col-lg-12">
        <h1 class="page-header">Categorias <small>Gestion de Contenidos</small>
        </h1>
    </div>

    <div class="col-lg-6">
            <div class="form-group">
                <label for="grillacategorias"></label>
                <asp:GridView ID="grillacategorias" CssClass="table" runat="server" OnRowCancelingEdit="grillacategorias_RowCancelingEdit" OnRowDeleting="grillacategorias_RowDeleting" OnRowUpdating="grillacategorias_RowUpdating" OnRowEditing="grillacategorias_RowEditing">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="IdCategoria" HeaderText="Id de Categoria" />
                        <asp:BoundField DataField="DescripCategoria" HeaderText="Descripcion" />
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
                <a href="#modalCategoria" class="btn btn-primary" data-toggle="modal">Agregar Categoria</a>
            </div>
        </div>


    <div class="modal fade" id="modalCategoria">
        <div class="modal-dialog">
            <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
            <%--<ContentTemplate>--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar Categoria</h2>
                    <div id="notificationcategoria">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalProducto">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarCategoria" />
                        </Triggers>
                        <ContentTemplate>

                            <form role="form">
                                <div class="form-group">
                                    <label for="descripcion">Descripcion</label>
                                    <input type="text" class="form-control" id="descripcion" runat="server" placeholder="Ingrese la descripcion" clientidmode="static" />
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                    <asp:Button runat="server" ID="btnGrabarCategoria" ClientIDMode="static" Text="Aceptar"  OnClientClick="return onbtnGrabarCategoria(this)" OnClick="btnGrabarCategoria_Click"/>
                </div>
            </div>


        </div>
    </div>











</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
