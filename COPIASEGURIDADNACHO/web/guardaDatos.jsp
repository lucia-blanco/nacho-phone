
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

      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE usuario SET "
                           
                           + "nombre='" + request.getParameter("nombre")
                           + "', apellido='" + request.getParameter("apellido")
                           + "', passw='" + request.getParameter("contraseña")
                           + "', tlfUsuario='" + request.getParameter("tlf")
                           + "' WHERE email='" + request.getParameter("mail") + "'";
        
      s.execute(actualizacion);
      out.println("Actulizado correctamente");
      conexion.close();
    %>
     <form action="usuario2.jsp" method="GET">
            <input style="display: none;" type="text" id='mail' name='mail' value="<% out.print(correo); %>" />  
            <div id="boton">
            <input id="button" type="submit" name="button" value="Volver">
            </div>
        </form>
  </body>
</html>
