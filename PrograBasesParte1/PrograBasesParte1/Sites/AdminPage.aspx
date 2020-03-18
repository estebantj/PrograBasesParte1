<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="PrograBasesParte1.Sites.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Button runat="server" id="verPropiedadesButton" CssClass="adminButton" text="Ver Propiedades" OnClick="verPropiedadesButton_Click" />
        <asp:Button runat="server" id="verPropietarios" CssClass="adminButton" text="Ver Propietarios" OnClick="verPropietarios_Click" />
        <asp:Button runat="server" id="verUsuarios" CssClass="adminButton" text="Ver Propietarios" OnClick="verUsuarios_Click" />
    </div>
    
    <!-- En DataField va lo que devuelve el stored procedure, por lo que si se usa un alias, se debe colocar el alias-->
    <div>
        <div id="divPropiedades">
            <asp:GridView runat="server" id="GridPropiedades" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id" OnRowUpdating="GridPropiedades_RowUpdating" OnRowDeleting="GridPropiedades_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText=" id " InsertVisible="False" ReadOnly="True" SortExpression="id" />

                    <asp:TemplateField HeaderText="NumeroFinca" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewNumeroFinca" runat="server" ></asp:TextBox>
                        </FooterTemplate> 
                        <ItemTemplate> 
                            <asp:TextBox ID="txtNumeroFinca" runat="server" Text='<%# Bind("NumeroFinca") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Valor" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewValor" runat="server" ></asp:TextBox>
                        </FooterTemplate> 
                        <ItemTemplate> 
                            <asp:TextBox ID="txtValor" runat="server" Text='<%# Bind("Valor") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Direccion" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewDireccion" runat="server" ></asp:TextBox>
                        </FooterTemplate> 
                        <ItemTemplate> 
                            <asp:TextBox ID="txtDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate> 
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="False" CommandName="Insert" Text="Insertar"></asp:LinkButton> 
                        </FooterTemplate> 
                        <ItemTemplate> 
                            <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                        </ItemTemplate> 
                    </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Recibos" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton ID="VerRecibos" runat="server" CausesValidation="True" OnClick="VerRecibos_Click" Text="Ver recibos"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" /> 
                        
                </Columns>
                <HeaderStyle BackColor="#222222" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

            <asp:GridView runat="server" id="GridRecibosPorPagar" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                    <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha Vencimiento" Visible="false"/>
                    <asp:BoundField DataField="Monto" HeaderText="Monto" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />

                </Columns>
            </asp:GridView>

            <asp:GridView runat="server" id="GridRecibosPagados" AutoGenerateColumns="false" Visible="false">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                    <asp:BoundField DataField="FechaVencimiento" HeaderText="Fecha Vencimiento" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" />
                </Columns>
            </asp:GridView>
        </div>

        <div id="divPropietarios">
            <asp:GridView runat="server" id="GridPropietarios" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText=" id " InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate>
                            <asp:TextBox ID="textBoxNuevoNombrePropietario" runat="server" ></asp:TextBox>
                        </FooterTemplate> 
                        <ItemTemplate>
                            <asp:TextBox runat="server" id="textBoxNombrePropietario" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="idTipoId" HeaderStyle-HorizontalAlign="Left">
                        <FooterTemplate>
                            <asp:TextBox ID="textBoxNuevoIdTipoId" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="textBoxIdTipoId" runat="server" Text='<%# Bind("idTipoDeId") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Activo" HeaderStyle-HorizontalAlign="Left">
                        <FooterTemplate>
                            <asp:TextBox ID="textBoxNuevoActivo" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="textBoxActivo" runat="server" Text='<%# Bind("Activo") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Identificacion" HeaderStyle-HorizontalAlign="Left">
                        <FooterTemplate>
                            <asp:TextBox ID="textBoxNuevoIdentificacion" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="textBoxIdentificacion" runat="server" Text='<%# Bind("Identificacion") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate> 
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="False" CommandName="Insert" Text="Insertar"></asp:LinkButton> 
                        </FooterTemplate> 
                        <ItemTemplate> 
                            <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                        </ItemTemplate> 
                    </asp:TemplateField> 

                    <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
        </div>

        <div id="divUsuarios">
            <asp:GridView runat="server" ID="GridUsuarios" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="true" />
                    
                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="textBoxNuevoNombreUsuario"></asp:TextBox>
                        </FooterTemplate> 
                        <ItemTemplate>
                            <asp:TextBox runat="server" id="textBoxNombreUsuario" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Tipo de Usuario" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="textBoxNuevoTipoUsuario"></asp:TextBox>
                        </FooterTemplate> 
                        <ItemTemplate>
                            <asp:TextBox runat="server" id="textBoxTipoUsuario" Text='<%# Bind("tipoUsuario") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left"> 
                        <FooterTemplate> 
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="False" CommandName="Insert" Text="Insertar"></asp:LinkButton> 
                        </FooterTemplate> 
                        <ItemTemplate> 
                            <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                        </ItemTemplate> 
                    </asp:TemplateField> 

                    <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    
    <link rel="stylesheet" href="/css/AdminPage.css" type="text/css" media="screen" />
</asp:Content>
