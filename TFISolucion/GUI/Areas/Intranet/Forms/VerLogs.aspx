﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="VerLogs.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.VerLogs" EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h2 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Logsdelsistema %>"> </asp:Label>
                </h2>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, Logsdelsistema %>"> </asp:Label>
                <select id="idelTIpoLog" runat="server" class="browser-default custom-select">
                  <option value="Evento">Evento</option>
                  <option value="Error">Error</option>
                </select>
                <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, Logsdelsistema %>"> </asp:Label>
                <input runat="server" type="date" value="25/11/2019" name="nFechaInicio" id="elIdFechaInicio" class="hasDatepicker" required="required"/>
                <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Logsdelsistema %>"> </asp:Label>
                <input runat="server" type="date" value="25/11/2019" name="nFechaFin" id="elIdFechaFin" class="hasDatepicker" required="required"/>
                <asp:Button ID="btnFiltrarLogs" runat="server" Text="<%$Resources:Global, Buscar %>" CssClass="btn btn-success" OnClick="btnFiltrarLogs_Click" />
                
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="form-group">
                    <label for="grillaLogs"></label>
                    <asp:GridView ID="grillaLogs"  CssClass="tablesorter table table-striped table-hover table-users" runat="server" AllowPaging="true" OnPageIndexChanging="grillaLogs_PageIndexChanging" PageSize="10" AutoGenerateColumns="false" >
                        <Columns>
                            <asp:BoundField DataField="IdBitacoraLog" HeaderText="<%$Resources:Global, IdCategoria %>" Visible="false" />
                            <asp:BoundField DataField="CUIT" HeaderText="<%$Resources:Global, Descripcion %>" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="<%$Resources:Global, Descripcion %>" />
                            <asp:BoundField DataField="Fecha" HeaderText="<%$Resources:Global, Descripcion %>" />
                            <asp:BoundField DataField="TipoLog" HeaderText="<%$Resources:Global, Descripcion %>" />
                            <asp:BoundField DataField="Accion" HeaderText="<%$Resources:Global, Descripcion %>" />
                            <asp:BoundField DataField="Mensaje" HeaderText="<%$Resources:Global, Descripcion %>" />
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

                
            </div>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
      <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>