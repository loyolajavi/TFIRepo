<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="UpdateEmpleado.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.UpdateEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">Editar empleado:<small> Empleado</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h4 class="page-header">Datos de Cuenta del empleado</h4>
                <div class="form-group">
                    <label for="txtNombreUsuario">Nombre de Usuario</label>
                    <input type="text" class="form-control" id="txtNombreUsuario" value="<%UnEmpleado.NombreUsuario%>" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtClave">Contraseña</label>
                    <input type="text" class="form-control" id="txtClave" runat="server" clientidmode="static" />
                </div>
                <div class="form-group">
                    <label for="txtClaveRep">Repetir Contraseña</label>
                    <input type="text" class="form-control" id="txtClaveRep" runat="server" clientidmode="static" />
                </div>
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
