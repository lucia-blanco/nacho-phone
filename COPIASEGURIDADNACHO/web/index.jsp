<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

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
   
    <title>Login</title>
</head>

<body id="fondo-principal" class="text-center">
	<div id="wrapper-login" class="cover-container d-flex h-100 p-3 mx-auto flex-column text-center">
		<main role="main" class="inner cover">
      <a href="aLogin.jsp">Admin</a>
      <form action="validate.jsp" method="get" accept-charset="utf-8" onSubmit="return validacion()" id="formulario" class="form-signin">
        <h1 class="h1 mb-3 titulo">NachoPhone</h1>
        <h5 class="h5 font-weight-normal">Por favor, identifícate</h5>
        <span id="errorLogin" style="display: none; color: red;">Correo electrónico o contraseña inválidos</span><br>
        <input type="email" id="mail" name="mail" class="form-control form-group" placeholder="Correo electrónico" required autofocus value="">
        <input type="password" id="password" name="password" value="" class="form-control form-group" placeholder="Contraseña" required>
        <input id="button" class="btn btn-lg btn-basic btn-block" type="submit" name="button" value="Acceder">
        <div id='error' style="display:none;"class='alert alert-danger mt-3' role='alert'>Correo o contraseña inválidos</div>
        <%
          
        %>
        <a href="registro.jsp" id="registro">Registrarse</a>
        <small class="mt-5 mb-3 text-muted">© Nachophone 2018</small>
      </form>
    </main>
  </div>  
</body>

</html>
