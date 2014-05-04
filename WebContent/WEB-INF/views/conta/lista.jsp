 <%@ page language="java" contentType="text/html; charset=UTF-8" 
          pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de Contas</title>
</head>
<body>

	<table>
		<tr>
			<th>Código</th>
			<th>Descrição</th>
			<th>Valor</th>
			<th>Tipo</th>
			<th>Pago?</th>
			<th>Dt Pagamento</th>
			<th>Ações</th>
		</tr>
	
		<c:forEach items="${todasContas}"  var="conta">
			<tr>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td>${conta.tipo}</td>
				<td>
					<c:if test="${conta.paga eq false }">
						NaoPago!
					</c:if>
					<c:if test="${conta.paga eq true }">
						Pago!!
					</c:if>
				</td>
				<td>
					<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/>
				</td>
				<td>Açoes</td>
			</tr>	
		</c:forEach>	
	</table>

</body>
</html>