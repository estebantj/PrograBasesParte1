<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PrograBasesParte1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="loginFormContainer">
        <asp:Label runat="server" CssClass="loginLabel" ID="UsernameLabel" Text="Usuario:" AssociatedControlID="usernameTextBox" >
           <asp:textbox id="usernameTextBox" runat="server" CssClass="textBox" />
        </asp:Label>

        <asp:Label runat="server" CssClass="loginLabel" ID="PasswordLabel" Text="Contraseña:" AssociatedControlID="passwordTextBox" >
            <asp:textbox id="passwordTextBox" runat="server" CssClass="textBox" TextMode="Password"/>
        </asp:Label>
 
        <asp:Button runat="server" CssClass="loginButton" id="loginButton" Text="Login" OnClick="loginButton_Click" />
        
        <div id="respuestaDiv">
            <asp:Label runat="server" CssClass="RespuestaLabel" ID="RespuestaLabel" Visible="false" />
        </div>

    </div>

    <!-- Referencias -->
    <link rel="stylesheet" href="/css/login.css" type="text/css" media="screen" />
    <script src="/Scripts/LoginPage/login.js"></script>
</asp:Content>
    