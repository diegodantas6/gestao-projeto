<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="projeto.id" value="${projeto?.id}">

		<input type="hidden" name="projeto.version"
			value="${projeto?.version}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="projeto.nome"
						<g:if test="${!editable}">disabled</g:if> id="nome"
						value="${projeto?.nome}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_situacaoProjeto">
				<label>* Situação</label>
				<g:if test="${editable}">
					<select class="form-control select2" name="projeto.situacaoProjeto">
						<option value="">Selecione a Situação</option>
						<g:each
							in="${br.com.gestaoProjeto.SituacaoProjeto.createCriteria().list{ order('nome') }}"
							var="situacaoProjeto">
							<g:if test="${projeto?.situacaoProjeto?.id == situacaoProjeto.id}">
								<option value="${situacaoProjeto.id}" selected="selected">
									${situacaoProjeto.nome}
								</option>
							</g:if>
							<g:else>
								<option value="${situacaoProjeto.id}">
									${situacaoProjeto.nome}
								</option>
							</g:else>
						</g:each>
					</select>
				</g:if>
				<g:else>
					<input type="text" class="form-control"
						value="${projeto?.situacaoProjeto?.nome}" disabled>
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
