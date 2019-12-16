<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoProdCat.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoProdCat" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

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

            <div class="col-md-5 col-md-offset-1">
                <div class="col-md-9">
                    <asp:TextBox ID="txtProductoaBuscar" ClientIDMode="Static" CssClass="form-control" placeholder="<%$Resources:Global, IngresoCodigoProducto %>" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="brnConsultar" CssClass="form-control" runat="server" Text="<%$Resources:Global, Buscar %>" OnClick="btnConsultar_Click" />
                </div>
            </div>
            <div class="form-inline col-md-3 text-right">
                    <label for="cboCategoria">
                        <asp:Label ID="Label3" runat="server" class="control-label text-center" Text="<%$Resources:Global, Categoria %>"></asp:Label></label>
                    <asp:DropDownList ID="cboCategoria" runat="server" CssClass="form-control" ClientIDMode="static" AutoPostBack="true"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <%if (this.Master.Autenticar(new string[] { "CategoriaAsociar" }))
                  { %>
                <asp:Button ID="btnAsociarCat" runat="server" Text="<%$Resources:Global, AgregarCATPROD %>" CssClass="btn btn-info" OnClick="btnGrabarAsociacion_Click" />
                <% } %>
            </div>


        </div>
   
        
        <div class="row">

                            <label for="grillacatprod"></label>
                            <asp:GridView ID="grillacatprod" BorderStyle="NotSet" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped" GridLines="None" runat="server" OnRowCommand="grillacatprod_RowCommand" >
                                <Columns>
                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bg-primary">
                                        <ItemTemplate>
                                            <%if (this.Master.Autenticar(new string[] { "CategoriaDesasociar" }))
                                              { %>
                                            <asp:LinkButton runat="server" CausesValidation="false" CommandArgument='<%# Eval ("IdCategoria") %>' CommandName="EliminarCommand"><asp:Image runat="server" ImageUrl="../../../Content/Images/Iconos/eliminar -16.png" /></asp:LinkButton>
                                            <% } %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IdProducto" HeaderText="<%$Resources:Global, IdProducto %>" HeaderStyle-CssClass="bg-primary" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="<%$Resources:Global, DescripcionProducto %>" HeaderStyle-CssClass="bg-primary" />
                                    <asp:BoundField DataField="IdCategoria" HeaderText="<%$Resources:Global, IdCategoria %>" HeaderStyle-CssClass="bg-primary" />
                                    <asp:BoundField DataField="DescripCategoria" HeaderText="<%$Resources:Global, DescripcionCategoria %>" HeaderStyle-CssClass="bg-primary" />
                                </Columns>

                            </asp:GridView>

                        <br />

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
