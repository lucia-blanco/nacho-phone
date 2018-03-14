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
      <link rel="stylesheet" type="text/css" href="css/usuario2.css">
      <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
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
          out.println("<table>");
          out.println("<tr><th colspan=2 > Tarifa </th></tr>");
          out.println("<tr><td colspan=2 >" + tar.getString("nomTarifa") + "</td></tr>");
          out.println("<tr><th colspan=2 > Minutos </th></tr>");
          out.println("<tr><td>" + tar.getString("minTarifa") + "</td><td>" + (tar.getInt("minTarifa") - tar.getInt("minConsumidos")) + "</td></tr>");
          out.println("<tr><th colspan=2 > Megas </th></tr>");
          out.println("<tr><td>" + tar.getString("mbTarifa") + "</td><td>" + (tar.getInt("mbTarifa") - tar.getInt("mbConsumidos")) + "</td></tr>");
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
