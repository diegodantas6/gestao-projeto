package br.com.gestaoProjeto

class SituacaoProjeto {

	String nome

	static constraints = {
		nome blank: false, unique: true
	}
}
