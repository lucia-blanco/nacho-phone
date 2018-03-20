
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
  <% request.setCharacterEncoding("UTF-8"); %>
    <%
      String emailAdmin = request.getParameter("emailAdmin");
      
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE usuario SET "
                           + "email='" + request.getParameter("mail")
                           + "', nombre='" + request.getParameter("nombre")
                           + "', apellido='" + request.getParameter("apellido")
                           + "', passw='" + request.getParameter("password")
                           + "', tlfUsuario='" + request.getParameter("tlf")
                           + "' WHERE email='" + request.getParameter("user") + "'";
        
      s.execute(actualizacion);
<<<<<<< HEAD
     
=======
      response.sendRedirect("uModificaDatos.jsp?mail=" + correo + "&q=cambia");
>>>>>>> 938f3da8fb7b72d467412b7677d82e0f6bf80cb6
      conexion.close();
      response.sendRedirect("admin.jsp?email="+ emailAdmin);
    %>
     
  </body>
</html>

