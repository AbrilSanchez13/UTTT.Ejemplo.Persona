
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title></title>
</head>
<body>
         <form id="form1" runat="server">
       <div class="container-fluid bg-success">
        <nav class="navbar navbar-dark bg-green">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">UTTT</a>
                   <a type="submit" name="btnPersona" href="PantallaPrincipal.aspx" class="btn btn-outline-dark">Atras</a>
                </div>
        </nav>
    </div>
    <div class="container" style="margin-right: 20%">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 class="text-center">Persona</h1>
                 <hr/>
            </div>
        </div>
    </div>
        
    <div class="container mt-3 mb-3">
      <label class="form-label">Nombre</label>
         <asp:TextBox class="form-control" AutoPostBack="true" OnTextChanged="txtNombre_TextChanged" ID="txtNombre" runat="server" Width="500px" ViewStateMode="Disabled"></asp:TextBox>
   </div>

    <div class="container mt-3 mb-3">
       <label class="form-label">Sexo</label>
        <asp:DropDownList ID="ddlSexo" runat="server" class="form-control" Width="500px"></asp:DropDownList>
    </div>
                 <div class="container mt-3 mb-3">
       <label class="form-label">Estado Civil</label>
        <asp:DropDownList ID="ddlEstadoCivil" runat="server" class="form-control" Width="500px"></asp:DropDownList>
    </div>
             <div class="container">
             <asp:Button ID="btnBuscar" Class="btn btn-secondary" runat="server" Text="Buscar" onclick="btnBuscar_Click" ViewStateMode="Disabled" />
              <asp:Button ID="btnAgregar" Class="btn btn-success" runat="server" Text="Agregar" onclick="btnAgregar_Click" ViewStateMode="Disabled" />
             </div>

               <div class="container-fluid"> 
                 <div class="row">
                <div class="col-sm-10  justify-content-center">
                  <h1 class="text-center">Detalle </h1>.
            </div>
        </div>
    </div>
     <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
             <asp:GridView CssClass="table table-bordered table-condensed" ID="dgvPersonas" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona" 
                Width="1067px" CellPadding="4" GridLines="None" 
                onrowcommand="dgvPersonas_RowCommand" 
                ViewStateMode="Disabled" ForeColor="#333333"  PageSize="5" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica" 
                        ReadOnly="True" SortExpression="strClaveUnica" />
                    <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True" 
                        SortExpression="strNombre" />
                    <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True" 
                        SortExpression="strAPaterno" />
                    <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True" 
                        SortExpression="strAMaterno" />
                    <asp:BoundField DataField="CatSexo" HeaderText="Sexo" 
                        SortExpression="CatSexo" />
                     <asp:BoundField DataField="dteFechaNacimiento" HeaderText="Fecha de Nacimiento" 
                        ReadOnly="True" SortExpression="dteFechaNacimiento" />

                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                    
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Eliminar" Visible="True">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')"/>
                            </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                      <asp:TemplateField HeaderText="Direccion">
                        <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                    
                    </asp:TemplateField>
                </Columns>
                 <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
          </div>
        </div>
         
        </div>

    <asp:LinqDataSource ID="DataSourcePersona" runat="server" 
        ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
        onselecting="DataSourcePersona_Selecting" 
        Select="new (strNombre, strAPaterno, strAMaterno, CatSexo,dteFechaNacimiento, strClaveUnica,id)" 
        TableName="Persona" EntityTypeName="">
    </asp:LinqDataSource>
    </form>
</body>
</html>
