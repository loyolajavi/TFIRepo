using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.Entidades;
using TFI.Entidades.Servicios.Permisos;
using TFI.SEGURIDAD;
using TFI.DAL;
using TFI.DAL.Services;

namespace TFI.CORE.Servicios
{
    public class BLLFamilia
    {
        DALFamilia GestorFamilia = new DALFamilia();

        public void FamiliaTraerSubPermisos(List<IFamPat> unasFamilias)
        {
            try
            {
                //Por cada familia/patente reviso si tiene subpermisos para agregarselos
                foreach (IFamPat unaFamilia in unasFamilias)
                {
                    GestorFamilia.FamiliaTraerFamiliasHijas(unaFamilia);
                }


            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "FamiliaTraerSubPermisos", "", Helpers.ConfigSection.Default.Site.Cuit.ToString());
                throw;
            }
        }


        public void FamiliaUnaTraerSubPermisos(IFamPat unaFamilia)
        {
            try
            {
                //Reviso si tiene subpermisos para agregarselos
                GestorFamilia.FamiliaTraerFamiliasHijas(unaFamilia);
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "FamiliaUnaTraerSubPermisos", "", Helpers.ConfigSection.Default.Site.Cuit.ToString());
                throw;
            }
        }

        public List<IFamPat> PermisosTraerTodos()
        {
            try
            {
                List<IFamPat> unasFamilias;
                unasFamilias = GestorFamilia.PermisosTraerTodos();
                FamiliaTraerSubPermisos(unasFamilias);
                return unasFamilias;
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "PermisosTraerTodos", "", Helpers.ConfigSection.Default.Site.Cuit.ToString());
                throw;
            }
        }


        public List<IFamPat> FamiliaSelectAll()
        {
            return GestorFamilia.SelectAll();
        }


        //public bool FamiliaCrear(IFamPat nuevaFamilia)
        //{
        //    try
        //    {
        //        if (!BLLFamilia.BuscarPermiso(FRAMEWORK.Servicios.ServicioLogin.GetLoginUnico().UsuarioLogueado.Permisos, new string[] { "Familia Crear" }))
        //            throw new InvalidOperationException("No posee los permisos suficientes");
        //        if (GestorFamilia.FamiliaCrear(nuevaFamilia))
        //            return true;
        //        return false;
        //    }
        //    catch (Exception es)
        //    {
        //        throw;
        //    }
        //}

        public Familia FamiliaBuscar(string NombreIFamPat)
        {
            try
            {
                return GestorFamilia.FamiliaBuscar(NombreIFamPat);
            }
            catch (Exception es)
            {
                throw;
            }
        }

        //public bool FamiliaModificar(IFamPat AModifFamilia, List<IFamPat> FamQuitarMod, List<IFamPat> FamAgregarMod)
        //{
        //    try
        //    {
        //        if (!BLLFamilia.BuscarPermiso(FRAMEWORK.Servicios.ServicioLogin.GetLoginUnico().UsuarioLogueado.Permisos, new string[] { "Familia Modificar" }))
        //            throw new InvalidOperationException("No posee los permisos suficientes");
        //        if (GestorFamilia.FamiliaModificar(AModifFamilia, FamQuitarMod, FamAgregarMod))
        //            return true;
        //        return false;
        //    }
        //    catch (Exception es)
        //    {
        //        throw;
        //    }
        //}

        //public bool FamiliaEliminar(Familia unafamilia)
        //{
        //    try
        //    {
        //        if (!BLLFamilia.BuscarPermiso(FRAMEWORK.Servicios.ServicioLogin.GetLoginUnico().UsuarioLogueado.Permisos, new string[] { "Familia Eliminar" }))
        //            throw new InvalidOperationException("No posee los permisos suficientes");
        //        if (GestorFamilia.FamiliaEliminar(unafamilia.IdIFamPat))
        //            return true;
        //        return false;
        //    }
        //    catch (Exception es)
        //    {
        //        throw;
        //    }
        //}

        //public List<UsuarioEntidad> FamiliaUsuariosComprometidos(int IdFamilia)
        //{
        //    try
        //    {
        //        return GestorFamilia.FamiliaUsuariosComprometidos(IdFamilia);
        //    }
        //    catch (Exception es)
        //    {
        //        throw;
        //    }
        //}

        //public List<UsuarioEntidad> FamiliaUsuariosAsociados(int IdFamilia)
        //{
        //    try
        //    {
        //        return GestorFamilia.FamiliaUsuariosAsociados(IdFamilia);
        //    }
        //    catch (Exception es)
        //    {
        //        throw;
        //    }
        //}


        public static bool BuscarPermiso(List<IFamPat> PermisosVer, string[] unTagControl)
        {
            foreach (var unTag in unTagControl)
            {
                foreach (IFamPat unPermiso in PermisosVer)
                {
                    if (unPermiso.CantHijos > 0)
                    {
                        if (BuscarSubPermisos((unPermiso as Familia).ElementosFamPat, unTag))
                            return true;
                    }
                    else
                        if (unPermiso.NombreIFamPat == unTag)
                            return true;
                }
            }
            return false;
        }


        public static bool BuscarSubPermisos(List<IFamPat> PermisosVer, string unTagControl)
        {
            bool Res = false;
            foreach (IFamPat unPer in PermisosVer)
            {
                if (unPer.CantHijos > 0)
                {
                    if (BuscarSubPermisos((unPer as Familia).ElementosFamPat, unTagControl))
                    {
                        Res = true;
                        break;
                    }
                }
                else
                {
                    if (unPer.NombreIFamPat == unTagControl)
                    {
                        Res = true;
                        break;
                    }
                }
            }
            return Res;
        }



        public void UsuarioFamiliaInsert(UsuarioEntidad elUsuario)
        {
            GestorFamilia.UsuarioFamiliaInsert(elUsuario);
        }




        public void UsuarioUpdatePermisosFamilia(UsuarioEntidad elUsuario)
        {
            GestorFamilia.UsuarioUpdatePermisosFamilia(elUsuario);
        }


    }
}
