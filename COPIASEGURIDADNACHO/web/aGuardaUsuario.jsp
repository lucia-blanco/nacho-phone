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
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      String mail = request.getParameter("emailAdmin");
     
     
        String insercion = "INSERT INTO USUARIO (email, passw, dni, nombre, apellido, tlfUsuario) VALUES ("
          
          + " '" + request.getParameter("mail")
          + "', '" + request.getParameter("password")
          + "', '" + request.getParameter("dni")
          + "', '" + request.getParameter("nombre")
          + "', '" + request.getParameter("apellido")
          + "', '" + request.getParameter("tlf") + "')";
        s.execute(insercion);
        
      conexion.close();
      response.sendRedirect("admin.jsp?q="+mail);
    %>
        

    
</body>
</html>