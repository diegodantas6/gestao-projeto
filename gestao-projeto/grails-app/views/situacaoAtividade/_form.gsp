<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="situacaoAtividade.id"
			value="${situacaoAtividade?.id}">

		<input type="hidden" name="situacaoAtividade.version"
			value="${situacaoAtividade?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control"
						name="situacaoAtividade.nome"
						<g:if test="${!editable}">disabled</g:if> id="nome"
						value="${situacaoAtividade?.nome}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_cor">
				<label>* Cor</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i></i>
					</div>
					<input type="text" class="form-control"
						name="situacaoAtividade.cor"
						<g:if test="${!editable}">disabled</g:if> id="cor"
						value="${situacaoAtividade?.cor}">
				</div>
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

		$("#div_cor").colorpicker();

	});
</script>
