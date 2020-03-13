using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrograBasesParte1.Sites
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarPropiedades();
        }

        protected void cargarPropiedades()
        {
            String userId = HttpContext.Current.Session["userId"].ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure = "showProperties";
                SqlCommand cmd = new SqlCommand(procedure,conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param;
                param = cmd.Parameters.Add("@id", SqlDbType.NVarChar,5);
                param.Value = userId;
                cmd.Connection = conn;
                conn.Open();

                GridPropiedades.DataSource = cmd.ExecuteReader();
                GridPropiedades.DataBind();
            }
        }

        protected void CargarRecibosDePropiedad(object sender, EventArgs e)
        {
            // Se obtiene la fila
            GridViewRow row = GridPropiedades.SelectedRow;
            // Se obtiene el id
            int idPropiedad = int.Parse(row.Cells[0].Text);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "showPendingReceipt";
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = idPropiedad;
                cmd.Connection = conn;
                conn.Open();
                GridRecibosPorPagar.DataSource = cmd.ExecuteReader();
                GridRecibosPorPagar.DataBind();

            }
        }
    }
}