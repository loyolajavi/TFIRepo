<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionPermisos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionPermisos" EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><%=Resources.Global.Permisos %></h3>
            </div>
        </div>

        <div class="row">
            <asp:DropDownList ID="cboFamilia" runat="server"></asp:DropDownList>
                        <%--    <asp:Repeater ID="rptFamilia" ClientIDMode="Static" runat="server">
                    <ItemTemplate>
                        <table class="table-bordered col-md-12" id="tblFamilias">
                            <thead>
                                <tr>
                                    <th class="text-center" id="txtFamilia">Familia</th>
                                    <th>Editar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td class="text-center" style="padding: 7px;">
                                        <div class="">
                                            <a href=""/>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </ItemTemplate>
                </asp:Repeater>--%>
        </div>
        <h3 class="page-header"><%=Resources.Global.Permisos %></h3>
        <div class="row">
            <asp:TreeView ID="treeDisponibles" runat="server" ></asp:TreeView>


        </div>

        <h3 class="page-header"><%=Resources.Global.Permisos %></h3>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:TextBox ID="txtName" runat="server" Width="150px" ReadOnly="true"
                    BorderStyle="Double">
                </asp:TextBox>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="treeTodos" EventName="SelectedNodeChanged" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="row">
            <asp:TreeView ID="treeTodos" runat="server" OnSelectedNodeChanged="treeTodos_SelectedNodeChanged" SelectedNodeStyle-CssClass="bg-success" >
            </asp:TreeView>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </div>


    </div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
