package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


@Secured("IS_AUTHENTICATED_FULLY")
class SituacaoAtividadeController {

	@Secured(["ROLE_CREATE_SITUACAO_ATIVIDADE", "ROLE_READ_SITUACAO_ATIVIDADE", "ROLE_UPDATE_SITUACAO_ATIVIDADE", "ROLE_DELETE_SITUACAO_ATIVIDADE"])
	def index() {
	}

	def listar() {

		def lista = SituacaoAtividade.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_SITUACAO_ATIVIDADE")
	def incluir() {

		SituacaoAtividade situacaoAtividade = new SituacaoAtividade()
		
		render(template: "form", model:[title: "Novo", editable: true, situacaoAtividade: situacaoAtividade])
	}

	@Secured("ROLE_UPDATE_SITUACAO_ATIVIDADE")
	def alterar() {

		SituacaoAtividade situacaoAtividade = SituacaoAtividade.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, situacaoAtividade: situacaoAtividade])
	}

	@Secured("ROLE_READ_SITUACAO_ATIVIDADE")
	def visualizar() {

		SituacaoAtividade situacaoAtividade = SituacaoAtividade.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, situacaoAtividade: situacaoAtividade])
	}

	def salvar(SituacaoAtividade situacaoAtividade) {

		def retorno

		if (params.situacaoAtividade.id) {

			SituacaoAtividade old = SituacaoAtividade.get(params.situacaoAtividade.id);

			if (old.version.toLong() > params.situacaoAtividade.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A situação projeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (situacaoAtividade.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, situacaoAtividade.errors)
		} else {

			situacaoAtividade.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	@Secured("ROLE_DELETE_SITUACAO_ATIVIDADE")
	def excluir() {

		def retorno

		SituacaoAtividade situacaoAtividade = SituacaoAtividade.get(params.id)

		try {

			situacaoAtividade.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
