
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
    String button = request.getParameter("button");
    String user = request.getParameter("user");
    String emailAdmin = request.getParameter("emailAdmin");
    
   
    if (button.equals("update")) {
      
     
            response.sendRedirect("aModificaDatos.jsp?emailAdmin="+emailAdmin+"&user="+user);
        
    }
    


    if (button.equals("delete")) {
    
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachophone","root", "");
            Statement s = conexion.createStatement();
            String delete = "DELETE FROM usuario WHERE EMAIL='"+user+"'";
            s.execute(delete);
            conexion.close(); 

            response.sendRedirect("admin.jsp?email="+ emailAdmin);
           
    }
    %>
  </body>
</html>
