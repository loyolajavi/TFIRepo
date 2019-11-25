using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.CORE.Helpers;


namespace TFI.GUI
{
    public partial class DatosPersonales : BasePage
    {
        private UsuarioCore UsuarioBLL = new UsuarioCore();
        private DireccionCore DireccionBLL = new DireccionCore();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        //Boolean tipo;
        public List<TelefonoDTO> ListaDeTelefonosDTO = new List<TelefonoDTO>();
        List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();
        //Dictionary<int, DireccionEntidad> DiccionarioDeDirecciones = new Dictionary<int, DireccionEntidad>();
        private LenguajeEntidad idioma;

        public string cuit = ConfigSection.Default.Site.Cuit;
        List<DireccionDTO> DireccionesFacturacionDeUsuario = new List<DireccionDTO>();
        List<DireccionDTO> DireccionesEnvioDeUsuario = new List<DireccionDTO>();
        TextBox txtNumeroEnvio = new TextBox();
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
            DireccionesFacturacionDeUsuario.Clear();
            DireccionesEnvioDeUsuario.Clear();
            // CargarGrillaDireccionDeFacturacion();
            cargarTipoTel();
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            if (usuarioentidad == null)
            {
                Response.Redirect("Home.aspx");
            }

            usuario.Value = usuarioentidad.NombreUsuario;
            clave.Value = usuarioentidad.Clave;
            clave.Value = clave.Value.Replace(usuarioentidad.Clave, "*********");

            DatosPersonalesDTO DatosPersonalesDTO = new DatosPersonalesDTO()
            {
                Apellido = usuarioentidad.Apellido,
                Email = usuarioentidad.Email,
                Nombre = usuarioentidad.Nombre
            };


            List<DatosPersonalesDTO> ListaDatosPersonalesDTO = new List<DatosPersonalesDTO>();

