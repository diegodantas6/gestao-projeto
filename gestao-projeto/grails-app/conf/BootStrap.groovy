import br.com.controleAcesso.Permissao
import br.com.controleAcesso.PermissaoGrupo

class BootStrap {

    def init = { servletContext ->

		String create = "Incluir"
		String read = "Visualizar"
		String update = "Alterar"
		String delete = "Excluir"
		
		// Controle Acesso
		PermissaoGrupo usuario = new PermissaoGrupo(nome: "Usuário").save()
		new Permissao(authority: "ROLE_CREATE_USUARIO", descricao: create, permissaoGrupo: usuario).save()
		new Permissao(authority: "ROLE_READ_USUARIO", descricao: read, permissaoGrupo: usuario).save()
		new Permissao(authority: "ROLE_UPDATE_USUARIO", descricao: update, permissaoGrupo: usuario).save()
		new Permissao(authority: "ROLE_DELETE_USUARIO", descricao: delete, permissaoGrupo: usuario).save()
		
		PermissaoGrupo usuarioGrupo = new PermissaoGrupo(nome: "Grupo Usuário").save()
		new Permissao(authority: "ROLE_CREATE_USUARIO_GRUPO", descricao: create, permissaoGrupo: usuarioGrupo).save()
		new Permissao(authority: "ROLE_READ_USUARIO_GRUPO", descricao: read, permissaoGrupo: usuarioGrupo).save()
		new Permissao(authority: "ROLE_UPDATE_USUARIO_GRUPO", descricao: update, permissaoGrupo: usuarioGrupo).save()
		new Permissao(authority: "ROLE_DELETE_USUARIO_GRUPO", descricao: delete, permissaoGrupo: usuarioGrupo).save()
		
		PermissaoGrupo permissaoAcesso = new PermissaoGrupo(nome: "Permissão Acesso").save()
		new Permissao(authority: "ROLE_CREATE_PERMISSAO_ACESSO", descricao: create, permissaoGrupo: permissaoAcesso).save()
		new Permissao(authority: "ROLE_READ_PERMISSAO_ACESSO", descricao: read, permissaoGrupo: permissaoAcesso).save()
		new Permissao(authority: "ROLE_UPDATE_PERMISSAO_ACESSO", descricao: update, permissaoGrupo: permissaoAcesso).save()
		new Permissao(authority: "ROLE_DELETE_PERMISSAO_ACESSO", descricao: delete, permissaoGrupo: permissaoAcesso).save()

		// Configuracao
		PermissaoGrupo situacaoAtividade = new PermissaoGrupo(nome: "Situação Atividade").save()
		new Permissao(authority: "ROLE_CREATE_SITUACAO_ATIVIDADE", descricao: create, permissaoGrupo: situacaoAtividade).save()
		new Permissao(authority: "ROLE_READ_SITUACAO_ATIVIDADE", descricao: read, permissaoGrupo: situacaoAtividade).save()
		new Permissao(authority: "ROLE_UPDATE_SITUACAO_ATIVIDADE", descricao: update, permissaoGrupo: situacaoAtividade).save()
		new Permissao(authority: "ROLE_DELETE_SITUACAO_ATIVIDADE", descricao: delete, permissaoGrupo: situacaoAtividade).save()

		PermissaoGrupo situacaoProjeto = new PermissaoGrupo(nome: "Situação Projeto").save()
		new Permissao(authority: "ROLE_CREATE_SITUACAO_PROJETO", descricao: create, permissaoGrupo: situacaoProjeto).save()
		new Permissao(authority: "ROLE_READ_SITUACAO_PROJETO", descricao: read, permissaoGrupo: situacaoProjeto).save()
		new Permissao(authority: "ROLE_UPDATE_SITUACAO_PROJETO", descricao: update, permissaoGrupo: situacaoProjeto).save()
		new Permissao(authority: "ROLE_DELETE_SITUACAO_PROJETO", descricao: delete, permissaoGrupo: situacaoProjeto).save()

		// Cadastro
		PermissaoGrupo atividade = new PermissaoGrupo(nome: "Atividade").save()
		new Permissao(authority: "ROLE_CREATE_ATIVIDADE", descricao: create, permissaoGrupo: atividade).save()
		new Permissao(authority: "ROLE_READ_ATIVIDADE", descricao: read, permissaoGrupo: atividade).save()
		new Permissao(authority: "ROLE_UPDATE_ATIVIDADE", descricao: update, permissaoGrupo: atividade).save()
		new Permissao(authority: "ROLE_DELETE_ATIVIDADE", descricao: delete, permissaoGrupo: atividade).save()

		PermissaoGrupo projeto = new PermissaoGrupo(nome: "Projeto").save()
		new Permissao(authority: "ROLE_CREATE_PROJETO", descricao: create, permissaoGrupo: projeto).save()
		new Permissao(authority: "ROLE_READ_PROJETO", descricao: read, permissaoGrupo: projeto).save()
		new Permissao(authority: "ROLE_UPDATE_PROJETO", descricao: update, permissaoGrupo: projeto).save()
		new Permissao(authority: "ROLE_DELETE_PROJETO", descricao: delete, permissaoGrupo: projeto).save()

    }
    def destroy = {
    }
}
