<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PrograBasesParte1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="css/login.css" type="text/css" media="screen" />

    <div class="loginFormContainer">
        
        <label for="uname" class="loginLabel" ><b>Username </b>
            <asp:textbox id="usernameTextBox" runat="server" CssClass="textBox"/>
        </label>
         
        <label for="psw" class="loginLabel" ><b>Password </b>
            <asp:textbox id="passwordsTextBox" runat="server" CssClass="textBox"/>
        </label>
            
        <asp:Button runat="server" CssClass="loginButton" id="loginButton" Text="Login" OnClick="loginButton_Click" />
        <asp:Label runat="server" CssClass="RespuestaLabel" ID="RespuestaLabel" Text="Respuesta" Visible="false" />

    </div>
</asp:Content>
