<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.AltaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">Alta de Usuario
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h4 class="page-header">Tipo de Usuario</h4>
                <div class="form-group">
                    <asp:DropDownList ID="ddlTipoUsuario" ClientIDMode="Static" runat="server"></asp:DropDownList>
                </div>
                <h4 class="page-header">Datos de la Cuenta</h4>
                <div class="form-group">
                    <label for="txtNombreUsuario">Nombre de Usuario</label>
                    <input type="text" class="form-control" id="txtNombreUsuario" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtClave">Contraseña</label><br />
                    <input type="password" class=" input-sm" id="txtClave" runat="server" clientidmode="static" placeholder="********" />
                    <asp:RegularExpressionValidator ID="vldTextoClave" runat="server" Text="Debe ingresar al menos 8 carácteres(Mayúscula, Letras y Números)" ControlToValidate="txtClave" CssClass="alert alert-warning" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="txtClaveRep">Repetir Contraseña</label><br />
                    <input type="password" class="input-sm" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                    <asp:CompareValidator ID="vldClave" CssClass="alert alert-warning" runat="server" Text="La contraseñas no coinciden, por favor reingréselas" ControlToValidate="txtClaveRep" ControlToCompare="txtClave"></asp:CompareValidator>
                </div>
                <%--<div id="divEspacioModifClave" runat="server"></div>
                <div id="divAlertaModifClave" class="alert alert-success" runat="server" visible="false">Se modificó la contraseña</div>--%>
                <h4 class="page-header">Datos personales del Usuario</h4>
                <div class="form-group">
                    <label for="txtApellido">Apellido</label>
                    <input type="text" class="form-control" id="txtApellido" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtNombre">Nombre</label>
                    <input type="text" class="form-control" id="txtNombre" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtMail">E-mail</label>
                    <input type="text" class="form-control" id="txtMail" runat="server" clientidmode="static" />
                </div>
                <div id="divFiscal" class="form-group">
                    <label id="lblFiscal" for="ddlFiscal">Condición Fiscal</label>
                    <asp:DropDownList CssClass="form-control" ID="ddlFiscal" runat="server" ></asp:DropDownList>
                </div>
                <div id="divDNI" class="form-group">
                    <label id="lblDNI" for="txtDNICliente">DNI/CUIT</label>
                    <input type="text" class="form-control" id="txtDNICliente" runat="server" clientidmode="static"  />
                </div>
                <%--<div id="divCUIT" class="form-group">
                    <label id="lblCUIT" for="txtCUITCliente">CUIT</label>
                    <input type="text" class="form-control" id="txtCUITCliente" runat="server" clientidmode="static" />
                </div>--%>
                <div class="form-group">
                    <h4 class="page-header">Permisos del usuario</h4>
                    <asp:DropDownList ID="ddlPermisosUsuarioUpdate" CssClass="list-group" runat="server"></asp:DropDownList>
                </div>
                <%--<asp:Button ID="btnPermisosUsuarioUpdate" CssClass="btn btn-warning" Text="Modificar Permiso" runat="server" OnClick="btnPermisosUsuarioUpdate_Click" />--%>
            </div>
        </div>
    </div>



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
