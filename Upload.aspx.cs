using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {

            Response.Redirect("Login1.aspx");

        }
       

    }
    protected void fileupload_DataBinding(object sender, EventArgs e)
    {
        
    }
    public void UploadDocument(object sender, EventArgs e)
    {
        if (fuDocument.HasFile)
        {
            const int maxlangth = 100*(1024*1024);

            if (fuDocument.PostedFile.ContentLength < maxlangth)
            {
                Session["file"] = Path.GetFileName(fuDocument.FileName);
                fuDocument.SaveAs(Server.MapPath("~/videos/" + Path.GetFileName(fuDocument.FileName)));

                Response.Write("<script>alert('upload successful');</script>");
                Response.Redirect("upload_detail.aspx");
            }
            else
            {
                Label1.Visible = true;
            }
        }
        else
        {
            Response.Write("<script>alert('Please select file');</script>");

        }
    }
    protected void filesize(object source,ServerValidateEventArgs args)
    {
        if (fuDocument.FileBytes.Length > 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}