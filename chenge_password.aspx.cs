using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class chenge_password : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            newpass.Focus();
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }

    protected void btnchange_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "' ";
            cmd.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);

        if ( ds.Tables[0].Rows[0]["password"].ToString()==currentpass.Text)
        {


            SqlCommand cmd1 = new SqlCommand("update user_registration set password='" + newpassconf.Text + "' where user_id='" + ds.Tables[0].Rows[0]["user_id"].ToString() + "'", cn);
            cmd1.ExecuteNonQuery();
            
            Session["user"] = null;
           
            Response.Redirect("Login1.aspx");
           


        }
        else
        {
            Label1.Text = "Invalid Password";
        }
        cn.Close();
       
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("User_home.aspx");
    }
}