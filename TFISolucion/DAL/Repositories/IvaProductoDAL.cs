using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class IvaProductoDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the IvaProducto table.
		/// </summary>
		public void Insert(IvaProductoEntidad ivaProducto)
		{
			ValidationUtility.ValidateArgument("ivaProducto", ivaProducto);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@PorcentajeIvaProd", ivaProducto.PorcentajeIvaProd)
			};

			ivaProducto.IdIvaProducto = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IvaProductoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the IvaProducto table.
		/// </summary>
		public void Update(IvaProductoEntidad ivaProducto)
		{
			ValidationUtility.ValidateArgument("ivaProducto", ivaProducto);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdIvaProducto", ivaProducto.IdIvaProducto),
				new SqlParameter("@PorcentajeIvaProd", ivaProducto.PorcentajeIvaProd)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IvaProductoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the IvaProducto table by its primary key.
		/// </summary>
		public void Delete(int idIvaProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdIvaProducto", idIvaProducto)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IvaProductoDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the IvaProducto table.
		/// </summary>
		public IvaProductoEntidad Select(int idIvaProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdIvaProducto", idIvaProducto)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IvaProductoSelect", parameters))
			{
                IvaProductoEntidad IvaProductoEntidad = new IvaProductoEntidad();

                IvaProductoEntidad = Mapeador.MapearFirst<IvaProductoEntidad>(dt);

                return IvaProductoEntidad;
			}
		}



		/// <summary>
		/// Selects all records from the IvaProducto table.
		/// </summary>
		public List<IvaProductoEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IvaProductoSelectAll"))
			{
				List<IvaProductoEntidad> ivaProductoEntidadList = new List<IvaProductoEntidad>();

                ivaProductoEntidadList = Mapeador.Mapear<IvaProductoEntidad>(dt);

				return ivaProductoEntidadList;
			}
		}


		#endregion
	}
}
