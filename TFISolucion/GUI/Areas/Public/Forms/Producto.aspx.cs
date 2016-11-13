using System;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI
{
    public partial class Producto : System.Web.UI.Page
    {
        private ProductoCore _manager;
        public const string IMAGES_CONTAINER = "/Content/Images/Productos/";
        private int _IdProducto;
        protected ProductoEntidad producto;

        public Producto()
        {
            _manager = new ProductoCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int IdProducto = Convert.ToInt32(Request.QueryString["IdProducto"]);
            _IdProducto = IdProducto;

            producto = _manager.Find(IdProducto);

            Page.Title = producto.DescripProducto;

            LoadProducto(IdProducto);
        }

        private void LoadProducto(int IdProducto)
        {
            imgProducto.Attributes["src"] = string.Format("{0}{1}", IMAGES_CONTAINER, producto.URL);
        }

        //protected void btnComprar_ServerClick(object sender, EventArgs e)
        //{
        //    if (Session["Usuario"] != null)
        //    {
        //        UsuarioEntidad oUsuario = new UsuarioEntidad();
        //        oUsuario = (UsuarioEntidad)Session["Usuario"];
        //        HelperProductoCantidad hProductoCantidad = new HelperProductoCantidad();
        //        ProductoEntidad oProducto = new ProductoEntidad();
        //        oProducto.IdProducto = _IdProducto;
        //        //oProducto.PrecioUnitario = Convert.ToDecimal(lblPrecio.InnerText);
        //        //hProductoCantidad.Cantidad = Convert.ToInt32(sCantidad.Value);
        //        hProductoCantidad.Producto = oProducto;
        //        List<HelperProductoCantidad> lProducto = new List<HelperProductoCantidad>();
        //        lProducto.Add(hProductoCantidad);
        //        PedidoCore PedidoCore = new PedidoCore();
        //        PedidoCore.InsertSelect(lProducto, oUsuario, DateTime.Now, "alem 123");
        //    }
        //    else
        //    {
        //        //no puede comprar, debe estar registrado y haber iniciado sesion
        //    }
        //}
    }
}