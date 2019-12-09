using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using TFI.FUNCIONES;
using System.Text;
using TFI.Entidades.Servicios.Permisos;
using TFI.CORE.Servicios;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class UpdateEmpleado : BasePage
    {

        public UsuarioEntidad unEmpleado = new UsuarioEntidad();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public BLLFamilia unManagerUsuarioFamilia = new BLLFamilia();
        HttpContext Current = HttpContext.Current;
        private LenguajeEntidad idioma;
        BLLFamilia ManagerFamilia = new BLLFamilia();
        List<IFamPat> LisAuxAsig;
        List<IFamPat> LisAuxDisp;
        List<IFamPat> LisAuxAsigBKP = new List<IFamPat>();


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
        private string usuarioString = null;

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

            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            string[] unosPermisosTest = new string[] { "Publico", "Cliente" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            unosPermisosTest = new string[] { "Empleado" };
            if (this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }
            
            usuarioString = Page.Request.QueryString["Emple"];

            if (!string.IsNullOrEmpty(usuarioString))
            {
                cargarDatosEmpleado();
                if (!IsPostBack)
                {
                    LisAuxAsig = new List<IFamPat>();
                    LisAuxAsig = unManagerUsuario.UsuarioTraerPermisos(unEmpleado.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit);
                    LisAuxAsigBKP = LisAuxAsig.ToList();
                    LisAuxDisp = new List<IFamPat>();
                    LisAuxDisp = ManagerFamilia.PermisosTraerTodos();

                    FiltrarDisponibles(ref LisAuxDisp, LisAuxAsig);

                    ListarPermisos(LisAuxDisp, treeDisponibles);
                    ListarPermisos(LisAuxAsig, treeAsignados);
                    treeAsignados.CollapseAll();
                    treeDisponibles.CollapseAll();

                    Current.Session["PermisosDisp"] = LisAuxDisp;
                    Current.Session["PermisosAsig"] = LisAuxAsig;

                }
                else
                {
                    LisAuxDisp = new List<IFamPat>();
                    LisAuxDisp = (List<IFamPat>)Current.Session["PermisosDisp"];
                    LisAuxAsig = new List<IFamPat>();
                    LisAuxAsig = (List<IFamPat>)Current.Session["PermisosAsig"];
                    LisAuxAsigBKP = unManagerUsuario.UsuarioTraerPermisos(unEmpleado.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit);
                }
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }


           




        }

        //public void cargarPermisos()
        //{
        //    ddlPermisosUsuarioUpdate.DataSource = null;
        //    unasFamilias = unManagerFamilia.FamiliaSelectAll();
        //    ddlPermisosUsuarioUpdate.DataSource = unasFamilias;
        //    ddlPermisosUsuarioUpdate.DataValueField = "NombreFamilia";
        //    ddlPermisosUsuarioUpdate.SelectedIndex = (int)unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
        //    ddlPermisosUsuarioUpdate.DataBind();
        //}



        public void cargarDatosEmpleado(){
            
            unEmpleado = unManagerUsuario.UsuarioSelectByIdUsuario(Int32.Parse(usuarioString));

            lblEmpleado.Text = unEmpleado.Nombre + " " + unEmpleado.Apellido;
            Session["Empleado"] = (UsuarioEntidad)unEmpleado;
            txtNombreUsuario.Value = unEmpleado.NombreUsuario;
            txtClave.Value = "********";
            txtClaveRep.Value = "********";
            txtApellido.Value = unEmpleado.Apellido;
            txtNombre.Value = unEmpleado.Nombre;
            txtMail.Value = unEmpleado.Email;
            txtDNI.Value = unEmpleado.NroIdentificacion;
        }

        protected void btnDatosUsuarioUpdate_Click(object sender, EventArgs e)
        {
            
            unEmpleado.Apellido = txtApellido.Value;
            unEmpleado.Nombre = txtNombre.Value;
            unEmpleado.Email = txtMail.Value;
            unEmpleado.NroIdentificacion = txtDNI.Value;
            unEmpleado.IdUsuario = Int32.Parse(usuarioString);
            unManagerUsuario.UsuarioUpdateDatosPersonalesConDNI(unEmpleado);
            cargarDatosEmpleado();
        }

        protected void btnPermisosUsuarioUpdate_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            List<IFamPat> PerQuitar = new List<IFamPat>();
            List<IFamPat> PerAgregar = new List<IFamPat>();

            //Verificar que quede al menos un permiso asignado
            if (LisAuxAsig.Count == 0)
            {
                sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#currentdetail').modal('show');");
                sb.Append("alert('Por favor revisar que el usuario posea al menos un permiso asignado');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModifClickMsj1", sb.ToString(), false);
            }
            else
            {
                unEmpleado = (UsuarioEntidad)Session["Empleado"];
                PerQuitar = LisAuxAsigBKP.Where(d => !LisAuxAsig.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();
                PerAgregar = LisAuxAsig.Where(d => !LisAuxAsigBKP.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();

                if(unManagerUsuario.UsuarioModificarPermisos(PerAgregar, PerQuitar, unEmpleado.NombreUsuario))
                {
                    LisAuxAsig = unManagerUsuario.UsuarioTraerPermisos(unEmpleado.NombreUsuario, unEmpleado.CUIT);
                    LisAuxAsigBKP = LisAuxAsig.ToList();
                    TFI.SEGURIDAD.ServicioLog.CrearLog("Modificar Permisos Usuario", "Permisos modificados correctamente", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                    treeAsignados.CollapseAll();
                    treeDisponibles.CollapseAll();
                    Current.Session["PermisosDisp"] = LisAuxDisp;
                    Current.Session["PermisosAsig"] = LisAuxAsig;

                }
                
            }

            
            //unEmpleado.Permisos.Clear();
            //unEmpleado.Permisos.Add(new Familia());
            //unEmpleado.Permisos[0].IdIFamPat = ddlPermisosUsuarioUpdate.SelectedIndex + 1;
            //unManagerUsuarioFamilia.UsuarioUpdatePermisosFamilia(unEmpleado);
            //cargarDatosEmpleado();
        }

        protected void btnCambiarClave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                StringBuilder sb = new StringBuilder();
                unEmpleado = (UsuarioEntidad)Session["Empleado"];
                unEmpleado.Clave = ServicioSecurizacion.AplicarHash(txtClave.Value);
                unManagerUsuario.UpdateUsuarioContraseña(unEmpleado);
                sb.Append("<br />");
                divEspacioModifClave.InnerHtml = sb.ToString();
                divAlertaModifClave.Visible = true;
            }
        }

        protected void btnNombreUsuario_Click(object sender, EventArgs e)
        {
            unEmpleado.NombreUsuario = txtNombreUsuario.Value;
            unEmpleado.IdUsuario = Int32.Parse(usuarioString);
            unManagerUsuario.UsuarioUpdateNombreUsuario(unEmpleado);
        }


        public void ListarPermisos(List<IFamPat> PermisosVer, TreeView treePermisos)
        {
            treePermisos.Nodes.Clear();
            foreach (IFamPat item in PermisosVer)
            {
                TreeNode Padre = new TreeNode();
                Padre.Text = item.GetType().Name.ToString() + ": " + item.NombreIFamPat;
                Padre.Value = item.NombreIFamPat;
                Padre.Expand();
                treePermisos.Nodes.Add(Padre);
                if (item.CantHijos > 0)
                    ListarYAgregarSubPermisos((item as Familia).ElementosFamPat, Padre);
            }
        }


        public void ListarYAgregarSubPermisos(List<IFamPat> PermisosVer, TreeNode elNodo = null)
        {
            int I = 0;

            do
            {
                TreeNode NodoHijo = null;
                if (elNodo == null)
                {
                    elNodo = new TreeNode();
                    elNodo.Text = PermisosVer[I].GetType().Name.ToString() + ": " + PermisosVer[I].NombreIFamPat;
                    elNodo.Value = PermisosVer[I].NombreIFamPat;
                }
                else
                {
                    NodoHijo = new TreeNode(PermisosVer[I].GetType().Name.ToString() + ": " + PermisosVer[I].NombreIFamPat);
                    NodoHijo.Collapse();
                    elNodo.ChildNodes.Add(NodoHijo);
                }
                if (PermisosVer[I].CantHijos > 0)
                    ListarYAgregarSubPermisos((PermisosVer[I] as Familia).ElementosFamPat, NodoHijo);
                I++;
            } while (I < PermisosVer.Count);
        }

        public void FiltrarDisponibles(ref List<IFamPat> PerDisp, List<IFamPat> PerAsig)
        {
            PerDisp = PerDisp.Where(d => !PerAsig.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();

            foreach (IFamPat item in PerAsig)
            {
                if (item.CantHijos > 0)
                    FiltrarSubpermisos(item as Familia, ref PerDisp);
            }
        }


        public void FiltrarSubpermisos(Familia fam, ref List<IFamPat> disp)
        {
            disp = disp.Where(d => !fam.ElementosFamPat.Any(a => a.NombreIFamPat == d.NombreIFamPat)).ToList();
            foreach (IFamPat item in fam.ElementosFamPat)
            {
                if (item.CantHijos > 0)
                    FiltrarSubpermisos(item as Familia, ref disp);
            }
        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (treeDisponibles.SelectedNode == null || treeDisponibles.SelectedNode.Parent != null)
            {
                sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#currentdetail').modal('show');");
                sb.Append("alert('Por favor seleccione la Familia que contiene el permiso seleccionado o la patente requerida en forma directa');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "AgregarClickMsj1", sb.ToString(), false);
            }
            else
            {
                LisAuxAsig.Add(LisAuxDisp.First(X => X.NombreIFamPat == treeDisponibles.SelectedNode.Value));
                LisAuxDisp = ManagerFamilia.PermisosTraerTodos();
                FiltrarDisponibles(ref LisAuxDisp, LisAuxAsig);
                ListarPermisos(LisAuxDisp, treeDisponibles);
                ListarPermisos(LisAuxAsig, treeAsignados);
                Current.Session["PermisosDisp"] = LisAuxDisp;
                Current.Session["PermisosAsig"] = LisAuxAsig;
                treeAsignados.CollapseAll();
                treeDisponibles.CollapseAll();
            }
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            
            if (treeAsignados.SelectedNode == null || treeAsignados.SelectedNode.Parent != null)
            {
                sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#currentdetail').modal('show');");
                sb.Append("alert('Por favor seleccione la Familia que contiene el permiso seleccionado o la patente requerida en forma directa');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "QuitarClickMsj1", sb.ToString(), false);
            }
            else
            {
                LisAuxAsig.Remove(LisAuxAsig.First(X => X.NombreIFamPat == treeAsignados.SelectedNode.Value));
                LisAuxDisp = ManagerFamilia.PermisosTraerTodos();
                FiltrarDisponibles(ref LisAuxDisp, LisAuxAsig);
                ListarPermisos(LisAuxDisp, treeDisponibles);
                ListarPermisos(LisAuxAsig, treeAsignados);
                Current.Session["PermisosDisp"] = LisAuxDisp;
                Current.Session["PermisosAsig"] = LisAuxAsig;
                treeAsignados.CollapseAll();
                treeDisponibles.CollapseAll();
            }

        }



    }
}