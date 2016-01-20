package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem

@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
class AtividadeController {

	def index() {
	}

	def listar() {

		def lista = Atividade.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	def incluir() {

		Atividade atividade = new Atividade()
		
		render(template: "form", model:[title: "Novo", editable: true, atividade: atividade])
	}

	def alterar() {

		Atividade atividade = Atividade.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, atividade: atividade])
	}

	def visualizar() {

		Atividade atividade = Atividade.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, atividade: atividade])
	}

	def salvar(Atividade atividade) {

		def retorno

		if (params.atividade.id) {

			Atividade old = Atividade.get(params.atividade.id);

			if (old.version.toLong() > params.atividade.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A atividade já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (atividade.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, atividade.errors)
		} else {

			atividade.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	def excluir() {

		def retorno

		Atividade atividade = Atividade.get(params.id)

		try {

			atividade.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}