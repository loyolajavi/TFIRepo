<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.AltaUsuario" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header"><asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, AltaUsuario %>"></asp:Label>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div id="divAlertaUsCreado" class="alert alert-success" runat="server" visible="false">
                    <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, UsuarioCreado %>"></asp:Label>
                </div>
                <h4 class="page-header"> <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, TipoUsuario %>"></asp:Label></h4>
                <div class="form-group">
                    <asp:DropDownList ID="ddlTipoUsuario" ClientIDMode="Static" runat="server"></asp:DropDownList>
                </div>
                <h4 class="page-header"><asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, DatosCuenta %>"></asp:Label></h4>
                <div class="form-group">
                    <label for="txtNombreUsuario"><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label></label><br />
                    <input type="text" class="input-sm" id="txtNombreUsuario" runat="server" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="vldExpNombreUsuario" Display="Dynamic" runat="server" ControlToValidate="txtNombreUsuario" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationGroup="AltaEmpleado,AltaCliente" ValidationExpression="([a-z]+)"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="vldReqNombreUsuario" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el usuario" ControlToValidate="txtNombreUsuario" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtClave"><asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, Contrasena %>"></asp:Label></label><br />
                    <input type="password" class="input-sm" id="txtClave" runat="server" clientidmode="static" placeholder="********" />
                    <asp:RegularExpressionValidator ID="vldTextoClave" Display="Dynamic" runat="server" Text="Debe ingresar al menos 8 carácteres(Mayúscula, Letras y Números)" ControlToValidate="txtClave" ValidationGroup="AltaEmpleado,AltaCliente" CssClass="alert alert-warning" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la contraseña" ControlToValidate="txtClave" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtClaveRep"><asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, RepetirContrasena %>"></asp:Label></label><br />
                    <input type="password" class="input-sm" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                    <asp:CompareValidator ID="vldClave" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="La contraseñas no coinciden, por favor reingréselas" ControlToValidate="txtClaveRep" ValidationGroup="AltaEmpleado,AltaCliente" ControlToCompare="txtClave"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Repita la contraseña" ValidationGroup="AltaEmpleado,AltaCliente" ControlToValidate="txtClaveRep"></asp:RequiredFieldValidator>
                </div>
                <%--Datos Personales--%>
                <h4 class="page-header"><asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                <div class="form-group">
                    <label for="txtApellido"><asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label></label><br />
                    <input type="text" class="input-sm" id="txtApellido" runat="server" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="vldExpApellido" Display="Dynamic" runat="server" ControlToValidate="txtApellido" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([A-Za-z]+)" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="vldReqApellido" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el apellido" ControlToValidate="txtApellido" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtNombre"><asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label></label><br />
                    <input type="text" class="input-sm" id="txtNombre" runat="server" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtNombre" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([A-Za-z]+)" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el nombre" ControlToValidate="txtNombre" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtMail"><asp:Label ID="Label11" runat="server" Text="Mail"></asp:Label></label><br />
                    <input type="text" class="input-sm" style="width: 350px;" id="txtMail" runat="server" placeholder="ejemplo@ejemplo.com" clientidmode="static" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="txtMail" CssClass="alert alert-warning" Text="Ejemplo@ejemplo.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el mail" ControlToValidate="txtMail" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div id="divFiscal" class="form-group">
                    <label id="lblFiscal" for="ddlFiscal"><asp:Label ID="Label12" runat="server" Text="<%$Resources:Global, CondicionFiscal %>"></asp:Label></label><br />
                    <asp:DropDownList ID="ddlFiscal" runat="server"></asp:DropDownList>
                </div>
                <div id="divDNI" class="form-group">
                    <label id="lblDNI" for="txtDNICliente"><asp:Label ID="Label13" runat="server" Text="DNI O CUIT"></asp:Label></label><br />
                    <input type="text" class="input-sm" id="txtDNICUIT" runat="server" clientidmode="static" placeholder="20222333 o 20334446668" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ControlToValidate="txtDNICUIT" CssClass="alert alert-warning" Text="Ingrese entre 8 y 12 números" ValidationExpression="^\d{8,12}$" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el DNI/CUIT" ControlToValidate="txtDNICUIT" ValidationGroup="AltaEmpleado,AltaCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <h4 class="page-header"><asp:Label ID="Label14" runat="server" Text="<%$Resources:Global, PermisosUsuario %>"></asp:Label></h4>
                    <asp:DropDownList ID="ddlPermisosUsuarioAlta" CssClass="list-group" runat="server"></asp:DropDownList>
                </div>
                <%--Direccion de Facturación--%>
                <div id="divDirFacturacion" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header"><asp:Label ID="Label15" runat="server" Text="<%$Resources:Global, DireccionDeFacturacion %>"></asp:Label></h4>
                    <div class="form-group">
                        <label for="calle"><asp:Label ID="Label16" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtCalle" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ControlToValidate="txtCalle" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([a-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la calle" ControlToValidate="txtCalle" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="numero"><asp:Label ID="Label17" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label></label><br />
                        <input type="number" class="input-sm" id="txtNumero" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" runat="server" ControlToValidate="txtNumero" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el número de la calle" ControlToValidate="txtNumero" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="piso"><asp:Label ID="Label18" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtPiso" runat="server" placeholder="Ej para el primer piso: 1" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ControlToValidate="txtPiso" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="departamento"><asp:Label ID="Label19" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtDpartamento" runat="server" placeholder="Ej para el dpto A: A" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ControlToValidate="txtDpartamento" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="localidad"><asp:Label ID="Label20" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtLocalidad" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" Display="Dynamic" runat="server" ControlToValidate="txtLocalidad" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,50})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la localidad" ControlToValidate="txtLocalidad" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="provincia"><asp:Label ID="Label21" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label></label><br />
                        <asp:DropDownList ID="ddlProvincia" runat="server" ClientIDMode="static"></asp:DropDownList>
                    </div>
                </div>

                <%--Direccion de Envío--%>
                <div id="divDirEnvio" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header"><asp:Label ID="Label22" runat="server" Text="<%$Resources:Global, DireccionesDeEnvio %>"></asp:Label></h4>
                    <div class="form-group">
                        <label for="calleenvio"><asp:Label ID="Label23" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtCalleEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" Display="Dynamic" runat="server" ControlToValidate="txtCalleEnvio" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([a-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la calle" ControlToValidate="txtCalleEnvio" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="numeroenvio"><asp:Label ID="Label24" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label></label><br />
                        <input type="number" class="input-sm" id="txtNumeroEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" Display="Dynamic" runat="server" ControlToValidate="txtNumeroEnvio" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el número de la calle" ControlToValidate="txtNumeroEnvio" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="pisoenvio"><asp:Label ID="Label25" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtPisoEnvio" runat="server" placeholder="Ej para el primer piso: 1" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" Display="Dynamic" runat="server" ControlToValidate="txtPisoEnvio" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="departamentoenvio"><asp:Label ID="Label26" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtDepartamentoEnvio" runat="server" placeholder="Ej para el dpto A: A" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" Display="Dynamic" runat="server" ControlToValidate="txtDepartamentoEnvio" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label for="localidadenvio"><asp:Label ID="Label27" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtLocalidadEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" Display="Dynamic" runat="server" ControlToValidate="txtLocalidadEnvio" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,50})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la localidad" ControlToValidate="txtLocalidadEnvio" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="ddlProvinciaEnvio"><asp:Label ID="Label28" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label></label><br />
                        <asp:DropDownList ID="ddlProvinciaEnvio" runat="server" ClientIDMode="static"></asp:DropDownList>
                    </div>
                </div>

                <asp:Button ID="btnAltaEmpleado" CssClass="btn btn-primary" ClientIDMode="static" Text="<%$Resources:Global, RegistrarEmpleado %>" runat="server" OnClick="btnAltaUsuario_Click" ValidationGroup="AltaEmpleado" />
                <asp:Button ID="btnAltaCliente" CssClass="btn btn-primary" ClientIDMode="static" Text="<%$Resources:Global, RegistroCliente %>" runat="server" OnClick="btnAltaUsuario_Click" ValidationGroup="AltaCliente" />
            </div>
        </div>
    </div>



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
