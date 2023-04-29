using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_Final
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["veterinariauhConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Mae_Usuario"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void BAgregar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(TUsuarioClave.Text) || string.IsNullOrWhiteSpace(TUsuarioNombre.Text))
            {
                Conexion.RegistrarAlerta(this, "Ingrese todos los campos necesario");
                return;
            }

            Usuarios.Clave_Usuario = TUsuarioClave.Text;
            Usuarios.Nombre_Usuario = TUsuarioNombre.Text;

            if (Usuarios.IngresarUsuario() > 0)
            {
                Conexion.RegistrarAlerta(this, "Usuario fue registrado ");
                LlenarGrid();
            }
            else
            {
                Conexion.RegistrarAlerta(this, "Usuario no fue registrado" );
            }
        }

        protected void BBorrar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TUsuarioid.Text))
            {
                Conexion.RegistrarAlerta(this, "Utilice el codigo del usuario");
                return;
            }

            Usuarios.Login_Usuario = int.Parse(TUsuarioid.Text);

            if (Usuarios.BorrarUsuario() > 0)
            {
                Conexion.RegistrarAlerta(this, "Usuario fue borrado");
                LlenarGrid();
            }
            else
            {
                Conexion.RegistrarAlerta(this, "Usuario no fue borrado ");
            }
        }

        protected void BModificar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(TUsuarioid.Text) || string.IsNullOrWhiteSpace(TUsuarioid.Text) || string.IsNullOrWhiteSpace(TUsuarioNombre.Text))
            {
                Conexion.RegistrarAlerta(this, "Ingrese todos los campos necesarios");
                return;
            }

            Usuarios.Login_Usuario = int.Parse(TUsuarioid.Text);
            Usuarios.Clave_Usuario = TUsuarioClave.Text;
            Usuarios.Nombre_Usuario = TUsuarioNombre.Text;

            if (Usuarios.ModificarUsuario() > 0)
            {
                Conexion.RegistrarAlerta(this, "Usuario fue modificado");
                LlenarGrid();
            }
            else
            {
                Conexion.RegistrarAlerta(this, "Usuario no pudo modificarse");
            }
        }
    }
}
