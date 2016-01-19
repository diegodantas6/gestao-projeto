<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!-- CRUD -->
<asset:javascript src="crud.js"/>

<!-- ColorPicker -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.css')}">
<script
	src="${createLink(uri: '/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.js')}"></script>

</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Configuração<small>Situação Atividade</small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box box-primary" id="divFormLista">

			<div class="box-header with-border">
				<h1 class="box-title">Lista</h1>
				<button type="submit" onclick="javascript: incluir()"
					class="btn btn-primary pull-right">Novo</button>
			</div>

			<div class="box-body" id="divLista"></div>

		</div>

		<div class="box-body" id="divForm"></div>

	</section>
</body>
</html>
