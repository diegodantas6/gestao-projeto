<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!-- ChartJS 1.0.1 -->
<script
	src="${createLink(uri: '/adminlte/plugins/chartjs/Chart.min.js')}"></script>

<script>
$(document).ready(function() {
	$("#divAtividades").hide()
})

function getAtividades(id) {
	$("#divProjetos").hide()
	$("#divAtividades").show()
	alert('quero ver: ' + id)
}

function voltar() {
	$("#divProjetos").show()
	$("#divAtividades").hide()
}

</script>

</head>
<body>

	<!-- Main content -->
	<section class="content">

		<div id="divProjetos">

			<g:each in="${retorno}" var="json">

				<!-- DONUT CHART -->
				<div class="col-md-4">
					<div class="box box-primary">
						<div class="box-header with-border">
							<a href="#" id="link_${json.id}">
								<h3 class="box-title">
									${json.nome}
								</h3>
							</a>
						</div>
						<div class="box-body">
							<canvas id="${json.id}"></canvas>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>

				<!-- page script -->
				<script>
				$(function() {
					var idLink = "#link_" + ${json.id};

					$(idLink).unbind("click");

					$(idLink).click(function() {
						getAtividades(${json.id});
					});

					var id = "#" + ${json.id};
					var pieChartCanvas1 = $(id).get(0).getContext("2d");

					var pieChart1 = new Chart(pieChartCanvas1);

					var PieData = [ {
						value : ${json.faltando},
						color : "#f56954",
						highlight : "#f56954",
						label : "Faltando"
					}, {
						value : ${json.concluido},
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

					pieChart1.Doughnut(PieData, pieOptions);

				});
			</script>

			</g:each>

		</div>

		<div id="divAtividades">

			<ul>
				<li>Jose</li>
				<li>
					<h3>
						Design some buttons <small class="pull-right">20%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-aqua" style="width: 20%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">20% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
				<li>
					<h3>
						Create a nice theme <small class="pull-right">40%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-green" style="width: 40%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">40% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
				<li>
					<h3>
						Some task I need to do <small class="pull-right">60%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-red" style="width: 60%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">60% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
				<li>
					<h3>
						Make beautiful transitions <small class="pull-right">80%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-yellow" style="width: 80%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">80% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
			</ul>
			<ul>
				<li>Joao</li>
				<li>
					<h3>
						Design some buttons <small class="pull-right">20%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-aqua" style="width: 20%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">20% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
				<li>
					<h3>
						Create a nice theme <small class="pull-right">40%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-green" style="width: 40%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">40% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
				<li>
					<h3>
						Some task I need to do <small class="pull-right">60%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-red" style="width: 60%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">60% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
				<li>
					<h3>
						Make beautiful transitions <small class="pull-right">80%</small>
					</h3>
					<div class="progress xs">
						<div class="progress-bar progress-bar-yellow" style="width: 80%"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only">80% Complete</span>
						</div>
					</div>
				</li>
				<!-- end task item -->
			</ul>
			
			<input type="button" class="btn btn-primary" value="Voltar" onclick="voltar();">
		</div>

	</section>
	<!-- /.content -->

</body>
</html>
