<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="PrograBases.Pages.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="/css/AdminPage.css" type="text/css" media="screen" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mainContainer">
            <div id="buttonsDiv">
                    <asp:Button runat="server" id="verPropiedadesButton" CssClass="adminButton" text="Ver Propiedades" OnClick="verPropiedadesButton_Click" />
                    <asp:Button runat="server" id="verPropietarios" CssClass="adminButton" text="Ver Propietarios" OnClick="verPropietarios_Click"  />
                    <asp:Button runat="server" id="verUsuarios" CssClass="adminButton" text="Ver Usuarios" OnClick="verUsuarios_Click" />
            </div>
    
            <!-- En DataField va lo que devuelve el stored procedure, por lo que si se usa un alias, se debe colocar el alias-->
            <div runat="server" id="divTablasUsuarioAdmin">
                <div runat="server" id="divPropiedades" >
                    <asp:GridView runat="server" CssClass="gridAdmin" id="GridPropiedades" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id" OnRowUpdating="GridPropiedades_RowUpdating" OnRowDeleting="GridPropiedades_RowDeleting" OnRowCommand="GridPropiedades_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-HorizontalAlign="Center"/>

                            <asp:TemplateField HeaderText="Numero de Finca" > 
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewNumeroFinca" runat="server" ></asp:TextBox>
                                </FooterTemplate> 
                                <ItemTemplate> 
                                    <asp:TextBox ID="txtNumeroFinca" runat="server" Text='<%# Bind("NumeroFinca") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Valor"> 
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewValor" runat="server" ></asp:TextBox>
                                </FooterTemplate> 
                                <ItemTemplate> 
                                    <asp:TextBox ID="txtValor" runat="server" Text='<%# Bind("Valor") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Direccion"> 
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNewDireccion" runat="server" ></asp:TextBox>
                                </FooterTemplate> 
                                <ItemTemplate> 
                                    <asp:TextBox ID="txtDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
                                <FooterTemplate> 
                                    <asp:LinkButton ID="lnkAddGridPropiedades" runat="server" CausesValidation="False" CommandName="Insert" Text="Insertar"></asp:LinkButton> 
                                </FooterTemplate> 
                                <ItemTemplate> 
                                    <asp:LinkButton ID="lbkUpdateGridPropiedades" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                </ItemTemplate> 
                            </asp:TemplateField> 

                            <asp:TemplateField HeaderText="Propietarios" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbVerPropietarios" runat="server" CausesValidation="True" OnClick="lnkbVerPropietarios_Click" Text="Ver propietarios"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" /> 
                        
                        </Columns>
                        <HeaderStyle BackColor="#222222" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:GridView> 
                </div>

                <div runat="server" id="divPropietarios">
                    <asp:GridView runat="server" id="GridPropietarios" CssClass="gridAdmin" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id" OnRowUpdating="GridPropietarios_RowUpdating" OnRowDeleting="GridPropietarios_RowDeleting" OnRowCommand="GridPropietarios_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-HorizontalAlign="Center" />

                            <asp:TemplateField HeaderText="Nombre"> 
                                <FooterTemplate>
                                    <asp:TextBox ID="textBoxNuevoNombrePropietario" runat="server" ></asp:TextBox>
                                </FooterTemplate> 
                                <ItemTemplate>
                                    <asp:TextBox runat="server" id="textBoxNombrePropietario" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Id del tipo de id" >
                                <FooterTemplate>
                                    <asp:TextBox ID="textBoxNuevoIdTipoId" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="textBoxIdTipoId" runat="server" Text='<%# Bind("idTipoDeId") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Activo" >
                                <FooterTemplate>
                                    <asp:TextBox ID="textBoxNuevoActivo" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="textBoxActivo" runat="server" Text='<%# Bind("Activo") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Identificacion" >
                                <FooterTemplate>
                                    <asp:TextBox ID="textBoxNuevoIdentificacion" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="textBoxIdentificacion" runat="server" Text='<%# Bind("Identificacion") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" ShowHeader="False" > 
                                <FooterTemplate> 
                                    <asp:LinkButton ID="lnkAddGridPropietarios" runat="server" CausesValidation="False" CommandName="Insert" Text="Insertar"></asp:LinkButton> 
                                </FooterTemplate> 
                                <ItemTemplate> 
                                    <asp:LinkButton ID="lbkUpdateGridPropietarios" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                </ItemTemplate> 
                            </asp:TemplateField> 

                            <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" />
                        </Columns>
                        <HeaderStyle BackColor="#222222" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>

                <div runat="server" id="divUsuarios">
                    <asp:GridView runat="server" ID="GridUsuarios" CssClass="gridAdmin" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="true" />
                    
                            <asp:TemplateField HeaderText="Nombre" > 
                                <FooterTemplate>
                                    <asp:TextBox runat="server" ID="textBoxNuevoNombreUsuario"></asp:TextBox>
                                </FooterTemplate> 
                                <ItemTemplate>
                                    <asp:TextBox runat="server" id="textBoxNombreUsuario" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tipo de Usuario"> 
                                <FooterTemplate>
                                    <asp:TextBox runat="server" ID="textBoxNuevoTipoUsuario"></asp:TextBox>
                                </FooterTemplate> 
                                <ItemTemplate>
                                    <asp:TextBox runat="server" id="textBoxTipoUsuario" Text='<%# Bind("tipoUsuario") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
                                <FooterTemplate> 
                                    <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="False" CommandName="Insert" Text="Insertar"></asp:LinkButton> 
                                </FooterTemplate> 
                                <ItemTemplate> 
                                    <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                </ItemTemplate> 
                            </asp:TemplateField> 

                            <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" />
                        </Columns>
                        <HeaderStyle BackColor="#222222" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
