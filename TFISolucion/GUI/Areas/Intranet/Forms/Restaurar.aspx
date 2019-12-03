<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="Restaurar.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.Restaurar" EnableEventValidation="false"  %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">





    <div class="container paddingPaginas">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Restaurar %>"> </asp:Label>
                </h2>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-8 control-label" for="textinput">Nombre</label>
            <div class="col-md-8">
                <input id="txtNombreArchivo" name="textinput" type="text" placeholder="" class="form-control input-md" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="file-field">
                <div class="btn btn-primary btn-sm float-left">
                    <span>Choose file</span>
                    <input type="file">
                </div>
            </div>
        </div>
        <asp:Button type="button" runat="server" id="btnRestaurar" Text="<%$Resources:Global, Restaurar %>" class="btn btn-primary" Mensaje="<%$ Resources:Global, Restaurar %>" OnClientClick='return confirm(this.getAttribute("Mensaje"))' OnClick="btnRestaurar_Click"></asp:Button>
    </div>










</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
        <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
