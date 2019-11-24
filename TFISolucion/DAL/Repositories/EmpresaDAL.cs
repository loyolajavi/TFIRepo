using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class EmpresaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Empresa table.
		/// </summary>
		public void Insert(EmpresaEntidad empresa)
		{
			ValidationUtility.ValidateArgument("empresa", empresa);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", empresa.CUIT),
				new SqlParameter("@NombreEmpresa", empresa.NombreEmpresa)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EmpresaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Empresa table.
		/// </summary>
		public void Update(EmpresaEntidad empresa)
		{
			ValidationUtility.ValidateArgument("empresa", empresa);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", empresa.CUIT),
				new SqlParameter("@NombreEmpresa", empresa.NombreEmpresa)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EmpresaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Empresa table by its primary key.
		/// </summary>
		public void Delete(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EmpresaDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the Empresa table.
		/// </summary>
		public EmpresaEntidad Select(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EmpresaSelect", parameters))
			{
                EmpresaEntidad EmpresaEntidad = new EmpresaEntidad();

                EmpresaEntidad = Mapeador.MapearFirst<EmpresaEntidad>(dt);

                return EmpresaEntidad;

			}
		}


		/// <summary>
		/// Selects all records from the Empresa table.
		/// </summary>
		public List<EmpresaEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EmpresaSelectAll"))
			{
				List<EmpresaEntidad> empresaEntidadList = new List<EmpresaEntidad>();

                empresaEntidadList = Mapeador.Mapear<EmpresaEntidad>(dt);

				return empresaEntidadList;
			}
		}

		
		#endregion
	}
}
