package br.com.gestaoProjeto

import grails.plugin.springsecurity.annotation.Secured

@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
class MenuController {

	def index() {
	}
}
