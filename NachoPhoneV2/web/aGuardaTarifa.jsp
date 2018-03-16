
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
      String tlf = request.getParameter("tlf");
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE GASTO SET "
                           
                           + "Tarifa=" + Integer.valueOf(request.getParameter("t"))
                           
                           + " WHERE telefono='" + request.getParameter("tlf") + "'";
        
      s.execute(actualizacion);
      out.println("Tarifa cambiada correctamente");
      conexion.close();
    %>
     <form action="crudUsuario.jsp" method="GET">
            <input style='display: none;' type="text" id='' name='user' value="<% out.print(correo); %>" />  
            <div id="boton">
            <input id="button" type="submit" name="button" value="Volver">
            </div>
        </form>
  </body>
</html>
