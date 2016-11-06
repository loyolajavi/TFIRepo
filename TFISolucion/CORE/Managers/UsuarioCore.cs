﻿using System.Linq;
using System;
using System.Configuration;
using TFI.DAL.DAL;
using TFI.Entidades;
using System.Collections.Generic;

namespace TFI.CORE.Managers
{
    public class UsuarioCore
    {
        private UsuarioDAL _dal;
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

        public DireccionEntidad FindDireccionPredeterminada(string nombreUsuario)
        {
            var direccion = DaldeDireccionUsuario.SelectAllByCUIT_NombreUsuario(Helpers.ConfigSection.Default.Site.Cuit, nombreUsuario).Where(x => x.Predeterminada).FirstOrDefault();
            if (direccion == null)
                return null;
            return DaldeDireccion.Select(direccion.IdDireccion);
        }

        public TelefonoEntidad FindTelefonoContacto(string nombreUsuario)
        {
            return DaldeTelefono.SelectTelefonosDeUsuario(Helpers.ConfigSection.Default.Site.Cuit, nombreUsuario).FirstOrDefault();
        }

    }
}