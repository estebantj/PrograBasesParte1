<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tablaPropietarios.aspx.cs" Inherits="PrograBases.WebPages.tablaPropietarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div runat="server" id="divPropietarios">
        <asp:GridView runat="server" id="GridPropietarios" CssClass="gridAdmin" AutoGenerateColumns="false" Visible="false" ShowFooter="True" CellPadding="3" DataKeyNames="id" OnRowUpdating="GridPropietarios_RowUpdating" OnRowDeleting="GridPropietarios_RowDeleting" OnRowCommand="GridPropietarios_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-HorizontalAlign="Center" />

                <asp:TemplateField HeaderText="Nombre"> 
                    <FooterTemplate>
                        <asp:TextBox ID="textBoxNuevoNombrePropietario" runat="server" ></asp:TextBox>
                    </FooterTemplate> 
                    <ItemTemplate>
                        <asp:TextBox runat="server" id="textBoxNombrePropietario" Text='<%# Bind("nombre") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Id del tipo de id" >
                    <FooterTemplate>
                        <asp:TextBox ID="textBoxNuevoIdTipoId" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="textBoxIdTipoId" runat="server" Text='<%# Bind("valorDocId") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Identificacion" >
                    <FooterTemplate>
                        <asp:TextBox ID="textBoxNuevoIdentificacion" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="textBoxIdentificacion" runat="server" Text='<%# Bind("identificacion") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Activo" >
                    <FooterTemplate>
                        <asp:TextBox ID="textBoxNuevoActivo" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="textBoxActivo" runat="server" Text='<%# Bind("activo") %>'></asp:TextBox>
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

                <asp:TemplateField HeaderText="Propiedad" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkbVerPropiedades" runat="server" CausesValidation="True" OnClick="lnkbVerPropiedades_Click" Text="Ver propiedades"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField HeaderText="Borrar" ShowDeleteButton="True" ShowHeader="True" />
            </Columns>
            <HeaderStyle BackColor="#222222" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
    </div>

</asp:Content>
