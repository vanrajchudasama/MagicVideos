using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Session["user"] = null;
            Response.Redirect("Login1.aspx");
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }
}