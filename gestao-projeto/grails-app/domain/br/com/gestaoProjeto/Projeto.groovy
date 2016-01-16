package br.com.gestaoProjeto

class Projeto {
	
	String nome
	SituacaoProjeto situacaoProjeto
	
	static hasMany = [atividades: Atividade]

    static constraints = {
    }
}
