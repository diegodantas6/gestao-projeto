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
		new PermissaoGrupo(nome: "Situação Atividade").save()
		new PermissaoGrupo(nome: "Situação Projeto").save()
		
		// Cadastro
		new PermissaoGrupo(nome: "Atividade").save()
		new PermissaoGrupo(nome: "Projeto").save()
		
    }
    def destroy = {
    }
}
