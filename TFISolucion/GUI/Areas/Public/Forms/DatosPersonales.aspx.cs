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
        List<DireccionEntidad> DireccionesFacturacionDeUsuario = new List<DireccionEntidad>();
        List<DireccionEntidad> DireccionesEnvioDeUsuario = new List<DireccionEntidad>();
        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
        public List<ProvinciaEntidad> unasProvinciasEnvio = new List<ProvinciaEntidad>();
        public List<ProvinciaEntidad> unasProvinciasAltaFact = new List<ProvinciaEntidad>();
        public List<ProvinciaEntidad> unasProvinciasAltaEnvio = new List<ProvinciaEntidad>();
        DropDownList ddl;
        DropDownList ddlLoc;
        DropDownList ddlEnvio;
        DropDownList ddlLocEnvio;
        List<TelefonoEntidad> TelefonosDelUsuario = new List<TelefonoEntidad>();
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coreMoneda;


        public DatosPersonales()
        {
            idioma = new LenguajeEntidad();
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            _coreMoneda = new MonedaCore();
        }

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
            DireccionesFacturacionDeUsuario.Clear();
            DireccionesEnvioDeUsuario.Clear();
            cargarTipoTel();
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            if (usuarioentidad == null)
                Response.Redirect("Home.aspx");

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


            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];
                Session.Add("cotizacionAnterior", "");
                grilladedatospersonales.DataBind();
            }
            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }
            if (cotizacion != null)
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);

            
            TelefonosDelUsuario = UsuarioBLL.SelectTelefonosDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);
            if (TelefonosDelUsuario != null && TelefonosDelUsuario.Count > 0)
                TelefonosDelUsuario = TelefonosDelUsuario.Where(X => X.FecBaja == null).ToList();


            foreach (var tel in TelefonosDelUsuario)
            {
                TelefonoDTO TipodeTelefono = new TelefonoDTO();
                TipodeTelefono.Tipo = UsuarioBLL.ObtenerTipodeTelefono(tel.miTipoTel.IdTipoTel);
                TipodeTelefono.Telefono = tel.NroTelefono;
                TipodeTelefono.CodArea = tel.CodArea;
                ListaDeTelefonosDTO.Add(TipodeTelefono);
            }

            grillatelefonos.DataSource = ListaDeTelefonosDTO;

            if (!IsPostBack)
                grillatelefonos.DataBind();

            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuarioActuales(usuarioentidad);

            foreach (var item in DireccionesDeUsuario)
            {
                if (item.IdTipoDireccion == 1)
                    DireccionesFacturacionDeUsuario.Add(item);
                else if (item.IdTipoDireccion == 2)
                    DireccionesEnvioDeUsuario.Add(item);
            }

            grilladirecciondefacturacion.DataSource = DireccionesFacturacionDeUsuario;
            if (!IsPostBack)
                grilladirecciondefacturacion.DataBind();

            grilladirecciondeenvio.DataSource = DireccionesEnvioDeUsuario;
            if (!IsPostBack)
                grilladirecciondeenvio.DataBind();

            if (!IsPostBack)
            {
                CargarDropdownProvinciasFact();
                cargarLocalidadesFact();
                CargarDropdownProvinciasEnvio();
                cargarLocalidadesEnvio();
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                if (cotizacion != null)
                    lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();
        }


        public class TelefonoDTO
        {
            public string CodArea { get; set; }
            public string Telefono { get; set; }
            public string Tipo { get; set; }
        }

        public class DatosPersonalesDTO
        {
            public string Nombre { get; set; }
            public string Apellido { get; set; }
            public string Email { get; set; }
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

            string unNombre = ((TextBox)row.Cells[1].Controls[0]).Text;
            string unApellido = ((TextBox)row.Cells[2].Controls[0]).Text;
            string unEmail = ((TextBox)row.Cells[3].Controls[0]).Text;

            if (!string.IsNullOrWhiteSpace(unNombre) && !string.IsNullOrWhiteSpace(unApellido) && !string.IsNullOrWhiteSpace(unEmail))
            {
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
            else
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("MsjAtencion('");
                sb.Append(Resources.Global.CampoNombreVacio);
                sb.Append("');");
                sb.Append("$('#ErrorMsj').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScriptError1", sb.ToString(), false);
            }


            
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
            if (TelefonosDelUsuario != null && TelefonosDelUsuario.Count > 0)
                TelefonosDelUsuario = TelefonosDelUsuario.Where(X => X.FecBaja == null).ToList();

            foreach (var tel in TelefonosDelUsuario)
            {
                TelefonoDTO TipodeTelefono = new TelefonoDTO()
                {
                    Tipo = UsuarioBLL.ObtenerTipodeTelefono(tel.miTipoTel.IdTipoTel),
                    Telefono = tel.NroTelefono,
                    CodArea = tel.CodArea
                };

                ListaDeTelefonosDTO.Add(TipodeTelefono);
                //tipo = false;
            }

            grillatelefonos.DataSource = ListaDeTelefonosDTO;

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
            var CodArea = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Telefono = ((TextBox)row.Cells[3].Controls[0]).Text;
            var Tipo = ((DropDownList)row.Cells[4].Controls[1]).SelectedIndex;

            TelefonoActualizado.miUsuario = new UsuarioEntidad();
            TelefonoActualizado.miUsuario.CUIT = usuarioentidad.CUIT;
            TelefonoActualizado.miUsuario.NombreUsuario = usuarioentidad.NombreUsuario;
            TelefonoActualizado.NroTelefono = Telefono;
            TelefonoActualizado.CodArea = CodArea;

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
                        Telefono = ((string)e.Row.Cells[3].Text);
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
        //protected void btnGrabarTelefono_Click(object sender, EventArgs e)
        //{
        //    CargarGrillaTelefonos();
        //    Response.Redirect(Request.RawUrl);
        //}


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarTelefono(string telefono, string tipoTel, string codigo)
        {
            var usuariosdad = new UsuarioCore();
            var Current = HttpContext.Current;
            var coreUsuario = new UsuarioCore();
            UsuarioEntidad usuarioentidadStatic;
            if (HttpContext.Current.Session["Usuario"] != null)
                usuarioentidadStatic = (UsuarioEntidad)Current.Session["Usuario"];
            else
                return;
            
            if (!string.IsNullOrEmpty(telefono) && !string.IsNullOrEmpty(codigo))
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
            if (HttpContext.Current.Session["Usuario"] != null)
                usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            else
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            int AuxIdDireccionEliminar = (int)grilladirecciondeenvio.DataKeys[e.RowIndex].Value;
            UsuarioBLL.DeleteDireccion(AuxIdDireccionEliminar, usuarioentidad);
            CargarGrillaDireccionDeEnvio();
        }

        protected void grilladirecciondefacturacion_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (HttpContext.Current.Session["Usuario"] != null)
                usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            else
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            int AuxIdDireccionEliminar = (int)grilladirecciondefacturacion.DataKeys[e.RowIndex].Value;
            UsuarioBLL.DeleteDireccion(AuxIdDireccionEliminar, usuarioentidad);
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
            if (HttpContext.Current.Session["Usuario"] != null)
                usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            else
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            DireccionEntidad DireccionActualizada = new DireccionEntidad();
            GridViewRow row = grilladirecciondefacturacion.Rows[e.RowIndex];
            var Calle = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Numero = ((TextBox)row.Cells[3].Controls[0]).Text;
            var Piso = ((TextBox)row.Cells[4].Controls[0]).Text;
            var Departamento = ((TextBox)row.Cells[5].Controls[0]).Text;
            var Provincia = ((DropDownList)row.Cells[6].Controls[1]).SelectedValue;
            var Localidad = ((DropDownList)row.Cells[7].Controls[1]).SelectedValue;
            var Predeterminado = ((CheckBox)row.Cells[8].Controls[0]).Checked;

            if(!string.IsNullOrWhiteSpace(Calle) && !string.IsNullOrWhiteSpace(Numero))
            {
                DireccionActualizada.IdDireccion = Convert.ToInt32((int)grilladirecciondefacturacion.DataKeys[e.RowIndex].Value);
                DireccionActualizada.Calle = Calle;
                DireccionActualizada.Departamento = Departamento;
                DireccionActualizada.Numero = Convert.ToInt32(Numero);
                if (!String.IsNullOrEmpty(Piso))
                    DireccionActualizada.Piso = Convert.ToInt32(Piso);
                DireccionActualizada.miLocalidad = new Entidades.Localidad();
                DireccionActualizada.miLocalidad.IdLocalidad = Int32.Parse(Localidad);
                DireccionActualizada.miLocalidad.miProvincia = new ProvinciaEntidad();
                DireccionActualizada.miLocalidad.miProvincia.IdProvincia = Int32.Parse(Provincia);
                DireccionActualizada.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Facturacion;
                DireccionActualizada.Predeterminada = Predeterminado;

                UsuarioBLL.UpdateDireccionesUsuario(DireccionActualizada, usuarioentidad);

                //////Reset the edit index.
                grilladirecciondefacturacion.EditIndex = -1;

                CargarGrillaDireccionDeFacturacion();
            }
            else
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("MsjAtencion('");
                sb.Append(Resources.Global.msjADirFacVacio);
                sb.Append("');");
                sb.Append("$('#ErrorMsj').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScriptError1", sb.ToString(), false);
            }

        }

        protected void grilladirecciondeenvio_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (HttpContext.Current.Session["Usuario"] != null)
                usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            else
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            DireccionEntidad DireccionActualizada = new DireccionEntidad();
            GridViewRow row = grilladirecciondeenvio.Rows[e.RowIndex];

            var Calle = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Numero = ((TextBox)row.Cells[3].Controls[0]).Text;
            var Piso = ((TextBox)row.Cells[4].Controls[0]).Text;
            var Departamento = ((TextBox)row.Cells[5].Controls[0]).Text;
            var Provincia = ((DropDownList)row.Cells[6].Controls[1]).SelectedValue;
            var Localidad = ((DropDownList)row.Cells[7].Controls[1]).SelectedValue;
            var Predeterminado = ((CheckBox)row.Cells[8].Controls[0]).Checked;

            if (!string.IsNullOrWhiteSpace(Calle) && !string.IsNullOrWhiteSpace(Numero))
            {
                DireccionActualizada.IdDireccion = Convert.ToInt32((int)grilladirecciondeenvio.DataKeys[e.RowIndex].Value);
                DireccionActualizada.Calle = Calle;
                DireccionActualizada.Departamento = Departamento;
                DireccionActualizada.Numero = Convert.ToInt32(Numero);
                if (!String.IsNullOrEmpty(Piso))
                    DireccionActualizada.Piso = Convert.ToInt32(Piso);
                DireccionActualizada.miLocalidad = new Entidades.Localidad();
                DireccionActualizada.miLocalidad.IdLocalidad = Int32.Parse(Localidad);
                DireccionActualizada.miLocalidad.miProvincia = new ProvinciaEntidad();
                DireccionActualizada.miLocalidad.miProvincia.IdProvincia = Int32.Parse(Provincia);
                DireccionActualizada.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Envio;
                DireccionActualizada.Predeterminada = Predeterminado;

                UsuarioBLL.UpdateDireccionesUsuario(DireccionActualizada, usuarioentidad);

                //////Reset the edit index.
                grilladirecciondeenvio.EditIndex = -1;

                CargarGrillaDireccionDeEnvio();
            }
            else
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("MsjAtencion('");
                sb.Append(Resources.Global.msjADirEnvVacio);
                sb.Append("');");
                sb.Append("$('#ErrorMsj').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScriptError1", sb.ToString(), false);
            }

        }

        private void CargarGrillaDireccionDeEnvio()
        {
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            DireccionesEnvioDeUsuario.Clear();

            List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();
            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuarioActuales(usuarioentidad);

            foreach (var item in DireccionesDeUsuario)
            {
                if (item.IdTipoDireccion == 1)
                    DireccionesFacturacionDeUsuario.Add(item);
                else if (item.IdTipoDireccion == 2)
                    DireccionesEnvioDeUsuario.Add(item);
            }
            grilladirecciondeenvio.DataSource = null;
            grilladirecciondeenvio.DataSource = DireccionesEnvioDeUsuario;
            grilladirecciondeenvio.DataBind();
        }

        private void CargarGrillaDireccionDeFacturacion()
        {
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            DireccionesFacturacionDeUsuario.Clear();

            List<DireccionEntidad> DireccionesDeUsuario = new List<DireccionEntidad>();
            DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuarioActuales(usuarioentidad);

            foreach (var item in DireccionesDeUsuario)
            {
                if (item.IdTipoDireccion == 1)
                    DireccionesFacturacionDeUsuario.Add(item);
                else if (item.IdTipoDireccion == 2)
                    DireccionesEnvioDeUsuario.Add(item);
            }
            grilladirecciondefacturacion.DataSource = null;
            grilladirecciondefacturacion.DataSource = DireccionesFacturacionDeUsuario;
            grilladirecciondefacturacion.DataBind();
        }

        protected void grilladirecciondefacturacion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ddl = e.Row.FindControl("ddlProvinciaG") as DropDownList;
                ddlLoc = e.Row.FindControl("ddlLocalidadG") as DropDownList;
                
                if (ddl != null)
                {
                    unasProvincias = UsuarioBLL.SelectALLProvincias();
                    ddl.DataSource = null;
                    ddl.DataSource = unasProvincias;
                    ddl.DataValueField = "IdProvincia";
                    ddl.DataTextField = "DescripcionProvincia";
                    ddl.DataBind();
                    ddl.SelectedValue = usuarioentidad.misDirecciones.First(X => X.IdDireccion == (int)grilladirecciondefacturacion.DataKeys[e.Row.RowIndex].Value).miLocalidad.miProvincia.IdProvincia.ToString();

                    ddlLoc.DataSource = null;
                    ddlLoc.DataSource = unasProvincias.Find(X => X.IdProvincia == (Int32.Parse(ddl.SelectedValue))).misLocalidades;
                    ddlLoc.DataValueField = "IdLocalidad";
                    ddlLoc.DataTextField = "DescripcionLocalidad";
                    ddlLoc.DataBind();
                    ddlLoc.SelectedValue = usuarioentidad.misDirecciones.First(X => X.IdDireccion == (int)grilladirecciondefacturacion.DataKeys[e.Row.RowIndex].Value).miLocalidad.IdLocalidad.ToString();
                }
            }
        }


        protected void grilladirecciondeenvio_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ddlEnvio = e.Row.FindControl("ddlProvinciaG") as DropDownList;
                ddlLocEnvio = e.Row.FindControl("ddlLocalidadG") as DropDownList;

                if (ddlEnvio != null)
                {
                    unasProvincias = UsuarioBLL.SelectALLProvincias();
                    ddlEnvio.DataSource = null;
                    ddlEnvio.DataSource = unasProvincias;
                    ddlEnvio.DataValueField = "IdProvincia";
                    ddlEnvio.DataTextField = "DescripcionProvincia";
                    ddlEnvio.DataBind();
                    ddlEnvio.SelectedValue = usuarioentidad.misDirecciones.First(X => X.IdDireccion == (int)grilladirecciondeenvio.DataKeys[e.Row.RowIndex].Value).miLocalidad.miProvincia.IdProvincia.ToString();

                    ddlLocEnvio.DataSource = null;
                    ddlLocEnvio.DataSource = unasProvincias.Find(X => X.IdProvincia == (Int32.Parse(ddlEnvio.SelectedValue))).misLocalidades;
                    ddlLocEnvio.DataValueField = "IdLocalidad";
                    ddlLocEnvio.DataTextField = "DescripcionLocalidad";
                    ddlLocEnvio.DataBind();
                    ddlLocEnvio.SelectedValue = usuarioentidad.misDirecciones.First(X => X.IdDireccion == (int)grilladirecciondeenvio.DataKeys[e.Row.RowIndex].Value).miLocalidad.IdLocalidad.ToString();
                }
            }
        }

        protected void CargarDropdownProvinciasFact(int? elIndice = null)
        {
            ddlProvincia.DataSource = null;
            unasProvinciasAltaFact = UsuarioBLL.SelectALLProvincias();
            ddlProvincia.DataSource = unasProvinciasAltaFact;
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataBind();
            if (elIndice != null)
                ddlProvincia.SelectedIndex = (int)elIndice;
        }

        public void cargarLocalidadesFact()
        {
            ddlLocalidadAltaFact.DataSource = null;
            ddlLocalidadAltaFact.DataSource = unasProvinciasAltaFact.Find(X => X.IdProvincia == (Int32.Parse(ddlProvincia.SelectedValue))).misLocalidades;
            ddlLocalidadAltaFact.DataValueField = "IdLocalidad";
            ddlLocalidadAltaFact.DataTextField = "DescripcionLocalidad";
            ddlLocalidadAltaFact.DataBind();
        }

        protected void CargarDropdownProvinciasEnvio(int? elIndice = null)
        {
            ddlProvinciaAltaEnvio.DataSource = null;
            unasProvinciasAltaEnvio = UsuarioBLL.SelectALLProvincias();
            ddlProvinciaAltaEnvio.DataSource = unasProvinciasAltaEnvio;
            ddlProvinciaAltaEnvio.DataValueField = "IdProvincia";
            ddlProvinciaAltaEnvio.DataTextField = "DescripcionProvincia";
            ddlProvinciaAltaEnvio.DataBind();
            if (elIndice != null)
                ddlProvinciaAltaEnvio.SelectedIndex = (int)elIndice;
        }

        public void cargarLocalidadesEnvio()
        {
            ddlLocalidadAltaEnvio.DataSource = null;
            ddlLocalidadAltaEnvio.DataSource = unasProvinciasAltaEnvio.Find(X => X.IdProvincia == (Int32.Parse(ddlProvinciaAltaEnvio.SelectedValue))).misLocalidades;
            ddlLocalidadAltaEnvio.DataValueField = "IdLocalidad";
            ddlLocalidadAltaEnvio.DataTextField = "DescripcionLocalidad";
            ddlLocalidadAltaEnvio.DataBind();
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarDireccionDeEnvio(string calleEnvio, int numeroEnvio, int pisoEnvio, string departamentoEnvio, string ddllocalidadEnvio, string ddlprovinciaEnvio)
        {

            var unUsuarioBLL = new UsuarioCore();
            var usuarioentidadStatic = new UsuarioEntidad();
            var Current = HttpContext.Current;

            if (Current.Session["Usuario"] != null)
                usuarioentidadStatic = (UsuarioEntidad)Current.Session["Usuario"];
            else
                return;

            DireccionEntidad NuevaDireccion = new DireccionEntidad();

            if (!string.IsNullOrEmpty(calleEnvio))
                NuevaDireccion.Calle = calleEnvio;

            if (!string.IsNullOrEmpty(departamentoEnvio))
                NuevaDireccion.Departamento = departamentoEnvio;

            NuevaDireccion.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Envio;
            NuevaDireccion.Numero = numeroEnvio;
            NuevaDireccion.Piso = pisoEnvio;
            NuevaDireccion.miLocalidad = new Entidades.Localidad();
            NuevaDireccion.miLocalidad.IdLocalidad = Int32.Parse(ddllocalidadEnvio);
            NuevaDireccion.miLocalidad.miProvincia = new ProvinciaEntidad();
            NuevaDireccion.miLocalidad.miProvincia.IdProvincia = Int32.Parse(ddlprovinciaEnvio);
            NuevaDireccion.Predeterminada = true;//Se crea por default como predeterminada

            unUsuarioBLL.InsertDireccionDeFacturacion(NuevaDireccion, usuarioentidadStatic);
            //De aca vuelve al ajax,  se cierra el modal; y desde el html (al obtener true del jquery-ajax) vuelve al backend para actualizar la grilla

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
                if (!string.IsNullOrWhiteSpace(passNueva) && !string.IsNullOrWhiteSpace(passRepetida) && passNueva == passRepetida)
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
        public static void GrabarDireccionDeFacturacion(string calle, int numero, int piso, string departamento, string ddllocalidad, string ddlprovincia)
        {
            var unUsuarioBLL = new UsuarioCore();
            var usuarioEntity = new UsuarioEntidad();
            var formularioDatosPersonales = new DatosPersonales();
            var Current = HttpContext.Current;

            if (Current.Session["Usuario"] != null)
                usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];
            else
                return;

            DireccionEntidad NuevaDireccion = new DireccionEntidad();

            if (!string.IsNullOrEmpty(calle))
                NuevaDireccion.Calle = calle;
            if (!string.IsNullOrEmpty(departamento))
                NuevaDireccion.Departamento = departamento;

            NuevaDireccion.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Facturacion;
            NuevaDireccion.Numero = numero;
            NuevaDireccion.Piso = piso;
            NuevaDireccion.miLocalidad = new Entidades.Localidad();
            NuevaDireccion.miLocalidad.IdLocalidad = Int32.Parse(ddllocalidad);
            NuevaDireccion.miLocalidad.miProvincia = new ProvinciaEntidad();
            NuevaDireccion.miLocalidad.miProvincia.IdProvincia = Int32.Parse(ddlprovincia);
            NuevaDireccion.Predeterminada = true;//Se crea por default como predeterminada

            unUsuarioBLL.InsertDireccionDeFacturacion(NuevaDireccion, usuarioEntity);
            //De aca vuelve al ajax,  se cierra el modal; y desde el html (al obtener true del jquery-ajax) vuelve al backend para actualizar la grilla
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

        protected void ddlProvinciaG_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProv = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlProv.NamingContainer;
            if (row != null)
            {
                unasProvincias = UsuarioBLL.SelectALLProvincias();
                DropDownList ddlLoc = (DropDownList)row.FindControl("ddlLocalidadG");
                ddlLoc.DataSource = unasProvincias.Find(X => X.IdProvincia == (Int32.Parse(ddlProv.SelectedValue))).misLocalidades;
                ddlLoc.DataValueField = "IdLocalidad";
                ddlLoc.DataTextField = "DescripcionLocalidad";
                ddlLoc.DataBind();
            }
        }

        //Modificar localidades al cambiar provincia seleccionada en alta dir fact
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int aux = Int32.Parse(ddlProvincia.SelectedValue);
            aux--;
            CargarDropdownProvinciasFact(aux);
            cargarLocalidadesFact();
        }

        //Modificar localidades al cambiar provincia seleccionada en alta dir Envio
        protected void ddlProvinciaAltaEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            int aux = Int32.Parse(ddlProvinciaAltaEnvio.SelectedValue);
            aux--;
            CargarDropdownProvinciasEnvio(aux);
            cargarLocalidadesEnvio();
        }

        protected void ddlProvinciaGEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProv = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlProv.NamingContainer;
            if (row != null)
            {
                unasProvinciasEnvio = UsuarioBLL.SelectALLProvincias();
                DropDownList ddlLoc = (DropDownList)row.FindControl("ddlLocalidadG");
                ddlLoc.DataSource = unasProvinciasEnvio.Find(X => X.IdProvincia == (Int32.Parse(ddlProv.SelectedValue))).misLocalidades;
                ddlLoc.DataValueField = "IdLocalidad";
                ddlLoc.DataTextField = "DescripcionLocalidad";
                ddlLoc.DataBind();
            }
        }

        protected void grillatelefonos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (HttpContext.Current.Session["Usuario"] != null)
                usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            else
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            UsuarioBLL.DeleteTelefono(usuarioentidad, TelefonosDelUsuario[e.RowIndex].NroTelefono, TelefonosDelUsuario[e.RowIndex].CodArea, TelefonosDelUsuario[e.RowIndex].miTipoTel.IdTipoTel);

            CargarGrillaTelefonos();
        }



    }
}