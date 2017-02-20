<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/LayoutAdministracion.Master" AutoEventWireup="true" CodeBehind="Graficos.aspx.cs" Inherits="TFI.GUI.Areas.Intranet.Forms.Graficos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiContenido" runat="server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    // Global variable to hold data  
    // Load the Visualization API and the piechart package.  
    google.load('visualization', '1', { packages: ['corechart'] });
</script>  
 
<script type="text/javascript">
    $(function () {
        $.ajax(
        {
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Graficos.aspx/GetChartData3',
            data: '{}',
            success: function (response) {
                drawchart3(response.d); // calling method  
            },

            error: function () {
                alert("Error loading data! Please try again.");
            }
        });
    })

    function drawchart3(dataValues) {
        // Callback that creates and populates a data table,  
        // instantiates the pie chart, passes in the data and  
        // draws it.  
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Mes');
        data.addColumn('number', 'Cantidad');


        for (var i = 0; i < dataValues.length; i++) {
            data.addRow([dataValues[i].Mes, dataValues[i].Cantidad]);
        }
        // Instantiate and draw our chart, passing in some options  

        var chart = new google.visualization.BarChart(document.getElementById('chartdiv3'));

        chart.draw(data,
        {
            title: "Monto de ventas por Mes",
            position: "top",
            fontsize: "14px",
            chartArea: { width: '50%' },
        });
    }
</script>

<script type="text/javascript">
    $(function () {
        $.ajax(
        {
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Graficos.aspx/GetChartData2',
            data: '{}',
            success: function (response) {
                drawchart2(response.d); // calling method  
            },

            error: function () {
                alert("Error loading data! Please try again.");
            }
        });
    })

    function drawchart2(dataValues) {
        // Callback that creates and populates a data table,  
        // instantiates the pie chart, passes in the data and  
        // draws it.  
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Producto');
        data.addColumn('number', 'Cantidad');


        for (var i = 0; i < dataValues.length; i++) {
            data.addRow([dataValues[i].Producto, dataValues[i].Cantidad]);
        }
        // Instantiate and draw our chart, passing in some options  

        var chart = new google.visualization.PieChart(document.getElementById('chartdiv2'));

        chart.draw(data,
        {
            title: "Productos mas vendidos",
            position: "top",
            fontsize: "14px",
            chartArea: { width: '50%' },
        });
    }
</script>

<script type="text/javascript">
    $(function () {
        $.ajax(
        {
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Graficos.aspx/GetChartData',
            data: '{}',
            success: function (response) {
                drawchart1(response.d); // calling method  
            },

            error: function () {
                alert("Error loading data! Please try again.");
            }
        });
    })

    function drawchart1(dataValues) {
        // Callback that creates and populates a data table,  
        // instantiates the pie chart, passes in the data and  
        // draws it.  
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Categoria');
        data.addColumn('number', 'Productos');
     

        for (var i = 0; i < dataValues.length; i++) {
            data.addRow([dataValues[i].Categoria, dataValues[i].Productos]);
        }
        // Instantiate and draw our chart, passing in some options  

        var chart = new google.visualization.PieChart(document.getElementById('chartdiv'));

        chart.draw(data,
        {
            title: "Productos por Categoria",
            position: "top",
            fontsize: "14px",
            chartArea: { width: '50%' },
        });
    }
</script>

    <script type="text/javascript">
        $(function () {
            $.ajax(
            {
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Graficos.aspx/GetChartData1',
                data: '{}',
                success: function (response) {
                    drawchart(response.d); // calling method  
                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })

        function drawchart(dataValues) {
            // Callback that creates and populates a data table,  
            // instantiates the pie chart, passes in the data and  
            // draws it.  
            var data = new google.visualization.DataTable();

            data.addColumn('string', 'Mes');
            data.addColumn('number', 'Cantidad');


            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Mes, dataValues[i].Cantidad]);
            }
            // Instantiate and draw our chart, passing in some options  

            var chart = new google.visualization.ColumnChart(document.getElementById('chartdiv1'));

            chart.draw(data,
            {
                title: "Ventas periodo",
                position: "top",
                fontsize: "14px",
                chartArea: { width: '50%' },
            });
        }
</script>

     <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12"> <br />
            <h1 class="page-header">
                Dashboard <small>Revisión de estadisticas</small>
            </h1>
            <ol class="breadcrumb">
                <li class="active">
                    <i class="fa fa-dashboard"></i> Dashboard
                </li>
            </ol>
        </div>
    </div>
     <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i>Información de ventas</h3>
                </div>
                <div class="panel-body">
                    <div id="chartdiv1"></div>
                  <%--  <div class="text-right">
                        <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                    </div>--%>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Información de categorías </h3>
                </div>
                <div class="panel-body">
                    <div id="chartdiv"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Ranking de productos </h3>
                </div>
                <div class="panel-body">
                    <div id="chartdiv2"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i>Ventas valorizadas</h3>
                </div>
                <div class="panel-body">
                    <div id="chartdiv3"></div>
                </div>
            </div>
        </div>
        </div>
    <div id="chartdiv12" style="width: 600px; height: 350px;"> </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
