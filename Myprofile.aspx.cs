using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Myprofile : System.Web.UI.Page
{
    public string user_image, user_dob, user_city, user_date, user_name;

    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        get_user_data();
        
    }
    public void get_user_data()
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
            user_name = ds.Tables[0].Rows[0]["name"].ToString();
            user_dob = ds.Tables[0].Rows[0]["dob"].ToString();
            user_city = ds.Tables[0].Rows[0]["city"].ToString();
            user_date = ds.Tables[0].Rows[0]["create_date"].ToString();

            cn.Close();
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }
}