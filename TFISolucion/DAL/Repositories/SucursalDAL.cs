using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class SucursalDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Sucursal table.
		/// </summary>
		public void Insert(SucursalEntidad sucursal)
		{
			ValidationUtility.ValidateArgument("sucursal", sucursal);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripSucursal", sucursal.DescripSucursal),
				new SqlParameter("@DireccionSucursal", sucursal.DireccionSucursal),
				new SqlParameter("@CUIT", sucursal.CUIT)
			};

			sucursal.IdSucursal = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Sucursal table.
		/// </summary>
		public void Update(SucursalEntidad sucursal)
		{
			ValidationUtility.ValidateArgument("sucursal", sucursal);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", sucursal.IdSucursal),
				new SqlParameter("@DescripSucursal", sucursal.DescripSucursal),
				new SqlParameter("@DireccionSucursal", sucursal.DireccionSucursal),
				new SqlParameter("@CUIT", sucursal.CUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Sucursal table by its primary key.
		/// </summary>
		public void Delete(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Sucursal table by a foreign key.
		/// </summary>
		public void DeleteAllByDireccionSucursal(int direccionSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DireccionSucursal", direccionSucursal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalDeleteAllByDireccionSucursal", parameters);
		}

		/// <summary>
		/// Deletes a record from the Sucursal table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalDeleteAllByCUIT", parameters);
		}

		/// <summary>
		/// Selects a single record from the Sucursal table.
		/// </summary>
		public SucursalEntidad Select(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalSelect", parameters))
			{
                SucursalEntidad entidad = new SucursalEntidad();
                //       

                entidad = Mapeador.MapearFirst<SucursalEntidad>(dt);



                return entidad;
			}
		}

	

		/// <summary>
		/// Selects all records from the Sucursal table.
		/// </summary>
		public List<SucursalEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalSelectAll"))
			{
                List<SucursalEntidad> lista = new List<SucursalEntidad>();
                lista = Mapeador.Mapear<SucursalEntidad>(dt);

                return lista;
			}
		}

		

		/// <summary>
		/// Selects all records from the Sucursal table by a foreign key.
		/// </summary>
        public SucursalEntidad SucursalTraerPorDireccionSucursal(string CUIT, int direccionSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DireccionSucursal", direccionSucursal),
                new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalTraerPorDireccionSucursal", parameters))
			{
                SucursalEntidad unaRes = new SucursalEntidad();
                unaRes = Mapeador.MapearFirst<SucursalEntidad>(dt);

                return unaRes;

				
			}
		}

		/// <summary>
		/// Selects all records from the Sucursal table by a foreign key.
		/// </summary>
		public List<SucursalEntidad> SelectAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SucursalSelectAllByCUIT", parameters))
			{
                List<SucursalEntidad> lista = new List<SucursalEntidad>();
                lista = Mapeador.Mapear<SucursalEntidad>(dt);

                return lista;
			}
		}


        public List<StockSucursalEntidad> TraerSucursalesConStock(int IdProducto, int CantidadProd, string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
                new SqlParameter("@IdProducto", IdProducto),
                new SqlParameter("@CantidadProd", CantidadProd),
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TraerSucursalesConStock", parameters))
            {
                List<StockSucursalEntidad> lista = new List<StockSucursalEntidad>();
                lista = Mapeador.Mapear<StockSucursalEntidad>(dt);

                return lista;
            }
        }
	

		
		#endregion

        public void DescontarStockSucursal(PedidoDetalleEntidad unPedidoDetalle, int? IdSucursal, string elCUIT)
        {
            try 
	        {	        
		        ValidationUtility.ValidateArgument("unPedidoDetalle", unPedidoDetalle);
                SqlParameter[] parameters = new SqlParameter[]
			    {
				    new SqlParameter("@IdSucursal", IdSucursal),
				    new SqlParameter("@IdProducto", unPedidoDetalle.IdProducto),
				    new SqlParameter("@CantDescontar", unPedidoDetalle.Cantidad),
				    new SqlParameter("@CUIT", elCUIT)
			    };
                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DescontarStockSucursal", parameters);
	        }
	        catch (Exception es)
	        {
		        throw;
	        }

        }
    }
}
