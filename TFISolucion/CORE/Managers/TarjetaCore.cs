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

        public bool Mod10Check(string creditCardNumber)
        {
            //// check whether input string is null or empty
            if (string.IsNullOrEmpty(creditCardNumber))
            {
                return false;
            }

            //// 1.	Starting with the check digit double the value of every other digit 
            //// 2.	If doubling of a number results in a two digits number, add up
            ///   the digits to get a single digit number. This will results in eight single digit numbers                    
            //// 3. Get the sum of the digits
            int sumOfDigits = creditCardNumber.Where((e) => e >= '0' && e <= '9')
                            .Reverse()
                            .Select((e, i) => ((int)e - 48) * (i % 2 == 0 ? 1 : 2))
                            .Sum((e) => e / 10 + e % 10);


            //// If the final sum is divisible by 10, then the credit card number
            //   is valid. If it is not divisible by 10, the number is invalid.            
            return sumOfDigits % 10 == 0;
        }

    }
}
