<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="ClientesEmpresa.aspx.cs" Inherits="TFI.GUI.ClientesEmpresa" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">
    <!-- Page Content -->
    <div class="container">

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nuestros Clientes
                   
                    <small>Las Empresas que mas compraron</small>
                </h1>

            </div>
        </div>

        <div class="tab-pane" id="panel-132440">
            <%--tab2 MAS VENDIDOS--%>
            <div class="row">

                <asp:Repeater ID="lstClientesConMasCompras" ClientIDMode="Static" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-2 col-lg-2 col-md-2">
                            <div class="thumbnail">
                                <a href="#detalleEmpresa">
                                    <img src='/Content/Images/Usuarios/<%#Eval("URI")%>' class="img-responsive col-md-2" alt="imagendeEmpresas" /></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%--Tab2 Row FIN--%>
        </div>
    </div>

</asp:Content>
