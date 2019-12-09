<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.AltaUsuario" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1 class="page-header text-center">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, AltaUsuario %>"></asp:Label>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-9 col-md-offset-2">
                <div id="divAlertaUsCreado" class="alert alert-success" runat="server" visible="false">
                    <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, UsuarioCreado %>"></asp:Label>
                </div>
<%--                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="control-label col-xs-3" Text="<%$Resources:Global, TipoUsuario %>"></asp:Label>
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <asp:DropDownList ID="ddlTipoUsuario" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>--%>

                <h4 class="page-header">
                    <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, DatosCuenta %>"></asp:Label></h4>
                <div class="form-group">
                    <asp:Label ID="Label5" CssClass="control-label col-xs-3" for="txtNombreUsuario" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label>
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <input type="text" class="form-control" id="txtNombreUsuario" runat="server" clientidmode="static" />
                        </div>
                        <div class="col-xs-7">
                            <asp:RegularExpressionValidator ID="vldExpNombreUsuario" Display="Dynamic" runat="server" ControlToValidate="txtNombreUsuario" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationGroup="AltaEmpleado" ValidationExpression="([A-Za-z]+)"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="vldReqNombreUsuario" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarUsuario %>" ControlToValidate="txtNombreUsuario" ValidationGroup="AltaEmpleado"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" CssClass="control-label col-xs-3" for="txtClave" runat="server" Text="<%$Resources:Global, Contrasena %>"></asp:Label>
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <input type="password" class="form-control" id="txtClave" runat="server" clientidmode="static" placeholder="********" />
                        </div>
                        <div class="col-xs-7">
                            <asp:RegularExpressionValidator ID="vldTextoClave" Display="Dynamic" runat="server" Text="<%$Resources:Global, IngresoEntre815Caracteres%>" ControlToValidate="txtClave" ValidationGroup="AltaEmpleado" CssClass="alert alert-warning" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarContrasena %>" ControlToValidate="txtClave" ValidationGroup="AltaEmpleado"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" for="txtClaveRep" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, RepetirContrasena %>"></asp:Label><br />
                    <div class="col-xs-9">
                        <div class="col-xs-5">
                            <input type="password" class="form-control" id="txtClaveRep" runat="server" clientidmode="static" placeholder="********" />
                        </div>
                        <div class="col-xs-7">
                            <asp:CompareValidator ID="vldClave" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ContrasenasDistintasCorta %>" ControlToValidate="txtClaveRep" ValidationGroup="AltaEmpleado" ControlToCompare="txtClave"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, RepetirContrasena %>" ValidationGroup="AltaEmpleado" ControlToValidate="txtClaveRep"></asp:RequiredFieldValidator>
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
                        <asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                        <asp:Label ID="Label9" for="txtApellido" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtApellido" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="vldExpApellido" Display="Dynamic" runat="server" ControlToValidate="txtApellido" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="AltaEmpleado"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="vldReqApellido" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarApellido %>" ControlToValidate="txtApellido" ValidationGroup="AltaEmpleado"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:Label ID="Label10" for="txtNombre" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtNombre" runat="server" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtNombre" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="AltaEmpleado"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarNombre %>" ControlToValidate="txtNombre" ValidationGroup="AltaEmpleado"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:Label ID="Label11" for="txtMail" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Correo %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtMail" runat="server" placeholder="<%$Resources:Global, EjemploCorreo %>" clientidmode="static" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="txtMail" CssClass="alert alert-warning" Text="<%$Resources:Global, EjemploCorreo %>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AltaEmpleado"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarCorreo %>" ControlToValidate="txtMail" ValidationGroup="AltaEmpleado"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    <%--ALTA CLIENTE BORRADO--%>
                    <%--<div id="divFiscal" class="form-group" runat="server">
                        <asp:Label ID="lblFiscal" for="ddlFiscal" runat="server" CssClass="control-label col-xs-3" Text="<%$Resources:Global, CondicionFiscal %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <asp:DropDownList ID="ddlFiscal" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>--%>
                        <asp:Label ID="lblDNI" for="txtDNICliente" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, DNIOCUIT %>"></asp:Label>
                        <div class="col-xs-9">
                            <div class="col-xs-5">
                                <input type="text" class="form-control" id="txtDNICUIT" runat="server" clientidmode="static" placeholder="20222333 o 20334446668" />
                            </div>
                            <div class="col-xs-7">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ControlToValidate="txtDNICUIT" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresoSolo8y12 %>" ValidationExpression="^\d{8,12}$" ValidationGroup="AltaEmpleado"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarDNIoCUIT %>" ControlToValidate="txtDNICUIT" ValidationGroup="AltaEmpleado"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                </div>
            </div>
        </div>

         <%--Permisos--%>
                <div class="form-group row">
                    <h4 class="page-header">
                        <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, PermisosUsuario %>"></asp:Label></h4>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <h5 class="page-header"><%=Resources.Global.Permisos %></h5>
                            <asp:UpdatePanel ID="upTreeDisp" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:TreeView ID="treeDisponibles" runat="server" SelectedNodeStyle-CssClass="bg-success"></asp:TreeView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                        </div>
                        <div class="col-md-4">
                            <h5 class="page-header"><%=Resources.Global.Permisos %></h5>
                            <asp:UpdatePanel ID="uptreeAsig" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:TreeView ID="treeAsignados" runat="server" SelectedNodeStyle-CssClass="bg-success"></asp:TreeView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnQuitar" runat="server" Text="Quitar" OnClick="btnQuitar_Click" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2 col-md-offset-5">
                        <asp:Button ID="btnAltaEmpleado" CssClass="btn btn-primary form-control" ClientIDMode="static" Text="<%$Resources:Global, RegistrarEmpleado %>" runat="server" OnClick="btnAltaUsuario_Click" ValidationGroup="AltaEmpleado" />
                            </div>
                    </div>
                </div>
                 <%--ENDPermissos--%>



    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
