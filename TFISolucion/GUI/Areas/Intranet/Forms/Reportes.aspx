<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

    <div class="col-md-8" style="margin-top: 100px;">

        <style>
            .vertical {
                padding-left: 20px;
                vertical-align: middle;
                width:400PX;
            }

            img {
                max-height: 50px;
                max-width: 50px;
                padding: 5px;
            }
        </style>

        <table class="table-bordered">
            <thead>
                <tr>
                    <td colspan="2" class="col-md-8">
                        <h4>REPORTES</h4>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="vertical">Reporte por Usuario
                    </td>
                    <td style="width: 0%; text-align: center;">
                        <a href="#">
                            <img src="/Content/Images/Iconos/pdf.png" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="vertical">Reporte Pedidos por Fecha
                    </td>
                    <td style="width: 0%; text-align: center;">
                        <a href="#">
                            <img src="/Content/Images/Iconos/pdf.png" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="vertical">Reporte Pedidos  por Estado
                    </td>
                    <td style="width: 0%; text-align: center;">
                        <a href="#">
                            <img src="/Content/Images/Iconos/pdf.png" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td class="vertical">Reporte Pedidos por Sucursal
                    </td>
                    <td style="width: 0%; text-align: center;">
                        <a href="#">
                            <img src="/Content/Images/Iconos/pdf.png" />
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog">

        <div class="modal-dialog" role="document" style="width:300px;">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">REPORTE</h4>
                </div>
                <div class="modal-body" style="margin-top:10px">
                    <div class="form-group">
                        <label for="filtro" style="font-weight:200; color:#333333; font-size:12PX;">USUARIO</label>
                        <input id="filtro" style="padding:4px; border-radius:0px;" class="form-control" />
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="text-center">
                        <button type="button" class="btn" style="width: 200px; background-color: black; color: #fff;" data-dismiss="modal">GENERAR</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>