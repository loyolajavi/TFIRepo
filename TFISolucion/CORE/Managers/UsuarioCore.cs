using System;
using System.Collections.Generic;
using System.Linq;
using TFI.CORE.Helpers;
using TFI.DAL.DAL;
using TFI.Entidades;
using TFI.Entidades.Servicios.Permisos;
using TFI.SEGURIDAD;
using TFI.CORE.Servicios;

namespace TFI.CORE.Managers
{
    public class UsuarioCore
    {
        private UsuarioDAL _dal;
        private ProvinciaDAL _dalProvicia;
        private UsuarioDAL DaldeUsuario = new UsuarioDAL();
        private TelefonoDAL DaldeTelefono = new TelefonoDAL();
        private DireccionUsuarioDAL DaldeDireccionUsuario = new DireccionUsuarioDAL();
        private DireccionDAL DaldeDireccion = new DireccionDAL();
        private TipoTelDAL DalDeTipoTelefono = new TipoTelDAL();
        private ProvinciaDAL DalDeProvincia = new ProvinciaDAL();
        private TarjetaDAL DalDeTarjetas = new TarjetaDAL();
        private BLLFamilia unManagerUsuarioFamilia = new BLLFamilia();


        public List<TipoTelEntidad> RetornaTipoTel()
        {
            return DalDeTipoTelefono.SelectAll();
        }
        public UsuarioCore()
        {
            _dal = new UsuarioDAL();
            _dalProvicia = new ProvinciaDAL();
        }

