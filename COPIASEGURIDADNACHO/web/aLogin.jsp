
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Login</title>
</head>

<body>
    <h2>NachoPhone / Administrador</h2>
    <% 
      
      String mostrar = request.getParameter("q");

    %>
    <form action="aValidacion.jsp" method="get" accept-charset="utf-8"  id="formulario">
        <div id="<% out.print(mostrar); %>" style="display: none;">Error en las credenciales</div><br/>
        <label for="tlf">Correo electrónico </label><br>
        <input type="text" id='mail' name='mail'  /><br>
        <label for="pass">Contraseña </label><br>
        <input type="password" id="pass" name="pass"  /></span><br/>

        <input id="button" type="submit" name="button" value="Acceder">

       
    </form>
</body>
<script>
    
    window.onload = function alert() {
        //mostrar = request.getParameter("q");
        
            document.getElementById("cambia").style.display = "inline";
        
    };
    
    widow.onclick = function quitar () {
        
        document.getElementById("cambia").style.display = "none";
    }
</script>

</html>