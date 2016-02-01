<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!--CSS-->
<!--FullCalendar-->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/fullcalendar.min.css')}">
<link rel="stylesheet" media="print"
	href="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/fullcalendar.print.css')}">

<!--JS-->
<!--FullCalendar-->
<script
	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/lib/moment.min.js')}"></script>
<script
	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/fullcalendar.min.js')}"></script>
<script
	src="${createLink(uri: '/adminlte/plugins/fullcalendar-2.6.0/lang-all.js')}"></script>


<script>
	$(document).ready(function() {
		$(".select2").select2();

		$('#divCalendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			defaultDate : '2016-01-12',
			lang : 'pt-br',
			selectable : true,
			selectHelper : true,
			editable : true,
			eventLimit : true,
		});

	})
</script>

</head>
<body>

	<!-- Main content -->
	<section class="content">

		<div class="row">

			<g:render template="filtro" />

			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="divCalendar"></div>
					</div>
				</div>
			</div>

		</div>

	</section>
	<!-- /.content -->

</body>
</html>
