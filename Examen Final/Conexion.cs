﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Examen_Final
{
    public class Conexion
    {

        public static void RegistrarAlerta(Page page, string message)
        {
            //Obtener el objeto ClientScriptManager.
            ClientScriptManager cs = page.ClientScript;
            //Definir el bloque de script que mostrará la alerta.
            string script = "<script>alert(" + "'" + message + "'" + ");</script>";
            //Registrar el script para que se ejecute al cargar la página.
            cs.RegisterStartupScript(typeof(Page), "AlertaScript", script);

        }

        public static SqlConnection obtenerConexion()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["veterinariauhConnectionString1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }
    }
}