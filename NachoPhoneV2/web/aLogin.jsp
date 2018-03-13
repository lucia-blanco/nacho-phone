
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <title>Login</title>
</head>

<body>
    <h2>NachoPhone / Administrador</h2>

    <form action="admin.jsp" method="get" accept-charset="utf-8" onSubmit="return validacion()" id="formulario">
        <label for="tlf">Correo electrónico </label><br>
        <input type="text" id='mail' name='mail' value="" /><span id="elmail" style="display: none; color: red;"> El correo eléctronico no es válido</span><br>
        <label for="contraseña">Contraseña </label><br>
        <input type="password" id="contraseña" name="contraseña" value="" /><span id="elpass" style="display: none; color: red;"> La contraseña no es válida</span><br/>

        <input id="button" type="submit" name="button" value="Acceder">

       
    </form>
</body>
<script type="text/javascript" src="js/login.js"></script>

</html>