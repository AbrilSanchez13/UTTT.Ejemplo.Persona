function valid() {

    var ddlsexo = document.getElementById("ddlSexo").value;
    var clave = document.getElementById("txtClaveUnica").value;
    var nom = document.getElementById("txtNombre").value;
    var apaterno = document.getElementById("txtAPaterno").value;
    //var amaterno = document.getElementById("txtAMaterno").value;
    var numhermanos = document.getElementById("txtNumHermanos").value;
    var email = document.getElementById("txtEmail").value;
    //var emailExp = / ^ ([a-zA-Z0-9 _ \. \ -]) + \ @ (([a-zA-Z0-9 \ -]) + \.) + ([com \ co \. \ in ]) + $ /;
    //var calendar = document.getElementById("hide");
    //var fecha = calendar.defaultValue;
    //var date = parseInt(("" + fecha.substr(6, 10)));
    //var f = 2021 - date;
    //var date = parseInt(("" + fecha.substr(6, 10)));
    //var f = 2021 - date;

    if (ddlsexo < 0) {
        alert("Por favor seleccione el Sexo");
        return false;
    }
    else if (clave === "") {
        alert("Clave no puede estar vacio")
        return false;
    }
    else if (isNaN(clave)) {
        alert("Clave unica solo acepta numeros")
        return true;
    }
    else if (clave.length < 3) {
        alert("Clave solo acepta 3 valores")
        return false;
    }
    else if (clave.length > 3) {
        alert("Clave solo acepta 3 valores")
        return false;
    }
    else if (nom == "") {
        alert("Nombre no puede estar vacio");
        return false;

    } else if (nom.length < 3) {
        alert("En nombre solo se admite minimo 3 letras");
        return false;

    } else if (nom.length > 15) {
        alert("En nombre solo se admite maximo 15 letras");
        return false;
    }
    else if (apaterno === "") {
        alert("A Paterno no puede estar vacio")
        return false;
    }
    else if (apaterno.length < 3) {
        alert("En A Paterno solo se admite minimo 3 letras");
        return false;

    }
    else if (apaterno.length > 15) {
        alert("En A Paterno solo se admite maximo 15 letras");
        return false;
    }
    //else if (amaterno === "") {
    //    alert("A Materno no puede estar vacio")
    //    return false;
    //}
    //else if (amaterno.length < 3) {
    //alert("En A Materno solo se admite minimo 3 letras");
    //return false;
    //}
    //else if (apaterno.length > 15) {
    //    alert("En A Materno solo se admite maximo 15 letras");
    //    return false;
    //}
    else if (numhermanos == "") {
        alert("Numero de Hermanos no puede estar vacio")
        return false;

    } else if (isNaN(numhermanos)) {
        alert("Solo debe ingresar numeros enteros en Numero Hermanos");
        return false;

    }
}
    //else if (f <= 18) {
    //    alert("El usuario debe ser mayor de edad");
    //    return false;