        public UsuarioEntidad loginUsuario(string clave, string nombreUsuario)
        {
            try
            {
                return _dal.SelectUserByClaveNombreUsuario(clave, nombreUsuario, Helpers.ConfigSection.Default.Site.Cuit);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int RegistrarUsuario(UsuarioEntidad usuario)
        {
            try
            {
                usuario.CUIT = Helpers.ConfigSection.Default.Site.Cuit;
                //Chequea si ya existe ese nombre de usuario
                UsuarioEntidad UsuarioYaRegistrado = new UsuarioEntidad();
                UsuarioYaRegistrado = Select(ConfigSection.Default.Site.Cuit, usuario.NombreUsuario);
                if (string.IsNullOrEmpty(UsuarioYaRegistrado.NombreUsuario))
                { 
                    _dal.Insert(usuario);
                    _dal.UsuarioAgregarPermisos(usuario.Permisos, usuario.NombreUsuario, usuario.CUIT);
                    //unManagerUsuarioFamilia.UsuarioFamiliaInsert(usuario);
                    return 0;
                }
                return 1;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public UsuarioEntidad Select(string cuit, string nombreUsuario)
        {
            return DaldeUsuario.Select(cuit, nombreUsuario);
        }

        public List<TelefonoEntidad> SelectTelefonosDeUsuario(string cuit, string nombreUsuario)
        {
            return DaldeTelefono.SelectTelefonosDeUsuario(cuit, nombreUsuario);
        }

        public string ObtenerTipodeTelefono(int tipo)
        {
            var entidad = DalDeTipoTelefono.Select(tipo);
            return entidad.DescripcionTipoTel;
        }

        public List<DireccionEntidad> SelectDireccionesDeUsuario(string cuit, string nombreUsuario)
        {
            List<DireccionUsuarioEntidad> ListaDeIntermedias = new List<DireccionUsuarioEntidad>();
            ListaDeIntermedias = DaldeDireccionUsuario.SelectAllByCUIT_NombreUsuario(cuit, nombreUsuario);

            List<DireccionEntidad> ListaDeDirecciones = new List<DireccionEntidad>();

            foreach (var item in ListaDeIntermedias)
            {
                DireccionEntidad UnaDireccion = new DireccionEntidad();
                UnaDireccion = DaldeDireccion.Select(item.IdDireccion);
                ListaDeDirecciones.Add(UnaDireccion);
            }

            return ListaDeDirecciones;
        }


        public List<DireccionEntidad> SelectDireccionesDeUsuarioActuales(UsuarioEntidad elUsuario)
        {
            //List<DireccionUsuarioEntidad> ListaDeIntermedias = new List<DireccionUsuarioEntidad>();
            //ListaDeIntermedias = DaldeDireccionUsuario.SelectAllByCUIT_NombreUsuario(cuit, nombreUsuario);

            elUsuario.misDirecciones = DaldeDireccion.SelectDireccionesDeUsuarioActuales(elUsuario.CUIT, elUsuario.NombreUsuario);

            //foreach (var item in ListaDeIntermedias)
            //{
                //DireccionEntidad UnaDireccion = new DireccionEntidad();
                //UnaDireccion = DaldeDireccion.Select(item.IdDireccion);
                //ListaDeDirecciones.Add(UnaDireccion);
            //}

            return elUsuario.misDirecciones;
        }


        public void UpdateDatosPersonales(UsuarioEntidad usuario)
        {
            DaldeUsuario.UpdateDatosPersonales(usuario);
        }

        public void UpdateTelefonosPersonales(TelefonoEntidad telefono)
        {
            DaldeTelefono.UpdateDatosPersonales(telefono);
        }

        public void UpdateDireccionesUsuario(DireccionEntidad direccion, UsuarioEntidad elUsuario)
        {
            DaldeDireccion.Update(direccion);
            if(direccion.Predeterminada)
                DaldeUsuario.UsuarioDireccionActualizar(direccion, elUsuario);
        }

        public List<ProvinciaEntidad> SelectALLProvincias()
        {
            DireccionCore ManagerDireccion = new DireccionCore();
            return ManagerDireccion.SelectALLProvincias();
            //return DalDeProvincia.SelectAll();
        }

        public void insertTelefonoUsuario(TelefonoEntidad tel)
        {

            DaldeTelefono.Insert(tel);


        }

        public void InsertDireccionDeFacturacion(DireccionEntidad direccion, UsuarioEntidad elUsuario)
        {
            try
            {
                var id = DaldeDireccion.Insert(direccion);
                direccion.IdDireccion = id;
                DaldeUsuario.UsuarioDireccionCrear(direccion, elUsuario);
                DaldeUsuario.UsuarioDireccionActualizar(direccion, elUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void DeleteDireccion(int elIdDireccion, UsuarioEntidad elUsuario)
        {
            try
            {
                DaldeDireccion.Delete(elIdDireccion);
                DaldeDireccionUsuario.Delete(elIdDireccion, elUsuario.CUIT, elUsuario.NombreUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateUsuarioContraseña(UsuarioEntidad usuario)
        {
            DaldeUsuario.UpdateUsuarioContraseña(usuario);
        }

        public DireccionUsuarioEntidad DireccionUsuarioSelect(int idDireccion, string cuit, string nombreUsuario)
        {
            return DaldeDireccionUsuario.Select(idDireccion, cuit, nombreUsuario);
        }



        /// <summary>
        /// Metodo que retorna los 5 clientes(empresas solamente)
        /// que mas hayan comprado en toda la historia de la empresa.
        /// </summary>
        /// <param name="CUIT"></param>
        /// <returns></returns>
        public List<UsuarioEntidad> EmpresasConMasPedidos(string cuit)
        {
            return DaldeUsuario.EmpresasConMasPedidos(cuit);
        }

        public List<DireccionEntidad> FindDireccionesPredeterminadas(UsuarioEntidad elUsuario)
        {
            List<DireccionEntidad> unasDirUsuario = SelectDireccionesDeUsuarioActuales(elUsuario)
                                    .Where(x => x.Predeterminada)
                                    .ToList();

            if (unasDirUsuario == null && !unasDirUsuario.Any())
                return null;
   
            return unasDirUsuario;
        }

        //public DireccionEntidad FindDireccionEnvioPredeterminada(string userName)
        //{
        //    return FindDireccionesPredeterminadas(userName)
        //               .Where(x => x.IdTipoDireccion == (int)TipoDireccionEntidad.Options.Envio)
        //               .FirstOrDefault();
        //}

        //public DireccionEntidad FindDireccionFacturacionPredeterminada(string userName)
        //{
        //    return FindDireccionesPredeterminadas(userName)
        //              .Where(x => x.IdTipoDireccion == (int)TipoDireccionEntidad.Options.Facturacion)
        //              .FirstOrDefault();
        //}

        public TelefonoEntidad FindTelefonoContacto(string nombreUsuario)
        {
            return DaldeTelefono.SelectTelefonosDeUsuario(Helpers.ConfigSection.Default.Site.Cuit, nombreUsuario).FirstOrDefault();
        }

        public List<UsuarioEntidad> UsuarioSelectAllByIdUsuarioTipo_CUIT(int elTipoUsuario)
        {
            return DaldeUsuario.UsuarioSelectAllByIdUsuarioTipo_CUIT(elTipoUsuario, ConfigSection.Default.Site.Cuit);
        }

        public UsuarioEntidad UsuarioSelectByIdUsuario(int idUsuario)
        {
            return DaldeUsuario.UsuarioSelectByIdUsuario(idUsuario);
        }
        public void UsuarioUpdateDatosPersonalesConDNI(UsuarioEntidad usuario)
        {
             DaldeUsuario.UsuarioUpdateDatosPersonalesConDNI(usuario);
        }


        public void UsuarioUpdateNombreUsuario(UsuarioEntidad usuario)
        {
            DaldeUsuario.UsuarioUpdateNombreUsuario(usuario);
        }


        public void UsuarioDeleteSeleccionadosByIdUsuario(int idUsuario)
        {
            try
            {
                _dal.UsuarioDeleteSeleccionadosByIdUsuario(idUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void DeleteAllByIdUsuarioTipo(int elTipoUsuario)
        {
            _dal.DeleteAllByIdUsuarioTipo(elTipoUsuario);
        }


        public List<IFamPat> UsuarioTraerPermisos(string elNomUsuario, string elCUIT)
        {

            Servicios.BLLFamilia ManagerFamilia = new Servicios.BLLFamilia();

            try
            {
                List<IFamPat> unasFamilias;
                //Primero traigo los permisos directos que tiene usuario (Familias y Patentes)
                unasFamilias = _dal.UsuarioTraerPermisos(elNomUsuario, elCUIT);
                //Segundo veo si aquellos permisos (1), tienen subpermisos (Familias y/o Patentes) y los agrego. La variable unasFamilias se modifica en las funciones de la BLL y DAL directamente.
                ManagerFamilia.FamiliaTraerSubPermisos(unasFamilias);
                return unasFamilias;

            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "UsuarioTraerPermisos", elNomUsuario, elCUIT);
                throw;
            }
        }



        public bool UsuarioModificarPermisos(List<IFamPat> PerAgregar, List<IFamPat> PerQuitar, string NombreUsuario)
        {
            try
            {
                if (PerAgregar.Count > 0)
                    _dal.UsuarioAgregarPermisos(PerAgregar, NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit);
                if (PerQuitar.Count > 0)
                    _dal.UsuarioQuitarPermisos(PerQuitar, NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit);
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }


    }
}