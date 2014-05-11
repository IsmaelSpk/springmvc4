package br.com.caelum.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {

	private ContaDAO contaDAO;

	@Autowired
	public ContaController( ContaDAO contaDAO ) {
		this.contaDAO = contaDAO;
	}
	
	@RequestMapping("/form")
	public String formulario(){
		return "formulario";
	}
	
	@RequestMapping("/adicionaContaForm")
	public String adiciona(@Valid Conta conta, BindingResult result ){
		
		if ( result.hasErrors() ){
			return "formulario";
		}
		
		this.contaDAO.adiciona(conta);
		return "redirect:listaContas";
	}
	
	@RequestMapping("/removeConta")
	public String remove( Conta conta ){
		this.contaDAO.remove(conta);
		return "redirect:listaContas"; 
	}
	
	@RequestMapping("/mostraConta")
	public String mostra(Long id, Model model) {
	    model.addAttribute("conta", this.contaDAO.buscaPorId(id));
	    return "conta/mostra";
	}	
	
	@RequestMapping("/alteraConta")
	public String altera(Conta conta) {
	   this.contaDAO.altera(conta);
	   return "redirect:listaContas";
	}
	
	@RequestMapping("/listaContas")
	public ModelAndView lista(){
		List<Conta> contas = contaDAO.lista();
		//System.out.println("Numero de registros:"+contas.size());
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("todasContas",contas);
		return mv;
	}
	
	@RequestMapping("/pagaConta")
	public void pagaConta( Conta conta, HttpServletResponse resposta ){
		contaDAO.paga(conta.getId());
		System.out.println("pagamento de Conta via Ajax");
		resposta.setStatus(200);
	}
	
}
