<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="UpdateCliente.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.UpdateCliente" EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, EditarCliente %>"> </asp:Label> <small>
                    <asp:Label ID="lblCliente" runat="server"></asp:Label>
                </small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h4 class="page-header">
                    <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, DatosCuenta %>"></asp:Label></h4>
                <div class="form-group">
                    <label for="txtNombreUsuario">
                        <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label></label>
                    <input type="text" class="form-control" id="txtNombreUsuario" runat="server" title="Ingrese solo letras y menos de 20 letras" pattern="^[_A-z\s]{1,20}$" ClientIDMode="static"  ValidationGroup="NomUs"  />
                </div>
                <%if (this.Master.Autenticar(new string[] { "ClienteMod" }))
                  {%>
                <asp:Button ID="btnNombreUsuario" CssClass="btn btn-primary" Text="<%$Resources:Global, ModificarNombreUsuario %>" runat="server" OnClick="btnNombreUsuario_Click" ValidationGroup="NomUs" />
                <%} %>
                <br />
                <br />
                <div class="form-group">
                    <label for="txtClave"><asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Contrasena %>"></asp:Label></label><br />
                    <input type="password" class=" input-sm" id="txtClave" runat="server" ClientIDMode="static" placeholder="********" />
                    <asp:RegularExpressionValidator ID="vldTextoClave" runat="server" Text="<%$Resources:Global, ValidacionContrasena %>" ControlToValidate="txtClave" CssClass="alert alert-warning" ValidationGroup="ModifPass"  ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label for="txtClaveRep"><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, RepetirContrasena %>"></asp:Label></label><br />
                    <input type="password" class="input-sm" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                    <asp:CompareValidator ID="vldClave" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ContrasenaNoCoincide %>" ControlToValidate="txtClaveRep" ValidationGroup="ModifPass"  ControlToCompare="txtClave"></asp:CompareValidator>
                </div>
                <%if (this.Master.Autenticar(new string[] { "ClienteMod" }))
                  {%>
                <asp:Button ID="btnCambiarClave" CssClass="btn btn-primary" Text="<%$Resources:Global, ModificarContrasena %>" runat="server" ValidationGroup="ModifPass"  OnClick="btnCambiarClave_Click" />
                <%} %>

                <div id="divEspacioModifClave" runat="server"></div>
                <div id="divAlertaModifClave" class="alert alert-success" runat="server" visible="false">
                    <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, ModificoContrasena %>"></asp:Label></div>
                <div id="divMsjError" class="alert alert-danger" runat="server" visible="false">
                        <asp:Label ID="Label11" runat="server" Text="<%$Resources:Global, msjAVerifiquePass %>"></asp:Label></div>

                <h4 class="page-header"><asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                <div class="form-group">
                    <label for="txtApellido"><asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label></label>
                    <input type="text" class="form-control" id="txtApellido" runat="server" title="Ingrese solo letras y menos de 20 letras" pattern="^[_A-z\s]{1,20}$" required="required" clientidmode="static" ValidationGroup="ModifDatos" />
                </div>
                <div class="form-group">
                    <label for="txtNombre"><asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label></label>
                    <input type="text" class="form-control" id="txtNombre" runat="server" title="Ingrese solo letras y menos de 20 letras" pattern="^[_A-z\s]{1,20}$" clientidmode="static" ValidationGroup="ModifDatos" required="required" />
                </div>
                <div class="form-group">
                    <label for="txtMail">E-mail</label>
                    <input type="text" class="form-control" id="txtMail" runat="server" title="mail@mail.com" clientidmode="static" ValidationGroup="ModifDatos" required="required"  />
                </div>
                <div id="divFiscal" class="form-group">
                    <label id="lblFiscal" for="ddlFiscalCliente"><asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, CondicionFiscal %>"></asp:Label></label><br />
                    <asp:DropDownList ID="ddlFiscalCliente" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtDNI">DNI/CUIT</label>
                    <input type="text" class="form-control" id="txtDNI" runat="server" pattern="[0-9]{8,9}" title="Solo números hasta 9 dígitos" clientidmode="static" ValidationGroup="ModifDatos" required="required" />
                </div>
                <%if (this.Master.Autenticar(new string[] { "ClienteMod" }))
                  {%>
                <asp:Button ID="btnDatosUsuarioUpdate" CssClass="btn btn-info" Text="Modificar Datos" runat="server" OnClick="btnDatosUsuarioUpdate_Click" />
                <%} %>
