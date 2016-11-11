<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="PermisosEmpleados.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.PermisosEmpleados" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h1 class="page-header">Permisos <small>Empleados</small>
                </h1>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">

                <asp:Repeater ID="rptEmpleados" ClientIDMode="Static" runat="server">
                    <ItemTemplate>
                        <table class="table-bordered col-md-6 col-md-offset-3 table-responsive" id="tblEmpleados">
                            <thead>
                                <tr>
                                    <th class="text-center"><input type="checkbox" id="CheckAllUsuarios" value="Y" runat="server" /></th>
                                    <th class="text-center">Nombre de usuario</th>
                                    <th class="text-center">Apellido</th>
                                    <th class="text-center">Nombre</th>
                                    <%--<th>Editar</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>
                                        <input type="checkbox" id="IdUsuarios" value='<%#Eval("IdUsuario") %>' runat="server" />
                                    </td>
                                    <td>
                                        <a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateEmpleado.aspx?Emple={0}") %>'><%#Eval("NombreUsuario") %></a>
                                    </td>
                                    <td>
                                        <a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateEmpleado.aspx?Emple={0}") %>'><%#Eval("Apellido") %></a>
                                    </td>
                                    <td><a href='<%#Eval("IdUsuario", "/Areas/Intranet/Forms/UpdateEmpleado.aspx?Emple={0}") %>'><%#Eval("Nombre") %></a>

                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
