
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
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
    <title>Modifica Datos</title>
</head>

<body>
 <%  
    String emailAdmin = request.getParameter("emailAdmin");
    String user = request.getParameter("user");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/nachoPhone","root", "");
    Statement s = conexion.createStatement();
    ResultSet dato = s.executeQuery("SELECT * FROM USUARIO WHERE email= '" + user + "' ");
    while (dato.next()) {
  %>  
  <nav class="navbar navbar-expand-md fixed-top">
    <a id="logo-navbar" href="admin.jsp?mail=<%=emailAdmin%>">NachoPhone</a>
  </nav>
  <main id="wrapper-reg" class="d-flex p-3 mx-auto flex-column text-center">
    <form id="modifica" class="text-left mt-5" action="aGuardaDatos.jsp" method="GET">
      <div class="form-group row">
        <label class="col-sm-6 col-form-label" for="mail">Correo</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="mail" name="mail" value="<%= dato.getString("email") %>">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-6 col-form-label" for="password">Contraseña</label>
        <div class="col-sm-6">
          <input type="password" class="form-control" id="password" name="password" value="<%= dato.getString("passw")%>">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-6 col-form-label" for="nombre">Nombre</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="nombre" name="nombre" value="<%= dato.getString("nombre")%>">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-6 col-form-label" for="apellido">Apellido</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="apellido" name="apellido" value="<%= dato.getString("apellido")%>">
        </div>
      </div>
      <div style="display:none" class="form-group row">
        <label class="col-sm-6 col-form-label" for="dni">DNI</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="dni" name="dni" value="<%= dato.getString("dni")%>">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-6 col-form-label" for="tlf">Teléfono</label>
        <div class="col-sm-6">
          <input type="text" class="form-control" id="tlf" name="tlf" value="<%= dato.getString("tlfUsuario")%>">
        </div>
      </div>
      <div id="envio">
        <input id="button" class="btn" type="submit" name="button" value="Enviar">
        <input type="hidden" name="user" value="<%= dato.getString("email")%>"/>
      </div> 
      <a class="btn" href="admin.jsp?mail=<%=emailAdmin%>">Volver</a>
     
    </form>
    <%    
      }
        conexion.close(); 
    %>
  </main>
</body>
</html>