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

	function getProjetos() {
		$.ajax({
			method : "POST",
			url : "dashboard/getProjetos",
			data : {},
			success : function(data) {
				$("#divConteudo").html(data)
			}
		})
	}

	function getAtividades(id) {
		$.ajax({
			method : "POST",
			url : "dashboard/getAtividades",
			data : {
				"id" : id
			},
			success : function(data) {
				$("#divConteudo").html(data)
			}
		})
	}
</script>

<style>
#divCalendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>


</head>
<body>

	<!-- Main content -->
	<section class="content">

		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Filtros</h3>
			</div>

			<div class="box-body">

				<div class="col-sm-6 form-group" id="div_projeto">
					<label>Projeto</label> <select class="form-control select2"
						name="atividade.projeto">
						<option value="">Selecione o Projeto</option>
						<g:each
							in="${br.com.gestaoProjeto.Projeto.createCriteria().list{ order('nome') }}"
							var="projeto">
							<g:if test="${atividade?.projeto?.id == projeto.id}">
								<option value="${projeto.id}" selected="selected">
									${projeto.nome}
								</option>
							</g:if>
							<g:else>
								<option value="${projeto.id}">
									${projeto.nome}
								</option>
							</g:else>
						</g:each>
					</select>
				</div>

				<div class="col-sm-6 form-group" id="div_usuario">
					<label>Usuário</label> <select class="form-control select2"
						name="atividade.usuario">
						<option value="">Selecione o Usuário</option>
						<g:each
							in="${br.com.controleAcesso.Usuario.createCriteria().list{

									usuarioGrupo {
										eq('realizaAtividade', br.com.teste.enums.SimNao.SIM)
									}
								
									eq('enabled', true)
									order('username') 
								}}"
							var="usuario">
							<g:if test="${atividade?.usuario?.id == usuario.id}">
								<option value="${usuario.id}" selected="selected">
									${usuario.username}
								</option>
							</g:if>
							<g:else>
								<option value="${usuario.id}">
									${usuario.username}
								</option>
							</g:else>
						</g:each>
					</select>
				</div>

			</div>

		</div>

		<div class="box box-primary col-md-9">
			<div class="box-header with-border">
				<h3 class="box-title">Agenda</h3>
			</div>

			<div class="box-body">

				<div id="divCalendar"></div>

			</div>
		
		</div>

	</section>
	<!-- /.content -->

</body>
</html>
