<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="usuarioGrupo.id"
			value="${usuarioGrupo?.id}">

		<input type="hidden" name="usuarioGrupo.version"
			value="${usuarioGrupo?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="usuarioGrupo.nome"
						<g:if test="${!editable}">disabled</g:if> id="nome"
						value="${usuarioGrupo?.nome}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_realizaAtividade">
				<label>* Realiza Atividade</label>
				<g:if test="${editable}">
					<g:select class="form-control select2" name="usuarioGrupo.realizaAtividade"
						noSelection="${['null':'Selecione um...']}"
						from="${br.com.teste.enums.SimNao?.values()}"
						value="${usuarioGrupo?.realizaAtividade}" />
				</g:if>
				<g:else>
					<input type="text" class="form-control" value="${usuarioGrupo?.realizaAtividade}"
						disabled>
				</g:else>
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

		$(".select2").select2();

		$("#nome").focus();

	});
</script>
