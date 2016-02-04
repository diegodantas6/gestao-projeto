package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


@Secured("IS_AUTHENTICATED_FULLY")
class SituacaoProjetoController {

	@Secured(["ROLE_CREATE_SITUACAO_PROJETO", "ROLE_READ_SITUACAO_PROJETO", "ROLE_UPDATE_SITUACAO_PROJETO", "ROLE_DELETE_SITUACAO_PROJETO"])
	def index() {
	}

	def listar() {

		def lista = SituacaoProjeto.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_SITUACAO_PROJETO")
	def incluir() {

		SituacaoProjeto situacaoProjeto = new SituacaoProjeto()
		
		render(template: "form", model:[title: "Novo", editable: true, situacaoProjeto: situacaoProjeto])
	}

	@Secured("ROLE_UPDATE_SITUACAO_PROJETO")
	def alterar() {

		SituacaoProjeto situacaoProjeto = SituacaoProjeto.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, situacaoProjeto: situacaoProjeto])
	}

	@Secured("ROLE_READ_SITUACAO_PROJETO")
	def visualizar() {

		SituacaoProjeto situacaoProjeto = SituacaoProjeto.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, situacaoProjeto: situacaoProjeto])
	}

	def salvar(SituacaoProjeto situacaoProjeto) {
		
		def retorno

		if (params.situacaoProjeto.id) {

			SituacaoProjeto old = SituacaoProjeto.get(params.situacaoProjeto.id);

			if (old.version.toLong() > params.situacaoProjeto.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A situação projeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

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

	@Secured("ROLE_DELETE_SITUACAO_PROJETO")
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
