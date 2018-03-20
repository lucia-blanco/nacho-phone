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
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script
      src="https://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"></script>
      <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
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
        out.println("<tr><td style='width:100%'>");
        out.println("<div class='progress'>");
        out.print("<div class='progress-bar' style='width:" + (tar.getInt("minConsumidos")*100)/tar.getInt("minTarifa") + "%' role='progressbar' aria-valuenow='" + tar.getInt("minConsumidos") + "' aria-valuemin='0' aria-valuemax='" + tar.getInt("minTarifa") + "'></div>");
        out.println("</div>");
        out.print("<span>" + (tar.getInt("minConsumidos")*100)/tar.getInt("minTarifa") + " %</span>");
        out.println("</tr></td>");
        out.println("<tr><th colspan=2 > Megas </th></tr>");
        out.println("<tr><td>");
        out.println("<div class='progress'>");
        out.println("<div class='progress-bar' style='width:" + (tar.getInt("mbConsumidos")*100)/tar.getInt("mbTarifa") + "%' role='progressbar' aria-valuenow='" + tar.getInt("mbConsumidos") + "' aria-valuemin='0' aria-valuemax='" + tar.getInt("mbTarifa") + "'></div>");
        out.println("</div>");
        out.print("<span>" + (tar.getInt("mbConsumidos")*100)/tar.getInt("mbTarifa") + " %</span>");
        out.println("</tr></td>"); 
        out.println("</table>"); 
        //tarifa = tar.getString("nomTarifa");
      }
      conexion.close();
    %>
  </body>
</html>
