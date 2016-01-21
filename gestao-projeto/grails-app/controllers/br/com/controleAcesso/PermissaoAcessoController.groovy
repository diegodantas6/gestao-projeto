package br.com.controleAcesso



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional;

import org.codehaus.groovy.grails.cli.support.UaaEnabler;
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject


@Secured("ROLE_USUARIO_GRUPO_PERMISSAO")
@Transactional(readOnly = true)
class PermissaoAcessoController {

	def index() {
		
		render view: 'index', model: [retorno: '{}']
		
	}
		
	private String getTreeViewData( UsuarioGrupo usuarioGrupo ) {

		JSONArray retorno = new JSONArray()
		
		List listPermissaoGrupoMenu = PermissaoGrupoMenu.list(sort: "nome")
		
		for (permissaoGrupoMenu in listPermissaoGrupoMenu) {
			
			JSONObject retornoAux = getJsonItemByPermissaoGrupoMenu(permissaoGrupoMenu)

			JSONArray retornoAuxItems1 = new JSONArray()
			
			List listPermissaoGrupo = PermissaoGrupo.findAllByMenu(permissaoGrupoMenu, [sort: "nome"])
			
			for (permissaoGrupo in listPermissaoGrupo) {
				
				JSONObject itemAux = getJsonItemByPermissaoGrupo(permissaoGrupo)
				
				JSONArray retornoAuxItems2 = new JSONArray()
				
				List listPermissao = Permissao.findAllByGrupo(permissaoGrupo, [sort: "descricao"])
				
				for (permissao in listPermissao) {
					
					retornoAuxItems2.add(getJsonItemByPermissao(permissao, usuarioGrupo))
					
				}
				
				itemAux.putAt("items", retornoAuxItems2)
				
				retornoAuxItems1.add(itemAux)
				
			}
			
			retornoAux.putAt("items", retornoAuxItems1)
			
			retorno.add(retornoAux)
			
		}
		
		return retorno.toString().replaceAll("\"", "")
				
	}

	private JSONObject getJsonItemByPermissao(Permissao permissao, UsuarioGrupo usuarioGrupo) {
		
		JSONObject jPermissao = new JSONObject()

		jPermissao.putAt("id", "'" + permissao.id + "'")
		jPermissao.putAt("text", "'" + permissao.descricao + "'")
		
		if ( PermissaoAcesso.findByUsuarioGrupoAndPermissao(usuarioGrupo, permissao) == null ) {
			
			jPermissao.putAt("checked", false)
			
		} else {
		
			jPermissao.putAt("checked", true)
			
		}

		return jPermissao
		
	}

	private JSONObject getJsonItemByPermissaoGrupo(PermissaoGrupo permissaoGrupo) {
		
		JSONObject jPermissaoGrupo = new JSONObject()

		jPermissaoGrupo.putAt("id", "'" + permissaoGrupo.id + "r'")
		jPermissaoGrupo.putAt("text", "'" + permissaoGrupo.nome + "'")
		jPermissaoGrupo.putAt("spriteCssClass", "'folder'")
//		jPermissaoGrupo.putAt("expanded", true)
		jPermissaoGrupo.putAt("expanded", false)

		return jPermissaoGrupo
		
	}

	private JSONObject getJsonItemByPermissaoGrupoMenu(PermissaoGrupoMenu permissaoGrupoMenu) {
		
		JSONObject jPermissaoGrupoMenu = new JSONObject()

		jPermissaoGrupoMenu.putAt("id", "'" + permissaoGrupoMenu.id + "m'")
		jPermissaoGrupoMenu.putAt("text", "'" + permissaoGrupoMenu.nome + "'")
		jPermissaoGrupoMenu.putAt("spriteCssClass", "'rootfolder'")
		jPermissaoGrupoMenu.putAt("expanded", true)
//		jPermissaoGrupoMenu.putAt("expanded", false)

		return jPermissaoGrupoMenu
		
	}
	
	def carregaTreeView() {
		
		Long idUserGroup = Long.valueOf( params.id )
		
		if (idUserGroup > 0L) {
			
			UsuarioGrupo usuarioGrupo = UsuarioGrupo.get( idUserGroup );

			String retorno = getTreeViewData( usuarioGrupo )
			
			render template: 'form', model: [retorno: retorno]
						
		} else {
		
			//render template: 'form', model: [retorno: null]
			render template: 'form', model: [retorno: '{}']
		
		}
		
	}
	
	@Transactional
	def save() {
		
		UsuarioGrupo usuarioGrupo = UsuarioGrupo.get(params.grupoUsuario)
		
		if (usuarioGrupo == null) {
			
			String mensagem = 'Favor serlecionar o Grupo de Usuário!'
			render(status: 500, text: message(code: mensagem))
			
		} else {
		
			PermissaoAcesso.removeAll(usuarioGrupo, true)
			
			String[] permissoes = params.result.toString().split(",")
			
			for (idPermissao in permissoes) {
				
				if (isInteger(idPermissao)) {
					
					Permissao permissao = Permissao.get(idPermissao)
					
					PermissaoAcesso.create(usuarioGrupo, permissao, true)
					
				}
				
			}

			StringBuilder sql = new StringBuilder()
			
			sql.append(" select up                                             ")
			sql.append(" from UsuarioPermissao up, Usuario u                   ")
			sql.append(" where up.usuario = u                                  ")
			sql.append(" and   u.grupo = :grupo                                ")
			sql.append(" and   not exists (select 1                            ")
			sql.append("                   from UsuarioGrupoPermissao ugp      ")
			sql.append("                   where u.grupo = ugp.usuarioGrupo    ")
			sql.append("                   and   up.permissao = ugp.permissao) ")

			List listUsuarioPermissao = UsuarioPermissao.executeQuery(sql.toString(), [grupo: usuarioGrupo])
			
			listUsuarioPermissao.each {
				it.delete(flush:true)
			}
			
			String mensagem = 'Salvo com sucesso!'
			render(status: 200, text: message(code: mensagem))
			
		}
		
	}
	
	private boolean isInteger(String string) {
		try {
			Integer.parseInt(string)
			return true
		} catch (Exception e) {
			return false
		}
	}
	
}
