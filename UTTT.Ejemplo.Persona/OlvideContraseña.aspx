<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlvideContraseña.aspx.cs" Inherits="UTTT.Ejemplo.Persona.OlvideContraseña" %>

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
                   <a type="submit" name="btnPersona" href="Login.aspx" class="btn btn-outline-dark">Atras</a>
               
            </div>
        </nav>
    </div>
    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Olvidé la Contraseña</h1>
                 <hr>
            </div>
        </div>
      
        <div class="row justify-content-md-center mt-3" >
            <div class="col-md-6">

                    <div class="mt-3 mb-3">
                        <label class="form-label">Ingrese su Correo</label>
                        <input name="txtEmail" type="email" maxlength="15" id="txtEmail" class="form-control"/>
                        &nbsp;</div>
                   
                    <div class="mb-6" style="margin-left: 40%">
                        <a type="submit" name="btnEnviar"  href="Login.aspx" class="btn btn-success" >Enviar</a>
                         <a type="submit" name="btnCancelar"  href="Login.aspx" class="btn btn-danger" >Cancelar</a>
                       </div>
                  
            </div>
        </div>
    </div>
</body>
</html>
