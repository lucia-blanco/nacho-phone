
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
  <link rel="stylesheet" type="text/css" href="css/estilo.css">
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
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
          Statement s = conexion.createStatement();
          ResultSet dato = s.executeQuery("SELECT * FROM usuario ORDER BY apellido");
         
    %>
    <nav class="navbar navbar-expand-md">
      <a id="logo-navbar" href="admin.jsp?mail=<%=correoAdmin%>">NachoPhone</a>
    </nav>
    <div id="dp">
        <%
          out.println("<form action='crudUsuario.jsp' method='GET'>");
            while (dato.next()) {
                
                out.println("<input name='user' type='radio' value= '" + dato.getString("email") + "'/>" + dato.getString("apellido") + ", " + dato.getString("nombre") +"<br/>");
                
            }
            
            conexion.close();  
    
                
       //   String tlf = request.getParameter("numeros");
       //   String correo = request.getParameter("mail");
       //   String tarifa = "";
       //    Class.forName("com.mysql.jdbc.Driver");
       //    Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
       //    Statement s3 = conexion3.createStatement();
         
          
       // ResultSet tar = s3.executeQuery("SELECT apellido,nombre,dni,telefono,nomTarifa,minConsumidos,mbConsumidos FROM gasto G JOIN usuario U ON G.usuario=U.idUsuario JOIN tarifa T ON T.idTarifa=G.tarifa");
    
        
       //  while (tar.next()) {  
          
       //  out.println("<table>");
       //  out.println("<tr><th colspan=2 > Tarifa </th></tr>");
       //  out.println("<tr><td colspan=2 >" + tar.getString("nomTarifa") + "</td></tr>");
       //  out.println("<tr><th colspan=2 > Minutos </th></tr>");
       //  out.println("<tr><td>" + tar.getString("minTarifa") + "</td><td>" + (tar.getInt("minTarifa") - tar.getInt("minConsumidos")) + "</td></tr>");
       //  out.println("<tr><th colspan=2 > Megas </th></tr>");
       //  out.println("<tr><td>" + tar.getString("mbTarifa") + "</td><td>" + (tar.getInt("mbTarifa") - tar.getInt("mbConsumidos")) + "</td></tr>");
       //  out.println("</table>"); 
        
       //  tarifa = tar.getString("nomTarifa");
       //  }
        
        out.println("<input id='button' type='submit' name='button' value='Consultar'>");
        out.println("</form>");
        // conexion3.close();
            
           
        %>
            <input style="display: none;" type="text" id='mail' name='mail' value="<%=correoAdmin%>" />
            
            
        </div>
        

    </div>
      
</body>
</html>