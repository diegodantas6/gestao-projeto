package br.com.gestaoProjeto

import grails.plugin.springsecurity.annotation.Secured

@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
class MenuController {

	def index() {

		List projetos = Projeto.list(sort: "nome")
		
		for (projeto in projetos) {
			
			List atividades = Atividade.findAllByProjeto(projeto)
			
			int quantidade = 0
			
			int totalConcluido = 0
			
			int totalFaltando = 0
			
			for (atividade in atividades) {
				
				quantidade++
				
				totalConcluido += atividade.percentualConcluido
				
			}
			
			if (quantidade > 0) {
				// calcula total concluido
				totalConcluido = ( totalConcluido / quantidade )
	
				// calcula total faltando
				totalFaltando = 100 - totalConcluido
			}

			println projeto.nome
			println totalConcluido
			println totalFaltando
		}
	}
}
