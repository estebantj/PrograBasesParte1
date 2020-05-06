using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PrograBases.WebPages
{
    public partial class tablaPropiedades : System.Web.UI.Page
    {
        private string verPropiedadesSpName = "showProperties";
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["userId"] = "esteban";
            //fillGridPropiedades();
        }

        protected void fillGridPropiedades()
        {
            String userId = HttpContext.Current.Session["userId"].ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure = verPropiedadesSpName;
                SqlCommand cmd = new SqlCommand(procedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = userId;
                cmd.Connection = conn;
                conn.Open();

                GridPropiedades.DataSource = cmd.ExecuteReader();
                GridPropiedades.DataBind();
                GridPropiedades.Visible = true;
            }
        }
        protected void verPropiedadesButton_Click(object sender, EventArgs e)
        {
            /*
            string currentDiv = Session["currentDiv"] as string;
            if (currentDiv == null)
            {
                Session["currentDiv"] = "divPropiedades";
            }
            else
            {
                HtmlControl div = (System.Web.UI.HtmlControls.HtmlControl)divTablasUsuarioAdmin.FindControl(currentDiv);
                div.Visible = false;
                Session["currentDiv"] = "divPropiedades";
                divPropiedades.Visible = true;
            }
            */
            //hideCurrentDiv("divPropiedades");
            //fillGridPropiedades();
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
            Debug.Write(id.ToString() + " " + numfinca + " " + valor + " " + direccion + "\n");
        }

        protected void GridPropiedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridPropiedades.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);

            //TODO Falta llamar SP

            fillGridPropiedades();
        }

        protected void GridPropiedades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                GridViewRow row = GridPropiedades.FooterRow;
                TextBox tb = (TextBox)row.FindControl("txtNewNumeroFinca");
                int numfinca = int.Parse(tb.Text);
                tb = (TextBox)row.FindControl("txtNewValor");
                decimal valor = Decimal.Parse(tb.Text);
                tb = (TextBox)row.FindControl("txtNewDireccion");
                String direccion = tb.Text;
                Debug.Write(numfinca + " " + valor + " " + direccion + "\n");
                fillGridPropiedades();
            }
        }

        protected void lnkbVerPropietarios_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            // Se obtiene el id
            int idPropiedad = int.Parse(row.Cells[0].Text);
            HttpContext.Current.Session["idPropiedad"] = idPropiedad;
            //hideCurrentDiv("divPropietarios");
            //fillGridPropietarios(idPropiedad);
            Response.Redirect("~/WebPages/tablaPropiedades.aspx");
        }
    }
}