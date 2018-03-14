
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
          String tlf = request.getParameter("tlf");
          out.print("<span>Linea: </span>" + tlf);
          out.print("<br/>");
          String tarifa = request.getParameter("tarifa");
          out.print("<span>Tarifa actual: </span>" + tarifa);
          
          String correo = request.getParameter("mail");
           
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
          Statement s = conexion.createStatement();
          ResultSet dato = s.executeQuery("SELECT * FROM TARIFA where nomTarifa !='"+tarifa+"'");
          out.println("<form method='get' action='aGuardaTarifa.jsp'>");
          out.println("<select id='t' name ='t'>");
            while (dato.next()) {
            
                out.println("<option value='"+dato.getString("idTarifa") +"'>" +  dato.getString("nomTarifa")    +    "</option>");
                
            }
            out.println("</select>");
            
            conexion.close(); 
          
    %>
   
       
          <input style='display: none;' type="text" name="tlf" value="<% out.println(tlf); %>"/>
          <input style='display: none;' type="text" name="tarifa" value="<% out.println(tarifa); %>"/>
          <input style='display: none;' type="text" name="mail" value="<% out.println(correo); %>"/>
          <button type="submit"> Cambiar tarifa </button>
        </form>
        <form action="aLineaSelec.jsp" method="GET">
            <input style='display: none;' type="text" id='' name='numeros' value="<% out.print(tlf); %>" />
            <input style='display: none;' type="text" name='mail' value="<% out.println(correo); %>"/>
            <div id="boton">
            <input id="button" type="submit" name="button" value="Volver">
            </div>
        </form>
       
    
       <%     

            //conexion.close(); 
       %>
  
  </body>
</html>