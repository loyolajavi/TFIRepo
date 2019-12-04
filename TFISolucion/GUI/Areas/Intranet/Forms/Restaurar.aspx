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
            <div class="col-md-8">
                <input id="txtNombreBD" name="txtNombreBD" type="text" placeholder="" class="form-control input-md" required="required">
                 <div>
                     <asp:UpdatePanel ID="up1" runat="server">
                         <ContentTemplate>
                             <asp:FileUpload ID="fileUpload" runat="server" />
                             <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                             <br />
                             <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                         </ContentTemplate>
                         <Triggers>
                             <asp:PostBackTrigger ControlID="btnUpload" />
                         </Triggers>
                     </asp:UpdatePanel>
                 </div>

                <%--        <asp:FileUpload id="FileUpload1"                 
           runat="server">
       </asp:FileUpload>

                <br>
                <asp:Button ID="UploadButton"
                    Text="Upload file"
                    OnClick="UploadButton_Click"
                    runat="server">
                </asp:Button>

                <hr />

                <asp:Label ID="UploadStatusLabel"
                    runat="server">
                </asp:Label>--%>

            </div>
        </div>
        <div class="form-group">
        </div>
        <asp:Button type="button" runat="server" id="btnRestaurar" Text="<%$Resources:Global, Restaurar %>" class="btn btn-primary" Mensaje="<%$ Resources:Global, Restaurar %>" OnClientClick='return confirm(this.getAttribute("Mensaje"))' OnClick="btnRestaurar_Click"></asp:Button>
    </div>










</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
        <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
