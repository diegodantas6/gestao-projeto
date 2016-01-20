package br.com.controleAcesso

class Permissao implements Serializable {

	private static final long serialVersionUID = 1

	String authority
	String descricao
	PermissaoGrupo permissaoGrupo

	Permissao(String authority) {
		this()
		this.authority = authority
	}

	@Override
	int hashCode() {
		authority?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof Permissao && other.authority == authority)
	}

	static constraints = {
		authority blank: false, unique: true
	}

	static mapping = {
		cache true
	}
}
