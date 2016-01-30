package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


@Secured("IS_AUTHENTICATED_FULLY")
class ProjetoController {

	@Secured(["ROLE_CREATE_PROJETO", "ROLE_READ_PROJETO", "ROLE_UPDATE_PROJETO", "ROLE_DELETE_PROJETO"])
	def index() {
	}

	def listar() {

		def lista = Projeto.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_PROJETO")
	def incluir() {

		render(template: "form", model:[title: "Novo", editable: true])
	}

	@Secured("ROLE_UPDATE_PROJETO")
	def alterar() {

		Projeto projeto = Projeto.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, projeto: projeto])
	}

	@Secured("ROLE_READ_PROJETO")
	def visualizar() {

		Projeto projeto = Projeto.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, projeto: projeto])
	}

	def salvar(Projeto projeto) {

		def retorno

		if (params.projeto.id) {

			Projeto old = Projeto.get(params.projeto.id);

			if (old.version.toLong() > params.projeto.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("O projeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (projeto.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, projeto.errors)
		} else {

			projeto.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	@Secured("ROLE_DELETE_PROJETO")
	def excluir() {

		def retorno

		Projeto projeto = Projeto.get(params.id)

		try {

			projeto.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
