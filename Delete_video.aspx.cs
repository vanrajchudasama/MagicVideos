using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Delete_video : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
        delete_video();
    }
    protected void delete_video()
    {
        cn.Open();
        SqlCommand cmd1 = new SqlCommand("delete from Parentcomment where video_id='" + Request.QueryString["id"] + "'", cn);
        cmd1.ExecuteNonQuery();
        SqlCommand cmd2 = new SqlCommand("delete from user_like where video_id='" + Request.QueryString["id"] + "'", cn);
        cmd2.ExecuteNonQuery();
        SqlCommand cmd = new SqlCommand("delete from videos where id='" + Request.QueryString["id"] + "'", cn);
        cmd.ExecuteNonQuery();
        
        cn.Close();
        Response.Redirect("user_home.aspx");
    }
}