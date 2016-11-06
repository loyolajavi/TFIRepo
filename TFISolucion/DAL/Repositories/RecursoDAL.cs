using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.Entidades;
using TFI.HelperDAL;

namespace TFI.DAL.DAL
{
    public class RecursoDAL
    {
        public int Insert(RecursoEntidad recurso)
        {
            ValidationUtility.ValidateArgument("recurso", recurso);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", recurso.CUIT),
				new SqlParameter("@Recurso", recurso.Recurso),
				new SqlParameter("@Url", recurso.Url)
				
			};

            var valor = Convert.ToInt32(SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "RecursoInsert", parameters));

            return valor;
        }


        public void Update(RecursoEntidad recurso)
        {
            ValidationUtility.ValidateArgument("recurso", recurso);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", recurso.CUIT),
				new SqlParameter("@Recurso", recurso.Recurso),
				new SqlParameter("@Url", recurso.Url)
				
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "RecursoUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the Direccion table by its primary key.
        /// </summary>
        public void Delete(string CUIT, string Recurso)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
                new SqlParameter("@Recurso", Recurso)

			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "RecursoDelete", parameters);
        }




        /// <summary>
        /// Selects a single record from the Direccion table.
        /// </summary>
        public RecursoEntidad Select(string CUIT, string Recurso)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
                new SqlParameter("@Recurso", Recurso)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "RecursoSelect", parameters))
            {
                RecursoEntidad Entidad = new RecursoEntidad();

                Entidad = Mapeador.MapearFirst<RecursoEntidad>(dt);

                return Entidad;
            }
        }



        /// <summary>
        /// Selects all records from the Direccion table.
        /// </summary>
        public List<RecursoEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "RecursoSelectAll"))
            {
                List<RecursoEntidad> lista = new List<RecursoEntidad>();

                lista = Mapeador.Mapear<RecursoEntidad>(dt);

                return lista;
            }
        }


    }
}
