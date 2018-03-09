
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/registro.css">
    <title>NachoPhone/Registro</title>
</head>

<body>
    <div id="top"><a href="index.jsp" id="logo">NachoPhone</a></div>
    <form action="" method="get" accept-charset="utf-8" id="formulario" onSubmit="return validacion()">
        <h2>Regístrate</h2>
        <label for="tlf">Correo electrónico </label>
        <input type="text" id="mail" name="mail" value="" /><span id="elmail" style="display: none; color: red;"> No es un email válido</span><br/>
        <label for="contraseña">Contraseña </label>
        <input type="password" id="contraseña" name="contraseña" value="" /><span id="elpass" style="display: none; color: red;"> La contraseña debe tener al menos 8 caracteres</span><br/>
        <label for="dni">DNI </label>
        <input type="text" id="dni" name="dni" value="" /><span id="eldni" style="display: none; color: red;"> El DNI no es correcto</span><br/>
        <label for="nombre">Nombre </label>
        <input type="text" id="nombre" name="nombre" value="" /><span id="elnombre" style="display: none; color: red;"> El campo nombre no puede estar vacio</span><br/>
        <label for="apellido1">Apellido </label>
        <input type="text" id="apellido" name="apellido1" value="" /><span id="elape" style="display: none; color: red;"> El campo apellido no puede estar vacio</span><br/>
        <label for="tlf">Teléfono </label>
        <input type="text" id="tlf" name="tlf" value="" /><span id="eltlf" style="display: none; color: red;"> No es un teléfono válido</span><br/>
        <div id="envio">
            <input id="button" type="submit" name="button" value="Enviar">
        </div>
    </form>
</body>
<script type="text/javascript" src="js/registro.js"></script>

</html>
