<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="UTTT.Ejemplo.Persona.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 430px;
            height: 240px;
            margin-left: 143px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 878px">
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Red" Text="Ha ocurrido un error inesperado, favor de contactar al administrador del sistema.   :("></asp:Label>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img alt="" class="auto-style1" src="Images/ooops.png" /></p>
</body>
</html>
