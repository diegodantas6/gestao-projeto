/**
 * Script criado para atender os cadastros padroes
 */

$(document).ready(function() {
	carregarLista()
})

function carregarLista() {
	$("#divForm").hide()

	$.ajax({
		method : "POST",
		url : "listar",
		data : {},
		success : function(data) {
			$("#divLista").html(data)
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
		}
	})
}
