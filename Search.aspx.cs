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


public partial class Search : System.Web.UI.Page
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
            if (Request.QueryString["search_query"] != null)
            {
                cn.Open();
                SqlCommand cmd = cn.CreateCommand();
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "select * from videos where  user_id='" + Request.QueryString["search_query"] + "'  ";
                cmd.ExecuteScalar();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();
                }
                else
                {
                    Label1.Visible = true;
                }
                cn.Close();
            }
        else if (Request.QueryString["search"] != "123" && Request.QueryString["search"] != "latest" && Request.QueryString["search"] != "trending")
            {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "select * from videos where  title like '%" + Request.QueryString["search"] + "%' or category like '%" + Request.QueryString["search"] + "%' or tags like'%"+Request.QueryString["search"]+"%'  ";
            cmd.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                    {
                     Repeater1.DataSource = ds;
                     Repeater1.DataBind();
                     }
                else
                {
                 Label1.Visible = true;
                }
            cn.Close();
            }
            else if (Request.QueryString["search"] == "123")
            {
                cn.Open();
                SqlCommand cmd = cn.CreateCommand();
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "select * from videos where  likes between '" + 100 + "' and  '" + 500 + "' ";
                cmd.ExecuteScalar();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();
                }
                else
                {
                    Label1.Visible = true;
                }
                cn.Close();
            }
            else if(Request.QueryString["search"]=="latest")
            {
                cn.Open();
                SqlCommand cmd = cn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                string date = "08-02-2019";
                cmd.CommandText = "select * from videos where   publish_date between '" + date + "' and '" + DateTime.Today.ToString("dd-MM-yyyy") + "' ";
                cmd.ExecuteScalar();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();
                }
                else
                {
                    Label1.Visible = true;
                }
                cn.Close();
            }
        else if (Request.QueryString["search"] == "trending")
        {
            cn.Open();
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            string date = "08-02-2019";
            cmd.CommandText = "select * from videos where (likes between ('" + 200 + "') and  ('" + 600 + "')) And (publish_date between ('"+date+"') and ('"+DateTime.Today.ToString("dd-MM-yyyy")+"')) ";
            cmd.ExecuteScalar();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
            else
            {
                Label1.Visible = true;
            }
            cn.Close();
        }
        else
        {
            Label1.Visible = true;
        }
        }
        catch (Exception e)
       {
           Response.Redirect("Server_not_responding.aspx");
       }

    }
}