package br.com.gestaoProjeto



import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem

@Secured("IS_AUTHENTICATED_FULLY")
class TesteController {

	@Secured(["ROLE_CREATE_TESTE", "ROLE_READ_TESTE", "ROLE_UPDATE_TESTE", "ROLE_DELETE_TESTE"])
	def index() {
	}

	def listar() {

		def lista = Teste.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_TESTE")
	def incluir() {

		Teste teste = new Teste()
		
		render(template: "form", model:[title: "Novo", editable: true, teste: teste])
	}

	@Secured("ROLE_UPDATE_TESTE")
	def alterar() {

		Teste teste = Teste.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, teste: teste])
	}

	@Secured("ROLE_READ_TESTE")
	def visualizar() {

		Teste teste = Teste.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, teste: teste])
	}

	def salvar(Teste teste) {

		def retorno

		if (params.teste.id) {

			Teste old = Teste.get(params.teste.id);

			if (old.version.toLong() > params.teste.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A teste já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (teste.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, teste.errors)
		} else {

			teste.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	@Secured("ROLE_DELETE_TESTE")
	def excluir() {

		def retorno

		Teste teste = Teste.get(params.id)

		try {

			teste.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
	
}
