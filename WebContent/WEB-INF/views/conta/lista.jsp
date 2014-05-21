<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Listagem de Contas</title>
	
	<!-- JQUERY -->
	<script src="resources/js/jquery.js"></script>
	
	<!-- TWITTER BOOTSTRAP CSS --> 
	<link  href="resources/js/bootstrap-3.1.1/css/bootstrap.css" rel="stylesheet" type="text/css" /> 
	
	<!-- TWITTER BOOTSTRAP JS --> 
	<script src="resources/js/bootstrap-3.1.1/js/bootstrap.js"></script>
	
	<script type="text/javascript">

		function deuCerto( dadosResposta ){
			alert("Conta Paga com Sucesso !!!");
		}

		function pagaAgora( id ){
			$.get("pagaConta?id=" + id);

			$.post("pagaConta", {'id' : id}, function(resposta) { $("#rowStatus_"+id).text("Pago");}); 		    
		}
		
	</script>
		
</head>
<body>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Link</a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="panel panel-default" style="width:60%; Margin:0 auto;">
		<div class="panel-heading">Lista de Contas</div>
		<div class="panel-body">
			<p> Mostra todas as Lista de Documentos Pagos e Recebidos </p>
		</div>

		<table class="table table-bordered table-striped table-condensed table-responsive table-with-link">
			<tr>
				<th>Código</th>
				<th>Descrição</th>
				<th>Valor</th>
				<th>Tipo</th>
				<th>Pago?</th>
				<th>Dt Pagamento</th>
				<th>Ações</th>
			</tr>
			<c:forEach items="${todasContas}" var="conta">
				<tr id="roww_${conta.id}" class="link-container">
					<td>${conta.id}</td>
					<td>${conta.descricao}</td>
					<td>${conta.valor}</td>
					<td>${conta.tipo}</td>
					<td id="rowStatus_${conta.id}"><c:if
							test="${conta.paga eq false }">
						NaoPago!
					</c:if> <c:if test="${conta.paga eq true }">
						Pago
					</c:if></td>
					<td id="rowDtPgto_${conta.id}"><fmt:formatDate
							value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy" /></td>
					<td><a href="removeConta?id=${conta.id}">Remover</a> | <a
						href="mostraConta?id=${conta.id}">Alterar</a> | <c:if
							test="${conta.paga eq false}">
							<a href="#" onclick="pagaAgora(${conta.id});">Pagar</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br/>
	<br/>
	<a href="form">Incluir nova Conta</a>


</body>
</html>