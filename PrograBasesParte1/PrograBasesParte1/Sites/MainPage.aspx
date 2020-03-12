<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="PrograBasesParte1.Sites.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView runat="server" id="GridPropiedades" AutoGenerateColumns="false" onselectedindexchanged="CargarRecibosDePropiedad">
        <Columns>
            <!-- En DataField va lo que devuelve el stored procedure, por lo que si se usa un alias, se debe colocar el alias-->
            <asp:BoundField DataField="id" HeaderText="id"/>
            <asp:BoundField DataField="NumFinca" HeaderText="Numero de finca" />
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

</asp:Content>
