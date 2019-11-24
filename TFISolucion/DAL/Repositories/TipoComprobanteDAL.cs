using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;
namespace TFI.DAL.DAL
{
	public class TipoComprobanteDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the TipoComprobante table.
		/// </summary>
		public void Insert(TipoComprobanteEntidad tipoComprobante)
		{
			ValidationUtility.ValidateArgument("tipoComprobante", tipoComprobante);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripTipoComprobante", tipoComprobante.DescripTipoComprobante)
			};

			tipoComprobante.IdTipoComprobante = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoComprobanteInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the TipoComprobante table.
		/// </summary>
		public void Update(TipoComprobanteEntidad tipoComprobante)
		{
			ValidationUtility.ValidateArgument("tipoComprobante", tipoComprobante);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoComprobante", tipoComprobante.IdTipoComprobante),
				new SqlParameter("@DescripTipoComprobante", tipoComprobante.DescripTipoComprobante)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoComprobanteUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the TipoComprobante table by its primary key.
		/// </summary>
		public void Delete(int idTipoComprobante)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoComprobante", idTipoComprobante)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoComprobanteDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the TipoComprobante table.
		/// </summary>
		public TipoComprobanteEntidad Select(int idTipoComprobante)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoComprobante", idTipoComprobante)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoComprobanteSelect", parameters))
			{
                TipoComprobanteEntidad entidad = new TipoComprobanteEntidad();
                //       

                entidad = Mapeador.MapearFirst<TipoComprobanteEntidad>(dt);



                return entidad;
			}
		}

		
		/// <summary>
		/// Selects all records from the TipoComprobante table.
		/// </summary>
		public List<TipoComprobanteEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoComprobanteSelectAll"))
			{
                List<TipoComprobanteEntidad> lista = new List<TipoComprobanteEntidad>();
                lista = Mapeador.Mapear<TipoComprobanteEntidad>(dt);

                return lista;
			}
		}

	
	

		#endregion
	}
}
