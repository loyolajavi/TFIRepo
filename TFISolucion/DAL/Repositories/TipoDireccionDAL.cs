using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class TipoDireccionDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the TipoDireccion table.
		/// </summary>
		public void Insert(TipoDireccionEntidad tipoDireccion)
		{
			ValidationUtility.ValidateArgument("tipoDireccion", tipoDireccion);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripcionDireccion", tipoDireccion.DescripcionDireccion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoDireccionInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the TipoDireccion table.
		/// </summary>
		public void Update(TipoDireccionEntidad tipoDireccion)
		{
			ValidationUtility.ValidateArgument("tipoDireccion", tipoDireccion);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoDireccion", tipoDireccion.IdTipoDireccion),
				new SqlParameter("@DescripcionDireccion", tipoDireccion.DescripcionDireccion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoDireccionUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the TipoDireccion table by its primary key.
		/// </summary>
		public void Delete(int idTipoDireccion)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoDireccion", idTipoDireccion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoDireccionDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the TipoDireccion table.
		/// </summary>
		public TipoDireccionEntidad Select(int idTipoDireccion)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoDireccion", idTipoDireccion)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoDireccionSelect", parameters))
			{
                TipoDireccionEntidad entidad = new TipoDireccionEntidad();
                //       

                entidad = Mapeador.MapearFirst<TipoDireccionEntidad>(dt);



                return entidad;
			}
		}

	

		/// <summary>
		/// Selects all records from the TipoDireccion table.
		/// </summary>
		public List<TipoDireccionEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoDireccionSelectAll"))
			{
                List<TipoDireccionEntidad> lista = new List<TipoDireccionEntidad>();
                lista = Mapeador.Mapear<TipoDireccionEntidad>(dt);

                return lista;
			}
		}

	

		#endregion
	}
}
