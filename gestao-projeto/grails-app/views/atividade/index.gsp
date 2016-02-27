<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="menu" />

<!-- CRUD -->
<asset:javascript src="crud.js"/>

<script type="text/javascript">

function retornoSalvarComentario(data) {

	$.notify(data.mensagem, data.type)

	if (data.type == "success") {
		
		//$("#divFormComentario").html("")
		
	} else {
		for (i = 0; i < data.errors.errors.length; i++) {
			var text = data.errors.errors[i].message

			$.notify(text, data.type);
		}
	}

}

function alterarComentario(id) {
	$.ajax({
		method : "POST",
		url : "alterar",
		data : {
			"id" : id
		},
		success : function(data) {
			$("#divFormLista").hide()
			$("#divForm").show()
			$("#divForm").html(data)
		},
		error : function(data) {
			retornoErro(data)
		}
	})
}

function excluirComentario(id) {
	customConfirm('Deseja realmente excluir?', function() {
		$.ajax({
			method : "POST",
			url : "excluirComentario",
			data : {
				"id" : id
			},
			success : function(data) {

				$.notify(data.mensagem, data.type);

				//if (data.type == "success") {
					//carregarLista()
				//}
			},
			error : function(data) {
				retornoErro(data)
			}
		})
	}, function() {
	});
}

</script>

</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Cadastro<small>Atividade</small>
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
