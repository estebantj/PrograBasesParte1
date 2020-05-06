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
    public partial class tablaPropietarios : System.Web.UI.Page
    {
        private string verPropietariosSpName = "showOwnersSP";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int idPropiedad = (int)HttpContext.Current.Session["idPropiedad"];
                Debug.Write("\n id Propiedad: " + idPropiedad);
            } catch (NullReferenceException ex)
            {
                Debug.Write("No hay id");
                Debug.Write(ex.Source);
            }
            HttpContext.Current.Session["idPropiedad"] = 5;
        }
        // Funciones de la tabla de propietarios ##########################

        protected void fillGridPropietarios(int idPropiedad)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                string procedure;
                //if (idPropiedad != -1)
                {
                //    procedure = verPropietariosDePropiedadSpName;
                }
                //else
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
            //hideCurrentDiv("divPropietarios");
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

    }
}