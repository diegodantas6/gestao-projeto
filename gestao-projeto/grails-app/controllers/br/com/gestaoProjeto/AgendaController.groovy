package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import br.com.controleAcesso.Usuario

@Secured("IS_AUTHENTICATED_FULLY")
class AgendaController {

	def index() {
	}

	def getUsuarios() {

		List usuarios;

		Long idProjeto = Long.valueOf( params.idProjeto )

		if ( idProjeto.equals(0L) ) {

			usuarios = Usuario.createCriteria().list { order("username") }
		} else {

			StringBuilder sql = new StringBuilder()

			sql.append(" select distinct u				 ")
			sql.append(" from Usuario u, Atividade a	 ")
			sql.append(" where u.id = a.usuario			 ")
			sql.append(" and   a.projeto.id = :idProjeto ")
			sql.append(" order by u.username			 ")

			usuarios = Usuario.executeQuery(sql.toString(), [idProjeto: idProjeto])
		}

		render usuarios as JSON
	}

	def getAtividades() {

		Projeto projeto = Projeto.get( params.idProjeto )
		Usuario usuario = Usuario.get( params.idUsuario )

		List atividades = Atividade.createCriteria().list {
			if (projeto) {
				eq("projeto", projeto)
			}

			if (usuario) {
				eq("usuario", usuario)
			}
		}

		JSONArray eventos = new JSONArray()

		for (atividade in atividades) {

			JSONObject evento = new JSONObject()

			evento.put("id", atividade.id)
			evento.put("title", atividade.nome)
			evento.put("start", atividade.dataInicio)
			evento.put("end", atividade.dataFim)
			evento.put("color", atividade.situacaoAtividade.cor)

			eventos.add(evento)
		}

		render eventos as JSON
	}

	def getAtividade() {

		Atividade atividade = Atividade.get(params.id)

		render(template: "form", model:[atividade: atividade])
	}
}
