<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.util.*,java.sql.*,java.io.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <title>Carga Tarifa</title>
  </head>
  <body>
    <% 
      String tlf=request.getParameter("q");
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
      Statement s = conexion.createStatement();
      ResultSet tar = s.executeQuery("SELECT * FROM TARIFA T JOIN GASTO G ON (T.idTarifa=G.tarifa) WHERE telefono= '"+tlf+"' ");

      while (tar.next()) {  
        out.println("<table>");
        out.println("<tr><th colspan=2 > Tarifa </th></tr>");
        out.println("<tr><td colspan=2 >" + tar.getString("nomTarifa") + "</td></tr>");
        out.println("<tr><th colspan=2 > Minutos </th></tr>");
        out.println("<tr><td>" + tar.getString("minTarifa") + "</td><td>" + (tar.getInt("minTarifa") - tar.getInt("minConsumidos")) + "</td></tr>");
        out.println("<tr><th colspan=2 > Megas </th></tr>");
        out.println("<tr><td>" + tar.getString("mbTarifa") + "</td><td>" + (tar.getInt("mbTarifa") - tar.getInt("mbConsumidos")) + "</td></tr>");
        out.println("</table>"); 
        //tarifa = tar.getString("nomTarifa");
      }
      conexion.close();
    %>
  </body>
</html>
