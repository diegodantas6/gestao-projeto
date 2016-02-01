<%@page import="java.text.SimpleDateFormat"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">Atividade</h3>
	</div>

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
					disabled id="nome" value="${atividade?.nome}">
			</div>
		</div>

		<div class="col-sm-6 form-group" id="div_dataInicio">
			<label>* Data Inicio</label>
			<div class="input-group">
				<div class="input-group-addon">
					<i class="fa fa-laptop"></i>
				</div>
				<input type="text" class="form-control" name="atividade.dataInicio"
					disabled id="dataInicio"
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
					disabled id="dataFim"
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
					disabled id="percentualConcluido"
					value="${atividade?.percentualConcluido}">
			</div>
		</div>

		<div class="col-sm-6 form-group" id="div_situacaoAtividade">
			<label>* Situação</label> <input type="text" class="form-control"
				value="${atividade?.situacaoAtividade?.nome}" disabled>
		</div>

		<div class="col-sm-6 form-group" id="div_usuario">
			<label>* Usuário</label> <input type="text" class="form-control"
				value="${atividade?.usuario?.username}" disabled>
		</div>

		<div class="col-sm-6 form-group" id="div_projeto">
			<label>* Projeto</label> <input type="text" class="form-control"
				value="${atividade?.projeto?.nome}" disabled>
		</div>

	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button type="reset" class="btn btn-primary pull-right"
			onclick="voltar()">Voltar</button>
	</div>
</div>
<!-- /.box -->

<!-- Page script -->
<script>
	$(document).ready(function() {

		$(".select2").select2();

	});
</script>
