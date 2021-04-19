<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>
	Login
</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
   
</head>
<body>
    <div class="container-fluid bg-success">
        <nav class="navbar navbar-dark bg-green">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UTTT</a>
               
            </div>
        </nav>
    </div>
    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Login</h1>
                 <hr>
            </div>
        </div>
      
        <div class="row justify-content-md-center mt-3" >
            <div class="col-md-6">
                <form name="form1" method="post" action="./Login.aspx" id="form1">

<%--                    <span id="lblError" class="text-danger">Nombre de usuario o contraseña incorrectos.</span>--%>
                    <div class="mt-3 mb-3">
                        <label class="form-label">Nombre de usuario</label>
                        <input name="txtUsername" type="text"  maxlength="15" id="txtUsername" class="form-control"/>
                        &nbsp;</div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input name="txtPassword" type="password" maxlength="15" id="txtPassword" class="form-control"/>
                        &nbsp;
                        &nbsp;
                        <br />
                    </div>
                    <div class="mb-6" style="margin-left: 40%">
                        <a type="submit" name="btnAceptar" href="PantallaPrincipal.aspx" class="btn btn-success">Iniciar Sesion</a>
                       </div>
                    <div class="mb-3">
                        
                        <a href="OlvideContraseña.aspx" >Olvidé mi contraseña</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="ValidScripts/login.js"></script>


</body>
</html>
