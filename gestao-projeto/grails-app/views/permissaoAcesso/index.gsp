<!DOCTYPE html>
<html>
<head>

<!-- Kendo -->
<asset:stylesheet href="kendo/kendo.common-material.min.css" />
<asset:stylesheet href="kendo/kendo.material.min.css" />
<asset:javascript src="kendo/kendo.all.min.js" />

<meta name="layout" content="menu">

<script type="text/javascript">
	function iniciaForm() {

		$("#grupoUsuario").select2();

		carregaTreeView();

	}

	function retornoSalvar(data) {
		$.notify(data.mensagem, data.type);

		carregaTreeView()
	}

	function carregaTreeView() {
		var id = $("#grupoUsuario").val()
		$("#divForm").hide()

		if (id > 0) {
			$.ajax({
				type : 'POST',
				data : 'id=' + id,
				url : 'carregaTreeView',
				success : function(data, textStatus) {
					$("#divForm").html(data)
					$("#divForm").show()
				}
			});
		}
	}

	function cancelar() {
		carregaTreeView()
	}

	function salvar() {
		var grupoUsuario = $("#grupoUsuario").val()
		var result = $("#result").val()

		if (grupoUsuario > 0) {
			$.ajax({
				type : 'POST',
				data : 'grupoUsuario=' + grupoUsuario + '&result=' + result,
				url : 'save',
				success : function(data, textStatus) {
					retornoSalvar(data)
				}
			});
		}
	}
</script>

</head>

<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Controle de Acesso<small>Permissão Acesso</small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box box-primary">

			<div class="box-header with-border">

				<div class="col-sm-6 form-group">

					<label>* Grupo Usuário</label> <select class="form-control"
						onchange="carregaTreeView();" id="grupoUsuario"
						name="grupoUsuario" required="required">
						<option value="0" selected>Selecione o Grupo Usuário</option>
						<g:each in="${br.com.controleAcesso.UsuarioGrupo.list()}"
							var="grupo">
							<option value="${grupo.id}">
								${grupo.nome}
							</option>
						</g:each>
					</select>

				</div>

			</div>

			<div id="divForm"></div>

		</div>

	</section>

</body>
</html>
