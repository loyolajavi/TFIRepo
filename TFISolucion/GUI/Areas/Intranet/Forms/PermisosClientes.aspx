<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="PermisosClientes.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.PermisosClientes"  EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">


        <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h1 class="page-header">
                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, Permisos %>"> </asp:Label> <small>
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, Clientes %>"></asp:Label></small>
                    <%--<span><a class="btn btn-info" href="AltaUsuario.aspx">
                        <asp:Label ID="Label3" runat="server" Text="AltaUsuario"></asp:Label></a></span>--%>
                </h1>
                <asp:Button ID="btnEliminarUsuario" class="btn btn-default" Text="<%$Resources:Global, EliminarUsuario %>" OnClick="btnEliminarUsuario_Click" ClientIDMode="Static" runat="server" /><p>Eliminar los usuarios seleccionados</p>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">


                <table class="table-bordered col-md-6 col-md-offset-3 table-responsive" id="tblClientes">
                    <thead>
                        <tr>
                            <th class="text-center">
                                <input type="checkbox" id="CheckAllUsuarios" value="Y" runat="server" /></th>
                            <th class="text-center">
                                <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, NombreUsuario %>"></asp:Label></th>
                            <th class="text-center"><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, Apellido %>"></asp:Label></th>
                            <th class="text-center"><asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, Nombre %>"></asp:Label></th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptClientes" ClientIDMode="Static" runat="server">
                        <ItemTemplate>

                            <tbody>
                                <tr class="text-center">
                                    <td>
                                        <%--<asp:CheckBox ID="chbIdUsuarios" ClientIDMode="Static"   runat="server" />--%>
                                        <input type="checkbox" id="chbIdUsuarios" clientidmode="static" value='<%#Eval("IdUsuario") %>' runat="server" />
                                    </td>
                                    <td>
                                        <a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateCliente.aspx?Cli={0}") %>'><%#Eval("NombreUsuario") %></a>
                                    </td>
                                    <td>
                                        <a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateCliente.aspx?Cli={0}") %>'><%#Eval("Apellido") %></a>
                                    </td>
                                    <td><a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateCliente.aspx?Cli={0}") %>'><%#Eval("Nombre") %></a>

                                    </td>
                                </tr>
                            </tbody>


                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
