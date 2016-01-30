package br.com.controleAcesso

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import br.com.teste.enums.NotifyType
import br.com.teste.utils.UtilsMensagem


@Secured("IS_AUTHENTICATED_FULLY")
class UsuarioController {

	@Secured(["ROLE_CREATE_USUARIO", "ROLE_READ_USUARIO", "ROLE_UPDATE_USUARIO", "ROLE_DELETE_USUARIO"])
	def index() {
	}

	def listar() {

		def lista = Usuario.createCriteria().list{ order("username") }

		render(template: "lista", model:[lista: lista])
	}

	@Secured("ROLE_CREATE_USUARIO")
	def incluir() {

		Usuario usuario = new Usuario()

		render(template: "form", model:[title: "Novo", editable: true, usuario: usuario])
	}

	@Secured("ROLE_UPDATE_USUARIO")
	def alterar() {

		Usuario usuario = Usuario.get(params.id)

		render(template: "form", model:[title: "Alterar", editable: true, usuario: usuario])
	}

	@Secured("ROLE_READ_USUARIO")
	def visualizar() {

		Usuario usuario = Usuario.get(params.id)

		render(template: "form", model:[title: "Visualizar", editable: false, usuario: usuario])
	}

	def salvar(Usuario usuario) {

		def retorno

		Long grupoOld
		Long grupoNew
		
		if (params.usuario.id) {

			Usuario old = Usuario.get(params.usuario.id);

			grupoOld = params.grupoOld.toLong()
			grupoNew = params.usuario.usuarioGrupo.toLong()
						
			if (old.version.toLong() > params.usuario.version.toLong()) {

				retorno = UtilsMensagem.getMensagem("A situação projeto já foi alterado por outro usuário!\nFavor canecelar esta operação e tentar novamente!", NotifyType.ERROR)

				render retorno as JSON

				return
			}
		}

		if (usuario.hasErrors()) {

			retorno = UtilsMensagem.getMensagem("Não foi possível salvar!", NotifyType.ERROR, usuario.errors)
		} else {
		
			usuario.save(flush:true)

			if (grupoOld) {
				
				if (!(grupoOld.equals(grupoNew))) {
					// incluir permissoes quando o usuario muda de grupo

					UsuarioPermissao.removeAll(usuario, true)

					List permissoes = UsuarioGrupoPermissao.findAllByUsuarioGrupo(usuario.usuarioGrupo)

					for (usuarioGrupoPermissao in permissoes) {

						UsuarioPermissao.create(usuario, usuarioGrupoPermissao.permissao, true)

					}

				}
			} else {
				// incluir permissoes para novos usuarios

				List permissoes = UsuarioGrupoPermissao.findAllByUsuarioGrupo(usuario.usuarioGrupo)

				for (usuarioGrupoPermissao in permissoes) {

					UsuarioPermissao.create(usuario, usuarioGrupoPermissao.permissao, true)

				}

			}

			retorno = UtilsMensagem.getMensagem("Salvo com sucesso!", NotifyType.SUCCESS)
		}

		render retorno as JSON
	}

	@Secured("ROLE_DELETE_USUARIO")
	def excluir() {

		def retorno

		Usuario usuario = Usuario.get(params.id)

		try {

			UsuarioPermissao.removeAll(usuario, true);

			usuario.delete(flush:true)

			retorno = UtilsMensagem.getMensagem("Excluido com sucesso!", NotifyType.SUCCESS)
		} catch(Exception e) {

			retorno = UtilsMensagem.getMensagem("Não foi possível excluir!", NotifyType.ERROR)
		}

		render retorno as JSON
	}
}
