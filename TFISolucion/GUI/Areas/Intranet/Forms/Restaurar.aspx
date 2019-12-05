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
            <label class="col-md-8 control-label" >Nombre</label>
            <div class="col-md-12">
                <input id="txtNombreBD" name="txtNombreBD" type="text" placeholder="" class="form-control input-md col-md-8" required="required">
                 <div>
                     <asp:UpdatePanel ID="up1" runat="server">
                         <ContentTemplate>
                             <asp:FileUpload ID="fileUpload" runat="server" />
                             <br />
                             <asp:Button ID="btnUpload" runat="server" Text="<%$Resources:Global, Restaurar %>" Mensaje="<%$ Resources:Global, EstaSeguro %>" OnClientClick='return confirm(this.getAttribute("Mensaje"))' OnClick="btnUpload_Click" class="btn btn-primary col-md-2" />
                             <br />
                             <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
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
