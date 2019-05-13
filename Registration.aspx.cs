using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
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
       
        string user = TextBox1.Text.Trim();
        
        SqlCommand cmd = cn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select *from user_registration where username='" + TextBox1.Text + "' and email='"+TextBox1.Text+"'";
        cmd.ExecuteNonQuery();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds, "pass");
        
        if (ds.Tables[0].Rows.Count > 0)
        {

            Label1.Text = "This Email Id is Already Exist......!";

           
        }
        else
        {
            
                string dob = Convert.ToString(DropDownList1.SelectedItem);
                dob = dob + "-" + DropDownList2.SelectedItem.ToString();
                dob = dob + "-" + DropDownList3.SelectedItem.ToString();
                cmd = new SqlCommand("insert into user_registration(name,email,dob,channel,username,password,create_date,tot_sub,security_code) values('" + TextBox6.Text + "','" + TextBox1.Text + "','" + dob + "','" + TextBox4.Text + "','" + TextBox1.Text + "','" + TextBox3.Text + "','" + DateTime.Now.ToString("dd/MM/yyyy") + "'.'"+0+"','" + TextBox5.Text + "')", cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                Response.Redirect("Login1.aspx");
                  
        }

    }

   
}