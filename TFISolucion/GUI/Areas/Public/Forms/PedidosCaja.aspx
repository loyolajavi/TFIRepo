<%@ Page Title="Caja" Language="C#" MasterPageFile="~/Shared/LayoutBasico.Master" AutoEventWireup="true" CodeBehind="PedidosCaja.aspx.cs" Inherits="TFI.GUI.Areas.Public.Forms.PedidosCaja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ClientIDMode="Static" ContentPlaceHolderID="ContentPlaceHolderCuerpo" runat="server">

    <style>
        .box {
            background: #fbfbfb;
            border: 1px solid #e4e4e4;
            padding: 14px 18px 13px;
            margin: 0 0 30px 0;
            line-height: 23px;
        }

        .box-title {
            margin-top: 20px;
            padding-bottom: 0px;
        }

        .btn-box-registro {
            width: 200px;
            border-radius: 0px;
        }

        .barras {
            margin-top: 5px;
        }

        .pad-bordes {
            margin: 5px;
        }

        .link {
            color: black;
            padding-top: 10px;
            font-size: 12px;
        }
    </style>

    <% if (logueado == null)
       { %>

    <div>
        <h1>Ingreso</h1>
    </div>
    <hr />
    <div class="row">

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title">CREAR UNA CUENTA</h4>
                <hr class="barras" />
                <p id="msgRegistro">Por favor completar registro para poder continuar:</p>
                <div class="form_content clearfix">
                    <br />
                    <label for="box-registro">Registro</label>
                    <br />
                    <a href="#" id="btnNuevoRegistro" class="btn btn-warning btn-box-registro"><i class="glyphicon glyphicon-lock"></i> Registrarse como Cliente</a>
                    <br />
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6">
            <div class="box">
                <h4 class="box-title">INICIAR SESION</h4>
                <hr class="barras" />

                <div class="form_content clearfix">
                    <label for="box-registro">Usuario</label>
                    <br />
                    <input type="text" name="name" id="txtUser" />
                    <br />
                    <br />
                    <label for="box-registro">Contraseña</label>
                    <br />
                    <input type="password" id="txtPass" name="name" />
                    <br />
                    <a class="link" href="#">Olvido su contraseña?</a>
                    <br />
                    <br />
                    <div>
                        <a class="btn btn-success btn-box-registro" id="btnRegistro" href="#"><i class="glyphicon glyphicon-user"></i> Iniciar Sesion</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% }
       else
       { %>

        


    <% } %>
</asp:Content>
<asp:Content ID="Scripts" ContentPlaceHolderID="ScriptSection" runat="server">

    <script>

        $('#btnRegistro').click(function () {

            var user = $('#txtUser').val();
            var pass = $('#txtPass').val();

            $.ajax({
                type: "POST",
                url: "PedidosCaja.aspx/Login",
                data: JSON.stringify({
                    user: user,
                    pass: pass
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    alert(error);
                },
                success: function () { app.reload(); }
            });
        });
    </script>
</asp:Content>