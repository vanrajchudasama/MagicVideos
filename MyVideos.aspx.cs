using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class MyVideos : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    public string user_id;
    public int tot_videos = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
        else
        {
            bindData();
            get_tot_videos();
        }
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
        tot_videos = Convert.ToInt32(cmd1.ExecuteScalar());

        cn.Close();


    }
    private void bindData()
    {
        try
        {
            cn.Open();

            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
            cmd.ExecuteScalar();
            DataSet ds1 = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(ds1);
            int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);



            SqlCommand cmd1 = cn.CreateCommand();
            cmd1.CommandType = CommandType.Text;

            cmd1.CommandText = "select * from videos  where user_id='" + id + "'";
            cmd1.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            da.Fill(ds);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            cn.Close();
        }
        catch (Exception e)
        {
            Response.Redirect("Server_not_responding.aspx");
        }

    }

}