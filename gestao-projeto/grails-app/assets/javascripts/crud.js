/**
 * Script criado para atender os cadastros padroes
 */

function iniciaForm() {
	
	carregarLista()
	
}

function carregarLista() {
	$("#divForm").hide()

	$.ajax({
		method : "POST",
		url : "listar",
		data : {},
		success : function(data) {
			$("#divLista").html(data)
		},
		error : function(data) {
			retornoErro(data)
		}
	})
}

function excluir(id) {
	customConfirm('Deseja realmente excluir?', function() {
		$.ajax({
			method : "POST",
			url : "excluir",
			data : {
				"id" : id
			},
			success : function(data) {

				$.notify(data.mensagem, data.type);

				if (data.type == "success") {
					carregarLista()
				}
			},
			error : function(data) {
				retornoErro(data)
			}
		})
	}, function() {
	});
}

function visualizar(id) {
	$.ajax({
		method : "POST",
		url : "visualizar",
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

function alterar(id) {
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

function retornoSalvar(data) {
	$.notify(data.mensagem, data.type);

	if (data.type == "success") {
		carregarLista()
		$("#divFormLista").show()
	} else {
		for (i = 0; i < data.errors.errors.length; i++) {
			var text = data.errors.errors[i].message
			var field = "#div_" + data.errors.errors[i].field

			$(field).addClass("has-error");

			$(field).focusin(function() {
				$(this).removeClass("has-error");
			});

			$.notify(text, data.type);
		}
	}
}

function cancelar() {
	$("#divFormLista").show()
	$("#divForm").hide()
}

function incluir() {
	$.ajax({
		method : "POST",
		url : "incluir",
		data : {},
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

function retornoErro(data) {
	
	if (data.status == 403) {
		
		$.notify("Entre em contato com o administrador para obter permissão.", "info");
		
		$.notify("Desculpe, você não possui autorização para realizar esta operação.", "error");
		
	} else {

		$.notify("Entre em contato com o administrador.", "info");
		
		$.notify("Desculpe, erro desconhecido.", "error");
		
	}
	
}

