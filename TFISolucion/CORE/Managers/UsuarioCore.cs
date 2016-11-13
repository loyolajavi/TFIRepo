using System;
using System.Collections.Generic;
using System.Linq;
using TFI.CORE.Helpers;
using TFI.DAL.DAL;
using TFI.Entidades;

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

        public UsuarioCore()
        {
            _dal = new UsuarioDAL();
            _dalProvicia = new ProvinciaDAL();
        }

        public UsuarioEntidad loginUsuario(string clave, string nombreUsuario)
        {
            try
            {
                return _dal.SelectUserByClaveNombreUsuario(clave, nombreUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void RegistrarUsuario(UsuarioEntidad usuario)
        {
            try
            {
                usuario.CUIT = Helpers.ConfigSection.Default.Site.Cuit;
                _dal.Insert(usuario);
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

        public void UpdateDatosPersonales(UsuarioEntidad usuario)
        {
            DaldeUsuario.UpdateDatosPersonales(usuario);
        }

        public void UpdateTelefonosPersonales(TelefonoEntidad telefono)
        {
            DaldeTelefono.UpdateDatosPersonales(telefono);
        }

        public void UpdateDireccionesUsuario(DireccionEntidad direccion)
        {
            DaldeDireccion.Update(direccion);
        }

        public List<ProvinciaEntidad> SelectALLProvincias()
        {
            return DalDeProvincia.SelectAll();
        }

        public void InsertDireccionDeFacturacion(DireccionEntidad direccion, DireccionUsuarioEntidad direcciondeusuario)
        {
            try
            {
                var id = DaldeDireccion.Insert(direccion);
                direcciondeusuario.IdDireccion = id;
                DaldeDireccionUsuario.Insert(direcciondeusuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void DeleteDireccion(DireccionEntidad direccion, DireccionUsuarioEntidad direcciondeusuario)
        {
            try
            {
                DaldeDireccion.Delete(direccion.IdDireccion);
                DaldeDireccionUsuario.Delete(direccion.IdDireccion, direcciondeusuario.CUIT, direcciondeusuario.NombreUsuario);
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

        public void DireccionUsuarioUpdate(DireccionUsuarioEntidad direccion)
        {
            DaldeDireccionUsuario.Update(direccion);
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

        public List<DireccionEntidad> FindDireccionesPredeterminadas(string nombreUsuario)
        {
            var direccionUsurio = DaldeDireccionUsuario
                .SelectAllByCUIT_NombreUsuario(Helpers.ConfigSection.Default.Site.Cuit, nombreUsuario)
                .Where(x => x.Predeterminada)
                .ToList();

            if (direccionUsurio == null && !direccionUsurio.Any())
                return null;

            var dirs = new List<DireccionEntidad>();
            direccionUsurio.ForEach(x => dirs.Add(DaldeDireccion.Select(x.IdDireccion)));
            dirs.ForEach(x => x.Provincia = _dalProvicia.Select(x.IdProvincia));

            return dirs;
        }

        public DireccionEntidad FindDireccionEnvioPredeterminada(string userName)
        {
            return FindDireccionesPredeterminadas(userName)
                       .Where(x => x.IdTipoDireccion == (int)TipoDireccionEntidad.Options.Envio)
                       .FirstOrDefault();
        }

        public DireccionEntidad FindDireccionFacturacionPredeterminada(string userName)
        {
            return FindDireccionesPredeterminadas(userName)
                      .Where(x => x.IdTipoDireccion == (int)TipoDireccionEntidad.Options.Facturacion)
                      .FirstOrDefault();
        }

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

    }
}