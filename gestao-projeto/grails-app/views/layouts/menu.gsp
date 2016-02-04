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
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/datatables/dataTables.bootstrap.css')}">
<!-- Confirm -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/confirm/jquery-confirm.min.css')}">
<!-- Select2 -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/plugins/select2/select2.min.css')}">
<!-- Theme style -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/dist/css/AdminLTE.min.css')}">
<!-- Skin - blue -->
<link rel="stylesheet"
	href="${createLink(uri: '/adminlte/dist/css/skins/skin-blue.min.css')}">
<!-- Custom CSS -->
<asset:stylesheet src="custom.css" />

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.1.4 -->
<script
	src="${createLink(uri: '/adminlte/plugins/jQuery/jQuery-2.1.4.min.js')}"></script>
<!-- jQueryUI -->
<script
	src="${createLink(uri: '/adminlte/plugins/jQueryUI/jquery-ui.min.js')}"></script>
<!-- Bootstrap 3.3.5 -->
<script
	src="${createLink(uri: '/adminlte/bootstrap/js/bootstrap.min.js')}"></script>
<!-- AdminLTE App -->
<script src="${createLink(uri: '/adminlte/dist/js/app.min.js')}"></script>
<!-- DataTables -->
<script
	src="${createLink(uri: '/adminlte/plugins/datatables/jquery.dataTables.min.js')}"></script>
<script
	src="${createLink(uri: '/adminlte/plugins/datatables/dataTables.bootstrap.min.js')}"></script>
<!-- InputMask -->
<script
	src="${createLink(uri: '/adminlte/plugins/input-mask/jquery.inputmask.bundle.js')}"></script>
<script
	src="${createLink(uri: '/adminlte/plugins/input-mask/jquery.price_format.2.0.min.js')}"></script>
<!-- Notify -->
<script type="text/javascript"
	src="${createLink(uri: '/adminlte/plugins/notify/notify.js')}"></script>
<!-- Confirm -->
<script type="text/javascript"
	src="${createLink(uri: '/adminlte/plugins/confirm/jquery-confirm.min.js')}"></script>
<!-- Select2 -->
<script
	src="${createLink(uri: '/adminlte/plugins/select2/select2.full.min.js')}"></script>

<g:layoutHead />
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div id="spinner" class="modal">
		<asset:image src="spinner3.gif" alt="Loading..." />
	</div>

	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="${createLink(uri: '/')}" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Admin</b>LTE</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>

				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<!-- Notifications Menu -->
						<li class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning">10</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- Inner Menu: contains the notifications -->
									<ul class="menu">
										<li>
											<!-- start notification --> <a href="#"> <i
												class="fa fa-users text-aqua"></i> 5 new members joined
												today
										</a>
										</li>
										<!-- end notification -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul>
						</li>

						<!-- LogOff -->
						<li class="notifications-menu"><a
							href="${createLink(controller: 'logout')}"> <i
								class="fa fa-power-off" data-toggle="tooltip" title="Logout"></i>
						</a></li>

					</ul>
				</div>
			</nav>
		</header>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<!--<img src="img-diego/user.jpg" class="img-circle" alt="User Image">-->
						<asset:image src="user.jpg" class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>
							<sec:loggedInUserInfo field="username" />
						</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<li class="header">MENU</li>

					<li><a href="${createLink(uri: '/dashboard')}"><i
							class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>

					<li><a href="${createLink(uri: '/agenda')}"><i
							class="fa fa-calendar"></i> <span>Agenda</span></a></li>

					<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
							<span>Cadastro</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="${createLink(uri: '/atividade/index')}"><i
									class="fa fa-circle-o"></i>Atividade</a></li>
							<li><a href="${createLink(uri: '/projeto/index')}"><i
									class="fa fa-circle-o"></i>Projeto</a></li>
						</ul></li>

					<li class="treeview"><a href="#"> <i class="fa fa-gears"></i>
							<span>Configuração</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="${createLink(uri: '/situacaoAtividade/index')}"><i
									class="fa fa-circle-o"></i>Situação Atividade</a></li>
							<li><a href="${createLink(uri: '/situacaoProjeto/index')}"><i
									class="fa fa-circle-o"></i>Situação Projeto</a></li>
						</ul></li>

					<li class="treeview"><a href="#"> <i class="fa fa-users"></i>
							<span>Controle de Acesso</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="${createLink(uri: '/usuario/index')}"><i
									class="fa fa-circle-o"></i>Usuário</a></li>
							<li><a href="${createLink(uri: '/usuarioGrupo/index')}"><i
									class="fa fa-circle-o"></i>Grupo Usuário</a></li>
							<li><a href="${createLink(uri: '/permissaoAcesso/index')}"><i
									class="fa fa-circle-o"></i>Permissão Acesso</a></li>
						</ul></li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<div id="content">
				<g:layoutBody />
			</div>

		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">Anything you want</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2015 <a href="#">Company</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!-- ./wrapper -->

	<script type="text/javascript">

		$(document).ready(function() {
			
			<!-- Usando MODAL -->
			var showSpinner = function() {
				$("#spinner").dialog({
					modal : true,
					width : 'auto',
					resizable : false,
					draggable: false,
					closeOnEscape: false
				});
		
				$(".ui-dialog-titlebar").hide();
			};
		
			var closeSpinner = function() {
				$("#spinner").dialog("close");
			}
		
			// Global handlers for AJAX events
			//$(document).on("ajaxSend", showSpinner).on("ajaxStop", closeSpinner).on("ajaxError", closeSpinner);
			
		});
	
		function customConfirm(message, yesFunc, noFunc) {
			//DOC: http://craftpip.github.io/jquery-confirm/
			$.confirm({
				confirmButton : 'Confirmar',
				cancelButton : 'Cancelar',
				confirmButtonClass : 'btn-primary',
				cancelButtonClass : 'btn-danger',
				keyboardEnabled : true,
				//theme : 'supervan',
				title : 'Gestão de Projeto',
				//icon : 'glyphicon glyphicon-ok',
				//columnClass: 'auto',
				content : message,

				confirm : function() {
					yesFunc()
				},
				cancel : function() {
					noFunc()
				}

			});
		}
	</script>

</body>
</html>
