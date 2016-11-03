using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class DireccionUsuarioDAL
	{


		#region Methods


        /// <summary>
        /// Saves a record to the DireccionUsuario table.
        /// </summary>
        public void Insert(DireccionUsuarioEntidad direccionUsuario)
        {
            ValidationUtility.ValidateArgument("direccionUsuario", direccionUsuario);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", direccionUsuario.IdDireccion),
				new SqlParameter("@cuit", direccionUsuario.CUIT),
				new SqlParameter("@NombreUsuario", direccionUsuario.NombreUsuario),
                                new SqlParameter("@Predeterminada", direccionUsuario.Predeterminada)

			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioInsert", parameters);
        }

        /// <summary>
        /// Deletes a record from the DireccionUsuario table by its primary key.
        /// </summary>
        public void Delete(int idDireccion, string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion),
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioDelete", parameters);
        }

        /// <summary>
        /// Deletes a record from the DireccionUsuario table by a foreign key.
        /// </summary>
        public void DeleteAllByIdDireccion(int idDireccion)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioDeleteAllByIdDireccion", parameters);
        }

        /// <summary>
        /// Deletes a record from the DireccionUsuario table by a foreign key.
        /// </summary>
        public void DeleteAllBycuit_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioDeleteAllBycuit_NombreUsuario", parameters);
        }

        /// <summary>
        /// Selects a single record from the DireccionUsuario table.
        /// </summary>
        public DireccionUsuarioEntidad Select(int idDireccion, string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion),
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioSelect", parameters))
            {
                DireccionUsuarioEntidad DireccionUsuarioEntidad = new DireccionUsuarioEntidad();

                DireccionUsuarioEntidad = Mapeador.MapearFirst<DireccionUsuarioEntidad>(dt);

                return DireccionUsuarioEntidad;

            }
        }



        /// <summary>
        /// Selects all records from the DireccionUsuario table by a foreign key.
        /// </summary>
        public List<DireccionUsuarioEntidad> SelectAllByIdDireccion(int idDireccion)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioSelectAllByIdDireccion", parameters))
            {
                List<DireccionUsuarioEntidad> direccionUsuarioEntidadList = new List<DireccionUsuarioEntidad>();

                direccionUsuarioEntidadList = Mapeador.Mapear<DireccionUsuarioEntidad>(dt);

                return direccionUsuarioEntidadList;
            }
        }
        /// <summary>
        /// Selects all records from the DireccionUsuario table by a foreign key.
        /// </summary>
        public List<DireccionUsuarioEntidad> SelectAllBycuit_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioSelectAllBycuit_NombreUsuario", parameters))
            {
                List<DireccionUsuarioEntidad> direccionUsuarioEntidadList = new List<DireccionUsuarioEntidad>();

                direccionUsuarioEntidadList = Mapeador.Mapear<DireccionUsuarioEntidad>(dt);

                return direccionUsuarioEntidadList;
            }
        }

        /// <summary>
        /// Updates a record in the Direccion table.
        /// </summary>
        public void Update(DireccionUsuarioEntidad direccion)
        {
            ValidationUtility.ValidateArgument("direccion", direccion);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", direccion.IdDireccion),
				new SqlParameter("@CUIT", direccion.CUIT),
				new SqlParameter("@NombreUsuario", direccion.NombreUsuario),
				new SqlParameter("@Predeterminada", direccion.Predeterminada),
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioUPDATE", parameters);
        }

		

		#endregion
	}
}
