<%@page import="java.text.SimpleDateFormat"%>

<div id="divListaComentario">

	<g:each var="atividadeComentario" in="${atividade.comentarios}">

		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">
					${new SimpleDateFormat('dd/MM/yyyy HH:mm:ss').format( atividadeComentario.data )}
				</h3>

				<div class="btn-group pull-right" role="group">
					<div class="btn-group" role="group">
						<a href="javascript: alterarComentario(${atividadeComentario.id})"><i
							class="fa fa-pencil" data-toggle="tooltip" title="Alterar"></i></a>
					</div>
					<div class="btn-group" role="group">
						<a href="javascript: excluirComentario(${atividadeComentario.id})"><i
							class="fa fa-minus-circle" data-toggle="tooltip" title="Excluir"></i></a>
					</div>
				</div>

			</div>

			<div class="box-body">

				${atividadeComentario.nome}

			</div>

		</div>

	</g:each>

</div>

<div id="divFormComentario">

	<g:formRemote name="form" url="[action: 'salvarComentario']"
		onSuccess="retornoSalvarComentario(data)">

		<input type="hidden" name="atividadeComentario.id"
			value="${atividadeComentario?.id}">

		<input type="hidden" name="atividadeComentario.version"
			value="${atividadeComentario?.version}">

		<input type="hidden" name="atividadeComentario.atividade"
			value="${atividade?.id}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_nome">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control"
						name="atividadeComentario.nome"
						<g:if test="${!editable}">disabled</g:if> id="nome"
						value="${atividadeComentario?.nome}">
				</div>
			</div>

		</div>

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