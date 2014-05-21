package br.com.caelum.contas.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
	throws Exception {
		
		
		String uri = request.getRequestURI();			
		System.out.println("==>> "+uri);
		if( uri.endsWith("/") || uri.endsWith("login") || uri.endsWith("efetuaLogin") || uri.endsWith("tabelas") || uri.contains("resources")) {
			return true;
		}
		
		if(request.getSession().getAttribute("usuarioLogado")!=null) {
			return true;
		} else {
			response.sendRedirect("login");
			return false;
		}
		
	}
}
