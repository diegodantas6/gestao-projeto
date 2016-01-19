package br.com.controleAcesso

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem

@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
class UsuarioController {

	def index() {
	}

	def listar() {

		def lista = Usuario.createCriteria().list{ order("username") }

		render(template: "lista", model:[lista: lista])
	}

	def incluir() {
		
		Usuario usuario = new Usuario()
		
		render(template: "form", model:[title: "Novo", editable: true, usuario: usuario])
	}

	def alterar() {

		Usuario usuario = Usuario.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, usuario: usuario])
	}

	def visualizar() {

		Usuario usuario = Usuario.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, usuario: usuario])
	}

	def salvar(Usuario usuario) {
		
		def retorno

		if (params.usuario.id) {

			Usuario old = Usuario.get(params.usuario.id);

			if (old.version.toLong() > params.usuario.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A situação projeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (usuario.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, usuario.errors)
		} else {

			usuario.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	def excluir() {

		def retorno

		Usuario usuario = Usuario.get(params.id)

		try {

			usuario.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
