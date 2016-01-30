package br.com.gestaoProjeto

import grails.plugin.springsecurity.annotation.Secured


@Secured("IS_AUTHENTICATED_FULLY")
class MenuController {

	//	def springSecurityService

	def index() {

		//		if(!(springSecurityService.isLoggedIn())) {
		//
		//			redirect(action: 'auth', controller: 'login')
		//		}
	}
}
