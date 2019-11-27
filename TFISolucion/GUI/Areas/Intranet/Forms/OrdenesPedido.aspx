<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="OrdenesPedido.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.OrdenesPedido" %>
<%@ MasterType VirtualPath="~/Shared/LayoutAdministracion.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
    
    <div class="container paddingPaginas">

        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header"><asp:Label ID="Label1" runat="server" Text="<%$Resources:Global, GestionPedidos %>"></asp:Label>
                </h1>
            </div>
        </div>

            <div class="row" runat="server" id="contenedorsinpedidos">
                <div class="col-md-9">
                    <div class="alert alert-info alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <i class="fa fa-info-circle"></i>
                        <div id="sinpedidos" runat="server"></div>
                    </div>
                </div>
            </div>

        <div class="row">
            <div class="list-group col-md-4">
                <div class="form-group">
                    <label for="txtClienteBusqueda" class="control-label">
                        <asp:Label ID="Label2" runat="server" Text="<%$Resources:Global, Cliente %>"></asp:Label></label>

                    <asp:TextBox ID="txtClienteBusqueda" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    <asp:Button ID="btnBuscarCliente" runat="server" Text="<%$Resources:Global, Buscar %>" CssClass="form-control col-md-" OnClick="btnBuscarCliente_Click" />

                </div>

                <asp:DropDownList ID="ddlEstadoPedido" CssClass="form-control" runat="server"></asp:DropDownList>

            </div>




            <hr />


            <div class="col-md-8">
                <asp:ScriptManager ID="ScriptManager1" runat="server" />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    
                    <ContentTemplate>
                        <asp:GridView ID="grilladeultimospedidos" AllowPaging="true" OnPageIndexChanging="grilladeultimospedidos_PageIndexChanging" PageSize="10" AutoGenerateColumns="false" CssClass="tablesorter table table-striped table-hover table-users" DataKeyNames="NroPedido" runat="server" OnRowCommand="grilladeultimospedidos_RowCommand">
                            <Columns>
                                <asp:ButtonField CommandName="VerDetalle" HeaderText="<%$Resources:Global, VerDetalle %>" Text="<%$Resources:Global, VerDetalle %>" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                <asp:BoundField DataField="NroPedido" HeaderText="<%$Resources:Global, NumeroPedido %>" />
                                <asp:BoundField DataField="FechaPedido" HeaderText="<%$Resources:Global, FechaPedido %>" />
                                <asp:BoundField DataField="Estado" HeaderText="<%$Resources:Global, Estado %>" />
                                <asp:BoundField DataField="NombreUsuario" HeaderText="<%$Resources:Global, Cliente %>" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                <asp:ButtonField CommandName="CambiarEstado" HeaderText="<%$Resources:Global, CambiarEstado %>" Text="<%$Resources:Global, CambiarEstado %>" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                <asp:ButtonField CommandName="CancelarPedido" HeaderText="<%$Resources:Global, Cancelar %>" Text="<%$Resources:Global, Cancelar %>" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>
    
    </div>

    <div id="currentdetail" class="modal fade">
                <div class="modal-dialog" style="width: 650px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                                ×</button>
                            <h3 id="myModalLabel">
                                <asp:Label ID="Label3" runat="server" Text="<%$Resources:Global, DetallePedido %>"></asp:Label></h3>
                        </div>
                        <div class="modal-body">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DetailsView ID="DetailsView1" runat="server"
                                        CssClass="table table-bordered table-hover"
                                        BackColor="White" ForeColor="Black"
                                        FieldHeaderStyle-Wrap="false"
                                        FieldHeaderStyle-Font-Bold="true"
                                        FieldHeaderStyle-BackColor="LavenderBlush"
                                        FieldHeaderStyle-ForeColor="Black"
                                        BorderStyle="Groove" AutoGenerateRows="False">
                                        <Fields>
                                            <asp:BoundField DataField="NroPedido" HeaderText="<%$Resources:Global, NumeroPedido %>" />
                                        </Fields>
                                    </asp:DetailsView>
                                    <asp:GridView ID="grilladedetallesdelpedido" CssClass="tablesorter table table-striped table-hover table-users" runat="server"></asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="grilladeultimospedidos" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <button class="btn btn-info" data-dismiss="modal"
                                    aria-hidden="true">
                                    <asp:Label ID="Label4" runat="server" Text="<%$Resources:Global, Close %>"></asp:Label></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
<%--    
    <div id="currentestado" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                                ×</button>
                            <h3 id="myModalEstadoLabel"><asp:Label ID="Label5" runat="server" Text="<%$Resources:Global, EstadoPedido %>"></asp:Label></h3>
                        </div>
                        <div class="modal-body">
                           
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate><asp:TextBox runat="server">Está Seguro?</asp:TextBox></ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnAvanzar"/>
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                   <asp:Button CssClass="form-control" runat="server" ID="btnAvanzar" ClientIDMode="static" Text="<%$Resources:Global, CambiarEstado %>" />
                                    <div id="notificationestado" runat="server"></div> 
                            </div>
                        </div>
                    </div>
                </div>
    </div>--%>

    <div id="BloqueadoModifFinalizado" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" 
                                aria-hidden="true">
                                ×</button>
                            <h3 id="myModalEstadoFinalizadoLabel"><asp:Label ID="Label7" runat="server" Text="<%$Resources:Global, Nopuedemodificarleelestadoaunpedidocancelado %>"></asp:Label></h3>
                        </div>
                    </div>
                </div>
    </div>

<%--    <div id="modaltracking" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ingrese el Tracking del pedido</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                          <div class="form-group">
                            <label for="nrotracking" class="col-form-label">Tracking:</label>
                              <input type="text" class="form-control" id="nrotracking" />
                          </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Send message</button>
                        </div>
                    </div>
                </div>
    </div>--%>

    <%--Prueba modal msg confirm desde cliente--%>
<%--    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="unModalConfirmar">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="ModalLabelConfirmar">Confirmar</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" id="modal-btn-si">Si</button>
            <button type="button" class="btn btn-primary" id="modal-btn-no">No</button>
          </div>
        </div>
      </div>
    </div>--%>
     


</asp:Content>


<asp:Content ID="Scripts" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../../Scripts/shared/Validaciones.js"></script>
     <script>
         var obtenerTags = function () {
             var result;
             $.ajax({
                 type: "POST",
                 url: "OrdenesPedido.aspx/ObtenerClientes",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 async: false,
                 error: function (xhr, status, error) {
                     alert(error);
                 },
                 success: function (data) {
                     result = data.d;
                 }
             });

             return result;
         };

        var availableTags = obtenerTags();

        //$("#txtClienteBusqueda").change(function () {
        //    $(this).autocomplete({
        //        source: availableTags
        //    });
        //});

        $("#txtClienteBusqueda").autocomplete({
            source: availableTags
        });

         //Sin onclicentCLick, este servia mas
        //$('.ctracking').click(function (e) {
        //    e.preventDefault();
        //    var $modal = $('#modaltracking');
        //    $modal.modal("show");
        //});


         //COn onCLienClick, este servia menos
        //function MostrarModalTracking(nroPedido) {
        //    alert(nroPedido);
        //    var $modal = $('#modaltracking');
        //    $modal.modal("show");
        //};

<%--        $('#modaltracking').on('click', '.btn-primary', function () {
            //PageMethods.ObtenerTracking($('#nrotracking').val());
            $('#<%=hdnfilename.ClientID %>').val($('#nrotracking').val());
            $('#modaltracking').modal('hide');
        });--%>

    </script>

</asp:Content>
