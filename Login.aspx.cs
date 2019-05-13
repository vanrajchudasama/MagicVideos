using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(5000);

        cn.Open();
        string pass = TextBox2.Text.Trim();
        string user = TextBox1.Text.Trim();
        int i = 0;
        SqlCommand cmd = cn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select *from user_registration where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
        cmd.ExecuteNonQuery();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds, "pass");
        if (ds.Tables[i].Rows.Count > 0)
        {
            if (pass == ds.Tables[i].Rows[i]["password"].ToString() && user == ds.Tables[i].Rows[i]["username"].ToString())
            {
                if (Session["l"] != null)
                {
                    Session["user"] = TextBox1.Text;
                    
                    Response.Redirect(Session["l"].ToString());
                }
                else
                {
                    Session["user"] = TextBox1.Text;
                    Response.Redirect("Default.aspx");
                }
                

            }
            else
            {
                Label1.Text = "User name and Password is Invalid";
            }

        }

        else
        {
            Label1.Text = "* We can not find an Account with that user name..";
            //Response.Write("<script LANGUAGE='JavaScript' >alert('Incorrect Password')</script>");
        }
        cn.Close();
    }
}