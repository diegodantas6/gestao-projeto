<!DOCTYPE html>
<html>
<head>

<asset:stylesheet href="kendo/kendo.common-material.min.css" />
<asset:stylesheet href="kendo/kendo.material.min.css" />

<!--<asset:javascript src="kendo/jquery.min.js" />-->
<asset:javascript src="kendo/kendo.all.min.js" />

<meta name="layout" content="menu">

<script type="text/javascript">
	function retornoSal(val, texto) {
		mensagemOK(val, texto);
		setaPosicaoInicia();
	}

	function carregaTreeView() {
		jQuery.ajax({
			type : 'POST',
			data : 'id=' + $("#grupoUsuario").val(),
			url : 'carregaTreeView',
			success : function(data, textStatus) {
				jQuery('#div_permissoes').html(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	}
</script>

</head>

<body>

	<div class="">

		<div class="page-title">
			<div class="title_left">
				<h3>Permissão Grupo de Usuário</h3>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">

					<g:formRemote name="frmUsuarioGrupoPermissao"
						url="[controller: 'usuarioGrupoPermissao', action: 'save']"
						onSuccess="retornoSal(true, data)"
						onFailure="handleError(XMLHttpRequest,textStatus,errorThrown)">

						<div class="form-group">

							<div class="row">

								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<label class="control-label" for="grupoUsuario">Grupo
										de Usuário<span class="required">*</span>
									</label> <select class="form-control" onchange="carregaTreeView();"
										id="grupoUsuario" name="grupoUsuario" required="required">
										<option value="0" selected>Selecione o Grupo de
											Usuário</option>
										<g:each in="${br.com.controleAcesso.UsuarioGrupo.list()}"
											var="grupo">
											<option value="${grupo.id}">
												${grupo.nome}
											</option>
										</g:each>
									</select>
								</div>

							</div>

							<div class="row">

								<div class="ln_solid"></div>

								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

									<g:render template="form" />

								</div>

							</div>

						</div>

						<div class="form-group">
							<div class="ln_solid"></div>
							<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
								<input type="submit" class="btn btn-primary" name="btnSalvar"
									value="Salvar" /> <input type="button"
									class="btn btn btn-warning" name="btnCancelar" value="Cancelar"
									onclick="carregaTreeView();" />
							</div>
						</div>

					</g:formRemote>
				</div>
			</div>
		</div>

	</div>

	<!-- select2 -->
	<script>
		$(document).ready(function() {
			$("#grupoUsuario").select2();
		});
	</script>
	<!-- /select2 -->

</body>
</html>
