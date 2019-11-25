using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; 
using TFI.Entidades;
using System.Linq;


namespace TFI.DAL.DAL
{
    public class ProductoDAL
    {


        #region Methods

        /// <summary>
        /// Saves a record to the Producto table.
        /// </summary>
        public int Insert(ProductoEntidad producto)
        {
            ValidationUtility.ValidateArgument("producto", producto);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CodigoProducto", producto.CodigoProducto),
				new SqlParameter("@PrecioUnitario", producto.PrecioUnitario),
				new SqlParameter("@IdMarca", producto.miMarca.IdMarca),
				new SqlParameter("@CUIT", producto.CUIT),
				new SqlParameter("@IdIvaProducto", producto.IdIvaProducto),
				new SqlParameter("@DescripProducto", producto.DescripProducto),
				new SqlParameter("@URL", producto.URL)
			};

        return producto.IdProducto = Convert.ToInt32(SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoInsert", parameters));
        }

        /// <summary>
        /// Updates a record in the Producto table.
        /// </summary>
        public void Update(ProductoEntidad producto)
        {
            ValidationUtility.ValidateArgument("producto", producto);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", producto.IdProducto),
				new SqlParameter("@CodigoProducto", producto.CodigoProducto),
				new SqlParameter("@PrecioUnitario", producto.PrecioUnitario),
				new SqlParameter("@IdMarca", producto.miMarca.IdMarca),
				new SqlParameter("@CUIT", producto.CUIT),
				new SqlParameter("@IdIvaProducto", producto.IdIvaProducto),
				new SqlParameter("@DescripProducto", producto.DescripProducto),
				new SqlParameter("@URL", producto.URL),
                 new SqlParameter("@DescripLarga", producto.DescripLarga)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the Producto table by its primary key.
        /// </summary>
        public void Delete(int idProducto)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoDelete", parameters);
        }

        /// <summary>
        /// Deletes a record from the Producto table by a foreign key.
        /// </summary>
        public void DeleteAllByCUIT(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoDeleteAllByCUIT", parameters);
        }

       
        /// <summary>
        /// Deletes a record from the Producto table by a foreign key.
        /// </summary>
        public void DeleteAllByIdIvaProducto(int idIvaProducto)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdIvaProducto", idIvaProducto)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoDeleteAllByIdIvaProducto", parameters);
        }

        /// <summary>
        /// Deletes a record from the Producto table by a foreign key.
        /// </summary>
        public void DeleteAllByIdMarca(int idMarca)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMarca", idMarca)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoDeleteAllByIdMarca", parameters);
        }


      

        /// <summary>
        /// Selects a single record from the Producto table.
        /// </summary>
        public ProductoEntidad Select(string cuit, int idProducto)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cuit),
                new SqlParameter("@IdProducto", idProducto)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoSelect", parameters))
            {

                ProductoEntidad Producto = new ProductoEntidad();

                Producto = MapearMuchos(dt).First();

                return Producto;
            }
        }


        /// <summary>
        /// Selects all records from the Producto table.
        /// </summary>
        public List<ProductoEntidad> SelectAll()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoSelectAll"))
            {
                List<ProductoEntidad> productoEntidadList = new List<ProductoEntidad>();
                productoEntidadList = MapearMuchos(dt);

                return productoEntidadList;
            }
        }


        /// <summary>
        /// Selects all records from the Producto table by a foreign key.
        /// </summary>
        public List<ProductoEntidad> SelectAllByCUIT(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoSelectAllByCUIT", parameters))
            {
                List<ProductoEntidad> productoEntidadList = new List<ProductoEntidad>();

                productoEntidadList = MapearMuchos(dt);
                return productoEntidadList;
            }
        }

      


        public List<ProductoEntidad> ProductoSelectByDescripProducto(string cuit, string DescripProducto)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cuit),
                new SqlParameter("@DescripProducto", DescripProducto)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoSelectByDescripProducto", parameters))
            {

                List<ProductoEntidad> productoEntidadList = new List<ProductoEntidad>();
                productoEntidadList = MapearMuchos(dt);
                return productoEntidadList;
            }
        }


        /// <summary>
        /// Selects all records from the Producto table by a foreign key.
        /// </summary>
        public List<ProductoEntidad> ProductoSelectMasVendidosByCUIT(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoSelectMasVendidosByCUIT", parameters))
            {
                List<ProductoEntidad> productoEntidadList = new List<ProductoEntidad>();

                productoEntidadList = MapearMuchos(dt);
                return productoEntidadList;
            }
        }

        public List<ProductoEntidad> ProductoSelectByCategoria(string cuit, int idCategoria)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cuit),
                new SqlParameter("@IdCategoria", idCategoria)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProductoSelectByCategoria", parameters))
            {

                List<ProductoEntidad> productoEntidadList = new List<ProductoEntidad>();
                productoEntidadList = MapearMuchos(dt);
                return productoEntidadList;
            }
        }



        private List<ProductoEntidad> MapearMuchos(DataSet ds)
        {
            List<ProductoEntidad> ResUnosItem = new List<ProductoEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ProductoEntidad unItem = new ProductoEntidad();


                    unItem.IdProducto = (int)row["IdProducto"];
                    unItem.CodigoProducto = row["CodigoProducto"].ToString();
                    unItem.PrecioUnitario = (decimal)row["PrecioUnitario"];
                    unItem.miMarca = new MarcaEntidad();
                    unItem.miMarca.IdMarca = (int)row["IdMarca"];
                    unItem.CUIT = row["CUIT"].ToString();
                    unItem.IdIvaProducto = (int)row["IdIvaProducto"];
                    unItem.DescripProducto = row["DescripProducto"].ToString();
                    unItem.URL = row["URL"].ToString();
                    unItem.DescripLarga = row["DescripLarga"].ToString();
                    if (row["FecBaja"].ToString() != "")
                        unItem.FecBaja = DateTime.Parse(row["FecBaja"].ToString());

                    ResUnosItem.Add(unItem);
                }
                return ResUnosItem;
            }
            catch (Exception es)
            {
                throw;
            }

        }



        #endregion
    }
}
