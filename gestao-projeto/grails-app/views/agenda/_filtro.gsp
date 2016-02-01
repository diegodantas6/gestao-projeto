<div class="col-md-3">

	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Filtros</h3>
		</div>

		<div class="box-body">

			<div class="col-sm-12 form-group" id="div_projeto">
				<label>Projeto</label> <select class="form-control select2"
					name="idProjeto" id="idProjeto" onchange="onChangeProjeto()">
					<option value="0">Todos</option>
					<g:each
						in="${br.com.gestaoProjeto.Projeto.createCriteria().list{ order('nome') }}"
						var="projeto">
						<option value="${projeto.id}">
							${projeto.nome}
						</option>
					</g:each>
				</select>
			</div>

			<div class="col-sm-12 form-group" id="div_usuario">
				<label>Usuário</label> <select class="form-control select2"
					name="idUsuario" id="idUsuario" onchange="onChangeUsuario()">
				</select>
			</div>

		</div>

	</div>

</div>
