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
			selectable : false,
			selectHelper : false,
			editable : false,
			eventLimit : true,
		});

	})

	function onChangeProjeto() {
		var id = $("#idProjeto").val()

		$.ajax({
			method : "POST",
			url : "agenda/getUsuarios",
			data : {
				"idProjeto" : id
			},
			success : function(data) {

				$("#idUsuario").find('option').remove().end().append('<option value="0">Todos</option>')

				for (i = 0; i < data.length; i++) {
					var obj = data[i]
					$("#idUsuario").append($("<option></option>").attr("value", obj.id).text(obj.username))
				}

				$("#idUsuario").select2("val", "0");
			}
		})
	}

	function onChangeUsuario() {
		var idProjeto = $("#idProjeto").val()
		var idUsuario = $("#idUsuario").val()

		$.ajax({
			method : "POST",
			url : "agenda/getAtividades",
			data : 'idProjeto=' + idProjeto + '&idUsuario=' + idUsuario,
			success : function(data) {

				for (i = 0; i < data.length; i++) {
					var obj = data[i]

					var event = {
						title: obj.nome,
						start: obj.dataInicio,
						end: obj.dataFim,
						color: obj.situacaoAtividade.cor
					}
					
					$('#divCalendar').fullCalendar('renderEvent', event, true)
					
				}
			}
		})
	}

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
