
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/registro.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <title>NachoPhone/Registro</title>
  </head>

  <body>
    <nav class="navbar navbar-expand-md fixed-top">
    <a href="index.jsp" id="logo-navbar">NachoPhone</a>
  </nav>
    <main id="wrapper-reg" class="d-flex p-3 mx-auto flex-column text-center">
      <form action="guardaUsuario.jsp" method="get" accept-charset="utf-8" id="formulario" onSubmit="return validacion()">
        <h2 class="h1 mb-4 regristro">Regístrate</h2>
        <div class="form-row form-group">
          <div class="col">
            <input class="form-control" type="email" id="mail" name="mail" value="" placeholder="Correo electrónico" onchange="quitarError('mail', 'errorMail')">
            <span id="errorMail" class="error"> No es un email válido</span>
          </div>
        
          <div class="col">
            <input class="form-control" type="password" id="password" name="password" value="" placeholder="Contraseña" onchange="quitarError('password', 'errorPassword')">
            <span id="errorPassword" class="error"> La contraseña debe tener al menos 4 caracteres y contener mayúscula, minúscula, un dígito y carácter no alfanumérico -().+*_</span>
          </div>
        </div>
        <div class="form-group">
          <input class="form-control" type="text" id="nombre" placeholder="Nombre" name="nombre" value="" onchange="quitarError('name', 'errorName')">
          <span id="errorNombre" class="error"> El campo nombre no puede estar vacio</span>
        </div>
        <div class="form-group">
          <input class="form-control" placeholder="Apellido" type="text" id="apellido" name="apellido1" value="">
          <span id="errorApellido" class="error">El campo apellido no puede estar vacio</span>
        </div>
        <div class="form-row form-group">
          <div class="col">
            <input class="form-control" placeholder="DNI" type="text" id="dni" name="dni" value="" onchange="quitarError('dni', 'errorDni')">
            <span id="errorDni"  class="error"> El DNI no es correcto</span>
          </div>
          <div class="col">
            <input class="form-control" placeholder="Teléfono de contacto" type="text" id="tlf" name="tlf" value="" onchange="quitarError('tlf', 'errorTlf')">
            <span id="errorTlf" class="error"> No es un teléfono válido</span>
          </div>
        </div>
        <div id="envio">
          <input id="button" class="btn btn-lg btn-basic btn-block" type="submit" name="button" value="Enviar">
        </div>
      </form>
    </main>
  </body>
  <script type="text/javascript" src="js/registro.js"></script>

</html>
