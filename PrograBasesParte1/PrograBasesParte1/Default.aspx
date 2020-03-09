<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PrograBasesParte1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Label ID="RespuestaID" Text="Respuesta:" runat="server">
            <asp:Button runat="server" id="ButtonPrueba" Text="Probar Conexion" OnClick="ButtonPrueba_Click" />
        </asp:Label>
    </div>

</asp:Content>
