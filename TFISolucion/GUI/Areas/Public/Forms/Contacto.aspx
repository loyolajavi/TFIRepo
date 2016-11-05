<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TFI.GUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
    <div class="container">
        <%--<form runat="server">--%>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <label class="col-xs-2">Nombre <span class="requerido">*</span> </label>
            <div class="col-xs-9">
                <input type="text" class="form-control" id="txtNombre" placeholder="Nombre" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <label class="control-label col-xs-2">Apellido <span class="requerido">*</span></label>
            <div class="col-xs-9">
                <input type="text" class="form-control" id="txtApellido" placeholder="Apellido" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <label class="control-label col-xs-2">Teléfono<span class="requerido">*</span></label>
            <div class="col-xs-9">
                <input type="text" class="form-control" runat="server" id="txtTelefono" placeholder="Tel&eacute;fono" />
            </div>
        </div>
        <div class="form-group ">
            <label class="control-label col-xs-1"></label>
            <label class="control-label col-xs-2">Correo<span class="requerido">*</span></label>
            <div class="col-xs-9">
                <input type="email" id="txtCorreo" class="form-control" runat="server" placeholder="Correo" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <label class="control-label col-xs-2">Asunto<span class="requerido">*</span></label>
            <div class="col-xs-9">
                <input type="text" id="txtAsunto" runat="server" class="form-control" placeholder="Asunto" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-1"></label>
            <label class="control-label col-xs-2">Mensaje<span class="requerido">*</span></label>
            <div class="col-xs-9">
                <textarea rows="3" runat="server" id="txtMensaje" class="form-control" placeholder="Mensaje"></textarea>
            </div>
        </div>

        <!-- Elemento captcha !-->
        <div class="form-group">
            <div class="g-recaptcha" data-sitekey="6LcVDAgUAAAAALQy6qd89Iv0odFUDnrsVR1FGMWX"></div>
        </div>

        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9" id="btnsContacto">
                <asp:Button ID="btnEnviarCorreo" OnClick="EnviarCorreo" CssClass="btn btn-primary" runat="server" Text="Enviar" />
                <input type="reset" class="btn btn-default" value="Limpiar" />
            </div>
        </div>

    </div>
    <%--</form>--%>
    <!-- Recaptcha de google !-->
    <script src='https://www.google.com/recaptcha/api.js'></script>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
