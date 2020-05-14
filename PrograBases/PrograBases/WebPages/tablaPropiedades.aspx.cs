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
        private string verPropiedadesDePropietario = "getPropertyOfOwner";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int idPropietario = (int)HttpContext.Current.Session["idPropietario"];
                Debug.Write("\n id Propiedad: " + idPropietario);
                fillGridPropiedades(idPropietario);
                Session.Remove("idPropietario");
            }
            catch (NullReferenceException ex)
            {
                Debug.Write("No hay id");
                Debug.Write(ex.Source);
                fillGridPropiedades(-1);
            }
        }

        protected void fillGridPropiedades(int pIdPropietario)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure;
                if (pIdPropietario == -1)
                {
                    procedure = verPropiedadesSpName;
                }
                else
                {
                    procedure = verPropiedadesDePropietario;
                }
                SqlCommand cmd = new SqlCommand(procedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                

                if (pIdPropietario == -1)
                {
                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = 1;
                }
                else
                {
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = pIdPropietario;
                }

                cmd.Connection = conn;
                conn.Open();

                GridPropiedades.DataSource = cmd.ExecuteReader();
                GridPropiedades.DataBind();
                GridPropiedades.Visible = true;
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
            Debug.Write(id.ToString() + " " + numfinca + " " + valor + " " + direccion + "\n");
        }

        protected void GridPropiedades_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridPropiedades.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);

            //TODO Falta llamar SP

            fillGridPropiedades(-1);
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
                fillGridPropiedades(-1);
            }
        }

        protected void lnkbVerPropietarios_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            // Se obtiene el id
            int idPropiedad = int.Parse(row.Cells[0].Text);
            HttpContext.Current.Session["idPropiedad"] = idPropiedad;
            Response.Redirect("~/WebPages/tablaPropietarios.aspx");
        }
    }
}