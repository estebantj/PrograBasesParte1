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

namespace PrograBases.Pages
{
    public partial class AdminPage : System.Web.UI.Page
    {
        private string verPropiedadesSpName = "showPropertiesSP";
        private string verPropietariosSpName = "showOwnersSP";
        private string verUsuariosSpName = "";
        private string verPropietariosDePropiedadSpName = "getOwnerOfProperty";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["userId"] = "esteban";
        }

        protected void hideCurrentDiv(string newDiv)
        {
            string currentDiv = Session["currentDiv"] as string;
            if (currentDiv == null)
            {
                Session["currentDiv"] = newDiv;
            }
            else
            {
                HtmlControl div = (HtmlControl)divTablasUsuarioAdmin.FindControl(currentDiv);
                div.Visible = false;
                Session["currentDiv"] = newDiv;
                div = (HtmlControl)divTablasUsuarioAdmin.FindControl(newDiv);
                div.Visible = true;
            }
        }
        // Funciones de la tabla de propiedades ##########################

        protected void fillGridPropiedades()
        {
            String userId = HttpContext.Current.Session["userId"].ToString();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure = verPropiedadesSpName;
                SqlCommand cmd = new SqlCommand(procedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;
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
            hideCurrentDiv("divPropiedades");
            fillGridPropiedades();
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
            hideCurrentDiv("divPropietarios");
            fillGridPropietarios(idPropiedad);
        }

        // Funciones de la tabla de propietarios ##########################

        protected void fillGridPropietarios(int idPropiedad)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure;
                if (idPropiedad != -1)
                {
                    procedure = verPropietariosDePropiedadSpName;
                }
                else
                {
                    procedure = verPropietariosSpName;
                }
                SqlCommand cmd = new SqlCommand(procedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if (idPropiedad != -1)
                {
                    cmd.Parameters.Add("@propertyNum", SqlDbType.Int).Value = idPropiedad;
                }
                cmd.Connection = conn;
                conn.Open();

                GridPropietarios.DataSource = cmd.ExecuteReader();
                GridPropietarios.DataBind();
                GridPropietarios.Visible = true;
            }
        }

        protected void verPropietarios_Click(object sender, EventArgs e)
        {
            /*
            string currentDiv = Session["currentDiv"] as string;
            if (currentDiv == null)
            {
                Session["currentDiv"] = "divPropietarios";
            }
            else
            {
                HtmlControl div = (System.Web.UI.HtmlControls.HtmlControl)divTablasUsuarioAdmin.FindControl(currentDiv);
                div.Visible = false;
                Session["currentDiv"] = "divPropietarios";
                divPropietarios.Visible = true;
            }
            */
            hideCurrentDiv("divPropietarios");
            fillGridPropietarios(-1);
        }

        protected void GridPropietarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridPropietarios.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);
            TextBox tb = (TextBox)row.FindControl("textBoxNombrePropietario");
            string nombrePropietario = tb.Text;
            tb = (TextBox)row.FindControl("textBoxIdTipoId");
            int idTipoId = int.Parse(tb.Text);
            tb = (TextBox)row.FindControl("textBoxActivo");
            bool activo = bool.Parse(tb.Text);
            tb = (TextBox)row.FindControl("textBoxIdentificacion");
            string identificacion = tb.Text;
            Debug.Write("" + id.ToString() + " " + nombrePropietario + " " + idTipoId.ToString() + " " + activo.ToString() + " " + identificacion + "\n");
        }

        protected void GridPropietarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Debug.Write("Eliminar \n");
            GridViewRow row = GridPropietarios.Rows[e.RowIndex];
            int id = int.Parse(row.Cells[0].Text);

            //TODO llamar SP

            fillGridPropietarios(-1);
        }

        protected void GridPropietarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                GridViewRow row = GridPropietarios.FooterRow;
                TextBox tb = (TextBox)row.FindControl("textBoxNuevoNombrePropietario");
                string nombrePropietario = tb.Text;
                tb = (TextBox)row.FindControl("textBoxNuevoIdTipoId");
                int idTipoId = int.Parse(tb.Text);
                tb = (TextBox)row.FindControl("textBoxNuevoActivo");
                bool activo = bool.Parse(tb.Text);
                tb = (TextBox)row.FindControl("textBoxNuevoIdentificacion");
                string identificacion = tb.Text;
                Debug.Write(nombrePropietario + " " + idTipoId.ToString() + " " + activo.ToString() + " " + identificacion + "\n");
                fillGridPropietarios(-1);
            }
        }

        // Funciones de la tabla de usuarios ##########################

        protected void verUsuarios_Click(object sender, EventArgs e)
        {

        }

        
    }

}