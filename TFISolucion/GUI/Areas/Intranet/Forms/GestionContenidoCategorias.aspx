<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoCategorias.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoCategorias" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Categorias %>"> </asp:Label>
                </h1>
            </div>
        </div>



        <div class="row">
            <div class="col-md-8 col-md-offset-2 " style="align-content: flex-end;">
                <%if (this.Master.Autenticar(new string[] { "CategoriaAlta" }))
                  { %>
                <a href="#modalCategoria" class="btn btn-info" data-toggle="modal">
                    <asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, AgregarCategoria %>"></asp:Label></a>
                <% } %>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-md-5 col-md-offset-2">
                <div class="form-group">
                    <label for="grillacategorias"></label>
                    <asp:GridView ID="grillacategorias" BorderStyle="NotSet" CssClass="table table-hover table-responsive table-striped" GridLines="None" runat="server" OnRowCancelingEdit="grillacategorias_RowCancelingEdit" OnRowUpdating="grillacategorias_RowUpdating" OnRowEditing="grillacategorias_RowEditing" OnRowCommand="grillacategorias_RowCommand" AutoGenerateColumns="false">
                        <Columns>
                            <asp:CommandField ShowEditButton="true" ButtonType="Image" CausesValidation="false" CancelImageUrl="../../../Content/Images/Iconos/Cancelar.png" UpdateImageUrl="../../../Content/Images/Iconos/Actualizar.png" EditImageUrl="../../../Content/Images/Iconos/boton-de-edicion-de-lapiz.png" ItemStyle-Width="10%" HeaderStyle-CssClass="bg-primary" />
                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bg-primary">
                                <ItemTemplate>
                                    <%if (this.Master.Autenticar(new string[] { "CategoriaEliminar" }))
                                      { %>
                                    <asp:LinkButton runat="server" CausesValidation="false" CommandArgument='<%# Eval ("IdCategoria") %>' CommandName="EliminarCommand"><asp:Image runat="server" ImageUrl="../../../Content/Images/Iconos/eliminar -16.png" /></asp:LinkButton>
                                    <% } %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="../../../Content/Images/Iconos/eliminar -16.png" HeaderStyle-CssClass="bg-primary" ItemStyle-Width="10%"  />--%>
                            <asp:BoundField DataField="IdCategoria" HeaderText="<%$Resources:Global, IdCategoria %>" Visible="false" HeaderStyle-CssClass="bg-primary" />
                            <asp:BoundField DataField="DescripCategoria" HeaderText="<%$Resources:Global, Descripcion %>" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="bg-primary text-center" />
                        </Columns>
                    </asp:GridView>
                </div>

                <br />


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
                        <div id="notificationcategoria" runat="server"  ClientIdMode="Static">
                        </div>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalProducto">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnGrabarCategoria" />
                            </Triggers>
                            <ContentTemplate>

                                <form role="form" id="form" data-toggle="validator">
                                    <div class="form-group">
                                        <label for="descripcion">
                                            <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Descripcion %>"></asp:Label></label>
                                        <input type="text" title="Ingrese solo letras y menos de 20 letras" pattern="^[_A-z\s]{1,20}$" class="form-control" id="descripcion" runat="server" placeholder="Ingrese la descripcion" required="" clientidmode="static" />
                                         <div class="help-block with-errors"></div>
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
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
