<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionStock.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionStock" EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">Gestión de Stock - <small>Productos</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:TextBox ID="txtProductoaBuscar" CssClass="form-control" placeholder="Ingreso producto" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnConsultar" CssClass="form-control" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />


                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="grillastock"></label>
                            <asp:GridView ID="grillastock" CssClass="table" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="IdProducto" HeaderText="Id de Producto" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion de Producto" />
                                    <asp:BoundField DataField="CantidadEnStock" HeaderText="Disponibilidad" />
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
                            <a href="#modalStock" class="btn btn-primary" data-toggle="modal">Agregar Stock</a>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modalStock">
                    <div class="modal-dialog">
                        <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
                        <%--<ContentTemplate>--%>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h2>Agregar Stock</h2>
                                <div id="notificationStock">
                                </div>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upmodalStock">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnGrabarStock" />
                                    </Triggers>
                                    <ContentTemplate>

                                        <form role="form">
                                            <div class="form-group">
                                                <label for="ddlProducto">Producto</label>
                                                <asp:DropDownList ID="ddlProducto" runat="server" ClientIDMode="static"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="cantidad">Cantidad</label>
                                                 <input type="number" class="form-control" id="cantidad" placeholder="Ingrese la cantidad a ingresar" runat="server" clientidmode="static" />
                                            </div>
                                        </form>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                                <asp:Button runat="server" ID="btnGrabarStock" ClientIDMode="static" Text="Aceptar" OnClientClick="return onbtnGrabarStock(this)" OnClick="btnGrabarStock_Click" />
                            </div>
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
