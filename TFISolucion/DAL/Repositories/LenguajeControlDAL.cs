using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class LenguajeControlDAL
	{
		
		#region Methods

		/// <summary>
		/// Saves a record to the LenguajeControl table.
		/// </summary>
		public void Insert(LenguajeControlEntidad lenguajeControl)
		{
			ValidationUtility.ValidateArgument("lenguajeControl", lenguajeControl);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Texto", lenguajeControl.Texto),
				new SqlParameter("@IdLenguaje", lenguajeControl.IdLenguaje),
				new SqlParameter("@Valor", lenguajeControl.Valor)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeControlInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the LenguajeControl table.
		/// </summary>
		public void Update(LenguajeControlEntidad lenguajeControl)
		{
			ValidationUtility.ValidateArgument("lenguajeControl", lenguajeControl);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Texto", lenguajeControl.Texto),
				new SqlParameter("@IdLenguaje", lenguajeControl.IdLenguaje),
				new SqlParameter("@Valor", lenguajeControl.Valor)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeControlUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the LenguajeControl table by its primary key.
		/// </summary>
		public void Delete(string texto, int idLenguaje)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Texto", texto),
				new SqlParameter("@IdLenguaje", idLenguaje)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeControlDelete", parameters);
		}


        /// <summary>
        /// Selects a single record from the LenguajeControl table.
        /// </summary>
        public LenguajeControlEntidad Select(string texto, int idLenguaje, string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Texto", texto),
				new SqlParameter("@IdLenguaje", idLenguaje),
                new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeControlSelect", parameters))
            {
                LenguajeControlEntidad LenguajeControlEntidad = new LenguajeControlEntidad();

                LenguajeControlEntidad = Mapeador.MapearFirst<LenguajeControlEntidad>(dt);

                return LenguajeControlEntidad;
            }
        }
		
		/// <summary>
		/// Selects all records from the LenguajeControl table.
		/// </summary>
		public List<LenguajeControlEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeControlSelectAll"))
			{
				List<LenguajeControlEntidad> lenguajeControlEntidadList = new List<LenguajeControlEntidad>();

                lenguajeControlEntidadList = Mapeador.Mapear<LenguajeControlEntidad>(dt);

				return lenguajeControlEntidadList;
			}
		}

		
		#endregion
	}
}
