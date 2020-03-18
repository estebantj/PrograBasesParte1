﻿using System;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace PrograBasesParte1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            int response = -1;
            String user = usernameTextBox.Text, password = passwordTextBox.Text;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[checkUserAndPasswordSP]";

                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = user;
                // Parametro para el valor de retorno
                SqlParameter returnParameter = cmd.Parameters.Add("RetVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                // Se abre la conexion y se ejecuta el store procedure
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();

                int id = (int)returnParameter.Value;
                response = id;
            }
            if (response == 1) // Usuario administrador
            {
                HttpContext.Current.Session["userId"] = user;
                Response.Redirect("~/Sites/AdminPage.aspx");
            }
            else if (response == 0) // Usuario corrient
            {
                HttpContext.Current.Session["userId"] = user;
            }
            else
            {
                RespuestaLabel.Text = "Usuario o contraseña incorrecta";
                RespuestaLabel.Visible = true;
            }
        }
    }
}