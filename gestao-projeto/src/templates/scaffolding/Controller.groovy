<%=packageName ? "package ${packageName}\n\n" : ''%>

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem

@Secured("IS_AUTHENTICATED_FULLY")
class ${className}Controller {

	@Secured(["ROLE_CREATE_${className}", "ROLE_READ_${className}", "ROLE_UPDATE_${className}", "ROLE_DELETE_${className}"])
	def index() {
	}

	def listar() {

		def lista = ${className}.createCriteria().list{ order("nome") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_${className}")
	def incluir() {

		${className} ${domainClass.propertyName} = new ${className}()
		
		render(template: "form", model:[title: "Novo", editable: true, ${domainClass.propertyName}: ${domainClass.propertyName}])
	}

	@Secured("ROLE_UPDATE_${className}")
	def alterar() {

		${className} ${domainClass.propertyName} = ${className}.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, ${domainClass.propertyName}: ${domainClass.propertyName}])
	}

	@Secured("ROLE_READ_${className}")
	def visualizar() {

		${className} ${domainClass.propertyName} = ${className}.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, ${domainClass.propertyName}: ${domainClass.propertyName}])
	}

	def salvar(${className} ${domainClass.propertyName}) {

		def retorno

		if (params.${domainClass.propertyName}.id) {

			${className} old = ${className}.get(params.${domainClass.propertyName}.id);

			if (old.version.toLong() > params.${domainClass.propertyName}.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A ${domainClass.propertyName} já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (${domainClass.propertyName}.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, ${domainClass.propertyName}.errors)
		} else {

			${domainClass.propertyName}.save(flush:true)

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	@Secured("ROLE_DELETE_${className}")
	def excluir() {

		def retorno

		${className} ${domainClass.propertyName} = ${className}.get(params.id)

		try {

			${domainClass.propertyName}.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
	
}
