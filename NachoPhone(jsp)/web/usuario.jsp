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
          String correo = request.getParameter("mail");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
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
     //out.println("<form action='' method='get' accept-charset='utf-8'>");    
     out.println("<div id='consumo'>"); 
     out.println("<div id='lineas'>");
     out.println("<select id='numeros'onchange='elige()'> ");
            Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s2 = conexion2.createStatement();
          String tlf = "";

          ResultSet tel = s2.executeQuery("SELECT * FROM GASTO G JOIN USUARIO U ON (G.usuario = U.idUsuario) WHERE email= '" + correo + "' ");
          
          while (tel.next()) {  
           String t = tel.getString("telefono");
           out.println("<option value='" + t + "' >" + t + "</option>");
          
           }
            conexion2.close();
        %>
    
            </select>
             
        </div>
        
        <script>
            
            function elige(){
                console.log($( "#numeros option:selected" ).val());
                tlf = $( "#numeros option:selected" ).val();
           
                console.log(tlf);
               
                
         }
         window.onload = elige;
        </script>
      
        <%
        
       Class.forName("com.mysql.jdbc.Driver");
          Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3399/nachoPhone","root", "");
          Statement s3 = conexion3.createStatement();
         
          
       ResultSet tar = s3.executeQuery("SELECT * FROM TARIFA T JOIN GASTO G ON (T.idTarifa=G.tarifa) WHERE telefono= '" + tlf + "' ");
    
        
        while (tar.next()) {  
          
           
        out.println("<div class='name'><strong>Tarifa </strong></div>");
        out.println("<div class='tarifa'>" + tar.getString("nomTarifa") + "</div>");
        out.println("<div class='name'><strong>Minutos </strong></div>");
        out.println("<div class='izquierda'>" + tar.getString("minTarifa") + "</div><div class='derecha'>" + (tar.getInt("minTarifa") - tar.getInt("minConsumidos")) + "</div>");
        out.println("<div class='name'><strong>Megas </strong></div>");
        out.println("<div class='izquierda'>" + tar.getString("mbTarifa") + "</div><div class='derecha'>" + (tar.getInt("mbTarifa") - tar.getInt("mbConsumidos")) + "</div>");
         }
            conexion3.close();
        %>
  



    </div>
      
</body>
</html>

