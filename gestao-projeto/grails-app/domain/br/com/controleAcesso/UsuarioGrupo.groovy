package br.com.controleAcesso

import br.com.teste.enums.SimNao;

class UsuarioGrupo {

	String nome
	SimNao realizaAtividade
	
    static constraints = {
		nome blank: false, unique: true
		realizaAtividade nullable: false
    }
	
}
