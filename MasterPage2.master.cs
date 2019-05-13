using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using WMPLib;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    public string user_image,user_id;
    public int tot_videos=0;
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        get_user_data();
        get_tot_videos();
    }
    protected void get_tot_videos()
    {
        cn.Open();

        SqlCommand cmd = cn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "' ";
        cmd.ExecuteScalar();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        user_id = ds.Tables[0].Rows[0]["user_id"].ToString();
            

        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select count(id)  from videos where user_id='" + user_id + "' ";
        tot_videos =Convert.ToInt32( cmd1.ExecuteScalar());

        cn.Close();

        
    }
    protected void get_user_data()
    {
      
        if (Session["user"] != null)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "' ";
            cmd.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);

            user_image = ds.Tables[0].Rows[0]["avatar"].ToString();
            

           
            cn.Close();
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }
}
