using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class TarjetaCore
    {

        private TipoTarjetaDAL DalDeTipoTarjeta = new TipoTarjetaDAL();

        private TarjetaDAL DalDeTarjetas = new TarjetaDAL();

        public TipoTarjetaEntidad ObtenerTipoTarjeta(TarjetaEntidad tarjeta)
        {

            return DalDeTipoTarjeta.Select(tarjeta.IdTipoTarjeta);

        }

        public List<TipoTarjetaEntidad> SelectAllTiposDeTarjeta()
        {

            return DalDeTipoTarjeta.SelectAll();

        }


        public List<TarjetaEntidad> SelectAllTarjetasByCUIT_NombreUsuario(string cuit, string nombreusuario)
        {
            try
            {
                return DalDeTarjetas.SelectAllByCUIT_NombreUsuario(cuit, nombreusuario);
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        public TarjetaEntidad SelectTarjetaByNumero(Int64 numero, string cuit)
        {
            try
            {
                return DalDeTarjetas.SelectByNumero(numero, cuit);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void DeleteTarjeta(int id)
        {
            try
            {
                DalDeTarjetas.Delete(id);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void InsertTarjeta(TarjetaEntidad tarjeta)
        {
            try
            {
                DalDeTarjetas.Insert(tarjeta);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
