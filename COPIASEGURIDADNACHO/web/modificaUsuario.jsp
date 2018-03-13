
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/usuario.css">
    <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
    
    <title></title>
</head>


<body>
      <%      
          String correo = request.getParameter("mail");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s = conexion.createStatement();
          ResultSet dato = s.executeQuery("SELECT * FROM USUARIO WHERE email= '" + correo + "' ");
          while (dato.next()) {
    %>
    <form action="guardaMod.jsp" method="GET">
        <input style="display: none;" type="text" id="mail" name="mail" value="<%= dato.getString("email") %>" /><br/>
        <label for="contraseña">Contraseña </label>
        <input type="password" id="contraseña" name="contraseña" value="<%= dato.getString("passw")%>" /><br/>
        <label for="dni">DNI </label>
        <input type="text" id="dni" name="dni" value="<%= dato.getString("dni")%>" /><br/>
        <label for="nombre">Nombre </label>
        <input type="text" id="nombre" name="nombre" value="<%= dato.getString("nombre")%>" /><br/>
        <label for="apellido">Apellido </label>
        <input type="text" id="apellido" name="apellido" value="<%= dato.getString("apellido")%>" /><br/>
        <label for="tlf">Teléfono </label>
        <input type="text" id="tlf" name="tlf" value="<%= dato.getString("tlfUsuario")%>" /><br/>
        <div id="envio">
            <input id="button" type="submit" name="button" value="Enviar">
        </div> 
    </form>
       <%    }

            conexion.close(); 
       %>
  
  </body>
</html>