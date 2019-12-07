<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="Backup.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.Backup" EnableEventValidation="false"  %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <div class="container paddingPaginas">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Backup %>"> </asp:Label>
                </h2>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                 <div>
                     <b><asp:Label Text="<%$Resources:Global, Nombre %>" runat="server"  /></b>
                     <asp:TextBox ID="txtNombreArchivo" CssClass="form-control input-md" runat="server" required="required" placeholder="<%$Resources:Global, Nombre %>"></asp:TextBox>
                     <%--<input id="txtNombreArchivo" name="txtNombreArchivo" type="text" placeholder="" class="form-control input-md col-md-8" required="required">--%>
                     <asp:UpdatePanel ID="up1" runat="server">
                         <ContentTemplate>
                             <asp:Button ID="btnUpload" runat="server" Text="<%$Resources:Global, Backup %>" Mensaje="<%$ Resources:Global, EstaSeguro %>" OnClientClick='return confirm(this.getAttribute("Mensaje"))' OnClick="btnUpload_Click" class="btn btn-primary col-md-2" />
                         </ContentTemplate>
                         <Triggers>
                             <asp:PostBackTrigger ControlID="btnUpload" />
                         </Triggers>
                     </asp:UpdatePanel>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
