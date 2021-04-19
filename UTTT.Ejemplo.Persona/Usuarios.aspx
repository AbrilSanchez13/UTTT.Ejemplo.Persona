<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

</head>
<body>

         <div class="container-fluid bg-success">
        <nav class="navbar navbar-dark bg-green">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UTTT</a>
                   <a type="submit" name="btnPersona" href="PantallaPrincipal.aspx" class="btn btn-outline-dark">Atras</a>
               
            </div>
        </nav>
    </div> 
    <form id="form1" runat="server">
    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Usuarios</h1>
                 <hr/>
            </div>
        </div>
    </div>
          <div class="container mt-3 mb-3">
      <label class="form-label">Nombre de Usuario:</label>
         <asp:TextBox class="form-control"  ID="txtNombreUsuario" runat="server" Width="500px" ViewStateMode="Disabled"></asp:TextBox>
   </div>
   
         <div class="container mt-3 mb-3">
       <label class="form-label">Estado</label>
        <asp:DropDownList ID="ddlEdo" runat="server" class="form-control" Width="500px"></asp:DropDownList>
    </div>
                <div class="container">
                    <asp:Button ID="btnAgregar" Class="btn btn-success" runat="server" Text="Agregar" onclick="btnAgregar_Click" ViewStateMode="Disabled" />
                    <asp:Button ID="btnBuscar" Class="btn btn-secondary" runat="server" Text="Buscar" onclick="btnBuscar_Click" ViewStateMode="Disabled" />
             </div>

               <div class="container-fluid"> 
                 <div class="row">
                <div class="col-sm-10  justify-content-center">
                  <h1 class="text-center">Detalle </h1>
            </div>
        </div>
      </div>

      <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
            <asp:GridView  ID="dgvUsuarios" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                DataSourceID="DataSourceUsuarios" 
                GridLines="None" CssClass="table table-bordered table-condensed" 
                OnRowCommand="dgvUsuarios_RowCommand" 
                 ViewStateMode="Disabled" ForeColor="#333333"  PageSize="5" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="strNomUser" HeaderText="Nombre de Usuario" ReadOnly="True" SortExpression="strNomUser" />
                    <asp:BoundField DataField="dteFechaIngreso" HeaderText="Fecha de Ingreso" ReadOnly="True" SortExpression="dteFechaIngreso" />
                    <asp:BoundField DataField="idCatEdo" HeaderText="idCatEdo" ReadOnly="True" SortExpression="idCatEdo" />
                   <%-- <asp:BoundField DataField="CatEdo" HeaderText="Estado" ReadOnly="True" SortExpression="CatEdo" />--%>
                     <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEditar" CommandName="Editar"  ImageUrl="~/Images/editrecord_16x16.png" runat="server" />
<%--                                    <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />--%>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                    
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Eliminar" Visible="True">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEliminar" CommandName="Eliminar"  ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" runat="server" />
<%--                                <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')"/>--%>
                            </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            <asp:LinqDataSource ID="DataSourceUsuarios" runat="server" 
                ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
               onselecting="DataSourceUsuarios_Selecting" 
                EntityTypeName="" 
                Select="new (strNomUser, dteFechaIngreso, idCatEdo, CatEdo)" 
                TableName="Usuarios">
            </asp:LinqDataSource>
            </div>
          </div>
        </div>

        </div>
      
    </form>
</body>
</html>
