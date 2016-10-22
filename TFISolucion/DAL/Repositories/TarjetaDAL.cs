using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class TarjetaDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the Tarjeta table.
		/// </summary>
		public void Insert(TarjetaEntidad tarjeta)
		{
			ValidationUtility.ValidateArgument("tarjeta", tarjeta);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", tarjeta.IdTarjeta),
				new SqlParameter("@IdTipoTarjeta", tarjeta.IdTipoTarjeta),
				new SqlParameter("@CUIT", tarjeta.CUIT),
				new SqlParameter("@NombreUsuario", tarjeta.NombreUsuario),
				new SqlParameter("@Titular", tarjeta.Titular),
				new SqlParameter("@Vencimiento", tarjeta.Vencimiento),
				new SqlParameter("@Numero", tarjeta.Numero),
				new SqlParameter("@CodSeguridad", tarjeta.CodSeguridad),
				new SqlParameter("@FecBaja", tarjeta.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Tarjeta table.
		/// </summary>
		public void Update(TarjetaEntidad tarjeta)
		{
			ValidationUtility.ValidateArgument("tarjeta", tarjeta);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", tarjeta.IdTarjeta),
				new SqlParameter("@IdTipoTarjeta", tarjeta.IdTipoTarjeta),
				new SqlParameter("@CUIT", tarjeta.CUIT),
				new SqlParameter("@NombreUsuario", tarjeta.NombreUsuario),
				new SqlParameter("@Titular", tarjeta.Titular),
				new SqlParameter("@Vencimiento", tarjeta.Vencimiento),
				new SqlParameter("@Numero", tarjeta.Numero),
				new SqlParameter("@CodSeguridad", tarjeta.CodSeguridad),
				new SqlParameter("@FecBaja", tarjeta.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Tarjeta table by its primary key.
		/// </summary>
		public void Delete(int idTarjeta)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", idTarjeta)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Tarjeta table by a foreign key.
		/// </summary>
		public void DeleteAllByIdTipoTarjeta(int idTipoTarjeta)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", idTipoTarjeta)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDeleteAllByIdTipoTarjeta", parameters);
		}

		/// <summary>
		/// Deletes a record from the Tarjeta table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT_NombreUsuario(int CUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDeleteAllByCUIT_NombreUsuario", parameters);
		}

		/// <summary>
		/// Selects a single record from the Tarjeta table.
		/// </summary>
		public TarjetaEntidad Select(int idTarjeta)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", idTarjeta)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelect", parameters))
			{
                TarjetaEntidad unTarjetaEntidad = new TarjetaEntidad();

                unTarjetaEntidad = Mapeador.MapearFirst<TarjetaEntidad>(dt);

                return unTarjetaEntidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the Tarjeta table.
		/// </summary>
		public List<TarjetaEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectAll"))
			{
				List<TarjetaEntidad> tarjetaEntidadList = new List<TarjetaEntidad>();

                tarjetaEntidadList = Mapeador.Mapear<TarjetaEntidad>(dt);

				return tarjetaEntidadList;
			}
		}

		
		/// <summary>
		/// Selects all records from the Tarjeta table by a foreign key.
		/// </summary>
		public List<TarjetaEntidad> SelectAllByIdTipoTarjeta(int idTipoTarjeta)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", idTipoTarjeta)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectAllByIdTipoTarjeta", parameters))
			{
				List<TarjetaEntidad> tarjetaEntidadList = new List<TarjetaEntidad>();

                tarjetaEntidadList = Mapeador.Mapear<TarjetaEntidad>(dt);

				return tarjetaEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the Tarjeta table by a foreign key.
		/// </summary>
		public List<TarjetaEntidad> SelectAllByCUIT_NombreUsuario(int CUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectAllByCUIT_NombreUsuario", parameters))
			{
				List<TarjetaEntidad> tarjetaEntidadList = new List<TarjetaEntidad>();

                tarjetaEntidadList = Mapeador.Mapear<TarjetaEntidad>(dt);

				return tarjetaEntidadList;
			}
		}

	
		#endregion
	}
}
