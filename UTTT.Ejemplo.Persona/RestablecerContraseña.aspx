<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestablecerContraseña.aspx.cs" Inherits="UTTT.Ejemplo.Persona.RestablecerContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title> </title>
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
                <h1 class="text-center">Restablecer la Contraseña</h1>
                 <hr>
            </div>
        </div>
      
        <div class="row justify-content-md-center mt-3" >
            <div class="col-md-6">

                    <div class="mt-3 mb-3">
                        <label class="form-label">Usuario</label>
                        <input name="txtNomUser" type="email" maxlength="15" id="txtNomUser" class="form-control" disabled="disabled"/>
                        &nbsp;</div>
                <div class="mt-3 mb-3">
                        <label class="form-label">Nueva Contraseña</label>
                        <input name="txtContraseña" type="password" maxlength="15" id="txtContraseña" class="form-control"/>
                        &nbsp;</div>
                <div class="mt-3 mb-3">
                        <label class="form-label">Confirmar Contraseña</label>
                        <input name="txtConfirmarContraseña" type="password" maxlength="15" id="txtConfirmarContraseña" class="form-control"/>
                        &nbsp;</div>
                   
                    <div class="mb-6" style="margin-left: 40%">
                        <a type="submit" name="btnRestablecer" href="Login.aspx" class="btn btn-success">Restablecer</a>
                       </div>
                  
            </div>
        </div>
    </div>
</body>
</html>
