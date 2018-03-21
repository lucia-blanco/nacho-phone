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
  <title>Admin</title>
</head>

<body style="background-color: #E9ECEF;">
    <% String emailAdmin = request.getParameter("mail"); %>
       <nav class="navbar navbar-expand-md fixed-top">
	  <a id="logo-navbar" href="admin.jsp?mail=<%=emailAdmin%>">NachoPhone</a>
           <div class="navbar-collapse collapse show" id="navbarCollapse" style></div>
                          <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><input id='eluser' name='user' type='submit' class='nav-link' value='Admin'/></li>
   
            <li class="nav-item">
              <a id="salir" class="nav-link" href="index.jsp">Salir</a>
            </li>
          </ul>
	</nav>
            <main role="main">
    <div class="jumbotron">
        <div class="datosTarifa">
            <div class="datosTarifa2">
<%
          out.println("<select class='custom-select' name='tarifas' onchange='showFields(this.value)'>");
          out.println("<option>Ver Tarifas</option>");
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
          Statement s2 = conexion2.createStatement();
          ResultSet tar = s2.executeQuery("SELECT * FROM TARIFA");
          while (tar.next()) {  
            String t = tar.getString("NOMTARIFA");
            out.println("<option value='" + t + "'>" + t + "</option>");
          }
          conexion2.close();
        %>
        </select>
        
        </div>
        <div class="datosTarifa3">
            <form class="formadmin" action="aGuardaUsuario.jsp" method="get">
                <input class="admininp" type="email" name="mail" value="" placeholder="Email"/>
                <input class="admininp" type="password" name="password" value="" placeholder="Contraseña"/>
                <input class="admininp" type="text" name="nombre" value="" placeholder="Nombre"/>
                <input class="admininp" type="text" name="apellido" value="" placeholder="Apellidos"/>
                <input class="admininp" type="text" name="dni" value="" placeholder="DNI"/>
                <input class="admininp" type="text" name="tlf" value="" placeholder="Teléfono"/>
                <input type="hidden" name="emailAdmin" value="<% out.print(emailAdmin); %>"/>
                <button type="submit" class="btn btn-success" id="btn-ok">OK</button>
            </form> 
        </div>
        </div>
        <div class="datosTarifa4">
            <div id="Show_update" style="color:black;"></div>
        </div>
    <%      
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
        Statement s3 = conexion3.createStatement();
        ResultSet dato = s3.executeQuery("SELECT * FROM GASTO G " 
                                       + "RIGHT JOIN USUARIO U ON G.USUARIO=U.IDUSUARIO LEFT JOIN TARIFA T ON T.IDTARIFA=G.TARIFA ORDER BY U.APELLIDO,U.NOMBRE"
                                       );
         
    %>

  
    <div class="usuarios">
        <%
          out.println("<input id='searchTerm' type='text' onkeyup='doSearch()' placeholder='Buscar' />");
          out.println("<table id='datos'>");
          out.println("<tr>");
          out.println("<th class='nomape' >Usuario</th>");
          out.println("<th>DNI</th>");
          out.println("<th>Número</th>");
          out.println("<th>Tarifa</th>");
          out.println("<th>Minutos</th>");
          out.println("<th>Megas</th>");
          out.println("<th></th>");
          out.println("</tr>");
            while (dato.next()) {
            out.println("<form action='crudUsuario.jsp' method='GET'>");
                out.println("<input type='hidden' name='user' value='"+dato.getString("email")+"'/>");
                out.print("<tr><td class='nomape'>"); 
                out.print(dato.getString("apellido") + ", " + dato.getString("nombre") +"</td>");
                out.print("<td>" + dato.getString("dni") + "</td>");
                out.print("<td>" + dato.getString("telefono") + "</td>");
                out.print("<td>" + dato.getString("nomtarifa") + "</td>");
                out.print("<td>" + dato.getString("minconsumidos") + "</td>");
                out.print("<td>" + dato.getString("mbconsumidos") + "</td>");
            out.println("<td class='td-btn'><button class='btn btn-success' type='submit' name='button' value= 'update'>Modificar</button>");
            out.println("<button class='btn btn-danger' type='submit' name='button' value= 'delete'>Eliminar</button></td>");
            out.println("<input type='hidden' name='emailAdmin' value='" +emailAdmin+"'/>");
            out.println("</form>");
            }
            out.println("</table>");
            
            conexion3.close();  
    
            
        %>
            <input style="display: none;" type="text" id='mail' name='mail' value="<% out.print(emailAdmin); %>" />
     </div>
    </div>
  </main> 
      
</body>
    <script src="js/buscadorTabla.js" type="text/javascript"></script>
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
    xRequest1.open("get","aMuestraTarifa.jsp?q="+string1,"true");
    xRequest1.send();
  }
  </script>
</html>