package br.com.gestaoProjeto

class Projeto {
	
	String nome
	SituacaoProjeto situacaoProjeto

    static constraints = {
		nome blank: false, unique: true
		situacaoProjeto nullable: false
    }
}
