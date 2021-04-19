
function validaUser() {

    var ddlPersona = document.getElementById("ddlPersona").value;
    var nomuser = document.getElementById("txtNombreUsuario").value;
    var contraseña = document.getElementById("txtContraseña").value;
    var confirmarContraseña = document.getElementById("txtConfirmarContraseña").value;

    if (ddlPersona < 0) {
        alert("Por favor seleccione a la Persona");
        return false;
    }
    else if (nomuser == "") {
        alert("Nombre de Usuario no puede estar vacio")
        return false;
    }
    else if (nomuser.length < 3) {
        alert("Nombre de Usuario solo acepta minimo 3 valores")
        return false;

    } else if (nom.length > 15) {
        alert("En Nombre de Usuario solo se admite maximo 15 letras");
        return false;
    }
    else if (contraseña === "") {
        alert("Contraseña no puede estar vacio")
        return false;
    }
    else if (contraseña.length > 15) {
        alert("Contraseña solo se admite maximo 15 letras");
        return false;
    }
    else if (contraseña.length < 8) {
        alert("En contraseña solo se admite minimo 8 letras");
        return false;
    }
    else if (confirmarContraseña === "") {
        alert("Confirmar Contraseña no puede estar vacio")
        return false;
    }
    else if (ConfrmarContraseña.length > 15) {
        alert(" Confirmar Contraseña solo se admite maximo 15 letras");
        return false;
    }
    else if (ConfirmarContraseña.length < 8) {
        alert("En Confirmar contraseña solo se admite minimo 8 letras");
        return false;
    }


}