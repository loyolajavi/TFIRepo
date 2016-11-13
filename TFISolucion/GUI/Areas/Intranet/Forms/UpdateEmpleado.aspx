<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="UpdateEmpleado.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.UpdateEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">Editar empleado: <small><asp:Label ID="lblEmpleado" runat="server"></asp:Label> </small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h4 class="page-header">Cuenta del Empleado</h4>
                <div class="form-group">
                    <label for="txtNombreUsuario">Nombre de Usuario</label>
                    <input type="text" class="form-control" id="txtNombreUsuario" runat="server" clientidmode="static" />
                </div>
                <asp:Button ID="btnNombreUsuario" CssClass="btn btn-primary" Text="Modificar Nombre de Usuario" runat="server" OnClick="btnNombreUsuario_Click" />
                <br />
                <br />
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
                    <asp:Button ID="btnCambiarClave" CssClass="btn btn-primary" Text="Modificar Contraseña" runat="server" OnClick="btnCambiarClave_Click" />
                
                <div id="divEspacioModifClave" runat="server"></div>
                <div id="divAlertaModifClave" class="alert alert-success" runat="server" visible="false">Se modificó la contraseña</div>
                <h4 class="page-header">Datos personales del Empleado</h4>
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
                <div class="form-group">
                    <label for="txtDNI">DNI</label>
                    <input type="text" class="form-control" id="txtDNI" runat="server" clientidmode="static" />
                </div>
                <asp:Button ID="btnDatosUsuarioUpdate" CssClass="btn btn-info" Text="Modificar Datos" runat="server" OnClick="btnDatosUsuarioUpdate_Click" />
                <div class="form-group">
                    <h4 class="page-header">Permisos del empleado</h4>
                    <asp:DropDownList ID="ddlPermisosUsuarioUpdate" CssClass="list-group" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnPermisosUsuarioUpdate" CssClass="btn btn-warning" Text="Modificar Permiso" runat="server" OnClick="btnPermisosUsuarioUpdate_Click" />
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
