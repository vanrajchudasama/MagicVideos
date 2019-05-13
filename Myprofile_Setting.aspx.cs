using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Myprofile_Setting : System.Web.UI.Page
{
    public string user_image, u_phone, user_dob, user_name, user_city, user_country, user_about, user_date, u_chnm, u_email, u_contry;
    SqlDataReader dr;
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {

            if (!IsPostBack)
            {
                get_user_data();
            }
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }

        Label3.Text = "";

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
            user_name = ds.Tables[0].Rows[0]["name"].ToString();
            user_dob = ds.Tables[0].Rows[0]["dob"].ToString();
            user_city = ds.Tables[0].Rows[0]["city"].ToString();
            user_date = ds.Tables[0].Rows[0]["create_date"].ToString();
            u_chnm = ds.Tables[0].Rows[0]["channel"].ToString();
            u_contry = ds.Tables[0].Rows[0]["country"].ToString();
            u_email = ds.Tables[0].Rows[0]["email"].ToString();
            u_phone = ds.Tables[0].Rows[0]["phone_no"].ToString();
            txtname.Text = user_name;
            txtchannelnm.Text = u_chnm;
            txtcity.Text = user_city;
            txtbdate.Text = user_dob;
            txtemail.Text = u_email;
            txtphone.Text = u_phone;
            country.SelectedValue = u_contry;
            cn.Close();
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
    }

    public void UploadDocument(object sender, EventArgs e)
    {
        if (fuDocument.HasFile)
        {
            const int maxlangth = 500 * 1024;

            if (fuDocument.PostedFile.ContentLength < maxlangth)
            {
                Session["file"] = Path.GetFileName(fuDocument.FileName);
                fuDocument.SaveAs(Server.MapPath("~/user_profile/" + Path.GetFileName(fuDocument.FileName)));
                cn.Open();
                SqlCommand cmd = new SqlCommand("update user_registration set avatar='" + "user_profile/" + Path.GetFileName(fuDocument.FileName) + "' where username='" + Session["user"] + "'", cn);
                cmd.ExecuteNonQuery();

                cn.Close();
                get_user_data();
                Response.Redirect("Myprofile_Setting.aspx");
            }
            else
            {
                Response.Write("<script>alert('file size must be <500kb');</script>");
                // Response.Redirect("Myprofile_Setting.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('Please select file');</script>");

        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {

        if (txtnewmail.Text != string.Empty)
        {
            string user = txtnewmail.Text.Trim();
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select *from user_registration where username='" + txtnewmail.Text + "' and email='" + txtnewmail.Text + "'";
            cmd.ExecuteNonQuery();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "pass");
            cn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {

                Label1.Text = "This Email Id is Already Exist......!";


            }
            else
            {


                    cn.Open();
                    SqlCommand cmd1 = new SqlCommand("update user_registration set name='" + txtname.Text + "',city='" + txtcity.Text + "',email='" + txtnewmail.Text + "',username='"+txtnewmail.Text+"',channel='" + txtchannelnm.Text + "',phone_no='" + txtphone.Text + "' where username='" + Session["user"] + "'", cn);
                    cmd1.ExecuteNonQuery();
                    txtnewmail.Text = "";
                    cn.Close();
                    Session["user"] = null;
                    Response.Redirect("Login1.aspx");
               
                    
                
            }
        }
        else
        {
            cn.Open();
            SqlCommand cmd2 = new SqlCommand("update user_registration set name='" + txtname.Text + "',city='" + txtcity.Text + "',channel='" + txtchannelnm.Text + "',phone_no='" + txtphone.Text + "'  where username='" + Session["user"] + "'", cn);
            cmd2.ExecuteNonQuery();
            cn.Close();
            get_user_data();
        }
    }
}