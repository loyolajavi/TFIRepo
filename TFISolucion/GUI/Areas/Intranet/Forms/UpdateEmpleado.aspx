<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="UpdateEmpleado.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.UpdateEmpleado" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, EditarEmpleado %>"></asp:Label> <small><asp:Label ID="lblEmpleado" runat="server"></asp:Label> </small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h4 class="page-header"><asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, CuentaEmpleado %>"></asp:Label></h4>
                <div class="form-group">
                    <label for="txtNombreUsuario"><asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label></label>
                    <input type="text" class="form-control" id="txtNombreUsuario" runat="server" clientidmode="static" />
                </div>
                <asp:Button ID="btnNombreUsuario" CssClass="btn btn-primary" Text="<%$Resources:Global, ModificarNombreUsuario %>" runat="server" OnClick="btnNombreUsuario_Click" />
                <br />
                <br />
                <div class="form-group">
                    <label for="txtClave"><asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Contrasena %>"></asp:Label></label><br />
                    <input type="password" class=" input-sm" id="txtClave" runat="server" clientidmode="static" placeholder="********" />
                    <asp:RegularExpressionValidator ID="vldTextoClave" runat="server" Text="<%$Resources:Global, ValidacionContrasena %>" ControlToValidate="txtClave" CssClass="alert alert-warning" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label for="txtClaveRep"><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, RepetirContrasena %>"></asp:Label></label><br />
                    <input type="password" class="input-sm" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                    <asp:CompareValidator ID="vldClave" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ContrasenaNoCoincide %>" ControlToValidate="txtClaveRep" ControlToCompare="txtClave"></asp:CompareValidator>
                </div>
                    <asp:Button ID="btnCambiarClave" CssClass="btn btn-primary" Text="<%$Resources:Global, ModificarContrasena %>" runat="server" OnClick="btnCambiarClave_Click" />
                
                <div id="divEspacioModifClave" runat="server"></div>
                <div id="divAlertaModifClave" class="alert alert-success" runat="server" visible="false"><asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, ModificoContrasena %>"></asp:Label></div>
                <h4 class="page-header"><asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                <div class="form-group">
                    <label for="txtApellido"><asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label></label>
                    <input type="text" class="form-control" id="txtApellido" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtNombre"><asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label></label>
                    <input type="text" class="form-control" id="txtNombre" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtMail">E-mail</label>
                    <input type="text" class="form-control" id="txtMail" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtDNI">DNI</label>
                    <input type="text" class="form-control" id="txtDNI" runat="server" clientidmode="static" />
                </div>
                <asp:Button ID="btnDatosUsuarioUpdate" CssClass="btn btn-info" Text="Modificar Datos" runat="server" OnClick="btnDatosUsuarioUpdate_Click" />
                <div class="form-group">
                    <h4 class="page-header"><asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, PermisosUsuario %>"></asp:Label></h4>
                    <asp:DropDownList ID="ddlPermisosUsuarioUpdate" CssClass="list-group" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnPermisosUsuarioUpdate" CssClass="btn btn-warning" Text="<%$Resources:Global, ModificarPermiso %>" runat="server" OnClick="btnPermisosUsuarioUpdate_Click" />
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
