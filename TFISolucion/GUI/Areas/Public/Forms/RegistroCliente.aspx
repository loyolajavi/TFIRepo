<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="RegistroCliente.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.RegistroCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, RegistroCliente %>"></asp:Label>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div id="divAlertaUsCreado" class="alert alert-success" runat="server" visible="false">
                    <asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, UsuarioCreadoCorrectamente %>"></asp:Label></div>
                <h4 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, DatosCuenta %>"></asp:Label></h4>
                <div class="form-group">
                    <%--<label for="txtNombreUsuario">Nombre de Usuario</label>--%>
                    <asp:Label ID="lblNombreUsuario" for="txtNombreUsuario" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label>
                    <br />
                    <input type="text" class="input-sm" id="txtNombreUsuario" runat="server" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="vldExpNombreUsuario" Display="Dynamic" runat="server" ControlToValidate="txtNombreUsuario" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([a-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="vldReqNombreUsuario" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarUsuario %>" ControlToValidate="txtNombreUsuario" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <%--<label for="txtClave">Contraseña</label><br />--%>
                    <asp:Label ID="lblClave" for="txtClave" runat="server" Text="<%$Resources:Global, Clave %>"></asp:Label></br>
                    <input type="password" class="input-sm" id="txtClave" runat="server" clientidmode="static" placeholder="********" />
                    <asp:RegularExpressionValidator ID="vldTextoClave" Display="Dynamic" runat="server" Text="<%$Resources:Global, ContrasenaSegura %>" ControlToValidate="txtClave" CssClass="alert alert-warning" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarContrasena %>" ControlToValidate="txtClave" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <%--<label for="txtClaveRep">Repetir Contraseña</label><br />--%>
                    <asp:Label ID="lblClaveRep" for="txtClaveRep" runat="server" Text="<%$Resources:Global, ClaveRepetida %>"></asp:Label></br>
                    <input type="password" class="input-sm" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                    <asp:CompareValidator ID="vldClave" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ContrasenasDistintas %>" ControlToValidate="txtClaveRep" ControlToCompare="txtClave" ValidationGroup="AltaCliente"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, RepetirContrasena %>" ControlToValidate="txtClaveRep" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <%--Datos Personales--%>
                <h4 class="page-header">
                    <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                <div class="form-group">
                    <asp:Label ID="lblApellido" for="txtApellido" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label><br />
                    <input type="text" class="input-sm" id="txtApellido" runat="server" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="vldExpApellido" Display="Dynamic" runat="server" ControlToValidate="txtApellido" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([A-Za-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="vldReqApellido" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ApellidoVacio %>" ControlToValidate="txtApellido" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblNombre" for="txtNombre" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label><br />
                    <input type="text" class="input-sm" id="txtNombre" runat="server" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtNombre" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([A-Za-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, NombreVacio %>" ControlToValidate="txtNombre" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblMail" for="txtMail" runat="server" Text="<%$Resources:Global, Correo %>"></asp:Label><br />
                    <input type="text" class="input-sm" style="width: 350px;" id="txtMail" runat="server" placeholder="<%$Resources:Global, EjemploCorreo %>" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="txtMail" CssClass="alert alert-warning" Text="<%$Resources:Global, EjemploCorreo %>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, CorreoVacio %>" ControlToValidate="txtMail" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div id="divFiscal" class="form-group">
                    <asp:Label ID="Label3" for="ddlFiscal" runat="server" Text="<%$Resources:Global, CondicionFiscal %>"></asp:Label><br />
                    <asp:DropDownList ID="ddlFiscal" runat="server"></asp:DropDownList>
                </div>
                <div id="divDNI" class="form-group">
                    <asp:Label ID="Label4" for="txtDNICUIT" runat="server" Text="<%$Resources:Global, DNIOCUIT %>"></asp:Label><br />
                    <input type="text" class="input-sm" id="txtDNICUIT" runat="server" clientidmode="static" placeholder="20222333 o 20334446668" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ControlToValidate="txtDNICUIT" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresoSolo8y12 %>" ValidationExpression="^\d{8,12}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, DNICUITVacio %>" ControlToValidate="txtDNICUIT" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <%--Direccion de Facturación y Envío--%>
                <div id="divDirFacturacion" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header">
                        <asp:Label ID="Label5" for="txtDNICUIT" runat="server" Text="<%$Resources:Global, Direccion %>"></asp:Label></h4>
                    <div class="form-group">
                        <asp:Label ID="lblCalle" for="txtCalle" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label><br />
                        <input type="text" class="input-sm" id="txtCalle" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ControlToValidate="txtCalle" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresoMax30 %>" ValidationExpression="([a-zA-Z0-9]{3,30})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarCalle %>" ControlToValidate="txtCalle" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNumero" for="txtNumero" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label><br />
                        <input type="number" class="input-sm" id="txtNumero" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" runat="server" ControlToValidate="txtNumero" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloNumeros %>" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarNumeroCalle %>" ControlToValidate="txtNumero" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPiso" for="txtPiso" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label><br />
                        <input type="text" class="input-sm" id="txtPiso" runat="server" placeholder="<%$Resources:Global, EjemploPiso %>" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ControlToValidate="txtPiso" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloNumeros %>" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDepartamento" for="txtDpartamento" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label><br />
                        <input type="text" class="input-sm" id="txtDpartamento" runat="server" placeholder="<%$Resources:Global, EjemploDepto %>" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ControlToValidate="txtDpartamento" CssClass="alert alert-warning" Text="<%$Resources:Global, DemasiadosCaracteresIngresados %>" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblLocalidad" for="txtLocalidad" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label><br />
                        <input type="text" class="input-sm" id="txtLocalidad" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" Display="Dynamic" runat="server" ControlToValidate="txtLocalidad" CssClass="alert alert-warning" Text="<%$Resources:Global, DemasiadosCaracteresIngresados %>" ValidationExpression="([A-Za-z0-9]{0,50})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarLocalidad %>" ControlToValidate="txtLocalidad" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblProvincia" for="ddlProvincia" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label><br />
                        <asp:DropDownList ID="ddlProvincia" runat="server" ClientIDMode="static"></asp:DropDownList>
                    </div>
                </div>

                <asp:Button ID="btnAltaCliente" CssClass="btn btn-primary" ClientIDMode="static" Text="<%$Resources:Global, Registrarse %>" runat="server" OnClick="btnAltaCliente_Click" ValidationGroup="AltaCliente" />
            </div>
        </div>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
