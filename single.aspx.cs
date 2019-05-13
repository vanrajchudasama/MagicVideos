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


public partial class single : System.Web.UI.Page
{
    public int a, i, count = 0;
    public static string id,link;
    public string video_path,user_id,user_img,user_name,user_channel, video_title,category,video_disc, chennel_logo, channel_name, tot_subscriber, tot_views="0",tot_dislikes="0",tot_subs="0", tot_like="0", tot_unlike="0";
    SqlDataReader dr;
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        link = HttpContext.Current.Request.Url.PathAndQuery;
        id = Request.QueryString["id"];
        showcomment();
        if (!IsPostBack)
        {
            views_count();
        }
        get_video_data();
       
        user_like();
        user_subscribe();
        uptonext();
       
    }
    protected void views_count()
    {
        cn.Open();
        count++;
        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
        cmd1.ExecuteScalar();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        da.Fill(ds);
        ViewState["views1"] = ds.Tables[0].Rows[0]["views"].ToString();
        count=count+Convert.ToInt32(ViewState["views1"]);
        SqlCommand cmd = new SqlCommand("update videos set views='" + count + "' where id='" + Request.QueryString["id"] + "'",cn);
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    private void user_like()
    {
        if (Session["user"] != null)
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


            SqlCommand cmd1 = new SqlCommand("select *from user_like where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
            dr = cmd1.ExecuteReader();
            
            if (dr.Read())
            {
                dr.Close();
            }
            else
            {
                dr.Close();
                SqlCommand cmd2 = new SqlCommand("insert into user_like values('" + Request.QueryString["id"] + "','" + id + "','" + false + "','"+false+"')", cn);
                cmd2.ExecuteNonQuery();
                
            }
            
            cn.Close();
        }
    }
    
    private void uptonext()
    {
        cn.Open();

       

        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "' ";
        cmd1.ExecuteScalar();
        DataSet ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(ds1);
        
        SqlCommand cmd2 = cn.CreateCommand();
        cmd2.CommandType = CommandType.Text;

        cmd2.CommandText = "select *from videos where category like '%" + ds1.Tables[0].Rows[0]["category"].ToString() + "%'";
        cmd2.ExecuteScalar();
        DataSet ds2 = new DataSet();
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        da2.Fill(ds2);

        Repeater3.DataSource = ds2;
        Repeater3.DataBind();
        cn.Close();
    }
    private void showcomment()
    {


        cn.Open();
        SqlCommand cmd = cn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        SqlCommand cmd1 = new SqlCommand("select Count(id) from Parentcomment where video_id='" + Request.QueryString["id"] + "'", cn);
        a = Convert.ToInt32(cmd1.ExecuteScalar());
        cmd.CommandText = "select *from Parentcomment where video_id='" + id + "' ORDER BY date_create";
        cmd.ExecuteScalar();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
        cn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        if (Session["user"] == null)
        {
            Session["l"] = HttpContext.Current.Request.Url.PathAndQuery;
            Response.Redirect("Login1.aspx");

        }
        else
        {
           
                if (return_like())
                {
                   
                    like_viewstae();
                    
                    i = Convert.ToInt32(ViewState["like1"]) - 1;
                    ViewState["like1"] = i.ToString();

                    SqlCommand cmd = cn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                    cmd.ExecuteScalar();
                    DataSet ds1 = new DataSet();
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                    da1.Fill(ds1);
                    int id =Convert.ToInt32( ds1.Tables[0].Rows[0]["user_id"]);


                    SqlCommand cmd1 = new SqlCommand("update user_like set likes='" + false + "' where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
                    cmd1.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("update videos set likes='" + ViewState["like1"] + "' where id='" + Request.QueryString["id"] + "'", cn);
                    cmd2.ExecuteNonQuery();
                    cn.Close();
                    get_video_data();
                }
                else
                { 
                    like_viewstae();
                    if (return_dislike())
                    {
                        cn.Open();

                        ViewState["like1"] = Convert.ToInt32(ViewState["like1"]) + 1;
                        ViewState["dislikes"] = Convert.ToInt32(ViewState["dislikes"]) - 1;
                        SqlCommand cmd = cn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                        cmd.ExecuteScalar();
                        DataSet ds1 = new DataSet();
                        SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                        da1.Fill(ds1);
                        int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);


                        SqlCommand cmd1 = new SqlCommand("update user_like set likes='" + true + "',dislikes='"+false+"' where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
                        cmd1.ExecuteNonQuery();

                        SqlCommand cmd2 = new SqlCommand("update videos set likes='" + ViewState["like1"] + "',dislikes='" + ViewState["dislikes"] + "' where id='" + Request.QueryString["id"] + "'", cn);
                        cmd2.ExecuteNonQuery();

                        cn.Close();
                        get_video_data();
                    }
                    else
                    {
                        cn.Open();
                        i = Convert.ToInt32(ViewState["like1"]) + 1;
                        ViewState["like1"] = i.ToString();

                        SqlCommand cmd = cn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                        cmd.ExecuteScalar();
                        DataSet ds1 = new DataSet();
                        SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                        da1.Fill(ds1);
                        int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);


                        SqlCommand cmd1 = new SqlCommand("update user_like set likes='" + true + "' where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
                        cmd1.ExecuteNonQuery();


                        SqlCommand cmd2 = new SqlCommand("update videos set likes='" + ViewState["like1"].ToString() + "' where id='" + Request.QueryString["id"] + "'", cn);
                        cmd2.ExecuteNonQuery();
                        
                    }
                    cn.Close();
                    get_video_data();
                }
            }
            
           
        
       
    }
    private void like_viewstae()
    {
        cn.Open();
        
        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
        cmd1.ExecuteScalar();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        da.Fill(ds);
        ViewState["views"] = ds.Tables[0].Rows[0]["views"].ToString();
        ViewState["like1"] = ds.Tables[0].Rows[0]["likes"].ToString();
        ViewState["dislikes"] = ds.Tables[0].Rows[0]["dislikes"].ToString();
        ViewState["tot_sub"] = ds.Tables[0].Rows[0]["tot_sub"].ToString();

    }
    public Boolean return_dislike()
    {
        bool t = false;
        cn.Close();
        cn.Open();
        if (Session["user"] != null)
        {


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
            cmd1.CommandText = "select *from user_like where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'";
            cmd1.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            da.Fill(ds);

            t = Convert.ToBoolean(ds.Tables[0].Rows[0]["dislikes"].ToString());


        }
        cn.Close();
        return t;

    }
   
    public Boolean return_like()
    {
        bool t=false;
        cn.Open();
        if (Session["user"] != null)
        {
           

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
            cmd1.CommandText = "select *from user_like where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'";
            cmd1.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            da.Fill(ds);
           
            t = Convert.ToBoolean(ds.Tables[0].Rows[0]["likes"].ToString());
            
            
        }
        cn.Close();
        return t;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Session["l"] = HttpContext.Current.Request.Url.PathAndQuery;
            Response.Redirect("Login1.aspx");

        }
        else
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
            user_name = ds.Tables[0].Rows[0]["name"].ToString();

            SqlCommand cmd1 = new SqlCommand("insert into Parentcomment(video_id,user_id,user_name,comment,date_create) values('"+Request.QueryString["id"]+"','"+user_id+"','"+user_name+"','" + TextBox1.Text + "','" + DateTime.Today.ToString("dd/MM/yyyy") + "')", cn);
            cmd1.ExecuteNonQuery();
            cn.Close();
            showcomment();
            
            TextBox1.Text = "";
          
            

        }
    }
    protected void get_video_data()
    {
        cn.Open();
        

        SqlCommand cmd1 = cn.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "' ";
        cmd1.ExecuteScalar();
        DataSet ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(ds1);

        SqlCommand cmd = cn.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select *from user_registration where user_id='" + ds1.Tables[0].Rows[0]["user_id"].ToString() +"' ";
        cmd.ExecuteScalar();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        user_channel = ds.Tables[0].Rows[0]["channel"].ToString();
        tot_subs = ds.Tables[0].Rows[0]["tot_sub"].ToString();
        Button5.Text = tot_subs;
        Button4.Text = tot_subs;
        user_img = ds.Tables[0].Rows[0]["avatar"].ToString();       
        video_path = ds1.Tables[0].Rows[0]["link"].ToString();
        video_title = ds1.Tables[0].Rows[0]["title"].ToString();
        tot_like = ds1.Tables[0].Rows[0]["likes"].ToString();
        tot_dislikes = ds1.Tables[0].Rows[0]["dislikes"].ToString();
        tot_views = ds1.Tables[0].Rows[0]["views"].ToString();
        category = ds1.Tables[0].Rows[0]["category"].ToString();
        video_disc = ds1.Tables[0].Rows[0]["description"].ToString();
        cn.Close();
    }


    protected void imgbtndislike_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["user"] != null)
        {
            like_viewstae();
            cn.Close();
            if (return_dislike())
            {
                cn.Open();

                ViewState["dislikes"] = Convert.ToInt32(ViewState["dislikes"]) - 1;
                SqlCommand cmd = cn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                cmd.ExecuteScalar();
                DataSet ds1 = new DataSet();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                da1.Fill(ds1);
                int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);


                SqlCommand cmd1 = new SqlCommand("update user_like set dislikes='" + false + "' where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("update videos set  dislikes='" + ViewState["dislikes"] + "' where id='" + Request.QueryString["id"] + "'", cn);
                cmd2.ExecuteNonQuery();

                cn.Close();
                get_video_data();





            }
            else
            {
                if (return_like())
                {
                    cn.Open();

                    ViewState["like1"] = Convert.ToInt32(ViewState["like1"]) - 1;
                    ViewState["dislikes"] = Convert.ToInt32(ViewState["dislikes"]) + 1;
                    SqlCommand cmd = cn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                    cmd.ExecuteScalar();
                    DataSet ds1 = new DataSet();
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                    da1.Fill(ds1);
                    int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);


                    SqlCommand cmd1 = new SqlCommand("update user_like set likes='" + false + "',dislikes='" + true + "' where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
                    cmd1.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("update videos set likes='" + ViewState["like1"] + "',dislikes='" + ViewState["dislikes"] + "' where id='" + Request.QueryString["id"] + "'", cn);
                    cmd2.ExecuteNonQuery();

                    cn.Close();
                    get_video_data();

                }
                else
                {
                    cn.Open();

                    ViewState["dislikes"] = Convert.ToInt32(ViewState["dislikes"]) + 1;

                    SqlCommand cmd = cn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                    cmd.ExecuteScalar();
                    DataSet ds1 = new DataSet();
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd);
                    da1.Fill(ds1);
                    int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);


                    SqlCommand cmd1 = new SqlCommand("update user_like set dislikes='" + true + "' where user_id='" + id + "' and video_id='" + Request.QueryString["id"] + "'", cn);
                    cmd1.ExecuteNonQuery();


                    SqlCommand cmd2 = new SqlCommand("update videos set dislikes='" + ViewState["dislikes"].ToString() + "' where id='" + Request.QueryString["id"] + "'", cn);
                    cmd2.ExecuteNonQuery();
                    cn.Close();
                    get_video_data();
                }

            }
        }
        else
        {
            Session["l"] = "van";
            Response.Redirect("Login1.aspx");

        }
    }


    protected Boolean return_subscribe()
    {
        bool t = false;
        
        cn.Open();
        if (Session["user"] != null)
        {
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
            cmd.ExecuteScalar();
            DataSet ds1 = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(ds1);
            int id = Convert.ToInt32(ds1.Tables[0].Rows[0]["user_id"]);

            SqlCommand cmd2 = cn.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText="select *from videos where id='"+Request.QueryString["id"]+"'";
            cmd2.ExecuteNonQuery();
            DataSet ds2 = new DataSet();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(ds2);
            int uid = Convert.ToInt32(ds2.Tables[0].Rows[0]["user_id"]);

            SqlCommand cmd1 = cn.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select *from subscrib where user_id='" + id + "' and channel_id='"+uid+"'";
            cmd1.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            da.Fill(ds);

            t = Convert.ToBoolean(ds.Tables[0].Rows[0]["status"].ToString());


        }
        cn.Close();
        return t;
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        if (Session["user"] != null)
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
                SqlCommand c = cn.CreateCommand();
                c.CommandType = CommandType.Text;
                c.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
                c.ExecuteNonQuery();
                DataSet d1 = new DataSet();
                SqlDataAdapter sd = new SqlDataAdapter(c);
                sd.Fill(d1);
                int uid = Convert.ToInt32(d1.Tables[0].Rows[0]["user_id"]);

                cn.Close();
            if (return_subscribe())
            {
                cn.Open();
                SqlCommand cmd1=new SqlCommand("update subscrib set status='"+false+"' where user_id='"+id+"' and channel_id='"+uid+"'",cn);
                cmd1.ExecuteNonQuery();
               int i1 = Convert.ToInt32(ViewState["tot_sub"]) - 1;
                ViewState["tot_sub"] = i1.ToString();

                SqlCommand cmd2 = cn.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
                cmd2.ExecuteNonQuery();
                DataSet ds2 = new DataSet();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                da2.Fill(ds2);
                int user_id1 = Convert.ToInt32(ds2.Tables[0].Rows[0]["user_id"]);


                SqlCommand cmd3 = new SqlCommand("update user_registration set tot_sub='" + ViewState["tot_sub"].ToString() + "' where user_id='" + user_id1 + "'" , cn);
                cmd3.ExecuteNonQuery();


                cn.Close();
            }
            else
            {
                cn.Open();
                SqlCommand cmd3 = new SqlCommand("update subscrib set status='" + true + "' where user_id='" + id + "' and channel_id='" + uid + "'", cn);
                cmd3.ExecuteNonQuery();


                SqlCommand cmd2 = cn.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
                cmd2.ExecuteNonQuery();
                DataSet ds2 = new DataSet();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                da2.Fill(ds2);
                int user_id1 = Convert.ToInt32(ds2.Tables[0].Rows[0]["user_id"]);


               int i1 = Convert.ToInt32(ViewState["tot_sub"]) + 1;
                ViewState["tot_sub"] = i1.ToString();

                SqlCommand cmd1 = new SqlCommand("update user_registration set tot_sub='" + ViewState["tot_sub"].ToString() + "' where user_id='" + user_id1 + "'", cn);
                cmd1.ExecuteNonQuery();
                cn.Close();
            }
        
        }
        else
        {
            Session["l"] = HttpContext.Current.Request.Url.PathAndQuery;
            Response.Redirect("Login1.aspx");
        }
    }
    public void user_subscribe()
    {
        if (Session["user"] != null)
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

            SqlCommand c = cn.CreateCommand();
            c.CommandType = CommandType.Text;
            c.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
            c.ExecuteNonQuery();
            DataSet d1 = new DataSet();
            SqlDataAdapter sd = new SqlDataAdapter(c);
            sd.Fill(d1);
            int uid = Convert.ToInt32(d1.Tables[0].Rows[0]["user_id"]);


            SqlCommand cmd4 = new SqlCommand("select *from subscrib where user_id='" + id + "' and channel_id='"+uid+"' ", cn);
            dr = cmd4.ExecuteReader();

            if (dr.Read())
            {
                dr.Close();
            }
            else
            {
                dr.Close();
                SqlCommand cmd3 = cn.CreateCommand();
                cmd3.CommandType = CommandType.Text;
                cmd3.CommandText = "select *from user_registration where username='" + Session["user"] + "'";
                cmd3.ExecuteScalar();
                DataSet ds3 = new DataSet();
                SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                da3.Fill(ds3);
                int uid1 = Convert.ToInt32(ds3.Tables[0].Rows[0]["user_id"]);
                SqlCommand cmd1 = cn.CreateCommand();
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "select *from videos where id='" + Request.QueryString["id"] + "'";
                cmd1.ExecuteScalar();
                DataSet ds2 = new DataSet();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd1);
                da2.Fill(ds2);
                int uid2 = Convert.ToInt32(ds2.Tables[0].Rows[0]["user_id"]);
                string ch_name = ds2.Tables[0].Rows[0]["channel"].ToString();
                string avatar = ds2.Tables[0].Rows[0]["avatar"].ToString();


                SqlCommand cmd2 = new SqlCommand("insert into subscrib(channel_id,user_id,date_subscrib,ch_nm,ch_img,status) values('" + uid2 + "','" + uid1 + "','" + DateTime.Today.ToString("dd-MM-yyyy") + "','"+ch_name+"','"+avatar+"','" + false + "')", cn);
                cmd2.ExecuteNonQuery();

            }

            cn.Close();
        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        string[] fil = video_path.Split('/');
             Response.ContentType = "Video/mp4";
            Response.AppendHeader("Content-Disposition", "attachment;filename="+fil[1]);
           //  Response.AddHeader("Content-Length",myfile.Length.ToString();
            Response.TransmitFile(Server.MapPath("~/videos/" + fil[1]));
            Response.End();
       
    }
    
}