<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="UpdateCliente.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.UpdateCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">Editar cliente: <small>
                    <asp:Label ID="lblCliente" runat="server"></asp:Label>
                </small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h4 class="page-header">Cuenta del Cliente</h4>
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
                <h4 class="page-header">Datos personales del Cliente</h4>
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
                    <label id="lblFiscal" for="ddlFiscalCliente">Condición Fiscal</label><br />
                    <asp:DropDownList ID="ddlFiscalCliente" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtDNI">DNI/CUIT</label>
                    <input type="text" class="form-control" id="txtDNI" runat="server" clientidmode="static" />
                </div>
                <asp:Button ID="btnDatosUsuarioUpdate" CssClass="btn btn-info" Text="Modificar Datos" runat="server" OnClick="btnDatosUsuarioUpdate_Click" />
                <div class="form-group">
                    <h4 class="page-header">Permisos del empleado</h4>
                    <asp:DropDownList ID="ddlPermisosUsuarioUpdate" CssClass="list-group" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnPermisosUsuarioUpdate" CssClass="btn btn-warning" Text="Modificar Permiso" runat="server" OnClick="btnPermisosUsuarioUpdate_Click" />



<%--                <table class="table-bordered col-md-6 col-md-offset-3 table-responsive" id="tblEmpleados">
                    <thead>
                        <tr>
                            <th class="text-center">Calle</th>
                            <th class="text-center">Número</th>
                            <th class="text-center">Departamento</th>
                            <th class="text-center">Localidad</th>
                            <th class="text-center">Provincia</th>
                            <th class="text-center">Predeterminada</th>

                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDirFacturacion" ClientIDMode="Static" runat="server">
                        <ItemTemplate>

                            <tbody>
                                <tr class="text-center">
                                    <td>
                                        <input type="text" class="input-sm" id="txtCalle" runat="server" clientidmode="static" value='<%Eval("Calle") %>' />
                                        <a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateEmpleado.aspx?Emple={0}") %>'><%#Eval("NombreUsuario") %></a>
                                    </td>
                                    <td>
                                        <a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateEmpleado.aspx?Emple={0}") %>'><%#Eval("Apellido") %></a>
                                    </td>
                                    <td><a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateEmpleado.aspx?Emple={0}") %>'><%#Eval("Nombre") %></a>

                                    </td>
                                </tr>
                            </tbody>


                        </ItemTemplate>
                    </asp:Repeater>
                </table>--%>

















                <%--Direccion de Facturación--%>
                <div id="divDirFacturacion" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header">Dirección de Facturación</h4>
                    <div class="form-group">
                        <label for="calle">Calle</label><br />
                        <input type="text" class="input-sm" id="txtCalle" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ControlToValidate="txtCalle" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([a-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la calle" ControlToValidate="txtCalle" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="numero">Número</label><br />
                        <input type="number" class="input-sm" id="txtNumero" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" runat="server" ControlToValidate="txtNumero" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el número de la calle" ControlToValidate="txtNumero" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="piso">Piso</label><br />
                        <input type="text" class="input-sm" id="txtPiso" runat="server" placeholder="Ej para el primer piso: 1" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ControlToValidate="txtPiso" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="departamento">Departamento</label><br />
                        <input type="text" class="input-sm" id="txtDpartamento" runat="server" placeholder="Ej para el dpto A: A" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ControlToValidate="txtDpartamento" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="localidad">Localidad</label><br />
                        <input type="text" class="input-sm" id="txtLocalidad" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" Display="Dynamic" runat="server" ControlToValidate="txtLocalidad" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,50})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la localidad" ControlToValidate="txtLocalidad" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="provincia">Provincia</label><br />
                        <asp:DropDownList ID="ddlProvincia" runat="server" ClientIDMode="static"></asp:DropDownList>
                    </div>
                    <asp:Button ID="btnUpdateFacturacion" CssClass="btn btn-default" runat="server" Text="Modificar Dirección Facturación" OnClick="btnUpdateFacturacion_Click" />
                </div>

                <%--Direccion de Envío--%>
                <div id="divDirEnvio" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header">Dirección de Envío</h4>
                    <div class="form-group">
                        <label for="calleenvio">Calle</label><br />
                        <input type="text" class="input-sm" id="txtCalleEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" Display="Dynamic" runat="server" ControlToValidate="txtCalleEnvio" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([a-z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la calle" ControlToValidate="txtCalleEnvio" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="numeroenvio">Número</label><br />
                        <input type="number" class="input-sm" id="txtNumeroEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" Display="Dynamic" runat="server" ControlToValidate="txtNumeroEnvio" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese el número de la calle" ControlToValidate="txtNumeroEnvio" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="pisoenvio">Piso</label><br />
                        <input type="text" class="input-sm" id="txtPisoEnvio" runat="server" placeholder="Ej para el primer piso: 1" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" Display="Dynamic" runat="server" ControlToValidate="txtPisoEnvio" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="departamentoenvio">Departamento</label><br />
                        <input type="text" class="input-sm" id="txtDepartamentoEnvio" runat="server" placeholder="Ej para el dpto A: A" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" Display="Dynamic" runat="server" ControlToValidate="txtDepartamentoEnvio" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label for="localidadenvio">Localidad</label><br />
                        <input type="text" class="input-sm" id="txtLocalidadEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" Display="Dynamic" runat="server" ControlToValidate="txtLocalidadEnvio" CssClass="alert alert-warning" Text="Cantidad de caracteres sobrepasada" ValidationExpression="([A-Za-z0-9]{0,50})" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingrese la localidad" ControlToValidate="txtLocalidadEnvio" ValidationGroup="AltaCliente"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="ddlProvinciaEnvio">Provincia</label><br />
                        <asp:DropDownList ID="ddlProvinciaEnvio" runat="server" ClientIDMode="static"></asp:DropDownList>
                    </div>
                    <asp:Button ID="btnUpdateEnvio" CssClass="btn btn-default" runat="server" Text="Modificar Dirección Envío" OnClick="btnUpdateEnvio_Click" />
                </div>

            </div>
        </div>
    </div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
