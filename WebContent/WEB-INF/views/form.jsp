<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de sucursales | TAREA DE PROGRAMACIÓN N-CAPAS</title>
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
 	
 	.form-container {
 		margin-top: 5%;;
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
			          </form>
			        </div>
			      </li>
			    </ul>
			  </div>
		  </div>
		</nav>
		<h3 class="title-root-container">Formulario de sucursales</h3>
		<div class="container">
			<div class="row">
				<div class='${action.equals("new") ? "col-md-12" : "col-md-6"}'>
					<form action="${pageContext.request.contextPath}/${action}" method="POST">
			         	<div class="form-group">
			         		<input type="text" name="id" value='${(branch != null) ? branch.getBranchId() : 0}' hidden/>
							<label class="form-label" for="location">Ubicación:</label>
							<input class="form-control" type="text" name="location" value='${(branch != null) ? branch.getLocation() : ""}' autocomplete="off" required />
						</div>
						<div class="form-group">
							<label class="form-label" for="openingTime">Apertura:</label>
							<input class="form-control" type="text" name="openingTime" value='${(branch != null) ? branch.getOpeningTime() : ""}' autocomplete="off" required />
						</div>
						<div class="form-group">
							<label class="form-label" for="closingTime">Apertura:</label>
							<input class="form-control" type="text" name="closingTime" value='${(branch != null) ? branch.getClosingTime() : ""}' autocomplete="off" required />
						</div>
						<div class="form-group">
							<label class="form-label" for="tablesCount">Numero de mesas:</label>
							<input class="form-control" type="number" name="tablesCount" value="${(branch != null) ? branch.getTablesCount() : 0}" autocomplete="off" required />
						</div>
						<input class="btn btn-outline-primary w-100" type="submit" value="Actualizar" />
			         </form>
				</div>
				<c:if test = '${action.equals("update")}'>
					<div class="col-md-6">
					   <form action="${pageContext.request.contextPath}/add-employee" method="POST">
				         	<div class="form-group">
								<input class="form-control" type="text" name="branchId" value="${branch.getBranchId()}" hidden />
								<label class="form-label" for="employe">Nombre:</label>
								<input class="form-control" type="text" name="name" autocomplete="off" required />
							</div>
							<div class="form-group">
								<label class="form-label" for="age">Edad:</label>
								<input class="form-control" type="number" name="age" autocomplete="off" required />
							</div>
							<div class="form-group">
								<label class="form-label" for="gender">Género:</label>
								<input class="form-control" type="text" name="gender" autocomplete="off" required />
							</div>
							<input class="btn btn-outline-info w-100" type="submit" value="Nuevo empleado" />
				        </form>
					</div>
				</c:if>	
			</div>
			<c:if test = '${action.equals("update")}'>
				
			</c:if>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
		document.getElementById("btn-exit").addEventListener("click", function (event) {
			event.preventDefault();
			document.getElementById("exit").click();
		})
	</script>
</body>
</html>