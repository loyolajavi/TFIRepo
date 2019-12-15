<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="ProductoAgregar.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.ProductoAgregar" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Producto %>"> </asp:Label>
                    <small>
                        <asp:Label ID="lblCliente" runat="server"></asp:Label>
                    </small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <div role="form" id="form" data-toggle="validator">

                    <asp:HiddenField ID="action" ClientIDMode="Static" Value="" runat="server" />
                    <asp:HiddenField ID="productoId" ClientIDMode="Static" runat="server" />
                    <asp:HiddenField ID="imagePath" ClientIDMode="Static" runat="server" />

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
                        <asp:DropDownList ID="ddMarca" runat="server" CssClass="form-control" ClientIDMode="static"></asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="ddlIVA">Iva</label>
                        <asp:DropDownList ID="ddiva" runat="server" CssClass="form-control" ClientIDMode="static"></asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="preciounitario">
                            <asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, PrecioUnitario %>"></asp:Label></label>
                        <%--<asp:TextBox runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$" TextMode="Number" ID="precioAsp" CssClass="form-control" placeholder="Ingrese el precio unitario" ClientIDMode="static" required="" />--%>
                        <input type="number" runat="server" class="form-control" placeholder="Ingrese el precio unitario" 
                            required="" id="txtPrecio" name="txtPrecio" min="0.1" value="0" step="0.01" 
                            title="Currency" pattern="^\d+(?:\.\d{1,2})?$" onblur="
                            this.style.backgroundColor=/^\d+(?:\.\d{1,2})?$/.test(this.value)?'inherit':'gray'" />
                        <%--<input type="number" runat="server" max="99999999" min="0" id="txtPrecio" class="form-control" placeholder="Ingrese el precio unitario" required="" />--%>
                        <%--<asp:TextBox runat="server" ValidationExpression="\d*\.?\d*" TextMode="Number" ID="precioAsp" CssClass="form-control" placeholder="Ingrese el precio unitario" ClientIDMode="static" required />--%>
                        <div class="help-block with-errors"></div>
                    </div>

                    <div class="form-group">
                        <label for="urlProducto">URL </label>
                        &nbsp;<label id="urlErrorMessage" style="color: coral; font-weight: 100;" hidden="hidden">Soporte solo para imagenes: jpeg,jpg,png,gif</label>

                        <asp:FileUpload ID="urlProducto" runat="server" ClientIDMode="static" onchange="showimagepreview(this)" />
                        <br />
                        <img id="uploadFile" style="max-width: 50%; max-height: 50%;" src="#" alt="" />
                    </div>

                    <div class="form-group">
                        <%--<label for="descriplarga">--%>
                        <asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, Detalle %>"></asp:Label>
                        <textarea type="text" class="form-control" maxlength="400" id="descriplarga" runat="server" placeholder="Ingrese el detalle del producto" clientidmode="static" />
                        <%--<input type="text" class="form-control"  id="descriplarga2" aria-multiline="true" maxlength="50" runat="server" placeholder="Ingrese el detalle del producto" clientidmode="static" required="" />--%>
                        <div class="help-block with-errors"></div>
                    </div>

                    <div style="text-align: center;">
                        <%if (this.Master.Autenticar(new string[] { "ProductoAlta", "ProductoMod" }))
                          { %>
                        <asp:Button Text="Guardar" runat="server" ClientIDMode="Static" ID="btnGuardar" CssClass="btn btn-primary" OnClick="Guardar" />
                        <% } %>
                        <a href="GestionContenidoProductos.aspx" class="btn btn-default">Volver</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">

        <script type="text/javascript">

            if ($('#imagePath').val() === "") {
                $('#uploadFile').attr('hidden', '')
            } else {
                $('#uploadFile').attr('src', '/Content/Images/Productos/' + $('#imagePath').val());
            }

            function showimagepreview(input) {
                if (input.files && input.files[0]) {

                    var file = input.files[0];
                    var fileType = file["type"];
                    var ValidImageTypes = ["image/gif", "image/jpeg", "image/png"];

                    if ($.inArray(fileType, ValidImageTypes) < 0) {
                        $('#btnGuardar').attr('disabled', '');
                        $('#urlErrorMessage').removeAttr('hidden');
                    } else {
                        $('#btnGuardar').removeAttr('disabled', '');
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#urlErrorMessage').attr('hidden', 'hidden');
                            $('#uploadFile').attr('src', e.target.result).removeAttr('hidden');
                        }
                        reader.readAsDataURL(input.files[0]);
                    }
                }
            }
    </script>

</asp:Content>
