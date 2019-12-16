<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="UpdateEmpleado.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.UpdateEmpleado" EnableEventValidation="false" %>
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
                <div class="form-group row">
                    <h4 class="page-header">
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, CuentaEmpleado %>"></asp:Label></h4>
                    <div class="form-group">
                        <label for="txtNombreUsuario">
                            <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label></label>
                        <input type="text" name="txtNombreUsuario" class="form-control" id="txtNombreUsuario" runat="server" required="required" />
                        <asp:RegularExpressionValidator ID="vldExpNombreUsuario" Display="Dynamic" runat="server" ControlToValidate="txtNombreUsuario" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([a-zA-Z]+)" ValidationGroup="AltaCliente"></asp:RegularExpressionValidator>
                    </div>
                    <%if (this.Master.Autenticar(new string[] { "EmpleadoMod" }))
                      {%>
                    <asp:Button ID="btnNombreUsuario" CssClass="btn btn-primary" Text="<%$Resources:Global, ModificarNombreUsuario %>" runat="server" OnClick="btnNombreUsuario_Click" ValidationGroup="AltaCliente" required="required" />
                    <%} %>
                </div>
                <div id="divNombreUsbr" runat="server"></div>
                    <div id="divNombreUsMal" class="alert alert-danger" runat="server" visible="false">
                        <asp:Label ID="Label13" runat="server" Text="<%$Resources:Global, msjCampoVacio %>"></asp:Label></div>
                    <br />
                <div class="form-group row">
                    <div class="form-group">
                        <label for="txtClave">
                            <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Contrasena %>"></asp:Label></label><br />
                        <input type="password" class="input-sm" id="txtClave" runat="server" placeholder="********" />
                        <asp:RegularExpressionValidator ID="vldTextoClave" runat="server" Text="<%$Resources:Global, ValidacionContrasena %>" ControlToValidate="txtClave" CssClass="alert alert-warning" ValidationGroup="ModifPass" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtClaveRep">
                            <asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, RepetirContrasena %>"></asp:Label></label><br />
                        <input type="password" class="input-sm" id="txtClaveRep" runat="server" placeholder="********" />
                        <asp:CompareValidator ID="vldClave" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ContrasenaNoCoincide %>" ControlToValidate="txtClaveRep" ControlToCompare="txtClave" ValidationGroup="ModifPass"></asp:CompareValidator>
                    </div>
                    <%if (this.Master.Autenticar(new string[] { "EmpleadoMod" }))
                      {%>
                    <asp:Button ID="btnCambiarClave" CssClass="btn btn-primary" Text="<%$Resources:Global, ModificarContrasena %>" runat="server" OnClick="btnCambiarClave_Click" ValidationGroup="ModifPass" />
                    <%} %>
                    <div id="divEspacioModifClave" runat="server"></div>
                    <div id="divAlertaModifClave" class="alert alert-success" runat="server" visible="false">
                        <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, ModificoContrasena %>"></asp:Label></div>
                    <div id="divMsjError" class="alert alert-danger" runat="server" visible="false">
                        <asp:Label ID="Label11" runat="server" Text="<%$Resources:Global, msjAVerifiquePass %>"></asp:Label></div>
                </div>

                <%--Datos Personales--%>
                <div class="form-group row">
                    <h4 class="page-header">
                        <asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h4>
                    <div class="form-group">
                        <label for="txtApellido">
                            <asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label></label>
                        <input type="text" class="form-control" id="txtApellido" runat="server" title="Ingrese solo letras y menos de 20 letras" pattern="^[_A-z\s]{1,20}$" clientidmode="static" ValidationGroup="ModifDatos" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="txtNombre">
                            <asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label></label>
                        <input type="text" class="form-control" id="txtNombre" runat="server" title="Ingrese solo letras y menos de 20 letras" pattern="^[_A-z\s]{1,20}$" clientidmode="static" ValidationGroup="ModifDatos" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="txtMail">E-mail</label>
                        <input type="text" class="form-control" id="txtMail" runat="server" title="mail@mail.com" pattern="/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/" clientidmode="static" ValidationGroup="ModifDatos"  required="required" />
                    </div>
                    <div class="form-group">
                        <label for="txtDNI">DNI</label>
                        <input type="text" class="form-control" id="txtDNI" runat="server" pattern="[0-9]{8,9}" title="Solo números hasta 9 dígitos"  clientidmode="static" ValidationGroup="ModifDatos" required="required" />
                    </div>
                    <%if (this.Master.Autenticar(new string[] { "EmpleadoMod" }))
                      {%>
                    <asp:Button ID="btnDatosUsuarioUpdate" CssClass="btn btn-info" Text="Modificar Datos" runat="server" OnClick="btnDatosUsuarioUpdate_Click" ValidationGroup="ModifDatos" />
                    <%} %>
                </div>

                <%--Permisos--%>
                <div class="form-group row">
                    <h4 class="page-header">
                        <asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, PermisosUsuario %>"></asp:Label></h4>
                    
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
                    <%if (this.Master.Autenticar(new string[] { "EmpleadoMod" }))
                      {%>
                        <asp:Button ID="btnPermisosUsuarioUpdate" CssClass="btn btn-warning" Text="<%$Resources:Global, ModificarPermiso %>" runat="server" OnClick="btnPermisosUsuarioUpdate_Click" />
                    <%} %>
                </div>
                 <%--ENDPermissos--%>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
