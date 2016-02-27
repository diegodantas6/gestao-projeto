<%@page import="java.text.SimpleDateFormat"%>

<g:formRemote name="form" url="[action: 'salvar']"
	onSuccess="retornoSalvar(data)">

	<input type="hidden" name="atividade.id" value="${atividade?.id}">

	<input type="hidden" name="atividade.version"
		value="${atividade?.version}">

	<div class="box-body">

		<div class="col-sm-6 form-group" id="div_nome">
			<label>* Nome</label>
			<div class="input-group">
				<div class="input-group-addon">
					<i class="fa fa-laptop"></i>
				</div>
				<input type="text" class="form-control" name="atividade.nome"
					<g:if test="${!editable}">disabled</g:if> id="nome"
					value="${atividade?.nome}">
			</div>
		</div>

		<div class="col-sm-6 form-group" id="div_dataInicio">
			<label>* Data Inicio</label>
			<div class="input-group">
				<div class="input-group-addon">
					<i class="fa fa-laptop"></i>
				</div>
				<input type="text" class="form-control" name="atividade.dataInicio"
					<g:if test="${!editable}">disabled</g:if> id="dataInicio"
					value="${new SimpleDateFormat('dd/MM/yyyy').format( atividade?.dataInicio )}">
			</div>
		</div>

		<div class="col-sm-6 form-group" id="div_dataFim">
			<label>* Data Fim</label>
			<div class="input-group">
				<div class="input-group-addon">
					<i class="fa fa-laptop"></i>
				</div>
				<input type="date" class="form-control" name="atividade.dataFim"
					<g:if test="${!editable}">disabled</g:if> id="dataFim"
					value="${new SimpleDateFormat('dd/MM/yyyy').format( atividade?.dataFim )}">
			</div>
		</div>

		<div class="col-sm-6 form-group" id="div_percentualConcluido">
			<label>% Concluido</label>
			<div class="input-group">
				<div class="input-group-addon">
					<i class="fa fa-laptop"></i>
				</div>
				<input type="text" class="form-control"
					name="atividade.percentualConcluido"
					<g:if test="${!editable}">disabled</g:if> id="percentualConcluido"
					value="${atividade?.percentualConcluido}">
			</div>
		</div>

		<div class="col-sm-6 form-group" id="div_situacaoAtividade">
			<label>* Situação</label>
			<g:if test="${editable}">
				<select class="form-control select2"
					name="atividade.situacaoAtividade">
					<option value="">Selecione a Situação</option>
					<g:each
						in="${br.com.gestaoProjeto.SituacaoAtividade.createCriteria().list{ order('nome') }}"
						var="situacaoAtividade">
						<g:if
							test="${atividade?.situacaoAtividade?.id == situacaoAtividade.id}">
							<option value="${situacaoAtividade.id}" selected="selected">
								${situacaoAtividade.nome}
							</option>
						</g:if>
						<g:else>
							<option value="${situacaoAtividade.id}">
								${situacaoAtividade.nome}
							</option>
						</g:else>
					</g:each>
				</select>
			</g:if>
			<g:else>
				<input type="text" class="form-control"
					value="${atividade?.situacaoAtividade?.nome}" disabled>
			</g:else>
		</div>

		<div class="col-sm-6 form-group" id="div_usuario">
			<label>* Usuário</label>
			<g:if test="${editable}">
				<select class="form-control select2" name="atividade.usuario">
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
			</g:if>
			<g:else>
				<input type="text" class="form-control"
					value="${atividade?.usuario?.username}" disabled>
			</g:else>
		</div>

		<div class="col-sm-6 form-group" id="div_projeto">
			<label>* Projeto</label>
			<g:if test="${editable}">
				<select class="form-control select2" name="atividade.projeto">
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
			</g:if>
			<g:else>
				<input type="text" class="form-control"
					value="${atividade?.projeto?.nome}" disabled>
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

<!-- Page script -->
<script>
	$(document).ready(function() {

		$(".select2").select2();

		$("#nome").focus();

		$("#dataInicio").inputmask({
			alias : "dd/mm/yyyy",
			clearIncomplete : true
		});

		$("#dataFim").inputmask({
			alias : "dd/mm/yyyy",
			clearIncomplete : true
		});

		$("#percentualConcluido").inputmask({
			alias : 'integer',
			min : 0,
			max : 100
		});

	});
</script>
