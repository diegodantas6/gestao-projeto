<div class="col-md-3">

	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Filtros</h3>
		</div>

		<div class="box-body">

			<div class="col-sm-12 form-group" id="div_projeto">
				<label>Projeto</label> <select class="form-control select2"
					name="atividade.projeto">
					<option value="">Selecione o Projeto</option>
					<g:each
						in="${br.com.gestaoProjeto.Projeto.createCriteria().list{ order('nome') }}"
						var="projeto">
						<g:if test="${atividade?.projeto?.id == projeto.id}">
							<option value="${projeto.id}" selected="selected">
								${projeto.nome}
							</option>
						</g:if>
						<g:else>
							<option value="${projeto.id}">
								${projeto.nome}
							</option>
						</g:else>
					</g:each>
				</select>
			</div>

			<div class="col-sm-12 form-group" id="div_usuario">
				<label>Usuário</label> <select class="form-control select2"
					name="atividade.usuario">
					<option value="">Selecione o Usuário</option>
					<g:each
						in="${br.com.controleAcesso.Usuario.createCriteria().list{

									usuarioGrupo {
										eq('realizaAtividade', br.com.teste.enums.SimNao.SIM)
									}
								
									eq('enabled', true)
									order('username') 
								}}"
						var="usuario">
						<g:if test="${atividade?.usuario?.id == usuario.id}">
							<option value="${usuario.id}" selected="selected">
								${usuario.username}
							</option>
						</g:if>
						<g:else>
							<option value="${usuario.id}">
								${usuario.username}
							</option>
						</g:else>
					</g:each>
				</select>
			</div>

		</div>

	</div>

</div>
