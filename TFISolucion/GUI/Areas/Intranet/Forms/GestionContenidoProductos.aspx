<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoProductos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoProductos" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
     <style>
        .thumbnail {
            position: relative;
            width: 70px;
            height: 70px;
            overflow: hidden;
        }

        .thumbnail img {
            position: absolute;
            left: 50%;
            top: 50%;
            height: 100%;
            width: auto;
            -webkit-transform: translate(-50%,-50%);
            -ms-transform: translate(-50%,-50%);
            transform: translate(-50%,-50%);
        }

        .thumbnail img.portrait {
            width: 100%;
            height: auto;
        }
    </style>

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

                <div class="col-md-12 text-right" style="align-content: flex-end;">
                    <a href="/Areas/Intranet/Forms/ProductoAgregar.aspx" class="btn btn-primary" data-toggle="modal">
                        <asp:Label ID="Label11" runat="server" Text="<%$Resources:Global, AgregarProducto %>"></asp:Label></a>
                </div>

        </div>





        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="grillaproductos"></label>
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>
                    <asp:GridView ID="grillaproductos" BorderStyle="NotSet" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped" GridLines="None" runat="server" OnRowDataBound="grillaproductos_RowDataBound" OnRowDeleting="grillaproductos_RowDeleting" OnPageIndexChanging="grillaproductos_PageIndexChanging" AllowPaging="true" >
                        <Columns>
                            <%--<asp:CommandField ShowEditButton="True" CausesValidation="false" ButtonType="Image" CancelImageUrl="../../../Content/Images/Iconos/Cancelar.png" UpdateImageUrl="../../../Content/Images/Iconos/Actualizar.png" EditImageUrl="../../../Content/Images/Iconos/boton-de-edicion-de-lapiz.png" ItemStyle-Width="5%" HeaderStyle-CssClass="bg-primary" />--%>
                            <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="bg-primary">
                                <ItemTemplate>
                                    <a href="/Areas/Intranet/Forms/ProductoAgregar.aspx?id=<%# Eval ("IdProducto") %>">
                                        <asp:Image runat="server" ImageUrl="../../../Content/Images/Iconos/boton-de-edicion-de-lapiz.png" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True"  ButtonType="Image" DeleteImageUrl="../../../Content/Images/Iconos/eliminar -16.png" HeaderStyle-CssClass="bg-primary" ItemStyle-Width="5%" />
                            <asp:BoundField DataField="CodigoProducto" HeaderText="<%$Resources:Global, CodigoProducto %>" HeaderStyle-CssClass="bg-primary" />
                            <asp:BoundField DataField="Descripcion" HeaderText="<%$Resources:Global, Descripcion %>" HeaderStyle-CssClass="bg-primary" />
                            <%--<asp:BoundField DataField="Marca" HeaderText="<%$Resources:Global, Marca %>" HeaderStyle-CssClass="bg-primary" />--%>
                            <asp:TemplateField HeaderText="<%$Resources:Global, Marca %>" HeaderStyle-CssClass="bg-primary" >
                                <ItemTemplate>
                                    <asp:DropDownList ID="dropdownMarca" runat="server" Enabled="false" ></asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="Iva" HeaderText="<%$Resources:Global, IVA %>" HeaderStyle-CssClass="bg-primary" />--%>
                            <asp:TemplateField HeaderText="IVA" HeaderStyle-CssClass="bg-primary" >
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlIVA" runat="server" Enabled="false"></asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PrecioUnitario" HeaderText="<%$Resources:Global, PrecioUnitario %>" HeaderStyle-CssClass="bg-primary" />
                            <%--<asp:BoundField DataField="URL" HeaderText="URL" HeaderStyle-CssClass="bg-primary" />--%>
                            <asp:TemplateField HeaderText="URL" HeaderStyle-CssClass="bg-primary" >
                                <ItemTemplate>
                                    <div class="thumbnail">
                                        <img src="/Content/Images/Productos/<%# Eval ("URL") %>" alt="<%# Eval ("URL") %>" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            


                        </Columns>

                    </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </div>

                <br />


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
