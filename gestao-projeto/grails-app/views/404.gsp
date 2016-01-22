<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Starter</title>
<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
	type="image/x-icon">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<!-- Reset -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/reset/html5-reset.css')}">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/bootstrap/css/bootstrap.min.css')}">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-12">
				<div class="col-middle">
					<div class="text-center">

						<h1 class="error-number">404</h1>

						<h2>Acesso Negado</h2>

						<p>Desculpe, você não possui autorização para acessar esta
							página.</p>

						<p>Entre em contato com o administrador para obter permissão.
						</p>

						<div class="mid_center">
							<h3>
								<a href="${createLink(uri: '/menu')}">Voltar</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
