<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" CodeBehind="UltimosPedidos.aspx.cs" Inherits="TFI.GUI.UltimosPedidos" %>
<%@ MasterType VirtualPath="~/Shared/MiCuenta.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">

    <div class="col-lg-12">
        <h1 class="page-header"><%=Resources.Global.Compras%> </h1>
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


    
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:GridView ID="grilladeultimospedidos" AllowPaging="true" PageSize="10" OnPageIndexChanging="grilladeultimospedidos_PageIndexChanging" class="table table-striped table-hover table-users" DataKeyNames="NroPedido" runat="server" OnRowCommand="grilladeultimospedidos_RowCommand" AutoGenerateColumns="false">
                    <Columns>
                        <asp:ButtonField CommandName="VerDetalle" HeaderText="<%$Resources:Global, VerDetalle %>"  Text="<%$Resources:Global, VerDetalle %>"  ButtonType="Button" ControlStyle-CssClass="btn btn-success center-block" />
                        <asp:BoundField DataField="NroPedido" HeaderText="<%$Resources:Global, NumeroPedido %>" />
                        <asp:BoundField DataField="FechaPedido" HeaderText="<%$Resources:Global, FechaPedido %>" />
                        <asp:BoundField DataField="Estado" HeaderText="<%$Resources:Global, Estado %>" />
                        <asp:BoundField DataField="IdEstadoPedido" Visible="false" />
                        <%--<asp:ButtonField CommandName="PagarPedido" HeaderText="<%$Resources:Global, Pagar %>"  Text="<%$Resources:Global, Pagar %>"  ButtonType="Button" ControlStyle-CssClass="btn btn-success center-block" Visible="<% If(Eval("Status").ToString() = "A", true, false) %>" />--%>
                        <asp:TemplateField HeaderText="<%$Resources:Global, Pagar %>">
                            <ItemTemplate>
                                <%--<asp:Button runat="server" Text="<%$Resources:Global, Pagar %>" CssClass="btn btn-success center-block" CommandArgument="<%# Container.DataItemIndex %>" Visible='<%# ((int)Eval("IdEstadoPedido") == 1) ? true : false %>'/>--%>
                                <a href='<%#Eval("NroPedido", "/Areas/Public/Forms/PedidoRealizadoPagar.aspx?NroPedDUltPed={0}") %>' class="btn btn-success" runat="server" visible='<%# ((int)Eval("IdEstadoPedido") == 1) ? true : false %>'><%=Resources.Global.Pagar%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>

        </asp:UpdatePanel>

   

    <div id="currentdetail" class="modal fade" >
        <div class="modal-dialog"  style="width: 550px; text-align:center" >
            <div class="modal-content">
        <div class="modal-header text-center">
            <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">
                ×</button>
            <h3 id="myModalLabel"><%=Resources.Global.DetallePedido%></h3>
        </div>
        <div class="modal-body" >
           
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server"
                        CssClass="table-striped" 
                        BackColor="White" ForeColor="Black"
                        FieldHeaderStyle-Wrap="false"
                        FieldHeaderStyle-Font-Bold="true"
                        FieldHeaderStyle-BackColor="LavenderBlush"
                        FieldHeaderStyle-ForeColor="Black"
                        BorderStyle="Groove" AutoGenerateRows="False">
                        <Fields>
                            <asp:BoundField DataField="NroPedido" HeaderText="<%$Resources:Global, NumeroPedido %>" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:GridView id="grilladedetallesdelpedido" runat="server" CssClass="tablesorter table table-striped table-hover table-users" ></asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="grilladeultimospedidos" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="modal-footer">
                <button class="btn btn-info" data-dismiss="modal"
                    aria-hidden="true">
                    <%=Resources.Global.Cerrar%></button>
            </div>
        </div>
                </div>
            </div>
    </div>



    <%--   <div class="col-md-3">
               <div class="text-center">
                     <p class="text-center"><button type="submit" class="btn btn-primary btn-block">Ir a Comprar!</button></p>
               </div>
     </div>--%>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
<script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
