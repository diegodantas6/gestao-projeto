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
<!-- Custom CSS -->
<asset:stylesheet src="institucional.css" />

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

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Start Bootstrap</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
					<li><a href="${createLink(controller: 'login')}">Login</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Image Background Page Header -->
	<!-- Note: The background image is set within the business-casual.css file. -->
	<header class="business-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="tagline">Business Name or Tagline</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<hr>

		<div class="row">
			<div class="col-sm-8">
				<h2>What We Do</h2>
				<p>Introduce the visitor to the business using clear,
					informative text. Use well-targeted keywords within your sentences
					to make sure search engines can find the business.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et
					molestiae similique eligendi reiciendis sunt distinctio odit? Quia,
					neque, ipsa, adipisci quisquam ullam deserunt accusantium illo iste
					exercitationem nemo voluptates asperiores.</p>
				<p>
					<a class="btn btn-default btn-lg" href="#">Call to Action
						&raquo;</a>
				</p>
			</div>
			<div class="col-sm-4">
				<h2>Contact Us</h2>
				<address>
					<strong>Start Bootstrap</strong> <br>3481 Melrose Place <br>Beverly
					Hills, CA 90210 <br>
				</address>
				<address>
					<abbr title="Phone">P:</abbr>(123) 456-7890 <br> <abbr
						title="Email">E:</abbr> <a href="mailto:#">name@example.com</a>
				</address>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<div class="row">
			<div class="col-sm-4">
				<img class="img-circle img-responsive img-center"
					src="http://placehold.it/300x300" alt="">
				<h2>Marketing Box #1</h2>
				<p>These marketing boxes are a great place to put some
					information. These can contain summaries of what the company does,
					promotional information, or anything else that is relevant to the
					company. These will usually be below-the-fold.</p>
			</div>
			<div class="col-sm-4">
				<img class="img-circle img-responsive img-center"
					src="http://placehold.it/300x300" alt="">
				<h2>Marketing Box #2</h2>
				<p>The images are set to be circular and responsive. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
			</div>
			<div class="col-sm-4">
				<img class="img-circle img-responsive img-center"
					src="http://placehold.it/300x300" alt="">
				<h2>Marketing Box #3</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
			<!-- /.row -->
		</footer>

	</div>
	<!-- /.container -->

</body>
</html>
