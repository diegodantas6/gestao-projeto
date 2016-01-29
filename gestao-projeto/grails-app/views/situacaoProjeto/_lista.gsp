<%@page import="java.text.SimpleDateFormat"%>
<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th>Exibe DashBoard</th>
			<th style="width: 75px;">Ações</th>
		</tr>
	</thead>
	<g:each in="${lista}" var="situacaoProjeto">
		<tr>
			<td>${situacaoProjeto.nome}</td>
			<td>${situacaoProjeto.exibe}</td>
			<td>
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<a href="javascript: visualizar(${situacaoProjeto.id})"><i class="fa fa-eye" data-toggle="tooltip" title="Visualizar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: alterar(${situacaoProjeto.id})"><i class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: excluir(${situacaoProjeto.id})"><i class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
					</div>
				</div>
			</td>
		</tr>
	</g:each>
</table>

<!-- page script -->
<script>
	$(function() {

		$('#tabela').DataTable();

	});
</script>
