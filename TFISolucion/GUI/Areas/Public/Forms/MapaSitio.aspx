<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="MapaSitio.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.MapaSitio" %>
<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">



    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
