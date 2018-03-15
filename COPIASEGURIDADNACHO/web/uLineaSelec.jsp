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
      <link rel="stylesheet" type="text/css" href="css/usuario2.css">
      <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <title>Linea Selec</title>
  </head>
  <body>
    <div>
      <%      
        String tlf = request.getParameter("numeros");
        String correo = request.getParameter("mail");
        String tarifa = "";

        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
        Statement s3 = conexion3.createStatement();

        ResultSet tar = s3.executeQuery("SELECT * FROM TARIFA T JOIN GASTO G ON (T.idTarifa=G.tarifa) WHERE telefono= '" + tlf + "' ");
        while (tar.next()) {  
        out.println("<table style='width:50%'>");
        out.println("<tr><th colspan=2 > Tarifa </th></tr>");
        out.println("<tr><td colspan=2 >" + tar.getString("nomTarifa") + "</td></tr>");
        out.println("<tr><th colspan=2 > Minutos </th></tr>");
        out.println("<tr><td style='width:100%'>");
        out.println("<div class='progress'>");
        out.println("<div class='progress-bar' style='width:" + (tar.getInt("minConsumidos")*100)/tar.getInt("minTarifa") + "%' role='progressbar' aria-valuenow='" + tar.getInt("minConsumidos") + "' aria-valuemin='0' aria-valuemax='" + tar.getInt("minTarifa") + "'>" + (tar.getInt("minConsumidos")*100)/tar.getInt("minTarifa") + " %</div>");
        out.println("</div>");
        out.println("</tr></td>");
        out.println("<tr><td>" + tar.getString("minTarifa") + "</td><td>" +tar.getInt("minConsumidos") + "</td></tr>");
        out.println("<tr><th colspan=2 > Megas </th></tr>");
        out.println("<tr><td>");
        out.println("<div class='progress'>");
        out.println("<div class='progress-bar' style='width:" + (tar.getInt("mbConsumidos")*100)/tar.getInt("mbTarifa") + "%' role='progressbar' aria-valuenow='" + tar.getInt("mbConsumidos") + "' aria-valuemin='0' aria-valuemax='" + tar.getInt("mbTarifa") + "'>" + (tar.getInt("mbConsumidos")*100)/tar.getInt("mbTarifa")  + " %</div>");
        out.println("</div>");
        out.println("</tr></td>");
        out.println("<tr><td>" + tar.getString("mbTarifa") + "</td><td>" + tar.getInt("mbConsumidos") + "</td></tr>"); 
        out.println("</table>");

          tarifa = tar.getString("nomTarifa");
        }
        conexion3.close();
      %>

      <form method="get" action="uCambiaTarifa.jsp">
        <input style='display: none;' type="text" name="tlf" value="<% out.println(tlf); %>"/>
        <input style='display: none;' type="text" name="tarifa" value="<% out.println(tarifa); %>"/>
        <input style="display: none;" type="text" id='mail' name='mail' value="<% out.print(correo); %>" /> 
        <button type="submit"> Cambiar tarifa </button>
      </form>
      <form action="usuario.jsp" method="GET">
        <input style='display: none;' type="text" id='mail' name='mail' value="<% out.print(correo); %>" />  
        <div id="boton">
          <input id="button" type="submit" name="button" value="Volver">
        </div>
      </form>
    </div>     
  </body>
</html>
