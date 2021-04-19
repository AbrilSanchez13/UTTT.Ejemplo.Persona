<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioSecondary.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioSecondary"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    

<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <title></title>
    
    <script type="text/javascript" src="Scripts/validUsuarioSecondary.js" ></script>
</head>
    
<body>
       <form id="form2" runat="server">
       <div class="container-fluid bg-success">
        <nav class="navbar navbar-dark bg-green">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UTTT</a>
                   <a type="submit" name="btnPersona" href="Usuarios.aspx" class="btn btn-outline-dark">Atras</a>
                </div>
        </nav>
    </div>

    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Usuario</h1>
                <h1 class="text-center">
              <asp:Label class="text-center" font-size="Medium" ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
                </h1>
                 <hr/>
            </div>
        </div>
    </div>
            
        <div class="row justify-content-center">
            <asp:Label ID="lblMensaje" class="text-center" runat="server" ForeColor="Red"></asp:Label>
       <br />
   </div>
           <div class="row justify-content-md-center mt-3" >
            <div class="col-md-6">

        <div class="mt-3 mb-3">
            <label class="form-label">Persona:</label>
            <asp:DropDownList class="form-control" ID="ddlPersona" runat="server" >
            </asp:DropDownList>
        </div>

             <div class="mt-3 mb-3">
            <label class="form-label">Nombre de Usuario:</label>
                  <asp:TextBox class="form-control" ID="txtNombreUsuario" type="text" runat="server" ViewStateMode="Disabled" MaxLength="15" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNombreUsuario" EnableClientScript="False" ErrorMessage="Nombre de Usuario no puede estar vacio" ></asp:RequiredFieldValidator>
             </div>
           
            <div class="mt-3 mb-3">
            <label class="form-label">Contraseña:</label>
             <asp:TextBox class="form-control" ID="txtContraseña" type="password" runat="server" ViewStateMode="Disabled" MaxLength="15" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContraseña" EnableClientScript="False" ErrorMessage="Contraseña no puede estar vacia" ></asp:RequiredFieldValidator>
             </div>

            <div class="mt-3 mb-3">
            <label class="form-label">Confirmar Contraseña:</label>
             <asp:TextBox class="form-control" ID="txtConfirmarContraseña" type="password" runat="server" ViewStateMode="Disabled" MaxLength="15" ></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfirmarContraseña" ControlToValidate="txtContraseña" EnableClientScript="False" ErrorMessage="Contraseña no coincide"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmarContraseña" EnableClientScript="False" ErrorMessage="Confirmar Contraseña no puede estar vacia" ></asp:RequiredFieldValidator>
             </div>
               
     
            <div class="mt-3 mb-3">
            <label class="form-label">Estado</label>
                <asp:DropDownList  class="form-control" ID="ddlEdo" runat="server" EnableTheming="True" Enabled="False"></asp:DropDownList>
            </div>

           
                 <div class="mt-3 mb-3">
           <label class="form-label">Fecha de Ingreso</label>
         <input id="hide" type="hidden" runat="server" />
                     <asp:Calendar ID="dteCalendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                         <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                         <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                         <OtherMonthDayStyle ForeColor="#999999" />
                         <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                         <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                         <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                         <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                         <WeekendDayStyle BackColor="#CCCCFF" />
                     </asp:Calendar>
                     <br />
                 </div>

                 <div class="mt-3 mb-3">

                     <%--  <asp:Button ID="Button3" runat="server" Text="Aceptar" 
            onclick="btnAceptar_Click" ViewStateMode="Disabled" Class="btn btn-success" ForeColor="White" />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
            onclick="btnCancelar_Click" ViewStateMode="Disabled" Class="btn btn-danger" ForeColor="White" />--%>
     
                     <asp:Button ID="btnAceptar" OnClick="btnAceptar_Click" OnClientClick="return validaUser();" runat="server" Text="Aceptar" class="btn btn-success" />
                     <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" class="btn btn-danger" />


                 </div>
          
      </div>
   </div>
</div>
           
</form>     
</body>
</html>