using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrograBases.WebPages
{
    public partial class StartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonConsultaPropiedadDePropietario_Click(object sender, EventArgs e)
        {
            int idPropiedad = int.Parse(idPropiedadDePropietario.Text);
            HttpContext.Current.Session["idPropiedad"] = idPropiedad;
            Response.Redirect("~/WebPages/tablaPropietarios.aspx");
        }
    }
}