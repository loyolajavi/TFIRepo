using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TFI.Entidades;
using TFI.DAL.DAL;

namespace TFI.CORE.Managers
{
    public class MonedaCore
    {
        private MonedaEmpresaDAL _DALMonedaEmpresa;
        private MonedaDAL _DALMoneda;
        private MonedaEntidad _moneda;
        private MonedaEmpresaEntidad _monedaEmpresa;


        public MonedaCore()
        {

            this._DALMonedaEmpresa = new MonedaEmpresaDAL();
            this._DALMoneda = new MonedaDAL();
            this._moneda = new MonedaEntidad();
            this._monedaEmpresa = new MonedaEmpresaEntidad();


        }

        public List<MonedaEntidad> FinAllMonedasByEmpresa()
        {
            var listaMonedasAMostrar = new List<MonedaEntidad>();
            var monedasDeLaEmpresa = _DALMonedaEmpresa.SelectAllByCUIT(Helpers.ConfigSection.Default.Site.Cuit);
            foreach (var moneda in monedasDeLaEmpresa)
            {
                MonedaEntidad unaMoneda = _DALMoneda.Select(moneda.IdMoneda);
                listaMonedasAMostrar.Add(unaMoneda);

            }

            return listaMonedasAMostrar;
        }

        public MonedaEmpresaEntidad Select(int idMoneda)
        {
            return _DALMonedaEmpresa.Select(idMoneda, Helpers.ConfigSection.Default.Site.Cuit);

        }

        public void MonedaUpdate(MonedaEntidad moneda)
        {
            _DALMoneda.Update(moneda);
        }

        //public void MonedaDelete(int IdMoneda)
        //{
        //    _DALMoneda.Delete(IdMoneda);
        //}

        public void MonedaInsert(MonedaEntidad moneda)
        {
            _DALMoneda.Insert(moneda);
        }

        public void MonedaEmpresaUpdate(MonedaEmpresaEntidad moneda)
        {
            moneda.CUIT = Helpers.ConfigSection.Default.Site.Cuit;
            _DALMonedaEmpresa.Update(moneda);
        }

        public MonedaEntidad selectMoneda(int idMoneda)
        {
            return _DALMoneda.Select(idMoneda);
        }





    }
}