<%--                <div class="form-group">
                    <h4 class="page-header"><asp:Label ID="Label11" runat="server" Text="<%$Resources:Global, Permisos %>"></asp:Label></h4>
                    <asp:DropDownList ID="ddlPermisosUsuarioUpdate" CssClass="list-group" runat="server"></asp:DropDownList>
                </div>
                <asp:Button ID="btnPermisosUsuarioUpdate" CssClass="btn btn-warning" Text="<%$Resources:Global, ModificarPermiso %>" runat="server" OnClick="btnPermisosUsuarioUpdate_Click" />--%>



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
                    <h4 class="page-header"><asp:Label ID="Label12" runat="server" Text="<%$Resources:Global, DireccionDeFacturacion %>"></asp:Label></h4>
                    <div class="form-group">
                        <label for="calle"><asp:Label ID="Label13" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtCalle" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ControlToValidate="txtCalle" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloLetras %>" ValidationExpression="([a-z]+)" ValidationGroup="DirFac"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngreseCalle %>" ControlToValidate="txtCalle" ValidationGroup="DirFac"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="numero"><asp:Label ID="Label14" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label></label><br />
                        <input type="number" class="input-sm" id="txtNumero" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" runat="server" ControlToValidate="txtNumero" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloNumero %>" ValidationExpression="^\d{1,5}$" ValidationGroup="DirFac"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngreseNumero %>" ControlToValidate="txtNumero" ValidationGroup="DirFac"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="piso"><asp:Label ID="Label15" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtPiso" runat="server" placeholder="Ej para el primer piso: 1" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ControlToValidate="txtPiso" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloNumero %>" ValidationExpression="^\d{1,5}$" ValidationGroup="DirFac"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="departamento"><asp:Label ID="Label16" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtDpartamento" runat="server" placeholder="Ej para el dpto A: A" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ControlToValidate="txtDpartamento" CssClass="alert alert-warning" Text="<%$Resources:Global, CaracteresSobrepasado %>" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="DirFac"></asp:RegularExpressionValidator>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>                    
                            <div class="form-group">
                                <label for="provincia"><asp:Label ID="Label18" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label></label><br />
                                <asp:DropDownList ID="ddlProvincia" runat="server" ClientIDMode="static" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="localidad"><asp:Label ID="lblLocalidad2" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label></label><br />
                                <asp:DropDownList ID="ddlLocalidad" CssClass="form-control" runat="server" ClientIDMode="static" ></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%if (this.Master.Autenticar(new string[] { "ClienteMod" }))
                      {%>
                    <asp:Button ID="btnUpdateFacturacion" CssClass="btn btn-default" runat="server" Text="<%$Resources:Global, ModificarFacturacion %>" OnClick="btnUpdateFacturacion_Click" />
                    <%} %>
                </div>

                <%--Direccion de Envío--%>
                <div id="divDirEnvio" role="form" clientidmode="static" runat="server">
                    <h4 class="page-header"><asp:Label ID="Label19" runat="server" Text="<%$Resources:Global, DireccionesDeEnvio %>"></asp:Label></h4>
                    <div class="form-group">
                        <label for="calleenvio"><asp:Label ID="Label20" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtCalleEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" Display="Dynamic" runat="server" ControlToValidate="txtCalleEnvio" CssClass="alert alert-warning" Text="Deben ser solo letras" ValidationExpression="([a-z]+)" ValidationGroup="DirEnvio"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngreseCalle %>" ControlToValidate="txtCalleEnvio" ValidationGroup="DirEnvio"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="numeroenvio"><asp:Label ID="Label21" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label></label><br />
                        <input type="number" class="input-sm" id="txtNumeroEnvio" runat="server" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" Display="Dynamic" runat="server" ControlToValidate="txtNumeroEnvio" CssClass="alert alert-warning" Text="Ingrese solo números" ValidationExpression="^\d{1,5}$" ValidationGroup="DirEnvio"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngreseNumero %>" ControlToValidate="txtNumeroEnvio" ValidationGroup="DirEnvio"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="pisoenvio"><asp:Label ID="Label22" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtPisoEnvio" runat="server" placeholder="Ej para el primer piso: 1" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" Display="Dynamic" runat="server" ControlToValidate="txtPisoEnvio" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloNumero %>" ValidationExpression="^\d{1,5}$" ValidationGroup="DirEnvio"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="departamentoenvio"><asp:Label ID="Label23" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label></label><br />
                        <input type="text" class="input-sm" id="txtDepartamentoEnvio" runat="server" placeholder="Ej para el dpto A: A" clientidmode="static" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" Display="Dynamic" runat="server" ControlToValidate="txtDepartamentoEnvio" CssClass="alert alert-warning" Text="<%$Resources:Global, CaracteresSobrepasado %>" ValidationExpression="([A-Za-z0-9]{0,20})" ValidationGroup="DirEnvio"></asp:RegularExpressionValidator>
                    </div>
                    
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>   
                            <div class="form-group">
                                <label for="ddlProvinciaEnvio"><asp:Label ID="Label25" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label></label><br />
                                <asp:DropDownList ID="ddlProvinciaEnvio" runat="server" OnSelectedIndexChanged="ddlProvinciaEnvio_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="ddlLocalidadEnvio"><asp:Label ID="Label17" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label></label><br />
                                <asp:DropDownList ID="ddlLocalidadEnvio" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%if (this.Master.Autenticar(new string[] { "ClienteMod" }))
                      {%>
                    <asp:Button ID="btnUpdateEnvio" CssClass="btn btn-default" runat="server" Text="<%$Resources:Global, ModificarEnvio %>" OnClick="btnUpdateEnvio_Click" />
                    <%} %>
                </div>

            </div>
        </div>
    </div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
