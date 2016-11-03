﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" CodeBehind="UltimosPedidos.aspx.cs" Inherits="TFI.GUI.UltimosPedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">

    <div class="col-lg-12">
        <h1 class="page-header">Ultimos pedidos <small>Mi Cuenta</small>
        </h1>
    </div>

    <div class="row" runat="server" id="contenedorsinpedidos">
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="fa fa-info-circle"></i>
                <div id="sinpedidos" runat="server"></div>
            </div>
        </div>
    </div>

    <hr />


    <form runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:GridView ID="grilladeultimospedidos" class="table table-striped table-hover table-users" DataKeyNames="NroPedido" runat="server" OnRowCommand="grilladeultimospedidos_RowCommand">
                    <Columns>
                        <asp:ButtonField CommandName="VerDetalle" HeaderText="Ver Detalle" Text="Ver Detalle" ButtonType="Button" ControlStyle-CssClass="btn-info" />
                        <asp:BoundField DataField="NroPedido" HeaderText="Número de Pedido" />
                        <asp:BoundField DataField="FechaPedido" HeaderText="Fecha de Pedido" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>

        </asp:UpdatePanel>

   

    <div id="currentdetail" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">
                ×</button>
            <h3 id="myModalLabel">Detalle de pedido</h3>
        </div>
        <div class="modal-body">
           
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server"
                        CssClass="table table-bordered table-hover"
                        BackColor="White" ForeColor="Black"
                        FieldHeaderStyle-Wrap="false"
                        FieldHeaderStyle-Font-Bold="true"
                        FieldHeaderStyle-BackColor="LavenderBlush"
                        FieldHeaderStyle-ForeColor="Black"
                        BorderStyle="Groove" AutoGenerateRows="False">
                        <Fields>
                            <asp:BoundField DataField="NroPedido" HeaderText="Número de pedido" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:GridView id="grilladedetallesdelpedido" runat="server"></asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="grilladeultimospedidos" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="modal-footer">
                <button class="btn btn-info" data-dismiss="modal"
                    aria-hidden="true">
                    Cerrar</button>
            </div>
        </div>
                </div>
            </div>
    </div>

     </form>

    <%--   <div class="col-md-3">
               <div class="text-center">
                     <p class="text-center"><button type="submit" class="btn btn-primary btn-block">Ir a Comprar!</button></p>
               </div>
     </div>--%>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
<script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>