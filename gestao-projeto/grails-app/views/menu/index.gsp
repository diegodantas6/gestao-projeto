<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!-- ChartJS 1.0.1 -->
<script
	src="${createLink(uri: '/adminlte/plugins/chartjs/Chart.min.js')}"></script>

</head>
<body>

	<!-- Main content -->
	<section class="content">

		<!-- DONUT CHART -->
		<div class="col-md-4">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Projeto 1</h3>
				</div>
				<div class="box-body">
					<canvas id="pieChart1"></canvas>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>

	</section>
	<!-- /.content -->

	<!-- page script -->
	<script>
		$(function() {
			/* ChartJS
			 * -------
			 * Here we will create a few charts using ChartJS
			 */

			//-------------
			//- PIE CHART -
			//-------------
			// Get context with jQuery - using jQuery's .get() method.
			var pieChartCanvas1 = $("#pieChart1").get(0).getContext("2d");
			//var pieChartCanvas2 = $("#pieChart2").get(0).getContext("2d");
			//var pieChartCanvas3 = $("#pieChart3").get(0).getContext("2d");

			var pieChart1 = new Chart(pieChartCanvas1);
			//var pieChart2 = new Chart(pieChartCanvas2);
			//var pieChart3 = new Chart(pieChartCanvas3);

			var PieData = [ {
				value : 60,
				color : "#f56954",
				highlight : "#f56954",
				label : "Faltando"
			}, {
				value : 40,
				color : "#00a65a",
				highlight : "#00a65a",
				label : "Concluido"
			} ];
			var pieOptions = {
				//Boolean - Whether we should show a stroke on each segment
				segmentShowStroke : true,
				//String - The colour of each segment stroke
				segmentStrokeColor : "#fff",
				//Number - The width of each segment stroke
				segmentStrokeWidth : 2,
				//Number - The percentage of the chart that we cut out of the middle
				percentageInnerCutout : 50, // This is 0 for Pie charts
				//Number - Amount of animation steps
				animationSteps : 100,
				//String - Animation easing effect
				animationEasing : "easeOutBounce",
				//Boolean - Whether we animate the rotation of the Doughnut
				animateRotate : true,
				//Boolean - Whether we animate scaling the Doughnut from the centre
				animateScale : false,
				//Boolean - whether to make the chart responsive to window resizing
				responsive : true,
				// Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
				maintainAspectRatio : true
			};
			//Create pie or douhnut chart
			// You can switch between pie and douhnut using the method below.
			pieChart1.Doughnut(PieData, pieOptions);
			//pieChart2.Doughnut(PieData, pieOptions);
			//pieChart3.Doughnut(PieData, pieOptions);

		});
	</script>

</body>
</html>
