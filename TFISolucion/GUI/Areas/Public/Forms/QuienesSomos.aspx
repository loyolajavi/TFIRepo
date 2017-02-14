<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="QuienesSomos.aspx.cs" Inherits="TFI.GUI.QuienesSomos" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

   <header class="business-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="tagline" id="nombreempresa" runat="server"></h1>
                </div>
            </div>
        </div>
    </header>

    <!-- Page Content -->
    <div class="container">

        <hr/>

        <div class="row">
            <div class="col-sm-8">
                <h2 ><asp:Label ID="lbldestacados" runat="server" Text="<%$Resources:Global, QuienesSomos %>"></asp:Label></h2>
                <p id="quienessomos" runat="server"></p>
            </div>
            <div class="col-sm-4">
                <h2><asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Contacto %>"></asp:Label></h2>
                <address>
                    <strong id="otronombreempresa"></strong>
                </address>
                <address>
                    <abbr title="Teléfono"><asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, Telefono %>"></asp:Label>:</abbr> <p id="TelEmpresa" runat="server"></p>
                    <br>
                    <abbr title="Email"><asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, Correo %>"></asp:Label>:</abbr> <a href="mailto:#" id="MailEmpresa" runat="server"></a>
                </address>
            </div>
        </div>
        <!-- /.row -->

        <hr />

        <div class="row">
            <div class="col-sm-12">
                <h2><asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Mision %>"></asp:Label></h2>
                <p id="mision" runat="server"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <h2><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, Vision %>"></asp:Label></h2>
                <p id="vision" runat="server"></p>
                <p></p>
            </div>
        </div>

        <hr />

    
    </div>
</asp:Content>
