package br.com.teste.utils

import org.codehaus.groovy.grails.web.json.JSONObject;
import org.springframework.validation.Errors;

import br.com.teste.enums.NotifyType

class UtilsMensagem {

	public static JSONObject getMensagem(String mensagem, NotifyType notifyType) {

		def retorno = [:]
		
		retorno["mensagem"] = mensagem
		retorno["type"] = notifyType.getType()
		
		return retorno
	}
	
	public static JSONObject getMensagem(String mensagem, NotifyType notifyType, Errors errors) {

		def retorno = [:]
		
		retorno["mensagem"] = mensagem
		retorno["type"] = notifyType.getType()
		retorno["errors"] = errors
		
		return retorno
	}
}
