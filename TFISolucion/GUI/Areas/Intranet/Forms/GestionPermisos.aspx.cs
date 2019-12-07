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
using TFI.CORE.Servicios;
using TFI.Entidades.Servicios.Permisos;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class GestionPermisos : BasePage
    {

        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;

        BLLFamilia ManagerFamilia = new BLLFamilia();
        List<IFamPat> PermisosTodos = new List<IFamPat>();
        List<IFamPat> PermisosCbo = new List<IFamPat>();
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

            PermisosTodos = ManagerFamilia.PermisosTraerTodos();
            PermisosCbo = PermisosTodos.Where(X => X.CantHijos > 0).ToList();
            Familia FamAux = new Familia();
            FamAux.IdIFamPat = -1;
            FamAux.NombreIFamPat = "";
            PermisosCbo.Insert(0, FamAux);
            cboFamilia.Items.Clear();
            cboFamilia.DataSource = null;
            cboFamilia.DataSource = PermisosCbo;
            cboFamilia.DataTextField = "NombreIFamPat";
            cboFamilia.DataValueField = "IdIFamPat";
            cboFamilia.DataBind();

            LisAuxDisp = PermisosTodos.ToList();
            LisAuxAsig = new List<IFamPat>();
            ListarPermisos(PermisosTodos, treeTodos);
            ListarPermisos(LisAuxDisp, treeDisponibles);



        }


        public void ListarPermisos(List<IFamPat> PermisosVer, TreeView treePermisos)
        {
            treePermisos.Nodes.Clear();
            foreach (IFamPat item in PermisosVer)
            {
                TreeNode Padre = new TreeNode();
                Padre.Text = item.GetType().Name.ToString() + ": " + item.NombreIFamPat;
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

        protected void treeTodos_SelectedNodeChanged(object sender, EventArgs e)
        {
            //lblMsg.Text = treeTodos.SelectedValue;
            //lblMsg.ForeColor = System.Drawing.Color.Red;
            txtName.Text = treeTodos.SelectedValue;
        }




    }
}