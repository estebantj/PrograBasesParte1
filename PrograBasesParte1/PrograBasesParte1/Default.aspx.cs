using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Diagnostics;

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
            String user = usernameTextBox.Text, password = passwordsTextBox.Text;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure = "checkUserAndPasswordSP";

                SqlCommand cmd = new SqlCommand(procedure,conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "checkUserAndPasswordSP";

                SqlParameter param;

                param = cmd.Parameters.Add("@password", SqlDbType.NVarChar, 30);

                param.Value = password;

                param = cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 100);

                param.Value = user;

                cmd.Connection = conn;
                conn.Open();
                SqlParameter returnParameter = cmd.Parameters.Add("RetVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                int id = (int)returnParameter.Value;
                response = id;
                Debug.WriteLine(returnParameter.Value);
                
            }
            if (response == 1)
            {
                HttpContext.Current.Session["userId"] = user;
                Debug.WriteLine("Usuario Correcto");
                Response.Redirect("~/Sites/mainPage.aspx");
            }
            else
            {
                RespuestaLabel.Text = "Usuario o contraseña incorrecta";
                RespuestaLabel.Visible = true;
            }
        }
    }
}