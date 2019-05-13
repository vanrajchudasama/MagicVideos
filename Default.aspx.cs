using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WMPLib;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        bindData();

       
    }
   
    private void bindData()
    {
        try
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            
            cmd.CommandText = "select TOP 8 * from videos where  views between '"+0+"' and  '"+500+"'  ";
            cmd.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);

            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            string s="sports";
            SqlCommand cmd1 = cn.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select * from videos where  (views between ('" + 0 + "') and  ('" + 500 + "')) and category='"+s+"'  ";
            cmd1.ExecuteScalar();
            DataSet ds1 = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(ds1);

            Repeater2.DataSource = ds1;
            Repeater2.DataBind();
            cn.Close();
        }
        catch (Exception e)
        {
            Response.Redirect("Server_not_responding.aspx");
        }

    }
}