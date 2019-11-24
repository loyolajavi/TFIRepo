using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class TipoTarjetaDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the TipoTarjeta table.
		/// </summary>
		public void Insert(TipoTarjetaEntidad tipoTarjeta)
		{
			ValidationUtility.ValidateArgument("tipoTarjeta", tipoTarjeta);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", tipoTarjeta.IdTipoTarjeta),
				new SqlParameter("@Descripcion", tipoTarjeta.Descripcion),
				new SqlParameter("@FecBaja", tipoTarjeta.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoTarjetaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the TipoTarjeta table.
		/// </summary>
		public void Update(TipoTarjetaEntidad tipoTarjeta)
		{
			ValidationUtility.ValidateArgument("tipoTarjeta", tipoTarjeta);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", tipoTarjeta.IdTipoTarjeta),
				new SqlParameter("@Descripcion", tipoTarjeta.Descripcion),
				new SqlParameter("@FecBaja", tipoTarjeta.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoTarjetaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the TipoTarjeta table by its primary key.
		/// </summary>
		public void Delete(int idTipoTarjeta)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", idTipoTarjeta)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoTarjetaDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the TipoTarjeta table.
		/// </summary>
		public TipoTarjetaEntidad Select(int idTipoTarjeta)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", idTipoTarjeta)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoTarjetaSelect", parameters))
			{
                TipoTarjetaEntidad unTipoTarjetaEntidad = new TipoTarjetaEntidad();

                unTipoTarjetaEntidad = Mapeador.MapearFirst<TipoTarjetaEntidad>(dt);

                return unTipoTarjetaEntidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the TipoTarjeta table.
		/// </summary>
		public List<TipoTarjetaEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoTarjetaSelectAll"))
			{
				List<TipoTarjetaEntidad> tipoTarjetaEntidadList = new List<TipoTarjetaEntidad>();

                tipoTarjetaEntidadList = Mapeador.Mapear<TipoTarjetaEntidad>(dt);

				return tipoTarjetaEntidadList;
			}
		}

		

		#endregion
	}
}
