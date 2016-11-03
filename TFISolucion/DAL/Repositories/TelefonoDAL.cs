using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class TelefonoDAL
	{


		#region Methods

        /// <summary>
        /// Saves a record to the Telefono table.
        /// </summary>
        public void Insert(TelefonoEntidad telefono)
        {
            ValidationUtility.ValidateArgument("telefono", telefono);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", telefono.CUIT),
				new SqlParameter("@NombreUsuario", telefono.NombreUsuario),
				new SqlParameter("@NroTelefono", telefono.NroTelefono),
				new SqlParameter("@CodArea", telefono.CodArea),
				new SqlParameter("@IdTipoTel", telefono.IdTipoTel)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoInsert", parameters);
        }

        /// <summary>
        /// Deletes a record from the Telefono table by its primary key.
        /// </summary>
        public void Delete(string cuit, string nombreUsuario, string nroTelefono, string codArea, int idTipoTel)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario),
				new SqlParameter("@NroTelefono", nroTelefono),
				new SqlParameter("@CodArea", codArea),
				new SqlParameter("@IdTipoTel", idTipoTel)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoDelete", parameters);
        }

        /// <summary>
        /// Deletes a record from the Telefono table by a foreign key.
        /// </summary>
        public void DeleteAllByIdTipoTel(int idTipoTel)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTel", idTipoTel)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoDeleteAllByIdTipoTel", parameters);
        }

        /// <summary>
        /// Deletes a record from the Telefono table by a foreign key.
        /// </summary>
        public void DeleteAllBycuit_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoDeleteAllBycuit_NombreUsuario", parameters);
        }

        /// <summary>
        /// Selects a single record from the Telefono table.
        /// </summary>
        public TelefonoEntidad Select(string cuit, string nombreUsuario, string nroTelefono, string codArea, int idTipoTel)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario),
				new SqlParameter("@NroTelefono", nroTelefono),
				new SqlParameter("@CodArea", codArea),
				new SqlParameter("@IdTipoTel", idTipoTel)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoSelect", parameters))
            {
                TelefonoEntidad entidad = new TelefonoEntidad();
                //       

                entidad = Mapeador.MapearFirst<TelefonoEntidad>(dt);



                return entidad;
            }
        }



        /// <summary>
        /// Selects all records from the Telefono table by a foreign key.
        /// </summary>
        public List<TelefonoEntidad> SelectAllByIdTipoTel(int idTipoTel)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTel", idTipoTel)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoSelectAllByIdTipoTel", parameters))
            {
                List<TelefonoEntidad> lista = new List<TelefonoEntidad>();
                lista = Mapeador.Mapear<TelefonoEntidad>(dt);

                return lista;
            }
        }

        /// <summary>
        /// Selects all records from the Telefono table by a foreign key.
        /// </summary>
        public List<TelefonoEntidad> SelectAllBycuit_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoSelectAllBycuit_NombreUsuario", parameters))
            {
                List<TelefonoEntidad> lista = new List<TelefonoEntidad>();
                lista = Mapeador.Mapear<TelefonoEntidad>(dt);

                return lista;
            }
        }
        public List<TelefonoEntidad> SelectTelefonosDeUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario),
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoSelectAllByUsuario", parameters))
            {
                List<TelefonoEntidad> listadetelefonos = new List<TelefonoEntidad>();

                listadetelefonos = Mapeador.Mapear<TelefonoEntidad>(dt);

                return listadetelefonos;
            }
        }


        /// <summary>
        /// Updates a record in the Tarjeta table.
        /// </summary>
        public void UpdateDatosPersonales(TelefonoEntidad telefono)
        {
            ValidationUtility.ValidateArgument("tarjeta", telefono);

            SqlParameter[] parameters = new SqlParameter[]
			{
				
				new SqlParameter("@cuit", telefono.CUIT),
				new SqlParameter("@NombreUsuario", telefono.NombreUsuario),
				new SqlParameter("@NroTelefono", telefono.NroTelefono),
				new SqlParameter("@IdTipoTel", telefono.IdTipoTel)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TelefonoUpdateDatosPersonales", parameters);
        }




		#endregion
	}
}
