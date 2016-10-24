<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="GestionClientes.aspx.cs" Inherits="TFI.GUI.Intranet.GestionClientes" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Pedidos 
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

 <div class="table-responsive">
<table id="myTable" class="display table">

        <thead>  
          <tr>  
            <th>Nro Pedido</th>  
            <th>Cliente</th>  
            <th>Estado</th>  
            <th></th>  
          </tr>  
        </thead>  
        <tbody>  
          <tr>  
            <td>001</td>  
            <td>Anusha</td>  
            <td>Entregado</td>  
           
          </tr>  
          <tr>  
            <td>002</td>  
            <td>Charles</td>  
            <td>Rechazado</td>  
            
          </tr>  
          <tr>  
            <td>003</td>  
            <td>Sravani</td>  
            <td>Aprobado</td>  
            
          </tr>  
           <tr>  
            <td>004</td>  
            <td>Amar</td>  
            <td>Pendiente</td>  
            
          </tr>  
          <tr>  
            <td>005</td>  
            <td>Lakshmi</td>  
            <td>Pendiente</td>  
            
          </tr>  
          
        </tbody>  

</table>
</div>


</asp:Content>
