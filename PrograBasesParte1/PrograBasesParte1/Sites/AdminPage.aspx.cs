using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Globalization;

namespace PrograBasesParte1.Sites
{
    public partial class MainPage : System.Web.UI.Page
    {
        GridView tablaActual;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["userId"] = "esteban";
        }

        // Funciones de la tabla de propiedades ##########################

        protected void verPropiedadesButton_Click(object sender, EventArgs e)
        {
            String userId = HttpContext.Current.Session["userId"].ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure = "showPropertiesSP";
                SqlCommand cmd = new SqlCommand(procedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param;
                param = cmd.Parameters.Add("@nombre", SqlDbType.NVarChar, 5);
                param.Value = userId;
                cmd.Connection = conn;
                conn.Open();

                GridPropiedades.DataSource = cmd.ExecuteReader();
                GridPropiedades.DataBind();
                GridPropiedades.Visible = true;
                tablaActual = GridPropiedades;
            }
        }

        protected void GridPropiedades_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridPropiedades.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);
            TextBox tb = (TextBox)row.FindControl("txtNumeroFinca");
            int numfinca = int.Parse(tb.Text);
            tb = (TextBox)row.FindControl("txtValor");
            decimal valor = Decimal.Parse(tb.Text);
            tb = (TextBox)row.FindControl("txtDireccion");
            String direccion = tb.Text; 
            Debug.Write(id.ToString() + " " + numfinca + " " + valor + " " + direccion);
        }

        protected void GridPropiedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridPropiedades.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);
        }

        protected void VerRecibos_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
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

        // Funciones de la tabla de propietarios ##########################

        protected void verPropietarios_Click(object sender, EventArgs e)
        {
            //tablaActual.Visible = false;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure = "showOwnersSP";
                SqlCommand cmd = new SqlCommand(procedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                conn.Open();

                GridPropietarios.DataSource = cmd.ExecuteReader();
                GridPropietarios.DataBind();
                GridPropietarios.Visible = true;
                tablaActual = GridPropietarios;
            }
        }

        // Funciones de la tabla de usuarios ##########################

        protected void verUsuarios_Click(object sender, EventArgs e)
        {

        }
    }
}