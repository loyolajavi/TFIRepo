<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoQuienesSomos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoQuienesSomos" EnableEventValidation="true" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, QuienesSomos %>"></asp:Label>
                    <small>
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, GestionContenidos %>"></asp:Label></small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h3>
                    <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, NombreEmpresa %>"></asp:Label></h3>

                <label for="NombreEmpresa"></label>
                <input id="NombreEmpresa" type="text" clientidmode="static" class="form-control" name="NombreEmpresa" runat="server" readonly />

                <hr />

                <h3>
                    <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, TelefonoEmpresa %>"></asp:Label></h3>
                <label for="TelefonoEmpresa"></label>
                <input id="TelefonoEmpresa" class="form-control" clientidmode="static" name="TelefonoEmpresa" runat="server" required="required" />

                <hr />

                <h3>
                    <asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, MailEmpresa %>"></asp:Label></h3>
                <label for="MailEmpresa"></label>
                <input id="MailEmpresa" class="form-control" clientidmode="static" name="MailEmpresa" runat="server" required="required" />

                <hr />

                <h3>
                    <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, QuienesSomos %>"></asp:Label></h3>
                <label for="QuienesSomos"></label>
                <textarea id="QuienesSomos" class="form-control" clientidmode="static" name="QuienesSomos" rows="9" cols="25" maxlength="1000" runat="server" required="required"></textarea>

                <hr />

                <h3>
                    <asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, Mision %>"></asp:Label></h3>
                <label for="Mision"></label>
                <textarea id="Mision" class="form-control" clientidmode="static" name="Mision" rows="9" cols="25" maxlength="1000" runat="server" required="required"></textarea>

                <hr />

                <h3>
                    <asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, Vision %>"></asp:Label></h3>
                <label for="Vision"></label>
                <textarea id="Vision" class="form-control" clientidmode="static" name="Vision" rows="9" cols="25" maxlength="400" runat="server" required="required"></textarea>

                <hr />

                <div class="text-center">
                    <asp:Button ID="btnActualizar" runat="server" ClientIDMode="static" class="btn btn-primary" OnClientClick="return onbtnActualizar(this)" OnClick="btnActualizar_Click" Text="<%$Resources:Global, Actualizar %>" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
