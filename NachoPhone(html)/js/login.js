function validacion() {

    var correcto = true
    valorMail = document.getElementById("mail").value;
    if (!(/\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(valorMail))) {
        console.log("introduce el email");
        document.getElementById("mail").style.borderColor = "red";
        document.getElementById("mail").style.color = "#888";
        document.getElementById("elmail").style.display = "inline";
        correcto= false;

    } else {
        document.getElementById("mail").style.borderColor = "green";
        document.getElementById("mail").style.color = "#000";
        document.getElementById("elmail").style.display = "none";
    }

    var password=document.getElementById("password")
    if (password.length<6||password.length>30|| // mínimo 6 car. máximo 30
        !/[a-zñ]/.test(password.value)|| !/[A-ZÑ]/.test(password.value)|| // al menos 1 min. y 1 may.
        !/[0-9]/.test(password.value)|| // al menos 1 dígito y
        !/[-().+*]/.test(password.value)) { // 1 car. especial
        password.style.borderColor="#f00"
        document.getElementById("errorPassword").style.visibility="visible"
        correcto=false
    }
    return correcto
}


document.getElementById("button").onclick = validacion;
document.getElementById("mail").onkeypress = color;
document.getElementById("password").onkeypress = color;

function color() {

    this.style.color = "#000";
}
