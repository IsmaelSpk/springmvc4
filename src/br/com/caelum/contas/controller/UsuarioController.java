package br.com.caelum.contas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.contas.dao.UsuarioDAO;
import br.com.caelum.contas.modelo.Usuario;

@Controller
public class UsuarioController {

	@RequestMapping("/login")
	public String loginForm(){
		return "/usuario/loginForm"; 
	}

	@RequestMapping("/efetuaLogin")
	public String login( Usuario usuario, HttpSession sessao ){
		UsuarioDAO udao = new UsuarioDAO();
		if ( udao.existeUsuario(usuario) )
		{
			sessao.setAttribute("usuarioLogado", usuario);
			return "redirect:listaContas";
		}
		return "redirect:login";
	}
	
}
