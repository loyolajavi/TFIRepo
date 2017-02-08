<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="GestionMoneda.aspx.cs" Inherits="TFI.CORE.Areas.Intranet.Forms.GestionMoneda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-lg-6">
        <div class="form-group">
            <label for="grillaMoneda"></label>
            <asp:GridView ID="grillaCotizacion" CssClass="table" runat="server" OnRowCancelingEdit="grillaCotizacion_RowCancelingEdit" OnRowEditing="grillaCotizacion_RowEditing" OnRowUpdating="grillaCotizacion_RowUpdating" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                <Columns>
                    <asp:CommandField ControlStyle-ForeColor="BurlyWood" ShowEditButton="True" />
                    <asp:BoundField DataField="IdMoneda" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="ISOCODE" />
                    <asp:BoundField DataField="Cotizacion" HeaderText="Cotizacion" />
                    <asp:BoundField DataField="SimboloMoneda" HeaderText="Simbolo" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>

        <br />

    <%--    <div class=" text-center">
            <a href="#modalMoneda" class="btn btn-primary" data-toggle="modal">Agregar Moneda</a>
        </div>
    </div>
--%>

  <%--<div class="modal fade" id="modalMoneda">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar Moneda</h2>
                    <div id="notificacionMoneda">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalMoneda">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarMoneda" />
                        </Triggers>
                        <ContentTemplate>

                            <form role="form">
                                <div class="form-group">
                                    <label for="txtNombreMoneda">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombreMoneda" runat="server" placeholder="ARS" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="txtSimbolo">Simbolo</label>
                                    <input type="text" class="form-control" id="txtSimbolo" runat="server" placeholder="$" clientidmode="static" />
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:Button runat="server" ID="btnGrabarMoneda" ClientIDMode="static" Text="Aceptar" OnClientClick="return onbtnGrabarMoneda(this)" OnClick="btnGrabarMoneda_Click" />
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="/Scripts/shared/Validaciones.js"></script>
</asp:Content>
