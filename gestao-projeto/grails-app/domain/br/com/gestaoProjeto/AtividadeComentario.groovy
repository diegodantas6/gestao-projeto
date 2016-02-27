package br.com.gestaoProjeto

import br.com.controleAcesso.Usuario;

class AtividadeComentario {
	
	String nome
	Date data
	
	static belongsTo = [atividade: Atividade]

    static constraints = {
		nome blank: false, unique: true
		data blank: false 
    }
}
