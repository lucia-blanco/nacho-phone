function validacion() {
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


}


document.getElementById("button").onclick = validacion;
document.getElementById("mail").onkeypress = color;
document.getElementById("contraseña").onkeypress = color;

function color() {

    this.style.color = "#000";
}
