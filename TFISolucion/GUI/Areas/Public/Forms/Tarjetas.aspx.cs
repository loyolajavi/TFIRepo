using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;

namespace TFI.GUI
{
    public partial class Tarjetas : System.Web.UI.Page
    {

        private UsuarioCore UsuarioBLL = new UsuarioCore();
        private TarjetaCore TarjetaBLL = new TarjetaCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<TarjetaEntidad> TarjetasEntidad = new List<TarjetaEntidad>();
        List<TarjetaDTO> TarjetasDTO = new List<TarjetaDTO>();


        protected void Page_Load(object sender, EventArgs e)
        {
            
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            CargarGrillaTarjetas();

            if (!IsPostBack)
            {
                CargarDropdownTipoTarjeta();
            }

        }

        private void CargarDropdownTipoTarjeta()
        {
            tipoTarjeta.DataSource = TarjetaBLL.SelectAllTiposDeTarjeta();
            tipoTarjeta.DataValueField = "IdTipoTarjeta";
            tipoTarjeta.DataTextField = "Descripcion";
            tipoTarjeta.DataBind();
        }

        private class TarjetaDTO
        {

            public Int64 NumeroTarjeta { get; set; }
            public string TipoDeTarjeta { get; set; }
            public string Titular { get; set; }
            public string FechaExpiracion { get; set; }
            public string CodigoSeguridad { get; set; }

        }

        //protected void grilladetarjetas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    grilladetarjetas.EditIndex = -1;
        //    grilladetarjetas.DataBind();
        //}


        protected void grilladetarjetas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            TarjetaEntidad TarjetaAEliminar = new TarjetaEntidad();
            TarjetaAEliminar.CUIT = usuarioentidad.CUIT;
            TarjetaAEliminar.NombreUsuario = usuarioentidad.NombreUsuario;
            GridViewRow row = (GridViewRow)grilladetarjetas.Rows[e.RowIndex];
            var numerodetarjeta = ((string)row.Cells[1].Text);
            var id = TarjetaBLL.SelectTarjetaByNumero(Convert.ToInt64(numerodetarjeta), TarjetaAEliminar.CUIT).IdTarjeta;
            TarjetaBLL.DeleteTarjeta(id);

            CargarGrillaTarjetas();
        }

        private void CargarGrillaTarjetas()
        {

            


            TarjetasEntidad = TarjetaBLL.SelectAllTarjetasByCUIT_NombreUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);


            foreach (var t in TarjetasEntidad)
            {
                TarjetaDTO TarjetaAMostrar = new TarjetaDTO();
                TarjetaAMostrar.NumeroTarjeta = t.Numero;
                var x = t.CodSeguridad.ToString();
                TarjetaAMostrar.CodigoSeguridad = x.Replace(x, "****");
                TarjetaAMostrar.FechaExpiracion = t.Vencimiento.ToShortDateString();
                TarjetaAMostrar.Titular = t.Titular;
                TipoTarjetaEntidad TipoTarjeta = TarjetaBLL.ObtenerTipoTarjeta(t);
                TarjetaAMostrar.TipoDeTarjeta = TipoTarjeta.Descripcion;

                TarjetasDTO.Add(TarjetaAMostrar);
            }



            grilladetarjetas.DataSource = TarjetasDTO;
            grilladetarjetas.AutoGenerateColumns = false;
            grilladetarjetas.DataBind();
        }



        //protected void grilladetarjetas_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    grilladetarjetas.EditIndex = e.NewEditIndex;
        //    grilladetarjetas.DataBind();

        //}



        //protected void grilladetarjetas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    TarjetaEntidad TarjetaActualizada = new TarjetaEntidad();


        //    ////////////////////ACA SE TOMAN LOS DATOS DE SESION////////////////////////////////
        //    usuarioentidad.NombreUsuario = "test";
        //    usuarioentidad.cuit = "20377540582";

        //    GridViewRow row = grilladetarjetas.Rows[e.RowIndex];
        //    var NumeroTarjeta = ((TextBox)row.Cells[2].Controls[0]).Text;
        //    var Tipo = ((DropDownList)row.Cells[3].Controls[1]).SelectedIndex + 1;;
        //    var Titular = ((TextBox)row.Cells[4].Controls[0]).Text;
        //    var FechaExpiracion = ((TextBox)row.Cells[5].Controls[0]).Text;
        //    var Localidad = ((TextBox)row.Cells[6].Controls[0]).Text;
        //    var Provincia = ((DropDownList)row.Cells[8].Controls[1]).SelectedIndex + 1;
        //    var Id = ((TextBox)row.Cells[7].Controls[0]).Text;


        //    DireccionActualizada.IdDireccion = Convert.ToInt32(Id);
        //    DireccionActualizada.Calle = Calle;
        //    DireccionActualizada.Departamento = Departamento;
        //    DireccionActualizada.Numero = Convert.ToInt32(Numero);
        //    if (!String.IsNullOrEmpty(Piso))
        //    {
        //        DireccionActualizada.Piso = Convert.ToInt32(Piso);
        //    }

        //    DireccionActualizada.Localidad = Localidad;

        //    DireccionActualizada.IdProvincia = Provincia;
        //    DireccionActualizada.IdTipoDireccion = 1;


        //    UsuarioBLL.UpdateDireccionesUsuario(DireccionActualizada);


        //    //////Reset the edit index.
        //    grilladetarjetas.EditIndex = -1;

        //    ////////Bind data to the GridView control.
        //    grilladetarjetas.DataBind();

        //    CargarGrillaTarjetas();



        //}


        protected void btnGrabarTarjeta_Click(object sender, EventArgs e)
        {

            TarjetaEntidad NuevaTarjeta = new TarjetaEntidad();

            NuevaTarjeta.NombreUsuario = usuarioentidad.NombreUsuario;
            NuevaTarjeta.CUIT = usuarioentidad.CUIT;
            NuevaTarjeta.Vencimiento = new DateTime(Convert.ToInt32(expiryYear.Value), Convert.ToInt32(expiryMes.Value), 1);
            NuevaTarjeta.Titular = txtTitular.Value;
            NuevaTarjeta.Numero = Convert.ToInt64(txtNumeroTarjeta.Value);
            NuevaTarjeta.CodSeguridad = Convert.ToInt32(txtCodigoSeguridad.Value);
            NuevaTarjeta.IdTipoTarjeta = tipoTarjeta.SelectedIndex + 1;

            TarjetaBLL.InsertTarjeta(NuevaTarjeta);


        }

        protected void grilladetarjetas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var ddl = e.Row.FindControl("ddlTipoDeTarjeta") as DropDownList;
                if (ddl != null)
                {

                    ddl.DataSource = TarjetaBLL.SelectAllTiposDeTarjeta();
                    ddl.DataValueField = "IdTipoTarjeta";
                    ddl.DataTextField = "Descripcion";
                    ddl.DataBind();


                }

            }
        }


    }
}