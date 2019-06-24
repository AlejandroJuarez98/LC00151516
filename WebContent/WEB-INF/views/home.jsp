<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login | Tarea final de programación n-capas</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
		body {
			width: 100%; 
			height: 100vh;
			background: #344C5C;
			overflow: hidden;
		}
		
		.root-container {
			width: 400px;
			height: auto;
			margin: 9% auto;
			padding: 15px 15px;
			border-radius: 15px;
			background-color: #eeeeee;
		}
		
		.root-container-title {
			margin-top: 40px;
			color: #222222;
			font-weight: 600;
			text-align: center;
			font-family: 'Raleway', sans-serif;
		}
		
		.root-container-description {
			text-align: center;
			font-size: 10pt;
		}
		
		.divider30 {
			width: 100%;
			height: 30px;
		}
		
		.login-form {
			padding: 15px 45px;
		}
		
		.form-label {
			font-size: 10pt;
		}
		
		.btn-login {
			width: 100%;
			margin-top: 30px;
		}
		
		.log {
			margin-top: 20px;
			font-size: 10pt;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="root-container">
		<h3 class="root-container-title">Inicio de sesión<h3>
		<p class="root-container-description">Tarea final de programación n-capas 01/2019</p>
		<div class="divider50"></div>
		<form class="login-form" action="${pageContext.request.contextPath}/login" method="POST">
			<div class="form-group">
				<label class="form-label" for="username">Usuario:</label>
				<input class="form-control" type="text" name="username" placeholder="Ingresa tu usuario..." autocomplete="off" required />
			</div>
			<div class="form-group">
				<label class="form-label" for="password">Contraseña:</label>
				<input class="form-control" type="password" name="password" placeholder="Ingresa tu contraseña..." required />
			</div>
			<input class="btn btn-outline-secondary btn-login" type="submit" />
			<c:if test = "${error == 1}">
				<div class="alert alert-danger log" role="alert">
				   <p class="log">¡Datos incorrectos!</p>
				</div>
			</c:if>			
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>