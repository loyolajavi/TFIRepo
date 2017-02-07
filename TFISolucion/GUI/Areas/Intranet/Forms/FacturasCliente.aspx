﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="FacturasCliente.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.FacturasCliente" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
      <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Facturas de Clientes
                </h1>
            </div>
        </div>


          <div class="row" runat="server" ClientIDMode="Static" id="contenedorsinfacturas">
                <div class="col-md-9">
                    <div class="alert alert-info alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <i class="fa fa-info-circle"></i>
                        <div id="sinfacturas" ClientIDMode="Static" runat="server"></div>
                    </div>
                </div>
            </div>



          <div class="row">
            <div class="list-group col-md-4">
                <div class="form-group">
                    <label for="txtClienteBusqueda" class="control-label">Cliente</label>

                    <asp:TextBox ID="txtClienteBusqueda" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Button ID="btnBuscarCliente" runat="server" Text="Buscar" CssClass="form-control col-md-" OnClick="btnBuscarCliente_Click" />

                </div>

            </div>




            <hr />


            <div class="col-md-8">
                <asp:ScriptManager ID="ScriptManager1" runat="server" />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <ContentTemplate>
                        <asp:GridView ID="grilladefacturas" CssClass="tablesorter table table-striped table-hover table-users" DataKeyNames="NroComprobante" runat="server" OnRowCommand="grilladefacturas_RowCommand" PageSize="4">
                            <Columns>
                                <asp:ButtonField CommandName="VerDetalle" HeaderText="Ver Detalle" Text="Ver Detalle" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                <asp:BoundField DataField="NroComprobante" HeaderText="Número de Factura" />
                                <asp:BoundField DataField="FechaComprobante" HeaderText="Fecha de Factura" />
                                <asp:BoundField DataField="TipoComprobante" HeaderText="Tipo" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                <asp:ButtonField CommandName="GenerarNC" HeaderText="Generar NC" Text="Generar NC" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>



            
        </div>










          </div>

      <div id="currentdetail" class="modal fade">
                <div class="modal-dialog" style="width:55%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                                ×</button>
                            <h3 id="myModalLabel">Detalle de factura</h3>
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
                                            <asp:BoundField DataField="NroComprobante" HeaderText="Número de factura" />
                                        </Fields>
                                    </asp:DetailsView>
                                    <asp:GridView ID="grilladedetallesdefactura" runat="server" CssClass="table"></asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="grilladefacturas" EventName="RowCommand" />
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
