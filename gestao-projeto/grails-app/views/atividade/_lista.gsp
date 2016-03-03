<%@page import="java.text.SimpleDateFormat"%>
<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th>Situação</th>
			<th>Data Inicio</th>
			<th>Data Fim</th>
			<th>% Concluido</th>
			<th>Projeto</th>
			<th>Usuário</th>
			<th style="width: 75px;">Ações</th>
		</tr>
	</thead>
	<g:each in="${lista}" var="atividade">
		<tr>
			<td>${atividade.nome}</td>
			<td>${atividade.situacaoAtividade.nome}</td>
			<td>${new SimpleDateFormat('dd/MM/yyyy').format( atividade.dataInicio )}</td>
			<td>${new SimpleDateFormat('dd/MM/yyyy').format( atividade.dataFim )}</td>
			<td>${atividade.percentualConcluido}</td>
			<td>${atividade.projeto.nome}</td>
			<td>${atividade.usuario.username}</td>
			<td>
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<a href="javascript: visualizar(${atividade.id})"><i class="fa fa-eye" data-toggle="tooltip" title="Visualizar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: alterar(${atividade.id})"><i class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: excluir(${atividade.id})"><i class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
					</div>
				</div>
			</td>
		</tr>
	</g:each>
</table>

<!-- page script -->
<script>
	$(function() {

		$('#tabela').DataTable({
			"scrollX": true
		});

	});
</script>
