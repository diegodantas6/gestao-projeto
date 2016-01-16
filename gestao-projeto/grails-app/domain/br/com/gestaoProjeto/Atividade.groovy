package br.com.gestaoProjeto

import br.com.controleAcesso.Usuario;

class Atividade {
	
	String nome
	Date dataInicio
	Date dataFim
	Integer percentualConcluido
	Projeto projeto
	Usuario usuario
	SituacaoAtividade situacaoAtividade

    static constraints = {
    }
}
