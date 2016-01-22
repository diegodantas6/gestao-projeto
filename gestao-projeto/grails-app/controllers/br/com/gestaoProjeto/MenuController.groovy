package br.com.gestaoProjeto

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject;

@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
class MenuController {

	def index() {
	}
}
