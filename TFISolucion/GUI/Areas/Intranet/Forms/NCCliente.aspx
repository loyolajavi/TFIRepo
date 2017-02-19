<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="NCCliente.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.NCCliente" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
     <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, NCClientes %>"></asp:Label>
                </h1>
            </div>
        </div>


          <div class="row" runat="server" id="contenedorsinnc">
                <div class="col-md-9">
                    <div class="alert alert-info alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <i class="fa fa-info-circle"></i>
                        <div id="sinnc" runat="server"></div>
                    </div>
                </div>
            </div>


          <div class="row">
            <div class="list-group col-md-4">
                <div class="form-group">
                    <label for="txtClienteBusqueda" class="control-label">
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, Cliente %>"></asp:Label></label>

                    <asp:TextBox ID="txtClienteBusqueda" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Button ID="btnBuscarCliente" runat="server" Text="<%$Resources:Global, Buscar %>" CssClass="form-control col-md-" OnClick="btnBuscarCliente_Click" />

                </div>

            </div>




            <hr />


            <div class="col-md-8">
                <asp:ScriptManager ID="ScriptManager1" runat="server" />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <ContentTemplate>
                        <asp:GridView ID="grilladenc" CssClass="tablesorter table table-striped table-hover table-users" DataKeyNames="NroComprobante" runat="server" OnRowCommand="grilladenc_RowCommand" PageSize="4">
                            <Columns>
                                <asp:ButtonField CommandName="VerDetalle" HeaderText="<%$Resources:Global, VerDetalle %>" Text="<%$Resources:Global, VerDetalle %>" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                <asp:BoundField DataField="NroComprobante" HeaderText="<%$Resources:Global, NumeroNC %>" />
                                <asp:BoundField DataField="FechaComprobante" HeaderText="<%$Resources:Global, FechaNC %>" />
                                <asp:BoundField DataField="TipoComprobante" HeaderText="<%$Resources:Global, Tipo %>" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                <asp:ButtonField CommandName="GenerarND" HeaderText="<%$Resources:Global, GenerarND %>" Text="<%$Resources:Global, GenerarND %>" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
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
                            <h3 id="myModalLabel">
                                <asp:Label ID="Label3" runat="server" Text="DetalleNC"></asp:Label></h3>
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
                                            <asp:BoundField DataField="NroComprobante" HeaderText="<%$Resources:Global, NumeroNC %>" />
                                        </Fields>
                                    </asp:DetailsView>
                                    <asp:GridView ID="grilladedetallesdenc" runat="server" CssClass="table"></asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="grilladenc" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <button class="btn btn-info" data-dismiss="modal"
                                    aria-hidden="true">
                                    <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Cerrar %>"></asp:Label></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
