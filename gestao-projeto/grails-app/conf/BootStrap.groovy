import br.com.controleAcesso.Permissao
import br.com.controleAcesso.PermissaoGrupo
import br.com.controleAcesso.PermissaoGrupoMenu
import br.com.controleAcesso.Usuario
import br.com.controleAcesso.UsuarioGrupo
import br.com.controleAcesso.UsuarioGrupoPermissao
import br.com.controleAcesso.UsuarioPermissao
import br.com.teste.enums.SimNao

class BootStrap {

	def init = { servletContext ->

		String create = "Incluir"
		String read = "Visualizar"
		String update = "Alterar"
		String delete = "Excluir"

		// Controle Acesso
		PermissaoGrupoMenu controleAcesso = new PermissaoGrupoMenu(nome: "Controle Acesso").save()

		PermissaoGrupo usuario = new PermissaoGrupo(permissaoGrupoMenu: controleAcesso, nome: "Usuário").save()
		new Permissao(authority: "ROLE_CREATE_USUARIO", descricao: create, permissaoGrupo: usuario).save()
		new Permissao(authority: "ROLE_READ_USUARIO", descricao: read, permissaoGrupo: usuario).save()
		new Permissao(authority: "ROLE_UPDATE_USUARIO", descricao: update, permissaoGrupo: usuario).save()
		new Permissao(authority: "ROLE_DELETE_USUARIO", descricao: delete, permissaoGrupo: usuario).save()

		PermissaoGrupo usuarioGrupo = new PermissaoGrupo(permissaoGrupoMenu: controleAcesso, nome: "Grupo Usuário").save()
		new Permissao(authority: "ROLE_CREATE_USUARIO_GRUPO", descricao: create, permissaoGrupo: usuarioGrupo).save()
		new Permissao(authority: "ROLE_READ_USUARIO_GRUPO", descricao: read, permissaoGrupo: usuarioGrupo).save()
		new Permissao(authority: "ROLE_UPDATE_USUARIO_GRUPO", descricao: update, permissaoGrupo: usuarioGrupo).save()
		new Permissao(authority: "ROLE_DELETE_USUARIO_GRUPO", descricao: delete, permissaoGrupo: usuarioGrupo).save()

		PermissaoGrupo permissaoAcesso = new PermissaoGrupo(permissaoGrupoMenu: controleAcesso, nome: "Permissão Acesso").save()
		Permissao permissao = new Permissao(authority: "ROLE_UPDATE_PERMISSAO_ACESSO", descricao: update, permissaoGrupo: permissaoAcesso).save()

		// Configuracao
		PermissaoGrupoMenu configuracao = new PermissaoGrupoMenu(nome: "Configuração").save()

		PermissaoGrupo situacaoAtividade = new PermissaoGrupo(permissaoGrupoMenu: configuracao, nome: "Situação Atividade").save()
		new Permissao(authority: "ROLE_CREATE_SITUACAO_ATIVIDADE", descricao: create, permissaoGrupo: situacaoAtividade).save()
		new Permissao(authority: "ROLE_READ_SITUACAO_ATIVIDADE", descricao: read, permissaoGrupo: situacaoAtividade).save()
		new Permissao(authority: "ROLE_UPDATE_SITUACAO_ATIVIDADE", descricao: update, permissaoGrupo: situacaoAtividade).save()
		new Permissao(authority: "ROLE_DELETE_SITUACAO_ATIVIDADE", descricao: delete, permissaoGrupo: situacaoAtividade).save()

		PermissaoGrupo situacaoProjeto = new PermissaoGrupo(permissaoGrupoMenu: configuracao, nome: "Situação Projeto").save()
		new Permissao(authority: "ROLE_CREATE_SITUACAO_PROJETO", descricao: create, permissaoGrupo: situacaoProjeto).save()
		new Permissao(authority: "ROLE_READ_SITUACAO_PROJETO", descricao: read, permissaoGrupo: situacaoProjeto).save()
		new Permissao(authority: "ROLE_UPDATE_SITUACAO_PROJETO", descricao: update, permissaoGrupo: situacaoProjeto).save()
		new Permissao(authority: "ROLE_DELETE_SITUACAO_PROJETO", descricao: delete, permissaoGrupo: situacaoProjeto).save()

		// Cadastro
		PermissaoGrupoMenu cadastro = new PermissaoGrupoMenu(nome: "Cadastro").save()

		PermissaoGrupo atividade = new PermissaoGrupo(permissaoGrupoMenu: cadastro, nome: "Atividade").save()
		new Permissao(authority: "ROLE_CREATE_ATIVIDADE", descricao: create, permissaoGrupo: atividade).save()
		new Permissao(authority: "ROLE_READ_ATIVIDADE", descricao: read, permissaoGrupo: atividade).save()
		new Permissao(authority: "ROLE_UPDATE_ATIVIDADE", descricao: update, permissaoGrupo: atividade).save()
		new Permissao(authority: "ROLE_DELETE_ATIVIDADE", descricao: delete, permissaoGrupo: atividade).save()

		PermissaoGrupo projeto = new PermissaoGrupo(permissaoGrupoMenu: cadastro, nome: "Projeto").save()
		new Permissao(authority: "ROLE_CREATE_PROJETO", descricao: create, permissaoGrupo: projeto).save()
		new Permissao(authority: "ROLE_READ_PROJETO", descricao: read, permissaoGrupo: projeto).save()
		new Permissao(authority: "ROLE_UPDATE_PROJETO", descricao: update, permissaoGrupo: projeto).save()
		new Permissao(authority: "ROLE_DELETE_PROJETO", descricao: delete, permissaoGrupo: projeto).save()

		// UsuarioGrupo
		UsuarioGrupo adminGrupo = new UsuarioGrupo(nome: "Admin", realizaAtividade: SimNao.NAO).save()
		
		// UsuarioGrupoPermissao
		new UsuarioGrupoPermissao(usuarioGrupo: adminGrupo, permissao: permissao).save()
		
		// Usuario
		Usuario admin = new Usuario(username: "admin", password: "123", usuarioGrupo: adminGrupo).save()
		
		// UsuarioPermissao
		new UsuarioPermissao(usuario: admin, permissao: permissao).save()
		
	}
	def destroy = {
	}
}
