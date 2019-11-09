<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="RegistroCliente.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.RegistroCliente" %>
<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-9 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, RegistroCliente %>"></asp:Label>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-9 col-md-offset-2">
                <div id="divAlertaUsCreado" class="alert alert-success" runat="server" visible="false">
                    <asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, UsuarioCreadoCorrectamente %>"></asp:Label>
                </div>
                <h4 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, DatosCuenta %>"></asp:Label></h4>
                <div class="form-group">
                    <%--<label for="txtNombreUsuario">Nombre de Usuario</label>--%>
                    <asp:Label ID="lblNombreUsuario" CssClass="control-label col-xs-3" for="txtNombreUsuario" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label>
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <input type="text" class="form-control" id="txtNombreUsuario" runat="server" clientidmode="static" />
                        </div>
                        <div class="col-xs-7">
                            <asp:RegularExpressionValidator ID="vldExpNombreUsuario" Display="Dynamic" runat="server" ControlToValidate="txtNombreUsuario" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([a-zA-Z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="vldReqNombreUsuario" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarUsuario %>" ControlToValidate="txtNombreUsuario" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <%--<label for="txtClave">Contraseña</label><br />--%>
                    <asp:Label ID="lblClave" for="txtClave" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Clave %>"></asp:Label>
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <input type="password" class="form-control" id="txtClave" runat="server" clientidmode="static" placeholder="********" />
                        </div>
                        <div class="col-xs-7">
                            <asp:RegularExpressionValidator ID="vldTextoClave" Display="Dynamic" runat="server" Text="<%$Resources:Global, IngresoEntre815Caracteres %>" ControlToValidate="txtClave" CssClass="alert alert-warning" ValidationExpression="([a-zA-Z0-9]{8,15}$)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarContrasena %>" ControlToValidate="txtClave" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <%--<label for="txtClaveRep">Repetir Contraseña</label><br />--%>
                    <asp:Label ID="lblClaveRep" CssClass="control-label col-xs-3" for="txtClaveRep" runat="server" Text="<%$Resources:Global, RepetirContrasena %>"></asp:Label>
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <input type="password" class="form-control" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                        </div>
                        <div class="col-xs-7">
                            <asp:CompareValidator ID="vldClave" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ContrasenasDistintasCorta %>" ControlToValidate="txtClaveRep" ControlToCompare="txtClave" ValidationGroup="AltaCliente"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, RepetirContrasena %>" ControlToValidate="txtClaveRep" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%--Datos Personales--%>
        <div class="row">
            <div class="col-md-9 col-md-offset-2">
                <div id="DatosPersonales" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header">
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                    <div class="form-group">
                        <asp:Label ID="lblApellido" CssClass="control-label col-xs-3" for="txtApellido" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtApellido" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="vldExpApellido" Display="Dynamic" runat="server" ControlToValidate="txtApellido" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="vldReqApellido" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarApellido %>" ControlToValidate="txtApellido" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNombre" CssClass="control-label col-xs-3" for="txtNombre" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtNombre" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtNombre" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarNombre %>" ControlToValidate="txtNombre" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblMail" for="txtMail" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Correo %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtMail" runat="server" placeholder="<%$Resources:Global, EjemploCorreo %>" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="txtMail" CssClass="alert alert-warning" Text="<%$Resources:Global, EjemploCorreo %>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarCorreo %>" ControlToValidate="txtMail" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div id="divFiscal" class="form-group">
                        <asp:Label ID="Label3" for="ddlFiscal" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, CondicionFiscal %>"></asp:Label><br />
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <asp:DropDownList ID="ddlFiscal" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div id="divDNI" class="form-group">
                        <asp:Label ID="Label4" for="txtDNICUIT" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, DNIOCUIT %>"></asp:Label><br />
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtDNICUIT" runat="server" clientidmode="static" placeholder="20222333 o 20334446668" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ControlToValidate="txtDNICUIT" CssClass="alert alert-warning" Text="<%$Resources:Global, IngreseEntre7y12Numeros %>" ValidationExpression="^\d{7,12}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarDNIoCUIT %>" ControlToValidate="txtDNICUIT" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Direccion de Facturación y Envío--%>
        <div class="row">
            <div class="col-md-9 col-md-offset-2">
                <div id="divDirFacturacion" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header">
                        <asp:Label ID="Label5" for="txtDNICUIT" runat="server" Text="<%$Resources:Global, Direccion %>"></asp:Label></h4>
                    <div class="form-group">
                        <asp:Label ID="lblCalle" CssClass="control-label col-xs-3" for="txtCalle" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtCalle" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ControlToValidate="txtCalle" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloLetras %>" ValidationExpression="([a-zA-Z0-9\s]{3,30})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarCalle %>" ControlToValidate="txtCalle" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNumero" for="txtNumero" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label><br />
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="number" class="form-control" id="txtNumero" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" runat="server" ControlToValidate="txtNumero" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloNumero %>" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarNumeroCalle %>" ControlToValidate="txtNumero" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPiso" for="txtPiso" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label><br />
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="number" class="form-control" id="txtPiso" runat="server" value="0" placeholder="<%$Resources:Global, EjemploPiso %>" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ControlToValidate="txtPiso" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloNumero %>" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDepartamento" for="txtDpartamento" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtDpartamento" runat="server" placeholder="<%$Resources:Global, EjemploDepto %>" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ControlToValidate="txtDpartamento" CssClass="alert alert-warning" Text="<%$Resources:Global, DemasiadosCaracteres %>" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblLocalidad" for="txtLocalidad" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtLocalidad" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" Display="Dynamic" runat="server" ControlToValidate="txtLocalidad" CssClass="alert alert-warning" Text="<%$Resources:Global, DemasiadosCaracteres %>" ValidationExpression="([A-Za-z0-9\s]{0,50})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarLocalidad %>" ControlToValidate="txtLocalidad" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblProvincia" for="ddlProvincia" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <asp:DropDownList ID="ddlProvincia" CssClass="form-control" runat="server" ClientIDMode="static"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9 col-md-offset-2">
            <div class="form-group">
                <asp:Label CssClass="control-label col-xs-3" runat="server"></asp:Label>
                <div class="col-xs-9">
                    <div class="col-xs-5" style="margin-left: 1px">
                        <asp:Button ID="btnAltaCliente" CssClass="btn btn-primary form-control" ClientIDMode="static" Text="<%$Resources:Global, Registrarse %>" runat="server" OnClick="btnAltaCliente_Click" ValidationGroup="AltaCliente" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
