function valid() {

    var ddlsexo = document.getElementById("ddlSexo").value;
    var clave = document.getElementById("txtClaveUnica").value;
    var nom = document.getElementById("txtNombre").value;
    var apaterno = document.getElementById("txtAPaterno").value;
    var amaterno = document.getElementById("txtAMaterno").value;
    var numhermanos = document.getElementById("txtNumHermanos").value;
    //var email = document.getElementById("txtEmail").value;
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
    //else if (apaterno.length < 3) {
    //    alert("En A Paterno solo se admite minimo 3 letras");
    //    return false;

    //}
    else if (apaterno.length > 15) {
        alert("En A Paterno solo se admite maximo 15 letras");
        return false;
    
    //else if (amaterno === "") {
    //    alert("A Materno no puede estar vacio")
    //    return false;
    }
    else if (amaterno.length < 3) {
    alert("En A Materno solo se admite minimo 3 letras");
    return false;
    }
    else if (apaterno.length > 15) {
        alert("En A Materno solo se admite maximo 15 letras");
        return false;
    }
    else if (numhermanos == "") {
        alert("Numero de Hermanos no puede estar vacio")
        return false;

    } else if (isNaN(numhermanos)) {
        alert("Solo debe ingresar numeros enteros en Numero Hermanos");
        return false;

    }
}

//const txtUsername = document.querySelector('#txtUsername');
//const txtPassword = document.querySelector('#txtPassword');
//const alertErroresParent = document.querySelector(".alert-errores-js");
//const alertErrores = alertErroresParent.firstElementChild.firstElementChild;
//let errores = "";
//const spaceRegex = /\s\s+/;

//function validate() {
//    if (validateForm()) {
//        return true;
//    }
//    if (errores.length > 0) {
//        removeAlertParentItems();
//        const errorFragment = document.createDocumentFragment();
//        const strong = document.createElement('strong');
//        strong.textContent = errores;
//        const br = document.createElement('br');
//        const btnCerrar = document.createElement('button');
//        btnCerrar.setAttribute('type', 'button');
//        btnCerrar.classList.add('btn');
//        btnCerrar.classList.add('btn-link');
//        btnCerrar.setAttribute('onClick', 'hideAlert()');
//        btnCerrar.textContent = 'Cerrar';
//        errorFragment.appendChild(strong);
//        errorFragment.appendChild(br);
//        errorFragment.appendChild(btnCerrar);
//        alertErrores.appendChild(errorFragment);
//        showAlert();
//    }
//    return false;
//}

//const showAlert = () => {
//    alertErroresParent.classList.remove('visible');
//}

//const hideAlert = () => {
//    alertErroresParent.classList.add('visible');
//    removeAlertParentItems();
//}

//const removeAlertParentItems = () => {
//    if (alertErrores.children.length > 0) {
//        alertErrores.children[0].remove();
//        alertErrores.children[1].remove();
//        alertErrores.children[0].remove();
//    }
//}

//const validateForm = () => {
//    if (txtUsername.value.trim().length === 0) {
//        errores = "El campo nombre de usuario es requerido.";
//        return false;
//    }
//    if (txtUsername.value.trim().length > 15) {
//        errores = "El campo nombre de usuario es muy grande, debe contener máximo 15 caracteres.";
//        return false;
//    }
//    if (spaceRegex.test(txtUsername.value)) {
//        errores = "El campo nombre no puede tener más de 1 espacio seguido.";
//        return false;
//    }
//    if (txtPassword.value.trim().length === 0) {
//        errores = "El campo contraseña es requerido.";
//        return false;
//    }
//    if (txtPassword.value.trim().length > 15) {
//        errores = "El campo contraseña es muy grande, debe contener máximo 15 caracteres.";
//        return false;
//    }
//    if (spaceRegex.test(txtPassword.value)) {
//        errores = "El campo contraseña no puede tener más de 1 espacio seguido.";
//        return false;
//    }
//    return true;
//}