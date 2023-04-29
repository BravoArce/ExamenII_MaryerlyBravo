using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen_Final
{
    public class Usuarios
    {

        public Usuarios() { }
        public static int Login_Usuario { set; get; }
        public static string Clave_Usuario { set; get; }
        public static string Nombre_Usuario { set; get; }


        //Ingresar Usuario
        public static int IngresarUsuario()
        {

            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Conexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("SP_AGREGARUSUARIO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@Clave_Usuario", Clave_Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Nombre_Usuario", Nombre_Usuario));

                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;

        }

        //Borrar Usuario
        public static int BorrarUsuario()
        {

            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Conexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("SP_BORRARUSUARIO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@Login_Usuario", Login_Usuario));

                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;

        }

        //Consultar Usuario
        public static int ConsultarUsuario()
        {

            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Conexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("SP_CONSULTARUSUARIO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@Login_Usuario", Login_Usuario));

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            retorno = 1;
                        }
                    }

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;

        }

        //Modificar Usuario
        public static int ModificarUsuario()
        {

            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Conexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("SP_MODIFICARUSUARIO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@Clave_Usuario", Clave_Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Nombre_Usuario", Nombre_Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Login_Usuario", Login_Usuario));

                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;

        }

    }
}