﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" CodeBehind="DatosPersonales.aspx.cs" EnableEventValidation="false" Inherits="TFI.GUI.DatosPersonales" %>

<%@ MasterType VirtualPath="~/Shared/MiCuenta.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="col-lg-12">
        <h1 class="page-header">
            <asp:Label ID="lbldestacados" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label><small><asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, MiCuenta %>"></asp:Label></small></h1>
    </div>
    <div id="panelDatosPersonales" class="col-lg-12">
        <h2>
            <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, DatosCuenta %>"></asp:Label></h2>

        <div class=" col-lg-6 form-group">
            <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, Usuario %>"></asp:Label>
            <input runat="server" id="usuario" class="form-control" type="text" disabled />
        </div>

        <div class="col-lg-6 form-group">
            <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Contrasena %>"></asp:Label>
            <input runat="server" id="clave" class="form-control" type="text" disabled />
        </div>

        <div class="text-center">
            <a id="btnCambiarPassPersonal" class="btn btn-info">
                <asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, CambiarContrasena %>"></asp:Label></a>
        </div>
        <hr />
    </div>

    <div id="dpersonales" class="col-lg-12">
        <h2>
            <asp:Label ID="Label6" runat="server" Text="<%$Resources:Global, DatosPersonales %>"></asp:Label></h2>

        <div class="text-center">
            <div class="form-group">
                                   <asp:UpdatePanel ID="UpdatePanel3" runat="server">

                    <ContentTemplate>
                <asp:GridView ID="grilladedatospersonales" CssClass="table table-hover table-responsive table-striped table-bordered" runat="server" AutoGenerateColumns="false" OnRowCancelingEdit="grilladedatospersonales_RowCancelingEdit" OnRowEditing="grilladedatospersonales_RowEditing" OnRowUpdating="grilladedatospersonales_RowUpdating" >
                    <Columns>
                        <asp:CommandField ControlStyle-ForeColor="White" ShowEditButton="True" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-success" />
                        <asp:BoundField DataField="Nombre" HeaderText="<%$Resources:Global, Nombre %>" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Apellido" HeaderText="<%$Resources:Global, Apellido %>"  HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Email" HeaderText="<%$Resources:Global, Correo %>" HeaderStyle-CssClass="bg-primary" />
                    </Columns>
<%--                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                </asp:GridView>
                        </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>

        <hr />
    </div>

    <%-- TELEFONO --%>
    <div class="col-lg-12">
        <h2>Teléfonos</h2>
        <div class="text-center">
            <div class="form-group">
                <asp:GridView ID="grillatelefonos" CssClass="table table-hover table-responsive table-striped table-bordered" runat="server" AutoGenerateColumns="false" OnRowEditing="grillatelefonos_RowEditing" OnRowCancelingEdit="grillatelefonos_RowCancelingEdit" OnRowUpdating="grillatelefonos_RowUpdating" OnRowDataBound="grillatelefonos_RowDataBound" OnRowDeleting="grillatelefonos_RowDeleting" >
                    <Columns>
                        <asp:CommandField ShowEditButton="True" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-success" />
                        <asp:CommandField ShowDeleteButton="True" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-default" />
                        <asp:BoundField DataField="CodArea" HeaderText="<%$Resources:Global, Telefono %>" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Telefono" HeaderText="<%$Resources:Global, Telefono %>" HeaderStyle-CssClass="bg-primary" />

                        <%-- <asp:BoundField DataField="Tipo" HeaderText="Tipo" />--%>
                        <asp:TemplateField HeaderText="Tipo" HeaderStyle-CssClass="bg-primary">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlTipo" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