            ListaDatosPersonalesDTO.Add(DatosPersonalesDTO);
            grilladedatospersonales.DataSource = ListaDatosPersonalesDTO;
            grilladedatospersonales.AutoGenerateColumns = false;


            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }
                grilladedatospersonales.DataBind();
            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }


            List<TelefonoEntidad> TelefonosDelUsuario = new List<TelefonoEntidad>();
            TelefonosDelUsuario = UsuarioBLL.SelectTelefonosDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            //Dictionary<TelefonoEntidad, TipoTelEntidad> DiccionarioDeTelefonos = new Dictionary<TelefonoEntidad, TipoTelEntidad>();



            foreach (var tel in TelefonosDelUsuario)
            {
                TelefonoDTO TipodeTelefono = new TelefonoDTO();
                TipodeTelefono.Tipo = UsuarioBLL.ObtenerTipodeTelefono(tel.miTipoTel.IdTipoTel);
                TipodeTelefono.Telefono = tel.NroTelefono;
                ListaDeTelefonosDTO.Add(TipodeTelefono);
                //tipo = false;
            }

            grillatelefonos.DataSource = ListaDeTelefonosDTO;
            grillatelefonos.AutoGenerateColumns = false;

            if (!IsPostBack)
            {

                grillatelefonos.DataBind();


            }

            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);


            foreach (var item in DireccionesDeUsuario)
            {

                DireccionDTO NuevaDireccion = new DireccionDTO()
                {
                    Calle = item.Calle,
                    Departamento = item.Departamento,
                    Localidad = item.Localidad,
                    Numero = item.Numero,
                    Piso = item.Piso,
                    IdDireccion = item.IdDireccion,
                    Provincia = item.IdProvincia,
                    Predeterminada = UsuarioBLL.DireccionUsuarioSelect(item.IdDireccion, usuarioentidad.CUIT, usuarioentidad.NombreUsuario).Predeterminada
                };

                if (item.IdTipoDireccion == 1)
                {
                    DireccionesFacturacionDeUsuario.Add(NuevaDireccion);
                    //DiccionarioDeDirecciones.Add(item.IdDireccion, item);

                }
                else if (item.IdTipoDireccion == 2)
                {

                    DireccionesEnvioDeUsuario.Add(NuevaDireccion);
                    //DiccionarioDeDirecciones.Add(item.IdDireccion, item);
                }

            }

            if (DireccionesFacturacionDeUsuario.Count == 1)
            {
                DireccionesFacturacionDeUsuario[0].Predeterminada = true;
                DireccionUsuarioEntidad ActualizarPred = new DireccionUsuarioEntidad();
                ActualizarPred = DireccionBLL.DireccionUsuarioSelect(DireccionesFacturacionDeUsuario[0].IdDireccion).First();
                ActualizarPred.Predeterminada = true;
                UsuarioBLL.DireccionUsuarioUpdate(ActualizarPred);

            }

            if (DireccionesEnvioDeUsuario.Count == 1)
            {
                DireccionesEnvioDeUsuario[0].Predeterminada = true;
                DireccionUsuarioEntidad ActualizarPred = new DireccionUsuarioEntidad();
                ActualizarPred = DireccionBLL.DireccionUsuarioSelect(DireccionesEnvioDeUsuario[0].IdDireccion).First();
                ActualizarPred.Predeterminada = true;
                UsuarioBLL.DireccionUsuarioUpdate(ActualizarPred);
            }

            grilladirecciondefacturacion.DataSource = DireccionesFacturacionDeUsuario;
            grilladirecciondefacturacion.AutoGenerateColumns = false;
            if (!IsPostBack)
            {
                grilladirecciondefacturacion.DataBind();
            }

            grilladirecciondeenvio.DataSource = DireccionesEnvioDeUsuario;
            grilladirecciondeenvio.AutoGenerateColumns = false;
            if (!IsPostBack)
            {
                grilladirecciondeenvio.DataBind();

            }

            if (!IsPostBack)
            {
                CargarDropdownProvincias();
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;

            }

        }


        public class TelefonoDTO
        {
            public string Telefono { get; set; }
            public string Tipo { get; set; }
        }

        public class DatosPersonalesDTO
        {
            public string Nombre { get; set; }
            public string Apellido { get; set; }
            public string Email { get; set; }
        }

        public class DireccionDTO
        {
            public int IdDireccion { get; set; }
            public string Calle { get; set; }
            public int Numero { get; set; }
            public int? Piso { get; set; }
            public string Departamento { get; set; }
            public string Localidad { get; set; }
            public int Provincia { get; set; }
            public bool Predeterminada { get; set; }
        }

        public void cargarTipoTel()
        {

            ddlTipoTel.DataSource = UsuarioBLL.RetornaTipoTel();
            ddlTipoTel.DataValueField = "IdTipoTel";
            ddlTipoTel.DataTextField = "DescripcionTipoTel";
            ddlTipoTel.DataBind();
        }

        protected void grillatelefonos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grillatelefonos.EditIndex = e.NewEditIndex;
            grillatelefonos.DataBind();
        }

        protected void grilladedatospersonales_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grilladedatospersonales.EditIndex = e.NewEditIndex;
            grilladedatospersonales.DataBind();
        }

        protected void grilladedatospersonales_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grilladedatospersonales.EditIndex = -1;
            grilladedatospersonales.DataBind();

        }

        protected void grilladedatospersonales_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            UsuarioEntidad UsuarioActualizado = new UsuarioEntidad();

            ////////////////////ACA SE TOMAN LOS DATOS DE SESION////////////////////////////////
            //usuarioentidad.NombreUsuario = "test";
            //usuarioentidad.cuit = "20377540582";

            GridViewRow row = grilladedatospersonales.Rows[e.RowIndex];
            UsuarioActualizado.Nombre = ((TextBox)row.Cells[1].Controls[0]).Text;
            UsuarioActualizado.Apellido = ((TextBox)row.Cells[2].Controls[0]).Text;
            UsuarioActualizado.Email = ((TextBox)row.Cells[3].Controls[0]).Text;

            UsuarioActualizado.CUIT = usuarioentidad.CUIT;
            UsuarioActualizado.NombreUsuario = usuarioentidad.NombreUsuario;

            UsuarioBLL.UpdateDatosPersonales(UsuarioActualizado);
            usuarioentidad.Email = UsuarioActualizado.Email;
            usuarioentidad.Nombre = UsuarioActualizado.Nombre;
            usuarioentidad.Apellido = UsuarioActualizado.Apellido;

            //Reset the edit index.
            grilladedatospersonales.EditIndex = -1;

            //Bind data to the GridView control.
            grilladedatospersonales.DataBind();

            CargarGrillaDatosPersonales();

            grilladedatospersonales.DataBind();
        }

        private void CargarGrillaDatosPersonales()
        {
            usuarioentidad = UsuarioBLL.Select(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            DatosPersonalesDTO DatosPersonalesDTO = new DatosPersonalesDTO();
            DatosPersonalesDTO.Apellido = usuarioentidad.Apellido;
            DatosPersonalesDTO.Email = usuarioentidad.Email;
            DatosPersonalesDTO.Nombre = usuarioentidad.Nombre;

            List<DatosPersonalesDTO> ListaDatosPersonalesDTO = new List<DatosPersonalesDTO>();
            ListaDatosPersonalesDTO.Add(DatosPersonalesDTO);

            grilladedatospersonales.DataSource = ListaDatosPersonalesDTO;
            grilladedatospersonales.AutoGenerateColumns = false;

            //Bind data to the GridView control.
            grilladedatospersonales.DataBind();
        }

        private void CargarGrillaTelefonos()
        {
            ListaDeTelefonosDTO.Clear();

            grillatelefonos.DataSource = null;
            grillatelefonos.DataBind();

            List<TelefonoEntidad> TelefonosDelUsuario = new List<TelefonoEntidad>();
            TelefonosDelUsuario = UsuarioBLL.SelectTelefonosDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            foreach (var tel in TelefonosDelUsuario)
            {
                TelefonoDTO TipodeTelefono = new TelefonoDTO()
                {
                    Tipo = UsuarioBLL.ObtenerTipodeTelefono(tel.miTipoTel.IdTipoTel),
                    Telefono = tel.NroTelefono
                };

                ListaDeTelefonosDTO.Add(TipodeTelefono);
                //tipo = false;
            }

            grillatelefonos.DataSource = ListaDeTelefonosDTO;
            grillatelefonos.AutoGenerateColumns = false;

            grillatelefonos.DataBind();
        }

        protected void grillatelefonos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grillatelefonos.EditIndex = -1;
            grillatelefonos.DataBind();
        }

        protected void grillatelefonos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TelefonoEntidad TelefonoActualizado = new TelefonoEntidad();



            GridViewRow row = grillatelefonos.Rows[e.RowIndex];
            var Telefono = ((TextBox)row.Cells[1].Controls[0]).Text;
            var Tipo = ((DropDownList)row.Cells[2].Controls[1]).SelectedIndex;

            TelefonoActualizado.miUsuario = new UsuarioEntidad();
            TelefonoActualizado.miUsuario.CUIT = usuarioentidad.CUIT;
            TelefonoActualizado.miUsuario.NombreUsuario = usuarioentidad.NombreUsuario;
            TelefonoActualizado.NroTelefono = Telefono;

            int tipodetelefono = 1;

            if (Tipo == 1)
            {
                tipodetelefono = 2;
            }
            TelefonoActualizado.miTipoTel = new TipoTelEntidad();
            TelefonoActualizado.miTipoTel.IdTipoTel = tipodetelefono;

            UsuarioBLL.UpdateTelefonosPersonales(TelefonoActualizado);


            ////Reset the edit index.
            grillatelefonos.EditIndex = -1;

            //////Bind data to the GridView control.
            grillatelefonos.DataBind();

            CargarGrillaTelefonos();
        }

        protected void grillatelefonos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var ddl = e.Row.FindControl("ddlTipo") as DropDownList;
                if (ddl != null)
                {
                    ddl.DataSource = new List<string>() { "Fijo", "Movil" };
                    string Telefono;

                    if (grillatelefonos.EditIndex == -1)
                    {
                        Telefono = ((string)e.Row.Cells[1].Text);
                        var x = ListaDeTelefonosDTO.Where(t => t.Telefono == Telefono).FirstOrDefault().Tipo;
                        if (x == "Movil") { ddl.SelectedIndex = 1; } else { ddl.SelectedIndex = 0; }




                    }
                    ddl.DataBind();
                    //else
                    //{

                    //}

                    //if (grillatelefonos.EditIndex== 0)
                    //{
                    //    Telefono = ((TextBox)e.Row.Cells[1].Controls[0]).Text;
                    //}
                    //if (grillatelefonos.EditIndex == 1)
                    //{
                    //    Telefono = ((TextBox)e.Row.Cells[2].Controls[1]).Text;
                    //}




                }
            }
        }
        protected void btnGrabarTelefono_Click(object sender, EventArgs e)
        {
            CargarGrillaTelefonos();
            Response.Redirect(Request.RawUrl);
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarTelefono(string telefono, string tipoTel, string codigo)
        {
            var usuariosdad = new UsuarioCore();
            var Current = HttpContext.Current;
            var coreUsuario = new UsuarioCore();
            UsuarioEntidad usuarioentidadStatic = (UsuarioEntidad)Current.Session["Usuario"];
            if (!string.IsNullOrEmpty(telefono))
            {
                var telefonoNuevo = new TelefonoEntidad();

                telefonoNuevo.NroTelefono = telefono;
                telefonoNuevo.miUsuario = new UsuarioEntidad();
                telefonoNuevo.miUsuario.NombreUsuario = usuarioentidadStatic.NombreUsuario;
                telefonoNuevo.CodArea = codigo;
                telefonoNuevo.miTipoTel = new TipoTelEntidad();
                telefonoNuevo.miTipoTel.IdTipoTel = Convert.ToInt32(tipoTel);
                telefonoNuevo.miUsuario.CUIT = usuarioentidadStatic.CUIT;
                coreUsuario.insertTelefonoUsuario(telefonoNuevo);
            }




        }


        protected void grilladirecciondefacturacion_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grilladirecciondefacturacion.EditIndex = -1;
            grilladirecciondefacturacion.DataBind();
        }

        protected void grilladirecciondeenvio_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grilladirecciondeenvio.EditIndex = -1;
            grilladirecciondeenvio.DataBind();
        }

        protected void grilladirecciondeenvio_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DireccionEntidad DireccionaEliminar = new DireccionEntidad();
            DireccionUsuarioEntidad DireccionUsuarioaEliminar = new DireccionUsuarioEntidad();
            DireccionUsuarioaEliminar.CUIT = usuarioentidad.CUIT;
            DireccionUsuarioaEliminar.NombreUsuario = usuarioentidad.NombreUsuario;
            GridViewRow row = (GridViewRow)grilladirecciondeenvio.Rows[e.RowIndex];
            var Id = ((string)row.Cells[7].Text);
            DireccionaEliminar.IdDireccion = Convert.ToInt32(Id);
            UsuarioBLL.DeleteDireccion(DireccionaEliminar, DireccionUsuarioaEliminar);
            CargarGrillaDireccionDeEnvio();
        }

        protected void grilladirecciondefacturacion_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DireccionEntidad DireccionaEliminar = new DireccionEntidad();
            DireccionUsuarioEntidad DireccionUsuarioaEliminar = new DireccionUsuarioEntidad();
            DireccionUsuarioaEliminar.CUIT = usuarioentidad.CUIT;
            DireccionUsuarioaEliminar.NombreUsuario = usuarioentidad.NombreUsuario;
            GridViewRow row = (GridViewRow)grilladirecciondefacturacion.Rows[e.RowIndex];
            var Id = ((string)row.Cells[7].Text);
            DireccionaEliminar.IdDireccion = Convert.ToInt32(Id);
            UsuarioBLL.DeleteDireccion(DireccionaEliminar, DireccionUsuarioaEliminar);
            CargarGrillaDireccionDeFacturacion();

        }

        protected void grilladirecciondefacturacion_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grilladirecciondefacturacion.EditIndex = e.NewEditIndex;
            grilladirecciondefacturacion.DataBind();
        }

        protected void grilladirecciondeenvio_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grilladirecciondeenvio.EditIndex = e.NewEditIndex;
            grilladirecciondeenvio.DataBind();
        }

        protected void grilladirecciondefacturacion_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DireccionEntidad DireccionActualizada = new DireccionEntidad();


            GridViewRow row = grilladirecciondefacturacion.Rows[e.RowIndex];
            var Calle = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Numero = ((TextBox)row.Cells[3].Controls[0]).Text;
            var Piso = ((TextBox)row.Cells[4].Controls[0]).Text;
            var Departamento = ((TextBox)row.Cells[5].Controls[0]).Text;
            var Localidad = ((TextBox)row.Cells[6].Controls[0]).Text;
            var Provincia = ((DropDownList)row.Cells[8].Controls[1]).SelectedIndex + 1;
            var Id = ((TextBox)row.Cells[7].Controls[0]).Text;
            var Predeterminado = ((CheckBox)row.Cells[9].Controls[0]).Checked;


            DireccionActualizada.IdDireccion = Convert.ToInt32(Id);
            DireccionActualizada.Calle = Calle;
            DireccionActualizada.Departamento = Departamento;
            DireccionActualizada.Numero = Convert.ToInt32(Numero);
            if (!String.IsNullOrEmpty(Piso))
            {
                DireccionActualizada.Piso = Convert.ToInt32(Piso);
            }

            DireccionActualizada.Localidad = Localidad;

            DireccionActualizada.IdProvincia = Provincia;
            DireccionActualizada.IdTipoDireccion = 1;


            UsuarioBLL.UpdateDireccionesUsuario(DireccionActualizada);

            DireccionUsuarioEntidad DireccionUsuarioActualizada = new DireccionUsuarioEntidad();
            DireccionUsuarioActualizada.CUIT = usuarioentidad.CUIT;
            DireccionUsuarioActualizada.NombreUsuario = usuarioentidad.NombreUsuario;
            DireccionUsuarioActualizada.Predeterminada = Predeterminado;
            DireccionUsuarioActualizada.IdDireccion = Convert.ToInt32(Id);

            UsuarioBLL.DireccionUsuarioUpdate(DireccionUsuarioActualizada);


            List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();

            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            foreach (var dir in DireccionesDeUsuario)
            {
                if (Predeterminado == true)
                {
                    if (dir.IdDireccion != DireccionUsuarioActualizada.IdDireccion && dir.IdTipoDireccion == DireccionActualizada.IdTipoDireccion)
                    {
                        DireccionUsuarioEntidad ActualizarNoPredeterminadas = new DireccionUsuarioEntidad();
                        ActualizarNoPredeterminadas.IdDireccion = dir.IdDireccion;
                        ActualizarNoPredeterminadas.Predeterminada = false;
                        ActualizarNoPredeterminadas.CUIT = usuarioentidad.CUIT;
                        ActualizarNoPredeterminadas.NombreUsuario = usuarioentidad.NombreUsuario;

                        UsuarioBLL.DireccionUsuarioUpdate(ActualizarNoPredeterminadas);
                    }
                }


            }


            //////Reset the edit index.
            grilladirecciondefacturacion.EditIndex = -1;

            ////////Bind data to the GridView control.
            grilladirecciondefacturacion.DataBind();

            CargarGrillaDireccionDeFacturacion();



        }

        protected void grilladirecciondeenvio_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DireccionEntidad DireccionActualizada = new DireccionEntidad();


            GridViewRow row = grilladirecciondeenvio.Rows[e.RowIndex];
            var Calle = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Numero = ((TextBox)row.Cells[3].Controls[0]).Text;
            var Piso = ((TextBox)row.Cells[4].Controls[0]).Text;
            var Departamento = ((TextBox)row.Cells[5].Controls[0]).Text;
            var Localidad = ((TextBox)row.Cells[6].Controls[0]).Text;
            var Provincia = ((DropDownList)row.Cells[8].Controls[1]).SelectedIndex + 1;
            var Id = ((TextBox)row.Cells[7].Controls[0]).Text;
            var Predeterminado = ((CheckBox)row.Cells[9].Controls[0]).Checked;


            DireccionActualizada.IdDireccion = Convert.ToInt32(Id);
            DireccionActualizada.Calle = Calle;
            DireccionActualizada.Departamento = Departamento;
            DireccionActualizada.Numero = Convert.ToInt32(Numero);
            if (!String.IsNullOrEmpty(Piso))
            {
                DireccionActualizada.Piso = Convert.ToInt32(Piso);
            }

            DireccionActualizada.Localidad = Localidad;

            DireccionActualizada.IdProvincia = Provincia;
            DireccionActualizada.IdTipoDireccion = 2;



            UsuarioBLL.UpdateDireccionesUsuario(DireccionActualizada);

            DireccionUsuarioEntidad DireccionUsuarioActualizada = new DireccionUsuarioEntidad();
            DireccionUsuarioActualizada.CUIT = usuarioentidad.CUIT;
            DireccionUsuarioActualizada.NombreUsuario = usuarioentidad.NombreUsuario;
            DireccionUsuarioActualizada.Predeterminada = Predeterminado;
            DireccionUsuarioActualizada.IdDireccion = Convert.ToInt32(Id);

            UsuarioBLL.DireccionUsuarioUpdate(DireccionUsuarioActualizada);

            List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();

            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            foreach (var dir in DireccionesDeUsuario)
            {

                if (dir.IdDireccion != DireccionUsuarioActualizada.IdDireccion && dir.IdTipoDireccion == DireccionActualizada.IdTipoDireccion)
                {

                    DireccionUsuarioEntidad ActualizarNoPredeterminadas = new DireccionUsuarioEntidad();
                    ActualizarNoPredeterminadas.IdDireccion = dir.IdDireccion;
                    ActualizarNoPredeterminadas.Predeterminada = false;
                    ActualizarNoPredeterminadas.CUIT = usuarioentidad.CUIT;
                    ActualizarNoPredeterminadas.NombreUsuario = usuarioentidad.NombreUsuario;

                    UsuarioBLL.DireccionUsuarioUpdate(ActualizarNoPredeterminadas);
                }


            }



            //////Reset the edit index.
            grilladirecciondeenvio.EditIndex = -1;

            ////////Bind data to the GridView control.
            grilladirecciondeenvio.DataBind();

            CargarGrillaDireccionDeEnvio();



        }

        private void CargarGrillaDireccionDeEnvio()
        {
            DireccionesEnvioDeUsuario.Clear();


            List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();
            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            foreach (var item in DireccionesDeUsuario)
            {

                DireccionDTO NuevaDireccion = new DireccionDTO();
                NuevaDireccion.Calle = item.Calle;
                NuevaDireccion.Departamento = item.Departamento;
                NuevaDireccion.Localidad = item.Localidad;
                NuevaDireccion.Numero = item.Numero;
                NuevaDireccion.Piso = item.Piso;
                NuevaDireccion.IdDireccion = item.IdDireccion;
                NuevaDireccion.Predeterminada = UsuarioBLL.DireccionUsuarioSelect(item.IdDireccion, usuarioentidad.CUIT, usuarioentidad.NombreUsuario).Predeterminada;

                if (item.IdTipoDireccion == 1)
                {
                    DireccionesFacturacionDeUsuario.Add(NuevaDireccion);


                }
                else if (item.IdTipoDireccion == 2)
                {

                    DireccionesEnvioDeUsuario.Add(NuevaDireccion);

                }

            }

            grilladirecciondeenvio.DataSource = DireccionesEnvioDeUsuario;
            grilladirecciondeenvio.AutoGenerateColumns = false;
            grilladirecciondeenvio.DataBind();
        }

        private void CargarGrillaDireccionDeFacturacion()
        {

            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            DireccionesFacturacionDeUsuario.Clear();


            List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();
            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            foreach (var item in DireccionesDeUsuario)
            {

                DireccionDTO NuevaDireccion = new DireccionDTO();
                NuevaDireccion.Calle = item.Calle;
                NuevaDireccion.Departamento = item.Departamento;
                NuevaDireccion.Localidad = item.Localidad;
                NuevaDireccion.Numero = item.Numero;
                NuevaDireccion.Piso = item.Piso;
                NuevaDireccion.IdDireccion = item.IdDireccion;
                NuevaDireccion.Predeterminada = UsuarioBLL.DireccionUsuarioSelect(item.IdDireccion, usuarioentidad.CUIT, usuarioentidad.NombreUsuario).Predeterminada;

                if (item.IdTipoDireccion == 1)
                {
                    DireccionesFacturacionDeUsuario.Add(NuevaDireccion);
                    //DiccionarioDeDirecciones.Add(item.IdDireccion, item);

                }
                else if (item.IdTipoDireccion == 2)
                {

                    DireccionesEnvioDeUsuario.Add(NuevaDireccion);
                    //DiccionarioDeDirecciones.Add(item.IdDireccion, item);
                }

            }

            grilladirecciondefacturacion.DataSource = DireccionesFacturacionDeUsuario;
            grilladirecciondefacturacion.AutoGenerateColumns = false;
            grilladirecciondefacturacion.DataBind();

        }

        protected void grilladirecciondefacturacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var Id = (string)e.Row.Cells[7].Text;

                if (string.IsNullOrEmpty(Id))
                {
                    Id = ((TextBox)e.Row.Cells[7].Controls[0]).Text;
                }

                var Dire = DireccionesDeUsuario.Where(X => X.IdDireccion == Int32.Parse(Id)).First();

                var ddl = e.Row.FindControl("ddlProvincia") as DropDownList;
                if (ddl != null)
                {
                    ddl.DataSource = UsuarioBLL.SelectALLProvincias();
                    ddl.DataValueField = "IdProvincia";
                    ddl.DataTextField = "DescripcionProvincia";
                    ddl.SelectedIndex = Dire.IdProvincia - 1;
                    ddl.DataBind();

                }
            }

        }


        protected void grilladirecciondeenvio_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var Id = (string)e.Row.Cells[7].Text;

                if (string.IsNullOrEmpty(Id))
                {
                    Id = ((TextBox)e.Row.Cells[7].Controls[0]).Text;
                }
                var Dire = DireccionesDeUsuario.Where(X => X.IdDireccion == Int32.Parse(Id)).First();

                var ddl = e.Row.FindControl("ddlProvincia") as DropDownList;
                if (ddl != null)
                {
                    ddl.DataSource = UsuarioBLL.SelectALLProvincias();
                    ddl.DataValueField = "IdProvincia";
                    ddl.DataTextField = "DescripcionProvincia";
                    ddl.SelectedIndex = Dire.IdProvincia - 1;
                    ddl.DataBind();

                }

            }

        }

        protected void CargarDropdownProvincias()
        {
            ddlProvincia.DataSource = UsuarioBLL.SelectALLProvincias();
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataBind();

            ddlProvinciaEnvio.DataSource = UsuarioBLL.SelectALLProvincias();
            ddlProvinciaEnvio.DataValueField = "IdProvincia";
            ddlProvinciaEnvio.DataTextField = "DescripcionProvincia";
            ddlProvinciaEnvio.DataBind();

        }



        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarDireccionDeEnvio(string calleEnvio, int numeroEnvio, int pisoEnvio, string departamentoEnvio, string localidadEnvio, string ddlprovinciaEnvio)
        {

            var unUsuarioBLL = new UsuarioCore();
            var usuarioentidadStatic = new UsuarioEntidad();
            DireccionUsuarioEntidad NuevaIntermedia = new DireccionUsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioentidadStatic = (UsuarioEntidad)Current.Session["Usuario"];

            DireccionUsuarioEntidad NuevaIntermediaEnvio = new DireccionUsuarioEntidad();
            NuevaIntermediaEnvio.CUIT = usuarioentidadStatic.CUIT;
            NuevaIntermediaEnvio.NombreUsuario = usuarioentidadStatic.NombreUsuario;



            DireccionEntidad NuevaDireccion = new DireccionEntidad();

            if (!string.IsNullOrEmpty(calleEnvio))
            {
                NuevaDireccion.Calle = calleEnvio;
            }

            if (!string.IsNullOrEmpty(departamentoEnvio))
            {
                NuevaDireccion.Departamento = departamentoEnvio;
            }

            if (!string.IsNullOrEmpty(localidadEnvio))
            {
                NuevaDireccion.Localidad = localidadEnvio;
            }

            NuevaDireccion.IdTipoDireccion = 2;
            NuevaDireccion.Numero = Convert.ToInt32(numeroEnvio);
            NuevaDireccion.Piso = Convert.ToInt32(pisoEnvio);
            NuevaDireccion.IdProvincia = Int32.Parse(ddlprovinciaEnvio);

            unUsuarioBLL.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermediaEnvio);


        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static bool CambiarClave(string passVieja, string passNueva, string passRepetida)
        {
            var usuariosdad = new UsuarioCore();
            var Current = HttpContext.Current;

            UsuarioEntidad usuarioentidadStatic = (UsuarioEntidad)Current.Session["Usuario"];

            var password = usuariosdad.Select(usuarioentidadStatic.CUIT, usuarioentidadStatic.NombreUsuario).Clave;

            passVieja = TFI.SEGURIDAD.ServicioSecurizacion.AplicarHash(passVieja);
            passNueva = TFI.SEGURIDAD.ServicioSecurizacion.AplicarHash(passNueva);
            passRepetida = TFI.SEGURIDAD.ServicioSecurizacion.AplicarHash(passRepetida);

            if (password == passVieja)
            {
                if (passNueva == passRepetida)
                {
                    usuarioentidadStatic.Clave = passRepetida;
                    usuariosdad.UpdateUsuarioContraseña(usuarioentidadStatic);
                    return true;
                }
            }
            return false;

        }



        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarDireccionDeFacturacion(string calle, int numero, int piso, string departamento, string localidad, string ddlprovincia)
        {
            var unUsuarioBLL = new UsuarioCore();
            var usuarioEntity = new UsuarioEntidad();
            var formularioDatosPersonales = new DatosPersonales();
            DireccionUsuarioEntidad NuevaIntermedia = new DireccionUsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            NuevaIntermedia.CUIT = usuarioEntity.CUIT;
            NuevaIntermedia.NombreUsuario = usuarioEntity.NombreUsuario;


            DireccionEntidad NuevaDireccion = new DireccionEntidad();

            if (!string.IsNullOrEmpty(calle))
            {
                NuevaDireccion.Calle = calle;
            }

            if (!string.IsNullOrEmpty(departamento))
            {
                NuevaDireccion.Departamento = departamento;
            }

            if (!string.IsNullOrEmpty(localidad))
            {
                NuevaDireccion.Localidad = localidad;
            }

            NuevaDireccion.IdTipoDireccion = 1;
            NuevaDireccion.Numero = numero;
            NuevaDireccion.Piso = piso;
            NuevaDireccion.IdProvincia = Int32.Parse(ddlprovincia);
            //NuevaDireccion.IdProvincia = provincia;

            unUsuarioBLL.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermedia);

            //formularioDatosPersonales.CargarGrillaDireccionDeFacturacion();


        }

        protected void GrabarDireccionDeFacturacion_Click(object sender, EventArgs e)
        {
            CargarGrillaDireccionDeFacturacion();
            Response.Redirect(Request.RawUrl);
        }

        protected void GrabarDireccionDeEnvio_Click(object sender, EventArgs e)
        {
            CargarGrillaDireccionDeEnvio();
            Response.Redirect(Request.RawUrl);
        }
        private void NotificacionCalleVacia()
        {
            //notificationTarjeta.InnerHtml = "El Numero de tarjeta es invalido";
            //notificationTarjeta.Visible = true;

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Ingrese Calle');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, GetType(),
                       "ModalScript", sb.ToString(), false);
        }

    }
}