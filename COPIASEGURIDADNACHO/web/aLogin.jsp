
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">

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

<body>
    <h2>NachoPhone / Administrador</h2>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% 
      
      String mostrar = request.getParameter("q");

    %>
    <form action="aValidacion.jsp" method="get" accept-charset="utf-8"  id="formulario">
        <div id="<% out.print(mostrar); %>" style="display: none;">Error en las credenciales</div><br/>
        <label for="mail">Correo electrónico </label><br>
        <input type="text" id='mail' name='mail'  /><br>
        <label for="pass">Contraseña </label><br>
        <input type="password" id="pass" name="pass"  /></span><br/>

        <input id="button" type="submit" name="button" value="Acceder">

       
    </form>
</body>
<script>
    
    window.onload = function alert() {
        //mostrar = request.getParameter("q");
        
            document.getElementById("cambia").style.display = "inline";
        
    };
    
    widow.onclick = function quitar () {
        
        document.getElementById("cambia").style.display = "none";
    }
</script>

</html>