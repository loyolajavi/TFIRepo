using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia;
using TFI.Entidades;

namespace TFI.DAL.DAL
{
    public class LocalidadDAL
    {


        public List<Localidad> LocalidadSelectAll()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LocalidadSelectAll"))
            {
                List<Localidad> unaLista = new List<Localidad>();

                unaLista = MapearMuchos(dt);

                return unaLista;
            }
        }


        private List<Localidad> MapearMuchos(DataSet ds)
        {
            List<Localidad> ResUnosItem = new List<Localidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    Localidad unItem = new Localidad();

                    unItem.IdLocalidad = (int)row["IdLocalidad"];
                    unItem.DescripcionLocalidad = row["DescripcionLocalidad"].ToString();
                    unItem.miProvincia = new ProvinciaEntidad();
                    unItem.miProvincia.IdProvincia = (int)row["IdProvincia"];
                    unItem.miProvincia.DescripcionProvincia = row["DescripcionProvincia"].ToString();

                    ResUnosItem.Add(unItem);
                }
                return ResUnosItem;
            }
            catch (Exception es)
            {
                throw;
            }

        }



    }
}
