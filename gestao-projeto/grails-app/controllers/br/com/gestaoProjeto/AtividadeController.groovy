package br.com.gestaoProjeto

import java.text.SimpleDateFormat;

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


@Secured("IS_AUTHENTICATED_FULLY")
class AtividadeController {

	@Secured(["ROLE_CREATE_ATIVIDADE", "ROLE_READ_ATIVIDADE", "ROLE_UPDATE_ATIVIDADE", "ROLE_DELETE_ATIVIDADE"])
	def index() {
	}

	def listar() {

		def lista = Atividade.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_ATIVIDADE")
	def incluir() {

		Atividade atividade = new Atividade()

		render(template: "form", model:[title: "Novo", editable: true, atividade: atividade])
	}

	@Secured("ROLE_UPDATE_ATIVIDADE")
	def alterar() {

		Atividade atividade = Atividade.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, atividade: atividade])
	}

	@Secured("ROLE_READ_ATIVIDADE")
	def visualizar() {

		Atividade atividade = Atividade.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, atividade: atividade])
	}

	def salvar(Atividade atividade) {

		def retorno

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy")

		Date dataInicio = null
		if (params.atividade.dataInicio)
			dataInicio = dateFormat.parse(params.atividade.dataInicio)

		Date dataFim = null
		if (params.atividade.dataFim)
			dataFim = dateFormat.parse(params.atividade.dataFim)

		if (dataFim < dataInicio) {
			retorno = UtilsMensagem.getMensagem("A data de Fim não pode ser menor do que a data de Inicio!", NotifyType.WARN)

			render retorno as JSON

			return
		}

		atividade.clearErrors()

		atividade.dataInicio = dataInicio

		atividade.dataFim = dataFim

		atividade.validate()

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

	@Secured("ROLE_DELETE_ATIVIDADE")
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
	
	def salvarComentario(AtividadeComentario atividadeComentario) {
		
		def retorno
		
		try {
			
			atividadeComentario.data = new Date()
			
			atividadeComentario.save(flush:true)
	
			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
			
			atividadeComentario.atividade.refresh()
	
		} catch(Exception e) {
		
			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, atividadeComentario.errors)
		
		} 
		
		render retorno as JSON
		
	}

	def excluirComentario() {

		def retorno

		try {
			
			AtividadeComentario atividadeComentario = AtividadeComentario.get(params.id)

			atividadeComentario.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
			
}
