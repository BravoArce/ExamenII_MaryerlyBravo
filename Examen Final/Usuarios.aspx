<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Examen_Final.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </p>
    <p>
        ID de Usuario:
        <asp:TextBox ID="TUsuarioid" runat="server"></asp:TextBox>
    </p>
    <p>
        Clave Usuario:
        <asp:TextBox ID="TUsuarioClave" runat="server"></asp:TextBox>
    </p>
    <p>
        Nombre Usuario:
        <asp:TextBox ID="TUsuarioNombre" runat="server"></asp:TextBox>
    </p>
    <asp:Button ID="BAgregar" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
    <asp:Button ID="BBorrar" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
    <asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="BModificar_Click" />
    <asp:Button ID="BConsultar" runat="server" Text="Consultar" OnClick="BConsultar_Click" />
</asp:Content>
