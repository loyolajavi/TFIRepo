<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionPermisos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.GestionPermisos" EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h3 class="page-header"><%=Resources.Global.Permisos %></h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <asp:Button ID="btnAltaFamilia" runat="server" Text="Crear Familia" OnClick="btnAltaFamilia_Click" CssClass="btn btn-primary" />
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="cboFamilia" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboFamilia_SelectedIndexChanged" CssClass="dropdown dropdown-toggle"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtName" runat="server" >
                </asp:TextBox>
                <asp:Button ID="btnModificarFamilia" runat="server" Text="Modificar Familia" OnClick="btnModificarFamilia_Click" CssClass="btn btn-success" />
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnEliminarFamilia" runat="server" Text="Eliminar Familia" OnClick="btnEliminarFamilia_Click" CssClass="btn btn-danger btn-sm" />
            </div>
        </div>

        
        <div class="row">
            <div class="col-md-4">
                <h3 class="page-header"><%=Resources.Global.Permisos %></h3>
                <asp:UpdatePanel ID="upTreeDisp" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:TreeView ID="treeDisponibles" runat="server" SelectedNodeStyle-CssClass="bg-success" ></asp:TreeView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
            </div>
            <div class="col-md-4">
                <h3 class="page-header"><%=Resources.Global.Permisos %></h3>
                <asp:UpdatePanel ID="uptreeAsig" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <asp:TreeView ID="treeAsignados" runat="server" SelectedNodeStyle-CssClass="bg-success" ></asp:TreeView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnQuitar" EventName="Click" />
                    </Triggers>
                        </asp:UpdatePanel>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnQuitar" runat="server" Text="Quitar" OnClick="btnQuitar_Click" />
            </div>

        </div>

        <h3 class="page-header"><%=Resources.Global.Permisos %></h3>

        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:TextBox ID="txtName" runat="server" Width="150px" ReadOnly="true"
                    BorderStyle="Double">
                </asp:TextBox>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="treeTodos" EventName="SelectedNodeChanged" />
            </Triggers>
        </asp:UpdatePanel>--%>

        <div class="row">
            <asp:TreeView ID="treeTodos" runat="server" OnSelectedNodeChanged="treeTodos_SelectedNodeChanged">
            </asp:TreeView>
        </div>


    </div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
