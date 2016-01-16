package br.com.gestaoProjeto

import grails.converters.JSON
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


class SituacaoProjetoController {

	def index() {
	}

	def listar() {

		def lista = SituacaoProjeto.createCriteria().list{ order("nome") }

		render(template: "lista", model:[situacaoProjetos: lista])
	}

	def incluir() {

		render(template: "form", model:[title: "Novo", editable: true])
	}

	def alterar() {

		SituacaoProjeto situacaoProjeto = SituacaoProjeto.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, situacaoProjeto: situacaoProjeto])
	}

	def visualizar() {

		SituacaoProjeto situacaoProjeto = SituacaoProjeto.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, situacaoProjeto: situacaoProjeto])
	}

	def salvar(SituacaoProjeto situacaoProjeto) {

		def retorno

		if (params.situacaoProjeto.id) {

			SituacaoProjeto old = SituacaoProjeto.get(params.situacaoProjeto.id);

			if (old.version.toLong() > params.situacaoProjeto.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("O situacaoProjeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (situacaoProjeto.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, situacaoProjeto.errors)
		} else {

			situacaoProjeto.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	def excluir() {

		def retorno

		SituacaoProjeto situacaoProjeto = SituacaoProjeto.get(params.id)

		try {

			situacaoProjeto.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
