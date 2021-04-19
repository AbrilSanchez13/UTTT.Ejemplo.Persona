<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    

<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   
    <title></title>
    
    <script type="text/javascript" src="Scripts/validaciones.js" ></script>
</head>
    
<body>
       <form id="form2" runat="server">
       <div class="container-fluid bg-success">
        <nav class="navbar navbar-dark bg-green">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UTTT</a>
                   <a type="submit" name="btnPersona" href="PersonaPrincipal.aspx" class="btn btn-outline-dark">Atras</a>
                </div>
        </nav>
    </div>

    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Persona</h1>
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
            <label class="form-label">Sexo:</label>
            <asp:DropDownList class="form-control" ID="ddlSexo" runat="server" onselectedindexchanged="ddlSexo_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSexo" EnableClientScript="False" ErrorMessage="Debe Seleccionar el sexo" InitialValue="-1"></asp:RequiredFieldValidator>
        </div>

             <div class="mt-3 mb-3">
            <label class="form-label">Clave Unica:</label>
             <asp:TextBox class="form-control" ID="txtClaveUnica" runat="server" ViewStateMode="Disabled" MaxLength="3" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClaveUnica" EnableClientScript="False" ErrorMessage="Clave Unica no puede estar Vacio" ValidationExpression="\d{3}"></asp:RequiredFieldValidator>
            </div>

             <div class="mt-3 mb-3">
            <label class="form-label">Nombre:</label>
                  <asp:TextBox class="form-control" ID="txtNombre" type="text" runat="server" ViewStateMode="Disabled" MaxLength="15" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNombre" EnableClientScript="False" ErrorMessage="Nombre no puede estar vacio" ></asp:RequiredFieldValidator>
             </div>
           

             <div class="mt-3 mb-3">
            <label class="form-label">Apellido Paterno:</label>
            <asp:TextBox ID="txtAPaterno" class="form-control" runat="server" ViewStateMode="Disabled" MaxLength="15" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAPaterno" EnableClientScript="False" ErrorMessage="A Paterno no puede estar vacio" ></asp:RequiredFieldValidator>
            </div>
        

            <div class="mt-3 mb-3">
            <label class="form-label">Apellido Materno:</label>
            <asp:TextBox class="form-control" ID="txtAMaterno" runat="server" ViewStateMode="Disabled" MaxLength="15" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAMaterno" EnableClientScript="False" ErrorMessage="A Materno no puede estar vacio"></asp:RequiredFieldValidator>
             </div>

            <div class="mt-3 mb-3">
            <label class="form-label">Numero de Hermanos:</label>
            <asp:TextBox ID="txtNumHermanos" runat="server" class="form-control"  MaxLength="1"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNumHermanos" EnableClientScript="False" ErrorMessage="Numero de Hermanos no puede estar vacio" ValidationExpression="([aA-záéíóúZÁÉÍÓÚ]{3}[aA-zñáéíóúZÁÉÍÓÚ]+[\s]*)"></asp:RequiredFieldValidator>
            </div>

            <div class="mt-3 mb-3">
            <label class="form-label">Correo:</label>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="25" patern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" 
                EnableClientScript="False" ErrorMessage="Por favor Ingresa un correo correcto" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Blue"></asp:RegularExpressionValidator>
            </div>

            <div class="mt-3 mb-3">
            <label class="form-label">Codigo Postal:</label>
            <asp:TextBox ID="txtCodigoPostal" class="form-control" runat="server" patern="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$?" MaxLength="5"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCodigoPostal" EnableClientScript="False" ErrorMessage="Por favor ingrese un Codigo Postal correcto" ForeColor="#0033CC" ValidationExpression="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$"></asp:RegularExpressionValidator>
            </div>

            <div class="mt-3 mb-3">
            <label class="form-label">RFC</label>
            <asp:TextBox ID="txtRfc" class="form-control" runat="server" patern="^([aA-zZñÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([aA-zZ\d]{3})?$" MaxLength="13"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtRfc" EnableClientScript="False" ErrorMessage="Por favor ingresa un RFC correcto" ValidationExpression="^([aA-zZñÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([aA-zZ\d]{3})?$" ForeColor="#0033CC"></asp:RegularExpressionValidator>
            </div>
             
            <div class="mt-3 mb-3">
            <label class="form-label">Estado Civil:</label>&nbsp;
             &nbsp;<asp:DropDownList class="form-control" ID="ddlEstadoCivil" runat="server" OnSelectedIndexChanged="ddlEstadoCivil_SelectedIndexChanged">
                </asp:DropDownList>
                </div>

             <div class="mt-3 mb-3">
            <label class="form-label">Fecha de Nacimiento:</label>
                 <div class="mt-3 mb-3">
            <asp:Calendar ID="dteCalendar" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="261px"  Width="340px" style="margin-left: 158px; margin-top: 0px;" OnSelectionChanged="dteCalendar_SelectionChanged" VisibleDate="2000-01-01">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
         <input id="hide" type="hidden" runat="server" />
                 </div>

               


             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" 
            onclick="btnAceptar_Click" OnClientClick="return valid();" ViewStateMode="Disabled" Class="btn btn-success" ForeColor="White" />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
            onclick="btnCancelar_Click" ViewStateMode="Disabled" Class="btn btn-danger" ForeColor="White" />
      </div>
   </div>
</div>
           
</form>     
</body>
</html>