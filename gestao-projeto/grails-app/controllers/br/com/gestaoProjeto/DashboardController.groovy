package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject;

@Secured("IS_AUTHENTICATED_FULLY")
class DashboardController {

	def index() {
		
	}
	
	def getProjetos() {
		
		//List projetos = Projeto.list(sort: "nome")
		
		List projetos = Projeto.createCriteria().list {
			
			situacaoProjeto {
				
				eq("exibeDashboard", true)
				
			}
			
			order("nome")
			
		}
		
		JSONArray retorno = new JSONArray()
		
		for (projeto in projetos) {
			
			List atividades = Atividade.findAllByProjeto(projeto)
			
			int quantidade = 0
			
			int totalConcluido = 0
			
			int totalFaltando = 100
			
			for (atividade in atividades) {
				
				quantidade++
				
				totalConcluido += atividade.percentualConcluido
				
			}
			
			if (quantidade > 0) {
				// calcula total concluido
				totalConcluido = ( totalConcluido / quantidade )
	
				// calcula total faltando
				totalFaltando -=  totalConcluido
			}

			JSONObject obj = new JSONObject()
			
			obj.put("id", projeto.id)
			obj.put("nome", projeto.nome)
			obj.put("concluido", totalConcluido)
			obj.put("faltando", totalFaltando)

			retorno.add(obj)
			
		}
		
		render(template: "projeto", model: [retorno: retorno])
	}
	
	def getAtividades() {
		
		Projeto projeto = Projeto.get(params.id)
		
		List atividades = Atividade.createCriteria().list {
			
			eq("projeto", projeto)
			
			order("usuario", "nome")
			
		}

		render(template: "atividade", model: [atividades: atividades, title: projeto.nome])
	}
}
