using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;
using System.Linq;

namespace TFI.CORE.Managers
{
    public class DireccionCore
    {

        private DireccionDAL GestorDireccion = new DireccionDAL();
        private DireccionUsuarioDAL DalDeDireccionUsuario = new DireccionUsuarioDAL();
        private ProvinciaDAL GestorProvincia = new ProvinciaDAL();
        private LocalidadDAL GestorLocalidad = new LocalidadDAL();

        public DireccionEntidad DireccionSelect(int idDireccion)
        {
            return GestorDireccion.Select(idDireccion);
        }

        public List< DireccionUsuarioEntidad> DireccionUsuarioSelect(int iddireccion)
        {
            return DalDeDireccionUsuario.SelectAllByIdDireccion(iddireccion);
        }

        public List<DireccionEntidad> FindAll()
        {
            return GestorDireccion.SelectAll();
        }


        public DireccionEntidad TraerDireccionPorIdSucursal(int elIdSucursal)
        {
            return GestorDireccion.TraerDireccionPorIdSucursal(elIdSucursal);
        }


        public List<ProvinciaEntidad> SelectALLProvincias()
        {
            List<ProvinciaEntidad> unasProv = new List<ProvinciaEntidad>();
            unasProv = GestorProvincia.SelectAll();
            List<Localidad> unasLocal = new List<Localidad>();
            unasLocal = GestorLocalidad.LocalidadSelectAll();
            unasProv.ForEach(X => X.misLocalidades = unasLocal.Where(y => y.miProvincia.IdProvincia == X.IdProvincia).ToList());
            return unasProv;
        }

            


    }
}
