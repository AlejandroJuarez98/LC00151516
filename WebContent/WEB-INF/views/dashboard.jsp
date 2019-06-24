<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dashboard | Tarea final de programación n-capas</title>
		<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		 <style>
		 	body {
		 		background: #ecf0f1;
		 	}
		 	
		 	.title-root-container {
		 		text-align: center;
		 		font-size: 14pt;
		 		margin-top: 5%;
		 	}
		 	
		 	.branches-detail {
		 		margin-top: 100px;
		 	}
		 	
		 	.actions {
		 		display: flex;
		 	}
		 	
		 	.btn-new {
		 		margin-bottom: 10px;
		 	}
		 </style>
	</head>
	<body>
		<div class="root-container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <div class="container">
			  	  <a class="navbar-brand" href="#">N CAPAS</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav ml-auto">
				      <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          ${username}
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <form action="${pageContext.request.contextPath}/logout" method="POST">
				          	<input type="submit" id="exit" hidden/>
				          	<a class="dropdown-item" id="btn-exit">Salir</a>
				          <form>
				        </div>
				      </li>
				    </ul>
				  </div>
			  </div>
			</nav>
			<h3 class="title-root-container">Detalle de sucursales</h3>
			<div class="container">
				<div class="branches-detail">
					<a href="${pageContext.request.contextPath}/new-branch" class="btn btn-outline-info btn-new">Nueva sucursal</a>
					<table class="table table-bordered">
					  <thead>
					    <tr>
					      <th scope="col">Id</th>
					      <th scope="col">Apertura</th>
					      <th scope="col">Cierre</th>
					      <th scope="col">Ubicación</th>
					      <th scope="col">No. mesas</th>
					      <th scope="col">Operaciones</th>
					    </tr>
					  </thead>
					  <tbody>
					    <c:forEach items="${ branches }" var="branch">
					    	<tr>
					    		<th>${ branch.getBranchId() }</th>
					    		<th>${ branch.getOpeningTime() }</th>
					    		<th>${ branch.getClosingTime() }</th>
					    		<th>${ branch.getLocation() }</th>
					    		<th>${ branch.getTablesCount() }</th>
					    		<th class="actions">
									<a href="${pageContext.request.contextPath}/update-branch?id=${branch.getBranchId()}" class="btn btn-outline-primary">Actualizar</a>
									<form action="${pageContext.request.contextPath}/delete-branch" method="POST">
										<input value="${branch.getBranchId()}" name="id" type="text" hidden/><input class="btn btn-outline-danger" style="margin-left: 5px;" type="submit" value="Eliminar"/>
									</form>
								</th>
					    	</tr>
					    </c:forEach>
					  </tbody>
					</table>
					<c:if test = "${success == 0}">
						<div class="alert alert-success log" role="alert">
						   <p class="log">Sucursal modificada exitosamente!</p>
						</div>
					</c:if>	
					<c:if test = "${success == 1}">
						<div class="alert alert-success log" role="alert">
						   <p class="log">Sucursal eliminada exitosamente!</p>
						</div>
					</c:if>	
					<c:if test = "${error == 1}">
						<div class="alert alert-danger log" role="alert">
						   <p class="log">Ocurrio un error al eliminar la sucursal</p>
						</div>
					</c:if>	
				</div>
			</div>
		</div>
	</body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
		document.getElementById("btn-exit").addEventListener("click", function (event) {
			event.preventDefault();
			document.getElementById("exit").click();
		})
	</script>
</html>