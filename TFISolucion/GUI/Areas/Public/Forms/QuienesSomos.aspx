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
                <h2 >Quiénes Somos</h2>
                <p id="quienessomos" runat="server"></p>
            </div>
            <div class="col-sm-4">
                <h2>Contacto</h2>
                <address>
                    <strong id="otronombreempresa"></strong>
                </address>
                <address>
                    <abbr title="Teléfono">Tel:</abbr> <p id="TelEmpresa" runat="server"></p>
                    <br>
                    <abbr title="Email">Email:</abbr> <a href="mailto:#" id="MailEmpresa" runat="server"></a>
                </address>
            </div>
        </div>
        <!-- /.row -->

        <hr />

        <div class="row">
            <div class="col-sm-12">
                <h2>Misión</h2>
                <p id="mision" runat="server"></p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <h2>Visión</h2>
                <p id="vision" runat="server"></p>
                <p></p>
            </div>
        </div>

        <hr />

    
    </div>
</asp:Content>
