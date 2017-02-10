<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" CodeBehind="DatosPersonales.aspx.cs" EnableEventValidation="false" Inherits="TFI.GUI.DatosPersonales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="col-lg-12">
        <h1 class="page-header">Datos Personales <small>Mi Cuenta</small></h1>
    </div>

    <div id="panelDatosPersonales" class="col-lg-12">
        <h2>Datos de cuenta</h2>

        <div class=" col-lg-6 form-group">
            <label for="usuario">Usuario</label>
            <input runat="server" id="usuario" class="form-control" type="text" disabled />
        </div>

        <div class="col-lg-6 form-group">
            <label for="clave">Contraseña</label>
            <input runat="server" id="clave" class="form-control" type="text" disabled />
        </div>

        <div class="text-center">
            <a id="btnLogin" class="btn btn-primary">Modificar Contraseña</a>
        </div>

        <hr />
    </div>

    <div id="dpersonales" class="col-lg-12">
        <h2>Datos Personales</h2>

        <div class="text-center">
            <div class="form-group">
                <asp:GridView ID="grilladedatospersonales" CssClass="table" runat="server" OnRowCancelingEdit="grilladedatospersonales_RowCancelingEdit" OnRowEditing="grilladedatospersonales_RowEditing" OnRowUpdating="grilladedatospersonales_RowUpdating" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                    <Columns>
                        <asp:CommandField ControlStyle-ForeColor="White" ShowEditButton="True" ControlStyle-CssClass="btn btn-warning" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
        </div>

        <hr />
    </div>

    <%-- TELEFONO --%>
    <div class="col-lg-12">
        <h2>Teléfonos</h2>
        <div class="text-center">
            <div class="form-group">
                <asp:GridView ID="grillatelefonos" CssClass="table" runat="server" OnRowEditing="grillatelefonos_RowEditing" OnRowCancelingEdit="grillatelefonos_RowCancelingEdit" OnRowUpdating="grillatelefonos_RowUpdating" OnRowDataBound="grillatelefonos_RowDataBound" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" />

                        <%-- <asp:BoundField DataField="Tipo" HeaderText="Tipo" />--%>
                        <asp:TemplateField HeaderText="Tipo">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlTipo" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>

            <div class="text-center">

                <%-- TODO: AGREGAR TELEFONO --%>

                <a href="#mdlAgregarTelefono" class="btn btn-primary" data-toggle="modal">Agregar Teléfono</a>
            </div>
        </div>
        <hr />
    </div>
    <%-- TELEFONO END --%>

    <%-- FACTURACION --%>
    <div id="ddireccionfacturacion" class="col-lg-12">

        <h2>Direcciones de Facturación</h2>

        <div class="text-center">

            <div class="form-group">
                <asp:GridView ID="grilladirecciondefacturacion" CssClass="table" runat="server" OnRowCancelingEdit="grilladirecciondefacturacion_RowCancelingEdit" OnRowDataBound="grilladirecciondefacturacion_RowDataBound" OnRowDeleting="grilladirecciondefacturacion_RowDeleting" OnRowEditing="grilladirecciondefacturacion_RowEditing" OnRowUpdating="grilladirecciondefacturacion_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" BackColor="#CCCCCC" BorderColor="#999999">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="Calle" HeaderText="Calle" />
                        <asp:BoundField DataField="Numero" HeaderText="Numero" />
                        <asp:BoundField DataField="Piso" HeaderText="Piso" />
                        <asp:BoundField DataField="Departamento" HeaderText="Departamento" />
                        <asp:BoundField DataField="Localidad" HeaderText="Localidad" />
                        <asp:BoundField DataField="IdDireccion" HeaderText="IdDireccion" />
                        <asp:TemplateField HeaderText="Provincia">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlProvincia" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Predeterminada" HeaderText="Predeterminada" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
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

            <div class="text-center">
                <a href="#modalDireccionFacturacion" class="btn btn-primary" data-toggle="modal">Agregar Direccion</a>
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
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar direccion de facturación</h2>
                    <div id="notificationdireccion">
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
                                    <label for="calle">Calle</label>
                                    <input type="text" class="form-control" id="calle" placeholder="Ingrese calle de la direccion" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="numero">Numero</label>
                                    <input type="number" class="form-control" id="numero" placeholder="Ingrese el numero de la direccion" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="piso">Piso</label>
                                    <input type="text" class="form-control" id="piso" runat="server" placeholder="Ingrese el piso" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="departamento">Departamento</label>
                                    <input type="text" class="form-control" id="departamento" runat="server" placeholder="Ingrese el departamento" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="localidad">Localidad</label>
                                    <input type="text" class="form-control" id="localidad" runat="server" placeholder="Ingrese la localidad" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="provincia">Provincia</label>
                                    <asp:DropDownList ID="ddlProvincia" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--Agrego boton, con update panel, le agrege ClientIDMode a los elementos del modal.--%>
                    <asp:Button runat="server" ID="btnGrabarDireccionDeFacturacion" ClientIDMode="static" Text="Guardar" OnClientClick="return onBtnGrabarClick(this)" OnClick="GrabarDireccionDeFacturacion_Click" />
                </div>
            </div>
        </div>
    </div>

    <%-- ENVIO --%>
    <div id="ddirecciondeenvio" class="col-lg-12">

        <h2>Direcciones de Envio</h2>

        <div class="text-center">
            <div class="form-group">

                <asp:GridView ID="grilladirecciondeenvio" CssClass="table" runat="server" OnRowCancelingEdit="grilladirecciondeenvio_RowCancelingEdit" OnRowDataBound="grilladirecciondeenvio_RowDataBound" OnRowDeleting="grilladirecciondeenvio_RowDeleting" OnRowEditing="grilladirecciondeenvio_RowEditing" OnRowUpdating="grilladirecciondeenvio_RowUpdating">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="Calle" HeaderText="Calle" />
                        <asp:BoundField DataField="Numero" HeaderText="Numero" />
                        <asp:BoundField DataField="Piso" HeaderText="Piso" />
                        <asp:BoundField DataField="Departamento" HeaderText="Departamento" />
                        <asp:BoundField DataField="Localidad" HeaderText="Localidad" />
                        <asp:BoundField DataField="IdDireccion" HeaderText="IdDireccion" />
                        <asp:TemplateField HeaderText="Provincia">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlProvincia" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Predeterminada" HeaderText="Predeterminada" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
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

            <div class=" text-center">
                <a href="#modalDireccionenvio" class="btn btn-primary" data-toggle="modal">Agregar Direccion</a>
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
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar direccion de envio</h2>
                    <div id="notificationdireccionenvio">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpModalDireEnvio">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarDireccionDeEnvio" />
                        </Triggers>
                        <ContentTemplate>
                            <form role="form">
                                <div class="form-group">
                                    <label for="calleenvio">Calle</label>
                                    <input type="text" class="form-control" id="calleenvio" runat="server" placeholder="Ingrese la calle" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="numeroenvio">Numero</label>
                                    <input type="number" class="form-control" id="numeroenvio" placeholder="Ingrese el numero de la direccion" runat="server" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="pisoenvio">Piso</label>
                                    <input type="text" class="form-control" id="pisoenvio" runat="server" placeholder="Ingrese el piso" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="departamentoenvio">Departamento</label>
                                    <input type="text" class="form-control" id="departamentoenvio" runat="server" placeholder="Ingrese el departamento" clientidmode="static" />
                                </div>

                                <div class="form-group">
                                    <label for="localidadenvio">Localidad</label>
                                    <input type="text" class="form-control" id="localidadenvio" runat="server" placeholder="Ingrese la localidad" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="ddlProvinciaEnvio">Provincia</label>
                                    <asp:DropDownList ID="ddlProvinciaEnvio" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnGrabarDireccionDeEnvio" runat="server" ClientIDMode="static" Text="Guardar" CssClass="btn btn-primary btn-block" OnClientClick="return onbtnGrabarEnvio(this)" OnClick="GrabarDireccionDeEnvio_Click" />
                </div>
            </div>
        </div>
    </div>

    <!--MODAL LOGIN-->
    <div class="modal fade" id="modalLogin" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="btnCerrarModal" class="close" data-dismiss="modal">&times;</button>
                    <h2>Cambiar Contraseña</h2>
                    <div id="notification"></div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="upContrasenia" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnCambiarClave" />
                        </Triggers>
                        <ContentTemplate>
                            <form role="form" id="formPass">

                                <div class="form-group">
                                    <label for="passanterior">Contraseña anterior</label>
                                    <input type="password" class="form-control" id="passanterior" clientidmode="static" placeholder="Ingrese la contraseña anterior" runat="server" maxlength="20" required />
                                </div>

                                <div class="form-group">
                                    <label for="passnueva">Nueva Contraseña</label>
                                    <input type="password" class="form-control" clientidmode="static" id="passnueva" placeholder="Ingrese la nueva contraseña" runat="server" maxlength="20" />
                                </div>

                                <div class="form-group">
                                    <label for="passnuevarepetida">Repita Nueva Contraseña</label>
                                    <input type="password" class="form-control" id="passnuevarepetida" clientidmode="static" runat="server" placeholder="Repita la nueva contraseña" maxlength="20" />
                                </div>

                                <%-- <button type="button" id="btnCambiarContra" runat="server"="btnCambiarContra_Click">Cambiar</button>--%>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <%--agrege onsubmit--%>
                    <asp:Button ID="btnCambiarClave" runat="server" ClientIDMode="static" onsubmit="return validateForm(this);" CssClass="btn btn-primary btn-block" Text="Cambiar" />
                </div>
            </div>
        </div>
    </div>
    <%--modal telefono inicio--%>
    <div class="modal fade" id="mdlAgregarTelefono">
        <div class="modal-dialog">

            <!--Contenido de la ventana Modal-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2>Agregar Telefono</h2>
                    <div id="notificationTelefono">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpModalTelefono">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarTelefono" />
                        </Triggers>
                        <ContentTemplate>
                            <form role="form">
                                <div class="form-group">
                                    <label for="txtCodigo">Codigo Area</label>
                                    <input type="text" class="form-control" id="txtCodigo" runat="server" placeholder="Codigo Area" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="txtNumero">Numero</label>
                                    <input type="text" class="form-control" id="txtNumero" runat="server" placeholder="Numero" clientidmode="static" />
                                </div>
                                <div class="form-group">
                                    <label for="ddlTipoTel">Tipo</label>
                                    <asp:DropDownList ID="ddlTipoTel" runat="server" ClientIDMode="static"></asp:DropDownList>
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnGrabarTelefono" runat="server" ClientIDMode="static" Text="Guardar" CssClass="btn btn-primary btn-block" OnClientClick="return onbtnGrabarTelefono(this)" OnClick="btnGrabarTelefono_Click" />
                </div>
            </div>
        </div>
    </div>
    <%--modal telefono end--%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>