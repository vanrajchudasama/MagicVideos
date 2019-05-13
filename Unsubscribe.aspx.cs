using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Unsubscribe : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["user"]!=null)
        {
            if(Request.QueryString["unsubscribe"]!=null && Request.QueryString["id"]!=null)
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("update subscrib set status='" + false + "' where channel_id='" + Request.QueryString["id"] + "' and user_id='" + Request.QueryString["unsubscribe"] + "'", cn);
                cmd.ExecuteNonQuery();
                Response.Redirect("MySubscription.aspx");
                cn.Close();


            }
            else
            {
                Response.Redirect("MySubscription.aspx");
            }
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }
}