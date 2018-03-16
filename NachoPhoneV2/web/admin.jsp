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
        Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
        Statement s3 = conexion3.createStatement();
        ResultSet dato = s3.executeQuery("SELECT * FROM GASTO G " 
                                       + "JOIN USUARIO U ON G.USUARIO=U.IDUSUARIO JOIN TARIFA T ON T.IDTARIFA=G.TARIFA ORDER BY U.APELLIDO,U.NOMBRE"
                                       );
         
    %>
    <div id="top"><a href="aLogin.jsp" id="logo">NachoPhone</a></div>
    <div id="dp">
        <label>Buscar: </label>
        <input id="searchTerm" type="text" onkeyup="doSearch()" />
        <%
         
          out.println("<table id='datos'>");
          out.println("<tr>");
          out.println("<th>Usuario</th>");
          out.println("<th>DNI</th>");
          out.println("<th>Número</th>");
          out.println("<th>Tarifa</th>");
          out.println("<th>Minutos consumidos</th>");
          out.println("<th>Megas consumidos</th>");
          out.println("</tr>");
            while (dato.next()) {
            out.println("<form action='crudUsuario.jsp' method='GET'>");
                out.print("<tr><td>"); 
                out.print(dato.getString("apellido") + ", " + dato.getString("nombre") +"</td>");
                out.print("<td>" + dato.getString("dni") + "</td>");
                out.print("<td>" + dato.getString("telefono") + "</td>");
                out.print("<td>" + dato.getString("nomtarifa") + "</td>");
                out.print("<td>" + dato.getString("minconsumidos") + "</td>");
                out.print("<td>" + dato.getString("mbconsumidos") + "</td>");
            out.println("<td><button type='submit' name='user' value= '" + dato.getString("email") + "'>Modificar</button></td>");
            out.println("</form>");
            }
            out.println("</table>");
            
            conexion3.close();  
    
            
        %>
            <input style="display: none;" type="text" id='mail' name='mail' value="<% out.print(correoAdmin); %>" />
            
            
        </div>
        

    </div>
      
</body>
    <script src="js/buscadorTabla.js" type="text/javascript"></script>
</html>