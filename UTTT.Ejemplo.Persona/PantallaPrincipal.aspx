<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PantallaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PantallaPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous"/>
    
    <title></title>
</head>
<body>
     <div class="container-fluid bg-success">
        <nav class="navbar navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UTTT</a>
                <a type="submit" name="btnPersona" href="Login.aspx" class="btn btn-outline-dark">Atras</a>
               
            </div>
        </nav>
    </div>
    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Bienvenido</h1>
                 <hr/>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">

        <div class="container" style="margin-right: -5%">
            <div class="justify-content-center">
          <a href="PersonaPrincipal.aspx" title="Personas"><img class="auto-style1" src="Images/personas.jfif" id="img1"/></a>
          <a href="Usuarios.aspx" title="Usuarios">&nbsp;<img class="auto-style2" src="Images/usuario.png" width="128px" height="128px" id="img2"/></a>   
         </div>
        </div>

        <div class="container" style="margin-right: -5%">
            <div class="justify-content-center" style="margin-left:5%">
                 <a type="submit" name="btnPersona" href="PersonaPrincipal.aspx" class="btn btn-outline-success">Persona</a>&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a type="submit" name="btnUsuarios" href="Usuarios.aspx" class="btn btn-outline-secondary">Usuarios</a>

            </div>
            </div>

    </form>
</body>
</html>
