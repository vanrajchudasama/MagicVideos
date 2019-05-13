using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Myplaylist : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    public int tot_channel=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            bindData();
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }
    protected void bindData()
    {
        cn.Open();



        SqlCommand cmd = cn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "' ";
        cmd.ExecuteScalar();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        string user_id = ds.Tables[0].Rows[0]["user_id"].ToString();


        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select *  from subscrib where user_id='" + user_id + "' and status='"+true+"'";
       cmd1.ExecuteScalar();
       DataSet ds2 = new DataSet();
       SqlDataAdapter da2 = new SqlDataAdapter(cmd1);
       da2.Fill(ds2);
       Repeater1.DataSource = ds2;
       Repeater1.DataBind();

       SqlCommand cmd2 = cn.CreateCommand();
       cmd2.CommandType = CommandType.Text;
       cmd2.CommandText = "select Count(user_id) from subscrib where user_id='" + user_id + "' and status='"+true+"' ";
       tot_channel = Convert.ToInt32(cmd2.ExecuteScalar());
        cn.Close();


    }

    
}