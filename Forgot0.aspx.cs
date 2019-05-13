using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Forgot : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Response.Redirect("Login1.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         cn.Open();
       
        string user = TextBox1.Text.Trim();
        int i = 0;
        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select *from user_registration where username='" + TextBox1.Text + "'";
        cmd1.ExecuteNonQuery();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        da.Fill(ds, "pass");
        if (ds.Tables[i].Rows.Count > 0)
        {
            if (user == ds.Tables[i].Rows[i]["username"].ToString())
            {
                if (securitycode.Text == ds.Tables[i].Rows[i]["security_code"].ToString())
                {
                    SqlCommand cmd2 = new SqlCommand("update user_registration set password='" + TextBox2.Text + "' where username='" + TextBox1.Text + "'", cn);
                    cmd2.ExecuteNonQuery();


                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Label1.Text = "Invalid Security Code";
                }

            }
            else
            {
                Label1.Text = "User name  is Invalid";
            }

        }

        
        cn.Close();
    }
}