package br.com.caelum.contas.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {

	@RequestMapping("/form")
	public String formulario(){
		return "formulario";
	}
	
	@RequestMapping("/adicionaContaForm")
	public String adiciona(@Valid Conta conta, BindingResult result ){
		
		if ( result.hasErrors() ){
			return "formulario";
		}
		ContaDAO contaDAO = new ContaDAO();
		contaDAO.adiciona(conta);
		return "redirect:listaContas";
	}
	
	@RequestMapping("/removeConta")
	public String remove( Conta conta ){
		ContaDAO contaDAO = new ContaDAO();
		contaDAO.remove(conta);
		return "redirect:listaContas"; 
	}
	
	@RequestMapping("/mostraConta")
	public String mostra(Long id, Model model) {
		ContaDAO dao = new ContaDAO();
	    model.addAttribute("conta", dao.buscaPorId(id));
	    return "conta/mostra";
	}	
	
	@RequestMapping("/alteraConta")
	public String altera(Conta conta) {
		ContaDAO dao = new ContaDAO();
		dao.altera(conta);
	   return "redirect:listaContas";
	}
	
	@RequestMapping("/listaContas")
	public ModelAndView lista(){
		ContaDAO dao  = new ContaDAO();
		List<Conta> contas = dao.lista();
		//System.out.println("Numero de registros:"+contas.size());
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("todasContas",contas);
		return mv;
	}
	
}
