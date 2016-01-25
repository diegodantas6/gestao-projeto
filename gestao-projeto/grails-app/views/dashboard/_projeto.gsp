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