<%--                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                </asp:GridView>
            </div>

            <div class="text-center">

                <%-- TODO: AGREGAR TELEFONO --%>

                <a href="#mdlAgregarTelefono" class="btn btn-info" data-toggle="modal">
                    <asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, AgregarTelefono %>"></asp:Label></a>
            </div>
        </div>
        <hr />
    </div>
    <%-- TELEFONO END --%>

    <%-- FACTURACION --%>
    <div id="ddireccionfacturacion" class="col-lg-12">

        <h2>
            <asp:Label ID="Label8" runat="server" Text="<%$Resources:Global, DireccionDeFacturacion %>"></asp:Label></h2>

        <div class="text-center">

            <div class="form-group">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grilladirecciondefacturacion" CssClass="table table-hover table-responsive table-striped table-bordered" runat="server" AutoGenerateColumns="false" DataKeyNames="IdDireccion" OnRowCancelingEdit="grilladirecciondefacturacion_RowCancelingEdit" OnRowDataBound="grilladirecciondefacturacion_RowDataBound" OnRowDeleting="grilladirecciondefacturacion_RowDeleting" OnRowEditing="grilladirecciondefacturacion_RowEditing" OnRowUpdating="grilladirecciondefacturacion_RowUpdating" >
                            <Columns>
                                <asp:CommandField ShowEditButton="True" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-success" />
                                <asp:CommandField ShowDeleteButton="True" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-default" />
                                <asp:BoundField DataField="Calle" HeaderText="<%$Resources:Global, Calle %>" HeaderStyle-CssClass="bg-primary" />
                                <asp:BoundField DataField="Numero" HeaderText="<%$Resources:Global, Numero %>" HeaderStyle-CssClass="bg-primary" />
                                <asp:BoundField DataField="Piso" HeaderText="<%$Resources:Global, Piso %>"  HeaderStyle-CssClass="bg-primary" />
                                <asp:BoundField DataField="Departamento" HeaderText="<%$Resources:Global, Departamento %>" HeaderStyle-CssClass="bg-primary" />
                                <asp:TemplateField HeaderText="<%$Resources:Global, Provincia %>" HeaderStyle-CssClass="bg-primary" >
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlProvinciaG" runat="server" OnSelectedIndexChanged="ddlProvinciaG_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Global, Localidad %>" HeaderStyle-CssClass="bg-primary">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlLocalidadG" runat="server" AutoPostBack="true" ></asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:CheckBoxField DataField="Predeterminada" HeaderText="<%$Resources:Global, Predeterminada %>" HeaderStyle-CssClass="bg-primary" />
                            </Columns>
<%--                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <br />

            <div class="text-center">
                <a href="#modalDireccionFacturacion" class="btn btn-info" data-toggle="modal">
                    <asp:Label ID="Label9" runat="server" Text="<%$Resources:Global, AgregarDireccion %>"></asp:Label></a>
            </div>
        </div>

        <hr />
    </div>
    <%-- FACTURACION END --%>

    <!--MODAL DIRECCION FACTURACION-->
    <div class="modal fade" id="modalDireccionFacturacion">
        <div class="modal-dialog">
            <%--<asp:UpdatePanel ID="upModal" ChildrenAsTriggers="false" UpdateMode="Conditional" runat="server">--%>
            <%--<ContentTemplate>--%>
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>
                        <asp:Label ID="Label10" runat="server" Text="<%$Resources:Global, AgregarDireccionDeFacturacion %>"></asp:Label></h2>
                    <div id="notificationdireccionFacturacion" runat="server" clientidmode="Static">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upModalFacturacion">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarDireccionDeFacturacion" />
                        </Triggers>
                        <ContentTemplate>
                            <form role="form">
                                <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label>
                                    <input type="text" class="form-control" id="calle" placeholder="<%$Resources:Global, IngresarCalle %>" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label12" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label>
                                    <input type="number" class="form-control" id="numero" placeholder="<%$Resources:Global, IngresarNumero %>" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label13" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label>
                                    <input type="number" value="0" class="form-control" id="piso" runat="server" placeholder="<%$Resources:Global, IngresarPiso %>" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label14" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label>
                                    <input type="text" class="form-control" id="departamento" runat="server" placeholder="<%$Resources:Global, IngresarDepartamento %>" clientidmode="static" />
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <asp:Label ID="Label16" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label>
                                        <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" AutoPostBack="true" ClientIDMode="static" ></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblLocalidad2" for="ddlLocalidadAltaFact" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label>
                                        <asp:DropDownList ID="ddlLocalidadAltaFact" CssClass="form-control" runat="server" ClientIDMode="static"></asp:DropDownList>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                    <asp:Button runat="server" CssClass="btn btn-primary btn-block" ID="btnGrabarDireccionDeFacturacion" ClientIDMode="static" Text="<%$Resources:Global, Guardar %>" OnClientClick="return onBtnGrabarClick(this)" OnClick="GrabarDireccionDeFacturacion_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- ENVIO --%>
    <div id="ddirecciondeenvio" class="col-lg-12">

        <h2>
            <asp:Label ID="Label17" runat="server" Text="<%$Resources:Global, DireccionesDeEnvio %>"></asp:Label></h2>

        <div class="text-center">
            <div class="form-group">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                <asp:GridView ID="grilladirecciondeenvio" CssClass="table table-hover table-responsive table-striped table-bordered" runat="server" AutoGenerateColumns="false" DataKeyNames="IdDireccion" OnRowCancelingEdit="grilladirecciondeenvio_RowCancelingEdit" OnRowDataBound="grilladirecciondeenvio_RowDataBound" OnRowDeleting="grilladirecciondeenvio_RowDeleting" OnRowEditing="grilladirecciondeenvio_RowEditing" OnRowUpdating="grilladirecciondeenvio_RowUpdating">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-success" />
                        <asp:CommandField ShowDeleteButton="True"  HeaderStyle-CssClass="bg-primary" ControlStyle-CssClass="btn btn-default" />
                        <asp:BoundField DataField="Calle" HeaderText="<%$Resources:Global, Calle %>" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Numero" HeaderText="<%$Resources:Global, Numero %>" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Piso" HeaderText="<%$Resources:Global, Piso %>" HeaderStyle-CssClass="bg-primary" />
                        <asp:BoundField DataField="Departamento" HeaderText="<%$Resources:Global, Departamento %>" HeaderStyle-CssClass="bg-primary" />
                        <asp:TemplateField HeaderText="<%$Resources:Global, Provincia %>" HeaderStyle-CssClass="bg-primary">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlProvinciaG" runat="server" OnSelectedIndexChanged="ddlProvinciaGEnvio_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="<%$Resources:Global, Localidad %>" HeaderStyle-CssClass="bg-primary">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlLocalidadG" runat="server" AutoPostBack="true" ></asp:DropDownList>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Predeterminada" HeaderText="<%$Resources:Global, Predeterminada %>" HeaderStyle-CssClass="bg-primary" />
                    </Columns>
