package br.com.gestaoProjeto

class SituacaoProjeto {

	String nome
	boolean exibeDashboard = true

	static constraints = {
		nome blank: false, unique: true
	}

	public String getExibe() {
		if (exibeDashboard)
			return "Sim"
		else
			return "Não"
	}
}
