<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="utf-8">
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
  <title>Usuario</title>
</head>

<body onload='showFields(document.getElementById("numeros").value)'>
  
  <%      
    String correo = request.getParameter("mail");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
    Statement s = conexion.createStatement();
    ResultSet dato = s.executeQuery("SELECT * FROM USUARIO WHERE email= '" + correo + "' ");
    while (dato.next()) {
  %>
  <nav class="navbar navbar-expand-md fixed-top">
	  <a id="logo-navbar" href="usuario.jsp?mail=<%=correo%>">NachoPhone</a>
	</nav>
  <main role="main">
    <div class="jumbotron">
      <div class="container">
        <% 
        
          out.println("<h1 id='bienvenida' class='display-3'> Bienvenido, " + dato.getString("nombre") + "</h1>");
        out.println("</div>");
     out.println("</div>");
       out.println("<div class='container-fluid'>");
         out.println("<div class='row'>");
           out.println("<div id='izquierda' class='col-md-4'>");
              out.println("<h2 class='mb-3'>" +  dato.getString("nombre") + " " + dato.getString("apellido")  +    "</h2>");
              out.println("<h5>" +  dato.getString("dni")    +    "</h5>");
              out.println("<h5>" +  dato.getString("email")    +    "</h5>");
              out.println("<h5 class='mb-4'>" +  dato.getString("tlfUsuario")    +    "</h5>");
            }
            conexion.close();
          %> 
          <form method="get" action="uModificaDatos.jsp">
            <input style='display: none;' type="text" name="mail" value="<% out.println(correo); %>"/>
            <button class="btn btn-basic" type="submit"> Modificar </button>
          </form>
        </div>
        <div id="derecha" class="col-md-6">
        <%
          out.println("<form action='uLineaSelec.jsp' method='GET'>");
            out.println("<select class='custom-select' name='numeros' id='numeros' onchange='showFields(this.value)' > ");

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
        </select><br/><br/>
        <div id="Show_update" style="color:black;">To Update the designation...</div>
      </div>
    </div>
  </main> 
</body>
<script>
  function showFields(string1){
    var xRequest1;
    if(string1==""){
      document.getElementById("Show_update").innerHTML="";
      return;
    }
    if(window.XMLHttpRequest){
      xRequest1=new XMLHttpRequest();
    }else{
      xRequest1=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xRequest1.onreadystatechange=function(){
      if((xRequest1.readyState==4) && (xRequest1.status==200)){
        document.getElementById("Show_update").innerHTML=xRequest1.responseText;
      }
    };
    xRequest1.open("get","cargaTarifa.jsp?q="+string1,"true");
    xRequest1.send();
  }
  </script>
</html>

