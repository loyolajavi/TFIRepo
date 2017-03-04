<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Tarjetas.aspx.cs" Inherits="TFI.GUI.Tarjetas" %>
<%@ MasterType VirtualPath="~/Shared/MiCuenta.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="col-lg-12">
        <h1 class="page-header"><%=Resources.Global.DatosDeTarjetas%> <small><%=Resources.Global.MiCuenta%></small>
        </h1>
    </div>

    <div class="col-lg-12">

        <div class="table-responsive">


            <asp:GridView CssClass="table" ID="grilladetarjetas" runat="server" OnRowDeleting="grilladetarjetas_RowDeleting" OnRowDataBound="grilladetarjetas_RowDataBound">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="NumeroTarjeta" HeaderText="<%$Resources:Global, NumeroTarjeta %>" />
                    <asp:TemplateField HeaderText="<%$Resources:Global, Tipo %>">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlTipoDeTarjeta" runat="server" disabled="true"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Titular" HeaderText="<%$Resources:Global, Titular %>" />
                    <asp:BoundField DataField="FechaExpiracion" HeaderText="<%$Resources:Global, FechaExpiracion %>" />
                    <asp:BoundField DataField="CodigoSeguridad" HeaderText="<%$Resources:Global, CodigoSeguridad %>"  />
                    <asp:CheckBoxField DataField="Predeterminada" HeaderText="<%$Resources:Global, Predeterminada %>" />
                </Columns>
            </asp:GridView>

        </div>



        <div class="col-md-6 text-center">
            <a href="#modalAltaTarjeta" class="btn btn-primary" data-toggle="modal"><%=Resources.Global.AgregarTarjeta%></a>
        </div>

        <br />
    </div>

    <br />



    <!--MODAL Alta Tarjeta-->
    <div class="modal fade" id="modalAltaTarjeta">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2><%=Resources.Global.AgregarTarjeta%></h2>
                    <div id="notificationTarjeta" runat="server" ClientIdMode="Static">
                    </div>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGrabarTarjeta" />
                        </Triggers>
                        <ContentTemplate>
                            <form role="form" id="formPass">
                                <div class="form-group">
                                    <label for="tipoTarjeta"><%=Resources.Global.TipoTarjeta%></label>
                                    <asp:DropDownList ID="tipoTarjeta" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="txtNumeroTarjeta"><%=Resources.Global.NumeroTarjeta%></label>
                                    <input type="text" class="form-control" clientidmode="static" name="txtNumeroTarjeta" id="txtNumeroTarjeta" runat="server" placeholder="<%$Resources:Global, NumeroTarjeta %>" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" Display="Dynamic" runat="server" ControlToValidate="txtNumeroTarjeta" CssClass="alert alert-warning" Text="<%$Resources:Global, SoloNumero %>" ValidationExpression="^\d{1,5}$" ValidationGroup="Altatarjeta"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" CssClass="alert alert-warning" runat="server" Text="Ingresar numero de tarjeta" ControlToValidate="txtNumeroTarjeta" ValidationGroup="Altatarjeta"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="card-holder-name"><%=Resources.Global.Titular%></label>
                                    <input type="text" class="form-control" name="card-holder-name" id="txtTitular" runat="server" placeholder="<%$Resources:Global, NombreTitular %>" />
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="txtCodigoSeguridad"><%=Resources.Global.CodigoSeguridad%></label>
                                    <input type="text" runat="server" class="form-control" name="txtCodigoSeguridad" id="txtCodigoSeguridad" placeholder="<%$Resources:Global, CodigoSeguridad %>">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="expiry-month"><%=Resources.Global.FechaExpiracion%></label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <select runat="server" class="form-control col-sm-3" name="expiry-month" id="expiryMes">
                                                    <option runat="server" value="01">Jan (01)</option>
                                                    <option value="02">Feb (02)</option>
                                                    <option value="03">Mar (03)</option>
                                                    <option value="04">Apr (04)</option>
                                                    <option value="05">May (05)</option>
                                                    <option value="06">June (06)</option>
                                                    <option value="07">July (07)</option>
                                                    <option value="08">Aug (08)</option>
                                                    <option value="09">Sep (09)</option>
                                                    <option value="10">Oct (10)</option>
                                                    <option value="11">Nov (11)</option>
                                                    <option value="12">Dec (12)</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-4">
                                                <select runat="server" class="form-control" id="expiryYear" name="expiryYear">
                                                    <option runat="server" value="2016">2016</option>
                                                    <option value="2017">2017</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2019">2019</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2021">2021</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2024">2024</option>
                                                    <option value="2025">2025</option>
                                                    <option value="2026">2026</option>
                                                    <option value="2027">2027</option>
                                                    <option value="2028">2028</option>
                                                    <option value="2029">2029</option>
                                                    <option value="2030">2030</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </ContentTemplate>
                    </asp:UpdatePanel>
             <asp:Button ID="btnGrabarTarjeta" CssClass="btn btn-primary btn-block" ClientIDMode="static" Text="<%=Resources.Global.Aceptar%>" runat="server" OnClick="btnGrabarTarjeta_Click" ValidationGroup="Altatarjeta" />
                        <%--   <button type="button" ValidationGroup="Altatarjeta" id="btnGrabarTarjeta" onserverclick="btnGrabarTarjeta_Click" runat="server" class="btn btn-primary btn-block"><%=Resources.Global.Aceptar%></button>--%>
                </div>
            </div>
        </div>
    </div>
    <br />


    <%--<div class="form-group">
                <label class="col-sm-3 control-label" for="card-holder-name">Titular</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Nombre del titular">
                </div>
            </div>--%>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
</asp:Content>
