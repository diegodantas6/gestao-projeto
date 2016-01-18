<%@page import="java.text.SimpleDateFormat"%>
<table id="tabela" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th style="width: 75px;">Ações</th>
		</tr>
	</thead>
	<g:each in="${lista}" var="situacaoAtividade">
		<tr>
			<td>${situacaoAtividade.nome}</td>
			<td>
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<a href="javascript: visualizar(${situacaoAtividade.id})"><i class="fa fa-eye" data-toggle="tooltip" title="Visualizar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: alterar(${situacaoAtividade.id})"><i class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: excluir(${situacaoAtividade.id})"><i class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
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
