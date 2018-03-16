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
          String correo = request.getParameter("user");
          out.print(correo);
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
          Statement s = conexion.createStatement();
          ResultSet dato = s.executeQuery("SELECT * FROM USUARIO WHERE email= '" + correo + "' ");
         
    %>
    <div id="top"><a href="index.jsp" id="logo">NachoPhone</a></div>
    <div id="dp">
        <%
            while (dato.next()) {
            
                out.println("<div class='datos'>" +  dato.getString("nombre") + " " + dato.getString("apellido")  +    "</div>");
                out.println("<div class='datos'>" +  dato.getString("dni")    +    "</div>");
                out.println("<div class='datos'>" +  dato.getString("email")    +    "</div>");
                out.println("<div class='datos'>" +  dato.getString("tlfUsuario")    +    "</div></div>");
            }
            conexion.close();  
        
     out.println("<div id='consumo'>"); 
     out.println("<div id='lineas'>");
     out.println("<form action='aLineaSelec.jsp' method='GET'>");
     out.println("<select name= 'numeros' id='numeros' > ");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
          Statement s2 = conexion2.createStatement();
    

          ResultSet tel = s2.executeQuery("SELECT * FROM GASTO G JOIN USUARIO U ON (G.usuario = U.idUsuario) WHERE email= '" + correo + "' ");
          
          while (tel.next()) {  
           String t = tel.getString("telefono");
           out.println("<option value='" + t + "' >" + t + "</option>");
          
           }
            conexion2.close();
            
        %>
            <input style="display: none;" type="text" id='mail' name='mail' value="<% out.print(correo); %>" />
            </select>
            <input id="enviar" type="submit" name="enviar" value="ENVIAR" />
            </form>
        </div>
        <form method="get" action="aBorraUsuario.jsp">
          <input style='display: none;' type="text" name="mail" value="<% out.println(correo); %>"/>
          <button type="submit"> Eliminar </button>
        </form>
        <form method="get" action="aModificaUsuario.jsp">
          <input style='display: none;' type="text" name="mail" value="<% out.println(correo); %>"/>
          <button type="submit"> Modificar </button>
        </form>

    </div>
    
    <form action="admin.jsp" method="GET">
            <input style='display: none;' type="text" id='' name='mail' value="<% out.print(correo); %>" />  
            <div id="boton">
            <input id="button" type="submit" name="button" value="Volver">
            </div>
        </form>
      
</body>
</html>