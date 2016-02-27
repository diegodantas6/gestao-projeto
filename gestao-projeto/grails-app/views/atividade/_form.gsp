<g:if test="${atividade.id}">

	<div class="nav-tabs-custom">
		<ul class="nav nav-tabs nav-justified">

			<li class="active"><a data-toggle="tab" href="#atividade"> ${title}
			</a></li>

			<li><a data-toggle="tab" href="#atividadeComentario">Comentários</a></li>

		</ul>

		<div class="tab-content">
			<div id="atividade" class="tab-pane fade in active">

				<g:render template="formAtividade"></g:render>

			</div>

			<div id="atividadeComentario" class="tab-pane fade">

				<g:render template="formAtividadeComentario"></g:render>

			</div>
		</div>
	</div>

</g:if>

<g:else>

	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">
				${title}
			</h3>
		</div>

		<g:render template="formAtividade"></g:render>

	</div>

</g:else>
