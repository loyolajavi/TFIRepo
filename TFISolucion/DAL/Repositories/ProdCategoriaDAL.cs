using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
    public class ProdCategoriaDAL
    {
        #region Methods

        /// <summary>
        /// Saves a record to the ProdCategoria table.
        /// </summary>
        public void Insert(ProdCategoriaEntidad prodCategoria)
        {
            ValidationUtility.ValidateArgument("prodCategoria", prodCategoria);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", prodCategoria.IdProducto),
				new SqlParameter("@IdCategoria", prodCategoria.IdCategoria),
                new SqlParameter("@CUIT", prodCategoria.CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProdCategoriaInsert", parameters);
        }

        /// <summary>
        /// Deletes a record from the ProdCategoria table by its primary key.
        /// </summary>
        public void Delete(int idProducto, int idCategoria)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto),
				new SqlParameter("@IdCategoria", idCategoria)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProdCategoriaDelete", parameters);
        }

        /// <summary>
        /// Deletes a record from the ProdCategoria table by a foreign key.
        /// </summary>
        public void DeleteAllByIdCategoria(int idCategoria)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCategoria", idCategoria)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProdCategoriaDeleteAllByIdCategoria", parameters);
        }

        /// <summary>
        /// Deletes a record from the ProdCategoria table by a foreign key.
        /// </summary>
        public void DeleteAllByIdProducto(int idProducto)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProdCategoriaDeleteAllByIdProducto", parameters);
        }

        /// <summary>
        /// Selects all records from the ProdCategoria table by a foreign key.
        /// </summary>
        public List<ProdCategoriaEntidad> SelectAllByIdCategoria(int idCategoria)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCategoria", idCategoria)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProdCategoriaSelectAllByIdCategoria", parameters))
            {
                List<ProdCategoriaEntidad> prodCategoriaEntidadList = new List<ProdCategoriaEntidad>();

                prodCategoriaEntidadList = Mapeador.Mapear<ProdCategoriaEntidad>(dt);

                return prodCategoriaEntidadList;
            }
        }

        /// <summary>
        /// Selects all records from the ProdCategoria table by a foreign key.
        /// </summary>
        public List<ProdCategoriaEntidad> SelectAllByIdProducto(int idProducto)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProdCategoriaSelectAllByIdProducto", parameters))
            {
                List<ProdCategoriaEntidad> prodCategoriaEntidadList = new List<ProdCategoriaEntidad>();

                prodCategoriaEntidadList = Mapeador.Mapear<ProdCategoriaEntidad>(dt);

                return prodCategoriaEntidadList;
            }
        }

        #endregion Methods
    }
}