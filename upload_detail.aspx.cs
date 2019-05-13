using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WMPLib;
using System.Diagnostics;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class upload_detail : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    
    public  string d1,video_path;
    static string img_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null )
        {
            if (Session["file"] != null)
            {
                fuDocument.Attributes["onchange"] = "UploadFile(this)";
                video_path = "videos/" + Session["file"];
                lblmsg.Text = "";
                Label1.Text = "";
                
                //TextBox1.Text = Session["file"].ToString();
            }
            else
            {
                if (Request.QueryString["ids"] == null)
                {
                    Response.Redirect("Upload.aspx");
                }
            }
            if (!IsPostBack)
            {
                get_video_details();
            }
        }
        else
        {
            Response.Redirect("Login1.aspx");
        }
     
    }
    protected void get_video_details()
    {
        if (Request.QueryString["ids"] != null)
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select *from videos where id='" + Request.QueryString["ids"] + "'";
            cmd.ExecuteScalar();
            DataSet ds1 = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(ds1);
            cn.Close();
            category.SelectedValue = ds1.Tables[0].Rows[0]["category"].ToString();
            title.Text = ds1.Tables[0].Rows[0]["title"].ToString();
            description.Text = ds1.Tables[0].Rows[0]["description"].ToString();
            Image1.ImageUrl = ds1.Tables[0].Rows[0]["img"].ToString();
            tags.Text = ds1.Tables[0].Rows[0]["tags"].ToString();
        }
    }
    public void UploadDocument(object sender, EventArgs e)
    {
        if (fuDocument.HasFile)
        {
            const int maxlangth = 512000;
           
                if (fuDocument.PostedFile.ContentLength < maxlangth)
                {
                    img_path = "video_img/" + Path.GetFileName(fuDocument.FileName);
                    fuDocument.SaveAs(Server.MapPath("~/video_img/" + Path.GetFileName(fuDocument.FileName)));

                    // Response.Write("<script>alert('upload successful');</script>");

                    Image1.ImageUrl = "~/video_img/" + Path.GetFileName(fuDocument.FileName);
                }
                else
                {
                    Label1.Text = "Image is to large (maxlangth < 500kb)";
                }
            
        }
            //Stream fs = fuDocument.PostedFile.InputStream;
            //BinaryReader br = new BinaryReader(fs);
            //Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            // base64 = Convert.ToBase64String(bytes, 0, bytes.Length);
            // link = "data:image/png;base64," + base64;
            //Image1.ImageUrl = "data:image/png;base64," + base64;


    }
    protected void upload_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ids"] == null)
        {
            if (title.Text != "")
            {
                if (Image1.ImageUrl != "~/video_img/index.PNG")
                {
                    if (category.SelectedIndex != 0)
                    {
                        if (tags.Text != "")
                        {
                            System.Threading.Thread.Sleep(3000);

                            cn.Open();
                            var player = new WindowsMediaPlayerClass();
                            var clip = player.newMedia(Server.MapPath("~/videos/" + Session["file"]));
                            int a = clip.imageSourceWidth;
                            d1 = clip.durationString;

                            SqlCommand cmd = cn.CreateCommand();
                            cmd.CommandType = CommandType.Text;

                            cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "' ";
                            cmd.ExecuteScalar();
                            DataSet ds = new DataSet();
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            da.Fill(ds);

                            string id = ds.Tables[0].Rows[0]["user_id"].ToString();
                            string nm = ds.Tables[0].Rows[0]["name"].ToString();

                            SqlCommand cmd1 = new SqlCommand("insert into videos(user_id,user_name,title,link,description,duration,likes,dislikes,views,img,publish_date,category,tags) values('" + id + "','" + nm + "','" + title.Text + "','" + video_path + "','" + description.Text + "','" + d1 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + img_path + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','" + category.SelectedItem + "','" + tags.Text + "')", cn);
                            cmd1.ExecuteNonQuery();
                            cn.Close();
                            Response.Redirect("User_home.aspx");

                        }
                        else
                        {
                        }
                    }
                    else
                    {
                        lblmsg.Text = "";
                        lblmsg.Text = "Please select Category";
                    }
                }
                else
                {
                    Label1.Text = "Please select image";
                }
            }
        }
        else
        {
            if (Image1.ImageUrl != "~/video_img/index.PNG" )
            {
                if (Image1.ImageUrl != null)
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("update videos set title='" + title.Text + "',description='" + description.Text + "',img='" + img_path + "',category='" + category.SelectedItem + "',tags='" + tags.Text + "' where id='" + Request.QueryString["ids"] + "'", cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    Response.Redirect("User_home.aspx");
                }
                else
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("update videos set title='" + title.Text + "',description='" + description.Text + "',category='" + category.SelectedItem + "',tags='" + tags.Text + "' where id='" + Request.QueryString["ids"] + "'", cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    Response.Redirect("User_home.aspx");
                }

            }
            else
            {
                Label1.Text = "Please select image";
            }
        }
    }

}