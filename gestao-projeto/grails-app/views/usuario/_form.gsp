<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<g:formRemote name="form" url="[action: 'salvar']"
		onSuccess="retornoSalvar(data)">

		<input type="hidden" name="usuario.id" value="${usuario?.id}">

		<input type="hidden" name="usuario.version"
			value="${usuario?.version}">

		<input type="hidden" name="grupoOld"
			value="${usuario?.usuarioGrupo?.id}">

		<div class="box-body">

			<div class="col-sm-6 form-group" id="div_username">
				<label>* Nome</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="text" class="form-control" name="usuario.username"
						<g:if test="${!editable}">disabled</g:if> id="username"
						value="${usuario?.username}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_password">
				<label>* Senha</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="password" class="form-control" name="usuario.password"
						<g:if test="${!editable}">disabled</g:if> id="password"
						value="${usuario?.password}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_email">
				<label>Email</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-laptop"></i>
					</div>
					<input type="email" class="form-control" name="usuario.email"
						<g:if test="${!editable}">disabled</g:if> id="email"
						value="${usuario?.email}">
				</div>
			</div>

			<div class="col-sm-6 form-group" id="div_usuarioGrupo">
				<label>* Grupo Usuário</label>
				<g:if test="${editable}">
					<select class="form-control select2" name="usuario.usuarioGrupo">
						<option value="">Selecione o Grupo Usuário</option>
						<g:each
							in="${br.com.controleAcesso.UsuarioGrupo.createCriteria().list{ order('nome') }}"
							var="usuarioGrupo">
							<g:if test="${usuario?.usuarioGrupo?.id == usuarioGrupo.id}">
								<option value="${usuarioGrupo.id}" selected="selected">
									${usuarioGrupo.nome}
								</option>
							</g:if>
							<g:else>
								<option value="${usuarioGrupo.id}">
									${usuarioGrupo.nome}
								</option>
							</g:else>
						</g:each>
					</select>
				</g:if>
				<g:else>
					<input type="text" class="form-control"
						value="${usuario?.usuarioGrupo?.nome}" disabled>
				</g:else>
			</div>

			<div class="col-sm-2 form-group" id="div_enabled">
				<label>Ativo</label>
				<g:checkBox class="form-control check" name="usuario.enabled"
					id="enabled" value="${usuario?.enabled}" disabled="${!editable}"></g:checkBox>
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

		$("#username").focus();

	});
</script>
