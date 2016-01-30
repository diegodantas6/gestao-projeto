package br.com.controleAcesso

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


@Secured("IS_AUTHENTICATED_FULLY")
class UsuarioGrupoController {

	@Secured(["ROLE_CREATE_USUARIO_GRUPO", "ROLE_READ_USUARIO_GRUPO", "ROLE_UPDATE_USUARIO_GRUPO", "ROLE_DELETE_USUARIO_GRUPO"])
	def index() {
	}

	def listar() {

		def lista = UsuarioGrupo.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_USUARIO_GRUPO")
	def incluir() {

		render(template: "form", model:[title: "Novo", editable: true])
	}

	@Secured("ROLE_UPDATE_USUARIO_GRUPO")
	def alterar() {

		UsuarioGrupo usuarioGrupo = UsuarioGrupo.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, usuarioGrupo: usuarioGrupo])
	}

	@Secured("ROLE_READ_USUARIO_GRUPO")
	def visualizar() {

		UsuarioGrupo usuarioGrupo = UsuarioGrupo.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, usuarioGrupo: usuarioGrupo])
	}

	def salvar(UsuarioGrupo usuarioGrupo) {
		
		def retorno

		if (params.usuarioGrupo.id) {

			UsuarioGrupo old = UsuarioGrupo.get(params.usuarioGrupo.id);

			if (old.version.toLong() > params.usuarioGrupo.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A situação projeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (usuarioGrupo.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, usuarioGrupo.errors)
		} else {

			usuarioGrupo.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	@Secured("ROLE_DELETE_USUARIO_GRUPO")
	def excluir() {

		def retorno

		UsuarioGrupo usuarioGrupo = UsuarioGrupo.get(params.id)

		try {

			usuarioGrupo.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
