using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class FormaPagoDAL
	{


		

		#region Methods

		/// <summary>
		/// Saves a record to the FormaPago table.
		/// </summary>
        public void Insert(FormaPagoEntidad formaPago)
        {


            ValidationUtility.ValidateArgument("formaPago", formaPago);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@DescripFormaPago", formaPago.DescripFormaPago)
            };

            formaPago.IdFormaPago = (int)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaPagoInsert", parameters);
            

        }



 		/// <summary>
		/// Updates a record in the FormaPago table.
		/// </summary>
        public void Update(FormaPagoEntidad formaPago)
        {
            ValidationUtility.ValidateArgument("formaPago", formaPago);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFormaPago", formaPago.IdFormaPago),
                new SqlParameter("@DescripFormaPago", formaPago.DescripFormaPago)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaPagoUpdate", parameters);
        }

		/// <summary> 
		/// Deletes a record from the FormaPago table by its primary key.
		/// </summary>
        public void Delete(int idFormaPago)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFormaPago", idFormaPago),

            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaPagoDelete", parameters);
        }

		/// <summary>
		/// Selects a single record from the FormaPago table.
		/// </summary>
        public FormaPagoEntidad Select(int idFormaPago)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFormaPago", idFormaPago)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaPagoSelect", parameters))
            {
                FormaPagoEntidad FormaPagoEntidad = new FormaPagoEntidad();

                FormaPagoEntidad = Mapeador.MapearFirst<FormaPagoEntidad>(dt);

                return FormaPagoEntidad;
            }
        }

		
		/// <summary>
		/// Selects all records from the FormaPago table.
		/// </summary>


        public List<FormaPagoEntidad> SelectAll()
        {

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaPagoSelectAll"))
            {
                List<FormaPagoEntidad> formaPagoEntidadesList = new List<FormaPagoEntidad>();

                formaPagoEntidadesList = Mapeador.Mapear<FormaPagoEntidad>(dt);

                return formaPagoEntidadesList;
            }
        }



		#endregion

    }
}