<%--                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
                </asp:GridView>
                </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <br />

            <div class=" text-center">
                <a href="#modalDireccionenvio" class="btn btn-info" data-toggle="modal">
                    <asp:Label ID="Label18" runat="server" Text="<%$Resources:Global, AgregarDireccion %>"></asp:Label></a>
            </div>
        </div>

        <hr />
    </div>
    <%-- ENVIO END --%>

    <%--MODAL DIRECCION ENVIO--%>
    <div class="modal fade" id="modalDireccionenvio">
        <div class="modal-dialog">

            <!--Contenido de la ventana Modal-->
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>
                        <asp:Label ID="Label19" runat="server" Text="<%$Resources:Global, AgregarDireccionDeEnvio %>"></asp:Label></h2>
                    <div id="notificationdireccionenvio">
                    </div>
                </div>
                <div class="modal-body">
                                <div class="form-group">
                                    <asp:Label ID="Label20" runat="server" Text="<%$Resources:Global, Calle %>"></asp:Label>
                                    <input type="text" class="form-control" id="calleenvio" runat="server" placeholder="<%$Resources:Global, IngresarCalle %>" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label21" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label>
                                    <input type="number" class="form-control" id="numeroenvio" placeholder="<%$Resources:Global, IngresarNumeroCalle %>" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label22" runat="server" Text="<%$Resources:Global, Piso %>"></asp:Label>
                                    <input type="number" value="0" class="form-control" id="pisoenvio" runat="server" placeholder="<%$Resources:Global, IngresarPiso %>" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label23" runat="server" Text="<%$Resources:Global, Departamento %>"></asp:Label>
                                    <input type="text" class="form-control" id="departamentoenvio" runat="server" placeholder="<%$Resources:Global, IngresarDepartamento %>" clientidmode="static" />
                                </div>
                                <asp:UpdatePanel runat="server" ID="UpModalDireEnvio">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <asp:Label ID="Label25" runat="server" Text="<%$Resources:Global, Provincia %>"></asp:Label>
                                            <asp:DropDownList ID="ddlProvinciaAltaEnvio" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlProvinciaAltaEnvio_SelectedIndexChanged" AutoPostBack="true" ClientIDMode="static"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label34" for="ddlLocalidadAltaEnvio" CssClass="control-label col-xs-3" runat="server" Text="<%$Resources:Global, Localidad %>"></asp:Label>
                                            <asp:DropDownList ID="ddlLocalidadAltaEnvio" CssClass="form-control" runat="server" ClientIDMode="static" ></asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                    <asp:Button ID="btnGrabarDireccionDeEnvio" runat="server" ClientIDMode="static" Text="<%$Resources:Global, Guardar %>" CssClass="btn btn-primary btn-block" OnClientClick="return onbtnGrabarEnvio(this)" OnClick="GrabarDireccionDeEnvio_Click" />
                </div>
            </div>
        </div>
    </div>

    <!--MODAL Password-->
    <div class="modal fade" id="modalCambiarPassPersonal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" id="btnCerrarModal" class="close" data-dismiss="modal">&times;</button>
                    <h2>
                        <asp:Label ID="Label26" runat="server" Text="<%$Resources:Global, CambiarContrasena %>"></asp:Label></h2>
                    <div id="notification"></div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="upContrasenia" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnCambiarClave" />
                        </Triggers>
                        <ContentTemplate>
                            <div role="form" id="formPass">

                                <div class="form-group">
                                    <asp:Label ID="Label27" runat="server" Text="<%$Resources:Global, ContrasenaAnterior %>"></asp:Label>
                                    <input type="password" class="form-control" id="passanterior" clientidmode="static" placeholder="<%$Resources:Global, IngresarContrasenaAnterior %>" runat="server" maxlength="20" required />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label28" runat="server" Text="<%$Resources:Global, NuevaContrasena %>"></asp:Label>
                                    <input type="password" class="form-control" clientidmode="static" id="passnueva" placeholder="<%$Resources:Global, IngresarContrasenaNueva %>" runat="server" maxlength="20" />
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label29" runat="server" Text="<%$Resources:Global, RepitaNuevaContrasena %>"></asp:Label>
                                    <input type="password" class="form-control" id="passnuevarepetida" clientidmode="static" runat="server" placeholder="<%$Resources:Global, RepetirNuevaContrasena %>" maxlength="20" />
                                </div>

                                <%-- <button type="button" id="btnCambiarContra" runat="server"="btnCambiarContra_Click">Cambiar</button>--%>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--agrege onsubmit--%>
                    <asp:Button ID="btnCambiarClave" runat="server" ClientIDMode="static" onsubmit="return validateForm(this);" CssClass="btn btn-primary btn-block" Text="<%$Resources:Global, Cambiar %>" />
                </div>
            </div>
        </div>
    </div>
    <%--modal telefono inicio--%>
    <div class="modal fade" id="mdlAgregarTelefono">
        <div class="modal-dialog">

            <!--Contenido de la ventana Modal-->
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>
                        <asp:Label ID="Label30" runat="server" Text="<%$Resources:Global, AgregarTelefono %>"></asp:Label></h2>
                    <div id="notificationTelefono">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpModalTelefono">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarTelefono" />
                        </Triggers>
                        <ContentTemplate>
                            <form role="form" data-toggle="validator" id="form">
                                <div class="form-group">
                                    <asp:Label ID="Label31" runat="server" Text="<%$Resources:Global, CodigoArea %>"></asp:Label>
                                    <input type="number"  class="form-control" id="txtCodigo" runat="server" placeholder="<%$Resources:Global, CodigoArea %>" clientidmode="static" required="" />
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label32" runat="server" Text="<%$Resources:Global, Numero %>"></asp:Label>
                                    <input type="number" pattern="^[0-9]{1,10}$" class="form-control" id="txtNumero" runat="server" placeholder="<%$Resources:Global, Numero %>" clientidmode="static" required="" />
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label33" runat="server" Text="<%$Resources:Global, Tipo %>"></asp:Label>
                                    <asp:DropDownList ID="ddlTipoTel" CssClass="form-control" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnGrabarTelefono" runat="server" ClientIDMode="static" Text="<%$Resources:Global, Guardar %>" CssClass="btn btn-primary btn-block" OnClientClick="onbtnGrabarTelefono(this)" />
                </div>
            </div>
        </div>
    </div>
    <%--modal telefono end--%>


    <!--MODAL ErrorMsj-->
    <div class="modal fade" id="ErrorMsj" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" id="btnCerrarErrorMsj" class="close" data-dismiss="modal">&times;</button>
                    <h2>
                        <asp:Label ID="Label15" runat="server" Text="<%$Resources:Global, Atencion %>"></asp:Label></h2>
                    
                </div>
                <div class="modal-body">
                            <div id="notificationAtencion"></div>
                </div>
            </div>
        </div>
    </div>
    <%--modal ErrorMsj end--%>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
