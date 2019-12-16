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
    public partial class AltaUsuario : BasePage
    {

        BLLFamilia ManagerFamilia = new BLLFamilia();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        HttpContext Current = HttpContext.Current;
        string[] unosPermisosTest;
        List<IFamPat> LisAuxAsig;
        List<IFamPat> LisAuxDisp;

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
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            unosPermisosTest = new string[] { "UsuarioAlta" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }


            if (!IsPostBack)
            {
                LisAuxAsig = new List<IFamPat>();
                LisAuxDisp = new List<IFamPat>();
                LisAuxDisp = ManagerFamilia.PermisosTraerTodos();
                ListarPermisos(LisAuxDisp, treeDisponibles);
                Current.Session["PermisosDisp"] = LisAuxDisp;
                treeDisponibles.CollapseAll();
            }
            else
            {
                LisAuxDisp = new List<IFamPat>();
                LisAuxDisp = (List<IFamPat>)Current.Session["PermisosDisp"];
                LisAuxAsig = (List<IFamPat>)Current.Session["PermisosAsig"];
                if(LisAuxAsig == null)
                    LisAuxAsig = new List<IFamPat>();
                
            }

        }

       

        protected void btnAltaUsuario_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            var NroRetorno = 0;

            try
            {
                Page.Validate("AltaEmpleado");
                if (Page.IsValid)
                {
                    //Verificar que quede al menos un permiso asignado
                    if (LisAuxAsig.Count == 0)
                    {
                        divAlertaUsCreado.Attributes["class"] = "alert alert-warning";
                        sb.Append("Por favor revisar que el usuario posea al menos un permiso asignado");
                    }
                    else
                    {
                        unUsuario.IdUsuarioTipo = 2; //Emp
                        unUsuario.NombreUsuario = txtNombreUsuario.Value;
                        unUsuario.Clave = ServicioSecurizacion.AplicarHash(txtClave.Value);
                        unUsuario.Apellido = txtApellido.Value;
                        unUsuario.Nombre = txtNombre.Value;
                        unUsuario.Email = txtMail.Value;
                        unUsuario.NroIdentificacion = txtDNICUIT.Value;
                        unUsuario.Permisos = LisAuxAsig;

                        NroRetorno = unManagerUsuario.RegistrarUsuario(unUsuario);
                        TFI.SEGURIDAD.ServicioLog.CrearLog("Crear Usuario", "Usuario: " + unUsuario.NombreUsuario + " creado correctamente", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());


                        if (NroRetorno == 0)
                        {
                            divAlertaUsCreado.Attributes["class"] = "alert alert-success";
                            sb.Append("Usuario creado correctamente");
                        }
                        else
                        {
                            divAlertaUsCreado.Attributes["class"] = "alert alert-warning";
                            sb.Append("El nombre de usuario ya existe");
                        }
                    }
                }
                else
                {
                    divAlertaUsCreado.Attributes["class"] = "alert alert-danger";
                    sb.Append("Error al crear usuario");
                }
                divAlertaUsCreado.InnerText = sb.ToString();
                divAlertaUsCreado.Visible = true;
                limpiarCampos();
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "AltaUsuario", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                Response.Redirect("../../../Shared/Errores.aspx");
            }


        }

        public void limpiarCampos()
        {
            txtNombreUsuario.Value = string.Empty;
            txtApellido.Value = string.Empty;
            txtNombre.Value = string.Empty;
            txtMail.Value = string.Empty;
            txtDNICUIT.Value = string.Empty;
            LisAuxAsig = new List<IFamPat>();
            Current.Session["PermisosAsig"] = null;
            LisAuxDisp = new List<IFamPat>();
            LisAuxDisp = ManagerFamilia.PermisosTraerTodos();
            ListarPermisos(LisAuxDisp, treeDisponibles);
            Current.Session["PermisosDisp"] = LisAuxDisp;
            treeDisponibles.CollapseAll();
            treeAsignados.Nodes.Clear();
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