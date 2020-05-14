<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="PrograBases.WebPages.StartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="/css/StartPage.css" type="text/css" media="screen" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divConsultas">
        <asp:TextBox runat="server" CssClass="textBoxConsulta" ID="idPropiedadDePropietario"></asp:TextBox>
        <asp:Button runat="server" CssClass="botonConsulta" Text="Consultar propiedades de propietario" ID="botonConsultaPropiedadDePropietario" OnClick="botonConsultaPropiedadDePropietario_Click"/>

        <asp:TextBox runat="server" CssClass="textBoxConsulta"></asp:TextBox>
        <asp:Button runat="server" CssClass="botonConsulta" Text="Consultar propietario de propiedad" />

        <asp:TextBox runat="server" CssClass="textBoxConsulta"></asp:TextBox>
        <asp:Button runat="server" CssClass="botonConsulta" Text="Consultar propiedades del usuario" />

        <asp:TextBox runat="server" CssClass="textBoxConsulta"></asp:TextBox>
        <asp:Button runat="server" CssClass="botonConsulta" Text="Consultar usuario de propiedad" />
    </div>

</asp:Content>
