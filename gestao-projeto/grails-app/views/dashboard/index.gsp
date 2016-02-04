<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!-- ChartJS 1.0.1 -->
<script
	src="${createLink(uri: '/adminlte/plugins/chartjs/Chart.min.js')}"></script>

<script>
	function iniciaForm() {

		getProjetos()

	}

	function getProjetos() {
		$.ajax({
			method : "POST",
			url : "dashboard/getProjetos",
			data : {},
			success : function(data) {
				$("#divConteudo").html(data)
			}
		})
	}

	function getAtividades(id) {
		$.ajax({
			method : "POST",
			url : "dashboard/getAtividades",
			data : {
				"id" : id
			},
			success : function(data) {
				$("#divConteudo").html(data)
			}
		})
	}

	function voltar() {
		getProjetos()
	}
</script>

</head>
<body>

	<!-- Main content -->
	<section class="content">

		<div id="divConteudo"></div>

	</section>
	<!-- /.content -->

</body>
</html>
