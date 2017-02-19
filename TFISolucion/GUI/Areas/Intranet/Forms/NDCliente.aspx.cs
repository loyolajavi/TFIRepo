﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class NDCliente : BasePage
    {

        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<ComprobanteEntidad> NDs = new List<ComprobanteEntidad>();
        ComprobanteCore ComprobanteBLL = new ComprobanteCore();
        List<NDsDTO> NotasDeDebitoAMostrar = new List<NDsDTO>();
        PedidoCore pedidoCore = new PedidoCore();
        private LenguajeEntidad idioma;

        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }
            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }

            CargarGrilladeNd();
        }

        private void CargarGrilladeNd()
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() <= FamiliaEntidad.PermisoFamilia.Cliente)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            foreach (var pedido in Pedidos)
            {

                var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
                foreach (var comprobante in Comprobantes)
                {
                    if (comprobante.IdTipoComprobante == 6 || comprobante.IdTipoComprobante == 9 || comprobante.IdComprobante == 10)
                    {
                        NDs.Add(comprobante);
                    }
                }


            }

            if (NDs.Count == 0)
            {
                sinnd.InnerHtml = "<strong>Usted no tiene notas de debito disponibles para consultar.";
            }
            else
            {
                contenedorsinnd.Visible = false;
            }

            for (int i = 0; i < NDs.Count; i++)
            {
                NDsDTO NDAMostrar = new NDsDTO();
              //  NDAMostrar.NroComprobante = NDs[i].NroComprobante;
                NDAMostrar.FechaComprobante = NDs[i].FechaComprobante;
                NDAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NDs[i].IdTipoComprobante).DescripTipoComprobante;
                char TipoNDLetra = NDAMostrar.TipoComprobante[NDAMostrar.TipoComprobante.Length - 1];
                string Sucursal4caracteres = "";
                Sucursal4caracteres = NDs[i].IdSucursal.ToString("D4");
                string NumeroND8Caracteres = "";
                NumeroND8Caracteres = NDs[i].NroComprobante.ToString("D8");
                NDAMostrar.NroComprobante = "ND" + TipoNDLetra + "-" + Sucursal4caracteres + "-" + NumeroND8Caracteres;
                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(NDs[i].NroComprobante, NDs[i].IdSucursal, NDs[i].IdTipoComprobante);
                NDAMostrar.Total = MontoTotalPorND(Detalles);
                NotasDeDebitoAMostrar.Add(NDAMostrar);

            }

            grilladend.DataSource = NotasDeDebitoAMostrar;
            grilladend.AutoGenerateColumns = false;
            grilladend.DataBind();
        }

        private double MontoTotalPorND(List<ComprobanteDetalleEntidad> Detalles)
        {
            double montoTotal = 0;
            foreach (var unDetalle in Detalles)
                montoTotal += Convert.ToDouble(unDetalle.PrecioUnitarioFact * unDetalle.CantidadProducto);
            return montoTotal;
        }

        public class NDsDTO
        {
            public string NroComprobante { get; set; }
            public DateTime FechaComprobante { get; set; }
            public string TipoComprobante { get; set; }
            public double Total { get; set; }
        }

        protected void grilladend_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("VerDetalle"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladend.DataKeys[index].Value.ToString();
                string ultimos8delcode = code.Substring(code.Length - 8);
                string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdSucursal, ComprobanteRow.IdTipoComprobante);
                grilladedetallesdend.DataSource = ListadeDetalles;
                grilladedetallesdend.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentdetail').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }

        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            List<ComprobanteEntidad> NDsDelCliente = new List<ComprobanteEntidad>();
            List<NDsDTO> NDsAMostrarDelCliente = new List<NDsDTO>();

            foreach (var pedido in Pedidos)
            {
                if (pedido.NombreUsuario == txtClienteBusqueda.Text)
                {

                    var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
                    foreach (var comprobante in Comprobantes)
                    {
                        if (comprobante.IdTipoComprobante == 6 || comprobante.IdTipoComprobante == 9 || comprobante.IdComprobante == 10)
                        {
                            NDsDelCliente.Add(comprobante);
                        }
                    }

                }
            }

            if (NDsDelCliente.Count == 0)
            {
                contenedorsinnd.Visible = true;
                sinnd.InnerHtml = "<strong>Usted no tiene notas de debito disponibles para consultar.";
            }
            else
            {
                contenedorsinnd.Visible = false;
            }

            for (int i = 0; i < NDsDelCliente.Count; i++)
            {
                NDsDTO NDAMostrar = new NDsDTO();
                //  NDAMostrar.NroComprobante = NDs[i].NroComprobante;
                NDAMostrar.FechaComprobante = NDs[i].FechaComprobante;
                NDAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NDs[i].IdTipoComprobante).DescripTipoComprobante;
                char TipoNDLetra = NDAMostrar.TipoComprobante[NDAMostrar.TipoComprobante.Length - 1];
                string Sucursal4caracteres = "";
                Sucursal4caracteres = NDs[i].IdSucursal.ToString("D4");
                string NumeroND8Caracteres = "";
                NumeroND8Caracteres = NDs[i].NroComprobante.ToString("D8");
                NDAMostrar.NroComprobante = "ND" + TipoNDLetra + "-" + Sucursal4caracteres + "-" + NumeroND8Caracteres;
                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(NDs[i].NroComprobante, NDs[i].IdSucursal, NDs[i].IdTipoComprobante);
                NDAMostrar.Total = MontoTotalPorND(Detalles);
                NDsAMostrarDelCliente.Add(NDAMostrar);

            }

            grilladend.DataSource = NDsAMostrarDelCliente;
            grilladend.AutoGenerateColumns = false;
            grilladend.DataBind();
        }
    }
}