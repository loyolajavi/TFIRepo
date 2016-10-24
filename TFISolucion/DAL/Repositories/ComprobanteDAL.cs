using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class ComprobanteDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the Comprobante table.
		/// </summary>
		public void Insert(ComprobanteEntidad comprobante)
		{
			ValidationUtility.ValidateArgument("comprobante", comprobante);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NroComprobante", comprobante.NroComprobante),
				new SqlParameter("@IdSucursal", comprobante.IdSucursal),
				new SqlParameter("@CUIT", comprobante.CUIT),
				new SqlParameter("@IdTipoComprobante", comprobante.IdTipoComprobante),
				new SqlParameter("@IdComprobante", comprobante.IdComprobante),
				new SqlParameter("@FechaComprobante", comprobante.FechaComprobante),
				new SqlParameter("@IdPedido", comprobante.IdPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Comprobante table.
		/// </summary>
		public void Update(ComprobanteEntidad comprobante)
		{
			ValidationUtility.ValidateArgument("comprobante", comprobante);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NroComprobante", comprobante.NroComprobante),
				new SqlParameter("@IdSucursal", comprobante.IdSucursal),
				new SqlParameter("@CUIT", comprobante.CUIT),
				new SqlParameter("@IdTipoComprobante", comprobante.IdTipoComprobante),
				new SqlParameter("@IdComprobante", comprobante.IdComprobante),
				new SqlParameter("@FechaComprobante", comprobante.FechaComprobante),
				new SqlParameter("@IdPedido", comprobante.IdPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Comprobante table by its primary key.
		/// </summary>
		public void Delete(int nroComprobante, int idSucursal, int idTipoComprobante, string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NroComprobante", nroComprobante),
				new SqlParameter("@IdSucursal", idSucursal),
				new SqlParameter("@IdTipoComprobante", idTipoComprobante),
				new SqlParameter("@CUIT", CUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Comprobante table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDeleteAllByCUIT", parameters);
		}

		/// <summary>
		/// Deletes a record from the Comprobante table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDeleteAllByIdPedido", parameters);
		}

		/// <summary>
		/// Deletes a record from the Comprobante table by a foreign key.
		/// </summary>
		public void DeleteAllByIdSucursal(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDeleteAllByIdSucursal", parameters);
		}

		/// <summary>
		/// Deletes a record from the Comprobante table by a foreign key.
		/// </summary>
		public void DeleteAllByIdTipoComprobante(int idTipoComprobante)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoComprobante", idTipoComprobante)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDeleteAllByIdTipoComprobante", parameters);
		}

		/// <summary>
		/// Selects a single record from the Comprobante table.
		/// </summary>
		public ComprobanteEntidad Select(int nroComprobante, int idSucursal, int idTipoComprobante, string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NroComprobante", nroComprobante),
				new SqlParameter("@IdSucursal", idSucursal),
				new SqlParameter("@IdTipoComprobante", idTipoComprobante),
				new SqlParameter("@CUIT", CUIT)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelect", parameters))
			{
                ComprobanteEntidad ComprobanteEntidad = new ComprobanteEntidad();

                ComprobanteEntidad = Mapeador.MapearFirst<ComprobanteEntidad>(dt);

                return ComprobanteEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the Comprobante table.
		/// </summary>
		public List<ComprobanteEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelectAll"))
			{
				List<ComprobanteEntidad> comprobanteEntidadList = new List<ComprobanteEntidad>();

                comprobanteEntidadList = Mapeador.Mapear<ComprobanteEntidad>(dt);

				return comprobanteEntidadList;
			}
		}


		/// <summary>
		/// Selects all records from the Comprobante table by a foreign key.
		/// </summary>
		public List<ComprobanteEntidad> SelectAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelectAllByCUIT", parameters))
			{
				List<ComprobanteEntidad> comprobanteEntidadList = new List<ComprobanteEntidad>();

                comprobanteEntidadList = Mapeador.Mapear<ComprobanteEntidad>(dt);

				return comprobanteEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the Comprobante table by a foreign key.
		/// </summary>
		public List<ComprobanteEntidad> SelectAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelectAllByIdPedido", parameters))
			{
				List<ComprobanteEntidad> comprobanteEntidadList = new List<ComprobanteEntidad>();

                comprobanteEntidadList = Mapeador.Mapear<ComprobanteEntidad>(dt);

				return comprobanteEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the Comprobante table by a foreign key.
		/// </summary>
		public List<ComprobanteEntidad> SelectAllByIdSucursal(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelectAllByIdSucursal", parameters))
			{
				List<ComprobanteEntidad> comprobanteEntidadList = new List<ComprobanteEntidad>();

                comprobanteEntidadList = Mapeador.Mapear<ComprobanteEntidad>(dt);

				return comprobanteEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the Comprobante table by a foreign key.
		/// </summary>
		public List<ComprobanteEntidad> SelectAllByIdTipoComprobante(int idTipoComprobante)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoComprobante", idTipoComprobante)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelectAllByIdTipoComprobante", parameters))
			{
				List<ComprobanteEntidad> comprobanteEntidadList = new List<ComprobanteEntidad>();

                comprobanteEntidadList = Mapeador.Mapear<ComprobanteEntidad>(dt);

				return comprobanteEntidadList;
			}
		}

	
		#endregion
	}
}
