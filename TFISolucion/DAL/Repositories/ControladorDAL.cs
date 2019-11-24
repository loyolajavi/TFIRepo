using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class ControladorDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Controlador table.
		/// </summary>
		public void Insert(ControladorEntidad controlador)
		{
			ValidationUtility.ValidateArgument("controlador", controlador);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEmpresa", controlador.IdEmpresa),
				new SqlParameter("@Pagina", controlador.Pagina),
				new SqlParameter("@Controlador", controlador.Controlador),
				new SqlParameter("@Descripcion", controlador.Descripcion)
			};

			controlador.IdControlador = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ControladorInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Controlador table.
		/// </summary>
		public void Update(ControladorEntidad controlador)
		{
			ValidationUtility.ValidateArgument("controlador", controlador);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdControlador", controlador.IdControlador),
				new SqlParameter("@IdEmpresa", controlador.IdEmpresa),
				new SqlParameter("@Pagina", controlador.Pagina),
				new SqlParameter("@Controlador", controlador.Controlador),
				new SqlParameter("@Descripcion", controlador.Descripcion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ControladorUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Controlador table by its primary key.
		/// </summary>
		public void Delete(int idControlador)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdControlador", idControlador)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ControladorDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Controlador table by a foreign key.
		/// </summary>
		public void DeleteAllByIdEmpresa(int idEmpresa)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEmpresa", idEmpresa)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ControladorDeleteAllByIdEmpresa", parameters);
		}

		/// <summary>
		/// Selects a single record from the Controlador table.
		/// </summary>
		public ControladorEntidad Select(int idControlador)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdControlador", idControlador)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ControladorSelect", parameters))
			{
                ControladorEntidad unControladorEntidad = new ControladorEntidad();

                unControladorEntidad = Mapeador.MapearFirst<ControladorEntidad>(dt);

                return unControladorEntidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the Controlador table.
		/// </summary>
		public List<ControladorEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ControladorSelectAll"))
			{
				List<ControladorEntidad> controladorEntidadList = new List<ControladorEntidad>();

                controladorEntidadList = Mapeador.Mapear<ControladorEntidad>(dt);

				return controladorEntidadList;
			}
		}

		
		#endregion
	}
}
