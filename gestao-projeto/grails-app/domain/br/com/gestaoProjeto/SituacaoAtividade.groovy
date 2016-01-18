package br.com.gestaoProjeto

class SituacaoAtividade {

	String nome
	String cor = "#000000"

	static constraints = {
		nome blank: false, unique: true
		cor blank: false
	}
}
