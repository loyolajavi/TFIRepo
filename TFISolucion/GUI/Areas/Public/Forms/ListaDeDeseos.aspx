<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MiCuenta.Master" AutoEventWireup="true" CodeBehind="ListaDeDeseos.aspx.cs" Inherits="TFI.GUI.ListaDeDeseos" %>
<%@ MasterType VirtualPath="~/Shared/LayoutBasico.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentCuenta" runat="server">

      <div class="col-lg-12">
                        <h1 class="page-header">
                            Lista de desos <small>Mi Cuenta</small>
                      </h1>
        </div>
                   <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h3 id="myModalLabel">Eliminar</h3>
                        </div>
                        <div class="modal-body">
                            <p></p>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                            <button data-dismiss="modal" class="btn red" id="btnYes">Confirmar</button>
                        </div>
   </div><table class="table table-striped table-hover table-users">
    			<thead>
    				<tr>
    					
    					<th class="hidden-phone">Producto</th>
    					<th>Precio</th>
    					<th></th>
    					<th></th>
    				</tr>
    			</thead>

    			<tbody>
    				
    				<tr>
                        
    					<td class="hidden-phone">Producto ejemplo 1</td>
    					<td>22.50</td>                    	  					
    					<td><a class="btn mini blue-stripe" href="{site_url()}admin/editFront/1">Comprar</a></td>

                        <td><a href="#" class="confirm-delete btn mini red-stripe" role="button" data-title="johnny" data-id="1">Comprar</a></td>
                    </tr>
					<tr>
                        
    					<td class="hidden-phone">Producto ejemplo 2</td>
    					<td>41.00</td>

                    	  					
    					<td><a class="btn mini blue-stripe" href="{site_url()}admin/editFront/2">Eliminar</a></td>

                        <td><a href="#" class="confirm-delete btn mini red-stripe" role="button" data-title="kitty" data-id="2">Eliminar</a></td>
                    </tr>
                
	               </tbody>

    		</table>


</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
