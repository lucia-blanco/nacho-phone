<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<nacho>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

      <link rel="stylesheet" type="text/css" href="css/estilo.css">
    
    <title>Login / Admin</title>
</head>


<body id="fondo-principal">
	<div id="wrapper-login" class="cover-container d-flex h-100 p-3 mx-auto flex-column text-center">
		<main role="main" class="inner cover">
      <% 
        String mostrar = request.getParameter("q");
      %>
      <form action="aValidacion.jsp" method="get" accept-charset="utf-8" onSubmit="return validacion()" id="formulario" class="form-signin">
        <h1 class="h1 mb-3 titulo">NachoPhone</h1>
        <h5 class="h5 font-weight-normal">Administrador</h5>
        
        <span id='<% out.print(mostrar); %>' style="display: none;"class='alert alert-danger mt-3' role='alert'>Correo electrónico o contraseña inválidos</span><br>
        <a style="margin-bottom: 5px; font-size: small;" href="index.jsp">Entrar como usuario</a>
        <input type="email" id="mail" name="mail" class="form-control form-group" placeholder="Correo electrónico" required autofocus value="">
        <input type="password" id="password" name="password" value="" class="form-control form-group" placeholder="Contraseña" required>
        <input id="button" class="btn btn-lg btn-basic btn-block" type="submit" name="button" value="Acceder">
        <small class="mt-5 mb-3 text-muted">© Nachophone 2018</small>
      </form>
    </main>
  </div>  
</body>
<script>
    window.onload = function alert() {
      //mostrar = request.getParameter("q");
      document.getElementById("cambia").style.display = "inline-block";
    };
    
    window.onclick = function quitar() {
      document.getElementById("cambia").style.display = "none";
    };
</script>
</html>