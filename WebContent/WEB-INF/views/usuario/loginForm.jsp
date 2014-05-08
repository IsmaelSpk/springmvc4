<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Acesso ao Sistema</title>
	
	<!-- JQUERY -->
	<script src="resources/js/jquery.js"></script>
	
	<!-- TWITTER BOOTSTRAP CSS --> 
	<link  href="resources/js/bootstrap-3.1.1/css/bootstrap.css" rel="stylesheet" type="text/css" /> 
	
	<!-- TWITTER BOOTSTRAP JS --> 
	<script src="resources/js/bootstrap-3.1.1/js/bootstrap.js"></script>
</head>
<body>

<br/>
<br/>
<br/>

<div class="panel panel-default" title="Login" style="width:40%; Margin:0 auto;">
  <div class="panel-heading">
    <h3 class="panel-title">Login</h3>
  </div>
  <div class="panel-body" >
		<form class="form-horizontal" role="form">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">E-mail</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">Senha</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="inputPassword3" placeholder="Senha">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox"> Lembre-me
		        </label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Logar</button>
		    </div>
		  </div>
		</form>
    
  </div>
</div>



</body>
</html>