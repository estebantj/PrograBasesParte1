<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tablaPropiedades.aspx.cs" Inherits="PrograBases.WebPages.tablaPropiedades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

</asp:Content>
