<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>

	<div class="box-body">

		<g:each in="${atividades}" var="atividade">

			<g:set var="newUser" value="${atividade.usuario.id}"></g:set>

			<g:if test="${ newUser == currentUser }">

				<h4>
					${atividade.nome}
					<small class="pull-right"> ${atividade.percentualConcluido}%
					</small>
				</h4>

				<g:if test="${atividade.percentualConcluido > 50}">
					<div class="progress xs">
						<div class="progress-bar progress-bar-primary"
							style="width: ${atividade.percentualConcluido}%"
							role="progressbar"
							aria-valuenow="${atividade.percentualConcluido}"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</g:if>
				<g:else>
					<div class="progress xs">
						<div class="progress-bar progress-bar-danger"
							style="width: ${atividade.percentualConcluido}%"
							role="progressbar"
							aria-valuenow="${atividade.percentualConcluido}"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>

				</g:else>

			</g:if>
			<g:else>

				<g:set var="currentUser" value="${atividade.usuario.id}"></g:set>

				<h3>
					${atividade.usuario.username}
				</h3>

				<h4>
					${atividade.nome}
					<small class="pull-right"> ${atividade.percentualConcluido}%
					</small>
				</h4>

				<g:if test="${atividade.percentualConcluido > 50}">
					<div class="progress xs">
						<div class="progress-bar progress-bar-primary"
							style="width: ${atividade.percentualConcluido}%"
							role="progressbar"
							aria-valuenow="${atividade.percentualConcluido}"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</g:if>
				<g:else>
					<div class="progress xs">
						<div class="progress-bar progress-bar-danger"
							style="width: ${atividade.percentualConcluido}%"
							role="progressbar"
							aria-valuenow="${atividade.percentualConcluido}"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>

				</g:else>

			</g:else>

		</g:each>

	</div>

	<div class="box-footer">
		<button type="reset" class="btn btn-primary pull-right"
			onclick="voltar();">Voltar</button>
	</div>

</div>
<!-- /.box -->
