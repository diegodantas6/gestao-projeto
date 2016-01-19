<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!-- CRUD -->
<asset:javascript src="crud.js"/>

</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Controle de Acesso<small>Grupo Usuário</small>
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
