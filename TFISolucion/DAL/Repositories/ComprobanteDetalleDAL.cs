using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class ComprobanteDetalleDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the ComprobanteDetalle table.
		/// </summary>
		public void Insert(ComprobanteDetalleEntidad comprobanteDetalle)
		{
			ValidationUtility.ValidateArgument("comprobanteDetalle", comprobanteDetalle);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdComprobanteDetalle", comprobanteDetalle.IdComprobanteDetalle),
				new SqlParameter("@NroComprobante", comprobanteDetalle.NroComprobante),
				new SqlParameter("@IdSucursal", comprobanteDetalle.IdSucursal),
				new SqlParameter("@IdTipoComprobante", comprobanteDetalle.IdTipoComprobante),
				new SqlParameter("@CUIT", comprobanteDetalle.CUIT),
				new SqlParameter("@IdProducto", comprobanteDetalle.IdProducto),
				new SqlParameter("@CantidadProducto", comprobanteDetalle.CantidadProducto),
				new SqlParameter("@PrecioUnitarioFact", comprobanteDetalle.PrecioUnitarioFact)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the ComprobanteDetalle table.
		/// </summary>
		public void Update(ComprobanteDetalleEntidad comprobanteDetalle)
		{
			ValidationUtility.ValidateArgument("comprobanteDetalle", comprobanteDetalle);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdComprobanteDetalle", comprobanteDetalle.IdComprobanteDetalle),
				new SqlParameter("@NroComprobante", comprobanteDetalle.NroComprobante),
				new SqlParameter("@IdSucursal", comprobanteDetalle.IdSucursal),
				new SqlParameter("@IdTipoComprobante", comprobanteDetalle.IdTipoComprobante),
				new SqlParameter("@CUIT", comprobanteDetalle.CUIT),
				new SqlParameter("@IdProducto", comprobanteDetalle.IdProducto),
				new SqlParameter("@CantidadProducto", comprobanteDetalle.CantidadProducto),
				new SqlParameter("@PrecioUnitarioFact", comprobanteDetalle.PrecioUnitarioFact)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the ComprobanteDetalle table by its primary key.
		/// </summary>
		public void Delete(int idComprobanteDetalle, int nroComprobante, int idSucursal, int idTipoComprobante, int cUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdComprobanteDetalle", idComprobanteDetalle),
				new SqlParameter("@NroComprobante", nroComprobante),
				new SqlParameter("@IdSucursal", idSucursal),
				new SqlParameter("@IdTipoComprobante", idTipoComprobante),
				new SqlParameter("@CUIT", cUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the ComprobanteDetalle table by a foreign key.
		/// </summary>
		public void DeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT(int nroComprobante, int idSucursal, int idTipoComprobante, int cUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NroComprobante", nroComprobante),
				new SqlParameter("@IdSucursal", idSucursal),
				new SqlParameter("@IdTipoComprobante", idTipoComprobante),
				new SqlParameter("@CUIT", cUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleDeleteAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT", parameters);
		}

		/// <summary>
		/// Deletes a record from the ComprobanteDetalle table by a foreign key.
		/// </summary>
		public void DeleteAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleDeleteAllByIdProducto", parameters);
		}

		/// <summary>
		/// Selects a single record from the ComprobanteDetalle table.
		/// </summary>
		public ComprobanteDetalleEntidad Select(int idComprobanteDetalle, int nroComprobante, int idSucursal, int idTipoComprobante, int cUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdComprobanteDetalle", idComprobanteDetalle),
				new SqlParameter("@NroComprobante", nroComprobante),
				new SqlParameter("@IdSucursal", idSucursal),
				new SqlParameter("@IdTipoComprobante", idTipoComprobante),
				new SqlParameter("@CUIT", cUIT)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleSelect", parameters))
			{

                ComprobanteDetalleEntidad ComprobanteDetalleEntidad = new ComprobanteDetalleEntidad();

                ComprobanteDetalleEntidad = Mapeador.MapearFirst<ComprobanteDetalleEntidad>(dt);

                return ComprobanteDetalleEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the ComprobanteDetalle table.
		/// </summary>
		public List<ComprobanteDetalleEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleSelectAll"))
			{
				List<ComprobanteDetalleEntidad> comprobanteDetalleEntidadList = new List<ComprobanteDetalleEntidad>();

                comprobanteDetalleEntidadList = Mapeador.Mapear<ComprobanteDetalleEntidad>(dt);

				return comprobanteDetalleEntidadList;
			}
		}


		/// <summary>
		/// Selects all records from the ComprobanteDetalle table by a foreign key.
		/// </summary>
		public List<ComprobanteDetalleEntidad> SelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT(int nroComprobante, int idSucursal, int idTipoComprobante, int cUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NroComprobante", nroComprobante),
				new SqlParameter("@IdSucursal", idSucursal),
				new SqlParameter("@IdTipoComprobante", idTipoComprobante),
				new SqlParameter("@CUIT", cUIT)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleSelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT", parameters))
			{
				List<ComprobanteDetalleEntidad> comprobanteDetalleEntidadList = new List<ComprobanteDetalleEntidad>();

                comprobanteDetalleEntidadList = Mapeador.Mapear<ComprobanteDetalleEntidad>(dt);
				return comprobanteDetalleEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the ComprobanteDetalle table by a foreign key.
		/// </summary>
		public List<ComprobanteDetalleEntidad> SelectAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleSelectAllByIdProducto", parameters))
			{
				List<ComprobanteDetalleEntidad> comprobanteDetalleEntidadList = new List<ComprobanteDetalleEntidad>();

                comprobanteDetalleEntidadList = Mapeador.Mapear<ComprobanteDetalleEntidad>(dt);

				return comprobanteDetalleEntidadList;
			}
		}

		

		#endregion
	}
}
