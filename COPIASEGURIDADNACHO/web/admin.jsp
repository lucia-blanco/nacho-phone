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
          String correoAdmin = request.getParameter("mail");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s = conexion.createStatement();
          ResultSet dato = s.executeQuery("SELECT * FROM USUARIO ORDER BY APELLIDO");
         
    %>
    <div id="top"><a href="aLogin.jsp" id="logo">NachoPhone</a></div>
    <div id="dp">
        <%
          out.println("<form action='crudUsuario.jsp' method='GET'>");
            while (dato.next()) {
                
                out.println("<input name='user' type='radio' value= '" + dato.getString("email") + "'/>" + dato.getString("apellido") + ", " + dato.getString("nombre") +"<br/>");
                
            }
            out.println("<input id='button' type='submit' name='button' value='Consultar'>");
            out.println("</form>");
            conexion.close();  
    
            
        %>
            <input style="display: none;" type="text" id='mail' name='mail' value="<% out.print(correoAdmin); %>" />
            
            
        </div>
        

    </div>
      
</body>
</html>