<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoProdCat.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoProdCat" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, CategoriasProductos %>"> </asp:Label>
                    <small>
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, GestionContenidos %>"></asp:Label></small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:TextBox ID="txtProductoaBuscar" ClientIDMode="Static" CssClass="form-control" placeholder="<%$Resources:Global, IngresoCodigoProducto %>" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="brnConsultar" CssClass="form-control" runat="server" Text="<%$Resources:Global, Buscar %>" OnClick="btnConsultar_Click" />


                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="grillacatprod"></label>
                            <asp:GridView ID="grillacatprod" CssClass="table" runat="server" OnRowDeleting="grillacatprod_RowDeleting">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="IdProducto" HeaderText="<%$Resources:Global, IdProducto %>" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="<%$Resources:Global, DescripcionProducto %>" />
                                    <asp:BoundField DataField="IdCategoria" HeaderText="<%$Resources:Global, IdCategoria %>" />
                                    <asp:BoundField DataField="DescripCategoria" HeaderText="<%$Resources:Global, DescripcionCategoria %>" />
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
                        <div class="col-md-4 col-md-offset-4">
                            <div class=" form-group">
                                <a href="#modalProdCategoria" class="btn btn-primary " data-toggle="modal">
                                    <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, AgregarCATPROD %>"></asp:Label></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modalProdCategoria">
                    <div class="modal-dialog">
                        <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
                        <%--<ContentTemplate>--%>
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h2>
                                    <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, AgregarCategoria %>"></asp:Label></h2>
                                <div id="notificationprodcategoria">
                                </div>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalProdCategoria">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnGrabarAsociacion" />
                                    </Triggers>
                                    <ContentTemplate>

                                        <form role="form" class=" col-xs-8">
                                            <div class="form-group">
                                                <label for="ddlProducto">
                                                    <asp:Label ID="Label5" runat="server" class="control-label col-xs-2" Text="<%$Resources:Global, Producto %>"></asp:Label></label>
                                                <asp:DropDownList ID="ddlProducto" CssClass="form-control" runat="server" ClientIDMode="static"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlCategoria">
                                                    <asp:Label ID="Label6" runat="server" class="control-label col-xs-2" Text="<%$Resources:Global, Categoria %>"></asp:Label></label>
                                                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control" ClientIDMode="static"></asp:DropDownList>
                                            </div>
                                        </form>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                                <div style="text-align: center;" class="form-group">
                                    <asp:Button runat="server" ID="btnGrabarAsociacion" ClientIDMode="static" class="btn btn-primary "  Text="<%$Resources:Global, Aceptar %>" OnClientClick="return onbtnAsociarCategoria(this)" OnClick="btnGrabarAsociacion_Click" />

                                </div>
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
    <script>
        var obtenerTags = function () {
            var result;
            $.ajax({
                type: "POST",
                url: "GestionStock.aspx/ObtenerProductos",
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

        $("#txtProductoaBuscar").autocomplete({
            source: availableTags

        });
    </script>
</asp:Content>
