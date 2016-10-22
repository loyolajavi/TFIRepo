using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;
namespace TFI.DAL.DAL
{
	public class StockSucursalDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the StockSucursal table.
		/// </summary>
		public void Insert(StockSucursalEntidad stockSucursal)
		{
			ValidationUtility.ValidateArgument("stockSucursal", stockSucursal);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", stockSucursal.IdProducto),
				new SqlParameter("@IdSucursal", stockSucursal.IdSucursal),
				new SqlParameter("@CantidadProducto", stockSucursal.CantidadProducto)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the StockSucursal table.
		/// </summary>
		public void Update(StockSucursalEntidad stockSucursal)
		{
			ValidationUtility.ValidateArgument("stockSucursal", stockSucursal);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", stockSucursal.IdProducto),
				new SqlParameter("@IdSucursal", stockSucursal.IdSucursal),
				new SqlParameter("@CantidadProducto", stockSucursal.CantidadProducto)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the StockSucursal table by its primary key.
		/// </summary>
		public void Delete(int idProducto, int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto),
				new SqlParameter("@IdSucursal", idSucursal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the StockSucursal table by a foreign key.
		/// </summary>
		public void DeleteAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalDeleteAllByIdProducto", parameters);
		}

		/// <summary>
		/// Deletes a record from the StockSucursal table by a foreign key.
		/// </summary>
		public void DeleteAllByIdSucursal(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalDeleteAllByIdSucursal", parameters);
		}

		/// <summary>
		/// Selects a single record from the StockSucursal table.
		/// </summary>
		public StockSucursalEntidad Select(int idProducto, int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto),
				new SqlParameter("@IdSucursal", idSucursal)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalSelect", parameters))
			{
                StockSucursalEntidad StockSucursalEntidad = new StockSucursalEntidad();
                //       

                StockSucursalEntidad = Mapeador.MapearFirst<StockSucursalEntidad>(dt);



                return StockSucursalEntidad;
			}
		}

	

		/// <summary>
		/// Selects all records from the StockSucursal table.
		/// </summary>
		public List<StockSucursalEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalSelectAll"))
			{
                List<StockSucursalEntidad> lista = new List<StockSucursalEntidad>();
                lista = Mapeador.Mapear<StockSucursalEntidad>(dt);

                return lista;
			}
		}

	

		/// <summary>
		/// Selects all records from the StockSucursal table by a foreign key.
		/// </summary>
		public List<StockSucursalEntidad> SelectAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalSelectAllByIdProducto", parameters))
			{
                List<StockSucursalEntidad> lista = new List<StockSucursalEntidad>();
                lista = Mapeador.Mapear<StockSucursalEntidad>(dt);

                return lista;
			}
		}

		/// <summary>
		/// Selects all records from the StockSucursal table by a foreign key.
		/// </summary>
		public List<StockSucursalEntidad> SelectAllByIdSucursal(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "StockSucursalSelectAllByIdSucursal", parameters))
			{
                List<StockSucursalEntidad> lista = new List<StockSucursalEntidad>();
                lista = Mapeador.Mapear<StockSucursalEntidad>(dt);

                return lista;
			}
		}

	
	


		#endregion
	}
}
