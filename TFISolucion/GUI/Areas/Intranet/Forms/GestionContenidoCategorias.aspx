<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoCategorias.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoCategorias" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Categorias %>"> </asp:Label><small>
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, GestionContenidos %>"></asp:Label></small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="form-group">
                    <label for="grillacategorias"></label>
                    <asp:GridView ID="grillacategorias" CssClass="table" runat="server" OnRowCancelingEdit="grillacategorias_RowCancelingEdit" OnRowDeleting="grillacategorias_RowDeleting" OnRowUpdating="grillacategorias_RowUpdating" OnRowEditing="grillacategorias_RowEditing">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="IdCategoria" HeaderText="<%$Resources:Global, IdCategoria %>" />
                            <asp:BoundField DataField="DescripCategoria" HeaderText="<%$Resources:Global, Descripcion %>" />
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
                    <a href="#modalCategoria" class="btn btn-primary" data-toggle="modal">
                        <asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, AgregarCategoria %>"></asp:Label></a>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalCategoria">
            <div class="modal-dialog">
                <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
                <%--<ContentTemplate>--%>
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2>
                            <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, AgregarCategoria %>"></asp:Label></h2>
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
                                        <label for="descripcion">
                                            <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Descripcion %>"></asp:Label></label>
                                        <input type="text" class="form-control" id="descripcion" runat="server" placeholder="Ingrese la descripcion" clientidmode="static" />
                                    </div>
                                </form>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                        <div class="text-center">
                            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnGrabarCategoria" ClientIDMode="static" Text="<%$Resources:Global, Aceptar %>" OnClientClick="return onbtnGrabarCategoria(this)" OnClick="btnGrabarCategoria_Click" />
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
