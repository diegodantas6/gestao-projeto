<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="situacaoProjeto.id"
			value="${situacaoProjeto?.id}">

		<input type="hidden" name="situacaoProjeto.version"
			value="${situacaoProjeto?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="situacaoProjeto.nome"
						<g:if test="${!editable}">disabled</g:if> id="nome"
						value="${situacaoProjeto?.nome}">
				</div>
			</div>
			
			<div class="col-sm-2 form-group" id="div_exibeDashboard">
				<label>Exibe DashBoard</label>
				<g:checkBox class="form-control check" name="situacaoProjeto.exibeDashboard"
					id="enabled" value="${situacaoProjeto?.exibeDashboard}" disabled="${!editable}"></g:checkBox>
			</div>

		</div>
		<!-- /.box-body -->

		<div class="box-footer">

			<g:if test="${editable}">
				<button type="reset" class="btn btn-danger"
					onclick="javascript: cancelar()">Cancelar</button>

				<button type="submit" class="btn btn-primary pull-right">Salvar</button>
			</g:if>
			<g:else>
				<button type="reset" class="btn btn-primary pull-right"
					onclick="javascript: cancelar()">Voltar</button>
			</g:else>
		</div>
	</g:formRemote>
</div>
<!-- /.box -->

<!-- Page script -->
<script>
	$(document).ready(function() {

		$("#nome").focus();

	});
</script>
