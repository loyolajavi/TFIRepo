using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class DireccionDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the Direccion table.
		/// </summary>
		public void Insert(DireccionEntidad direccion)
		{
			ValidationUtility.ValidateArgument("direccion", direccion);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Calle", direccion.Calle),
				new SqlParameter("@Numero", direccion.Numero),
				new SqlParameter("@Piso", direccion.Piso),
				new SqlParameter("@Departamento", direccion.Departamento),
				new SqlParameter("@Localidad", direccion.Localidad),
				new SqlParameter("@IdProvincia", direccion.IdProvincia),
				new SqlParameter("@IdTipoDireccion", direccion.IdTipoDireccion)
			};

			direccion.IdDireccion = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Direccion table.
		/// </summary>
		public void Update(DireccionEntidad direccion)
		{
			ValidationUtility.ValidateArgument("direccion", direccion);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", direccion.IdDireccion),
				new SqlParameter("@Calle", direccion.Calle),
				new SqlParameter("@Numero", direccion.Numero),
				new SqlParameter("@Piso", direccion.Piso),
				new SqlParameter("@Departamento", direccion.Departamento),
				new SqlParameter("@Localidad", direccion.Localidad),
				new SqlParameter("@IdProvincia", direccion.IdProvincia),
				new SqlParameter("@IdTipoDireccion", direccion.IdTipoDireccion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Direccion table by its primary key.
		/// </summary>
		public void Delete(int idDireccion)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Direccion table by a foreign key.
		/// </summary>
		public void DeleteAllByIdProvincia(int idProvincia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", idProvincia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionDeleteAllByIdProvincia", parameters);
		}

		/// <summary>
		/// Deletes a record from the Direccion table by a foreign key.
		/// </summary>
		public void DeleteAllByIdTipoDireccion(int idTipoDireccion)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoDireccion", idTipoDireccion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionDeleteAllByIdTipoDireccion", parameters);
		}

		/// <summary>
		/// Selects a single record from the Direccion table.
		/// </summary>
		public DireccionEntidad Select(int idDireccion)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelect", parameters))
			{
                DireccionEntidad DireccionEntidad = new DireccionEntidad();

                DireccionEntidad = Mapeador.MapearFirst<DireccionEntidad>(dt);

                return DireccionEntidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the Direccion table.
		/// </summary>
		public List<DireccionEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelectAll"))
			{
				List<DireccionEntidad> direccionEntidadList = new List<DireccionEntidad>();

                direccionEntidadList = Mapeador.Mapear<DireccionEntidad>(dt);

				return direccionEntidadList;
			}
		}


		/// <summary>
		/// Selects all records from the Direccion table by a foreign key.
		/// </summary>
		public List<DireccionEntidad> SelectAllByIdProvincia(int idProvincia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", idProvincia)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelectAllByIdProvincia", parameters))
			{
				List<DireccionEntidad> direccionEntidadList = new List<DireccionEntidad>();

                direccionEntidadList = Mapeador.Mapear<DireccionEntidad>(dt);

				return direccionEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the Direccion table by a foreign key.
		/// </summary>
		public List<DireccionEntidad> SelectAllByIdTipoDireccion(int idTipoDireccion)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoDireccion", idTipoDireccion)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelectAllByIdTipoDireccion", parameters))
			{
				List<DireccionEntidad> direccionEntidadList = new List<DireccionEntidad>();

                direccionEntidadList = Mapeador.Mapear<DireccionEntidad>(dt);

				return direccionEntidadList;
			}
		}


		#endregion
	}
}
