<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="PrograBasesParte1.Sites.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Button runat="server" id="verPropiedadesButton" CssClass="adminButton" text="Ver Propiedades" OnClick="verPropiedadesButton_Click" />
        <asp:Button runat="server" id="editarPropietarios" CssClass="adminButton" text="Editar Propietarios" OnClick="editarPropietarios_Click" />
        <asp:Button runat="server" id="editarPropiedades" CssClass="adminButton" text="Editar Propiedades" OnClick="editarPropiedades_Click" />
    </div>
    
    <!-- En DataField va lo que devuelve el stored procedure, por lo que si se usa un alias, se debe colocar el alias-->
    <div>
        <asp:GridView runat="server" id="GridPropiedades" AutoGenerateColumns="false" Visible="false" onselectedindexchanged="CargarRecibosDePropiedad">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id"/>
                <asp:BoundField DataField="NumeroFinca" HeaderText="Numero de finca" />
                <asp:BoundField DataField="Valor" HeaderText="Valor de la propieda" />
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
                <asp:CommandField ShowSelectButton="true" SelectText="Ver recibos" />
            </Columns>
        </asp:GridView>

        <asp:GridView runat="server" id="GridRecibosPorPagar" AutoGenerateColumns="false" >
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
    
    <link rel="stylesheet" href="/css/MainPageCss.css" type="text/css" media="screen" />
</asp:Content>
