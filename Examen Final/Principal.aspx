<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Examen_Final.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            font-family: Poppins-Bold;
            font-size: 24px;
            text-align: center;
            display: block;
        }

        p {
            font-family: Poppins-Bold;
            text-align: center;
            font-size: 20px;
            text-align: center;
        }

        div {
            background-color: #faebf4;
        }

        .centered-img {
            display: block;
            max-width: 50%;
            margin: 0 auto;
            opacity: 0.1;
            z-index: -1;
            position: absolute;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>¡Bienvenido a nuestra Veterinaria!</h1>
        <p>Selecccione la opcción que necesita</p>
        <img src="Imagen.jpg" alt="Imagen de fondo" class="centered-img">
    </div>
</asp:Content>
