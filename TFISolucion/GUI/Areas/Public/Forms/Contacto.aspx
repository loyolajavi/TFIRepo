<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TFI.GUI.Contacto" %>

<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
    <div class="container">
        <div class="row" runat="server" id="contenedorsinpedidos" Visible="False">
            <div class="col-lg-12">
                <div class="alert alert-info alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <i class="fa fa-info-circle"></i>
                    <div id="notificacion" runat="server">
                        <asp:Label ID="Label4" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, CorreoEnviadoCorrectamente %>"></asp:Label>
                    </div>
                </div>
            </div>
        </div> 
        <%--<form runat="server">--%>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <%--<label class="col-xs-2">Nombre <span class="requerido">*</span> </label>--%>
            <asp:Label ID="lblNombre" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Nombre %>"><span class="requerido">*</span></asp:Label>
            <div class="col-xs-9">
                <div class="col-xs-5">
                    <input type="text" class="form-control" id="txtNombre" placeholder="<%$Resources:Global, Nombre %>" runat="server" />
                </div>
                <div class="col-xs-4">
                    <asp:RegularExpressionValidator ID="vldExpNombreUsuario" Display="Dynamic" runat="server" ControlToValidate="txtNombre" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="Correo"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="vldReqNombreUsuario" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarNombre %>" ControlToValidate="txtNombre" ValidationGroup="Correo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <%--<label class="control-label col-xs-2">Apellido <span class="requerido">*</span></label>--%>
            <asp:Label ID="lblApellido" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Apellido %>"><span class="requerido">*</span></asp:Label>
            <div class="col-xs-9">
                <div class="col-xs-5">
                    <input type="text" class="form-control" id="txtApellido" placeholder="<%$Resources:Global, Apellido %>" runat="server" />
                </div>
                <div class="col-xs-4">
                    <asp:RegularExpressionValidator ID="vldExpApellido" Display="Dynamic" runat="server" ControlToValidate="txtApellido" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="Correo"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="vldReqApellido" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, ApellidoVacio %>" ControlToValidate="txtApellido" ValidationGroup="Correo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <asp:Label ID="lblTelefono" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Telefono %>"><span class="requerido">*</span></asp:Label>
            <div class="col-xs-9">
                <div class="col-xs-5">
                    <input type="text" class="form-control" runat="server" id="txtTelefono" placeholder="<%$Resources:Global, Telefono %>" />
                </div>
                <div class="col-xs-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarTelefono %>" ControlToValidate="txtTelefono" ValidationGroup="Correo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="form-group ">
            <label class="control-label col-xs-1"></label>
            <asp:Label ID="Label1" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Correo %>"><span class="requerido">*</span></asp:Label>
            <div class="col-xs-9">
                <div class="col-xs-5">
                    <input type="email" id="txtCorreo" class="form-control" runat="server" placeholder="<%$Resources:Global, Correo %>" />
                </div>
                <div class="col-xs-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="txtCorreo" CssClass="alert alert-warning" Text="<%$Resources:Global, EjemploCorreo %>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Correo"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, CorreoVacio %>" ControlToValidate="txtCorreo" ValidationGroup="Correo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <asp:Label ID="Label2" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Asunto %>"><span class="requerido">*</span></asp:Label>
            <div class="col-xs-9">
                <div class="col-xs-5">
                    <input type="text" id="txtAsunto" runat="server" class="form-control" placeholder="<%$Resources:Global, Asunto %>" />
                </div>
                <div class="col-xs-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtAsunto" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresarSoloLetras %>" ValidationExpression="([A-Za-z\s]+)" ValidationGroup="Correo"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, AsuntoVacio %>" ControlToValidate="txtAsunto" ValidationGroup="Correo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <asp:Label ID="Label3" runat="server" Font-Bold="true" class="control-label col-xs-2" Text="<%$Resources:Global, Mensaje %>"><span class="requerido">*</span></asp:Label>
            <div class="col-xs-9">
                <div class="col-xs-5">
                    <textarea rows="3" runat="server" id="txtMensaje" class="form-control" placeholder="<%$Resources:Global, Mensaje %>"></textarea>
                </div>
                <div class="col-xs-5">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ControlToValidate="txtMensaje" CssClass="alert alert-warning" Text="<%$Resources:Global, IngresoMax1000 %>" ValidationExpression="([a-zA-Z0-9\s]{3,1000})" ValidationGroup="Correo"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="<%$Resources:Global, IngresarMensaje %>" ControlToValidate="txtMensaje" ValidationGroup="Correo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <!-- Elemento captcha !-->
        <div class="form-group">
            <div class="g-recaptcha" data-sitekey="6LcVDAgUAAAAALQy6qd89Iv0odFUDnrsVR1FGMWX"></div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-8" id="btnsContacto">
                <asp:Button ID="btnEnviarCorreo" OnClick="EnviarCorreo" CssClass="btn btn-primary" runat="server" Text="<%$Resources:Global, Enviar %>" ValidationGroup="Correo" />
                <input type="reset" class="btn btn-default" runat="server" value="<%$Resources:Global, Limpiar %>" />
            </div>
        </div>

    </div>
    <div id="mdl_correo" class="modal fade" tabindex="-1" role="dialog">

        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h3 class="modal-title" style="color: #de5900;"><%=Resources.Global.Enviado%></h3>
                </div>
                <div class="modal-body text-center">
                    <h4><%=Resources.Global.CorreoEnviadoConDatosDeTransferencia%></h4>
                </div>
                <div class="modal-footer">
                    <div class="text-center">
                        <a class="btn" style="width: 200px; background-color: black; color: #fff;" href="Home.aspx" id="btnContinuarCierre"><%=Resources.Global.Continuar%></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--</form>--%>
    <!-- Recaptcha de google !-->
    <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
