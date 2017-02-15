<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionContenidoQuienesSomos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionContenidoQuienesSomos" EnableEventValidation="true" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Quienes Somos <small>Gestion de Contenidos</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h3>Nombre Empresa</h3>

                <label for="NombreEmpresa"></label>
                <input id="NombreEmpresa" type="text" clientidmode="static" class="form-control" name="NombreEmpresa" runat="server" readonly />

                <hr />

                <h3>Telefono Empresa</h3>
                <label for="TelefonoEmpresa"></label>
                <input id="TelefonoEmpresa" class="form-control" clientidmode="static" name="TelefonoEmpresa" runat="server" />

                <hr />

                <h3>Mail Empresa</h3>
                <label for="MailEmpresa"></label>
                <input id="MailEmpresa" class="form-control" clientidmode="static" name="MailEmpresa" runat="server" />

                <hr />

                <h3>Quienes Somos</h3>
                <label for="QuienesSomos"></label>
                <textarea id="QuienesSomos" class="form-control" clientidmode="static" name="QuienesSomos" rows="9" cols="25" maxlength="1000" runat="server"></textarea>

                <hr />

                <h3>Mision</h3>
                <label for="Mision"></label>
                <textarea id="Mision" class="form-control" clientidmode="static" name="Mision" rows="9" cols="25" maxlength="1000" runat="server"></textarea>

                <hr />

                <h3>Vision</h3>
                <label for="Vision"></label>
                <textarea id="Vision" class="form-control" clientidmode="static" name="Vision" rows="9" cols="25" maxlength="400" runat="server"></textarea>

                <hr />


                <asp:Button ID="btnActualizar" runat="server" ClientIDMode="static" class="btn btn-primary" OnClientClick="return onbtnActualizar(this)" OnClick="btnActualizar_Click" Text="Actualizar" />
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
