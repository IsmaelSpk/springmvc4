<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir nova Conta</title>
</head>
<body>

	<h3>Adicionar Nova Conta</h3>
	
	<form action="adicionaContaForm" method="post">
	
		Descrição:<br/>
		<textarea name="descricao" rows="4" cols="100"></textarea>
		<br/>
		Valor:<br/>
		<input type="text" name="valor">
		<br/>
		Tipo:<br/>
		<select name="tipo"> 
			<option value="ENTRADA">ENTRADA</option>
			<option value="SAIDA">SAIDA</option>
		</select>
					
		<br/>
		<br/>
		
		<input type="submit" value="Adiciona"/>
		
	</form>

</body>
</html>