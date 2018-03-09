function validacion() {
    
    //Validar una dirección de email
    valorMail = document.getElementById("mail").value;
    if (!(/\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(valorMail))) {
        console.log("introduce el email");
        document.getElementById("mail").style.borderColor = "red";
        document.getElementById("mail").style.color = "#888";
        document.getElementById("elmail").style.display = "inline";
        return false;

    } else {
        document.getElementById("mail").style.borderColor = "green";
        document.getElementById("mail").style.color = "#000";
        document.getElementById("elmail").style.display = "none";
    }
    
    // Contraseña  REVISAR!!!!
    valorTexto3 = document.getElementById("contraseña").value;

    if (valorTexto3 == null || valorTexto3.length < 6) {

        console.log('La contraseña tiene que tener 6 caracteres');
        document.getElementById("contraseña").style.borderColor = "red";
        document.getElementById("contraseña").style.color = "#888";
        document.getElementById("elpass").style.display = "inline";
        return false;
    } else {
        document.getElementById("contraseña").style.borderColor = "green";
        document.getElementById("contraseña").style.color = "#000";
        document.getElementById("elpass").style.display = "none";
    }
    
    //Valida DNI
    valorDNI = document.getElementById("dni").value;
    var letras = ['T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J',
    'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E', 'T'];
    if (!(/^\d{8}[A-Z]$/.test(valorDNI))) {
        console.log("el formato de dni no es correcto");
        document.getElementById("dni").style.borderColor = "red";
        document.getElementById("dni").style.color = "#888";
        document.getElementById("eldni").style.display = "inline";
       
        return false;
    } else {
        document.getElementById("dni").style.borderColor = "green";
        document.getElementById("dni").style.color = "#000";
        document.getElementById("eldni").style.display = "none";
    }
    
    if (valorDNI.charAt(8) != letras[(valorDNI.substring(0, 8)) % 23]) {
        console.log("el valor de Dni no es correcto");
        document.getElementById("dni").style.borderColor = "red";
        document.getElementById("dni").style.color = "#888";
        document.getElementById("eldni").style.display = "inline";
        return false;
    } else {
        document.getElementById("dni").style.borderColor = "green";
        document.getElementById("dni").style.color = "#000";
        document.getElementById("eldni").style.display = "none";
    }
    
    // Valida nombre
    valorTexto = document.getElementById("nombre").value;

    if (valorTexto == null || valorTexto.length == 0 || /^\s+$/.test(valorTexto)) {

        console.log('Debe escribir su nombre');
        document.getElementById("nombre").style.borderColor = "red";
        document.getElementById("nombre").style.color = "#888";
        document.getElementById("elnombre").style.display = "inline";
        return false;
    } else {
        document.getElementById("nombre").style.borderColor = "green";
        document.getElementById("nombre").style.color = "#000";
        document.getElementById("elnombre").style.display = "none";
    }
    
    // Valida apellido 
    valorTexto2 = document.getElementById("apellido").value;

    if (valorTexto2 == null || valorTexto2.length == 0 || /^\s+$/.test(valorTexto2)) {

        console.log('Debe escribir su primer apellido');
        document.getElementById("apellido").style.borderColor = "red";
        document.getElementById("apellido").style.color = "#888";
        document.getElementById("elape").style.display = "inline";
        return false;
    } else {
        document.getElementById("apellido").style.borderColor = "green";
        document.getElementById("apellido").style.color = "#000";
        document.getElementById("elape").style.display = "none";
    }
    
    
    
    //Validar un número de teléfono
    valorTlf = document.getElementById("tlf").value;
    if (!(/^\d{9}$/.test(valorTlf))) {
        console.log("telefono no valido");
        document.getElementById("tlf").style.borderColor = "red";
        document.getElementById("tlf").style.color = "#888";
        document.getElementById("eltlf").style.display = "inline";
        return false;
    } else {
        console.log("telefono no valido");
        document.getElementById("tlf").style.borderColor = "green";
        document.getElementById("tlf").style.color = "#000";
        document.getElementById("eltlf").style.display = "none";
    }
      
}

document.getElementById("button").onclick = validacion;