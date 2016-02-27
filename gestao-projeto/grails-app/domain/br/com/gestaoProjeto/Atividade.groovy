package br.com.gestaoProjeto

import br.com.controleAcesso.Usuario;

class Atividade {
	
	String nome
	Date dataInicio = new Date()
	Date dataFim = new Date().plus(1)
	Integer percentualConcluido = 0
	Projeto projeto
	Usuario usuario
	SituacaoAtividade situacaoAtividade

	static hasMany = [comentarios: AtividadeComentario]
	
    static constraints = {
		nome blank: false, unique: true
		dataInicio blank: false 
		dataFim blank: false
		percentualConcluido blank: false, max: 100, min: 0
		projeto nullable: false 
		usuario nullable: false
		situacaoAtividade nullable: false
    }
}
