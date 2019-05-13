 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="upload_detail.aspx.cs" Inherits="upload_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .button
        {
            height:35px;
            width:150px;
            border-radius:5px;
            color:white;
            background-color:#25AAFA;
            font-size:14px;
        }
            .button:hover
            {
                background-color:#d4cfcf;
                color:#fff;
            }
        .content
        {
            width:90%;
            margin-left:5%;
            margin-right:5%;
           
            
            margin-top:30px;
            margin-bottom:30px;
            box-shadow:1px 1px 1px 1px;
        }
         .textbox
        {
            border-radius:5px;
            height:30px;
            width:300px;
            font-size:16px;
        }
         .model
        {
            position:fixed;
            z-index:999;
            height:100%;
            width:100%;
            top:0;
            background-color:black;
            filter:alpha(opacity=60);
            opacity:0.6;

        }
        .center
        {
            z-index:1000;
            margin: auto;
            padding:10px;
            width:130px;
            background-color:white;
            border-radius:10px;
            opacity:1;

        }
    </style>
      <script type="text/javascript">
          function UploadFile(fileUpload) {

              if (fileUpload.value != '') {
                  document.getElementById("<%= btnUploadDoc.ClientID%>").click();
              }
             
          }
          function showfileupload() {
              document.getElementById("<%=fuDocument.ClientID%>").click();

           }
    </script>
   <div class="content">
        
       <div style="width:100%;height:240px;padding:50px;">

           <div style="width:29%;float:left;position:relative;">
               <asp:ImageButton  ID="Image1" BorderStyle="Solid" ImageUrl="~/video_img/index.PNG"  OnClientClick="showfileupload();"  runat="server" Height="130px" Width="250px" CausesValidation="False" />
               <%--<asp:Image ID="Image1" ImageUrl="~/video_img/index.PNG"  runat="server" Height="130px" Width="250px"/>--%>
               
               <div style="position:absolute;top:0px;height:100%;width:100%;opacity:-1">
              <asp:FileUpload ID="fuDocument" AllowMultiple="false" runat="server" style="height:100%;width:100%;"  onchange="UploadFile(this);"  accept=".png,.jpg,.jpeg,jiifi"  />
                </div> 
               <br />
               <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Medium"></asp:Label>
                     
              <asp:Button ID="btnUploadDoc" Text="upload" runat="server"  style="display:none;"  OnClick="UploadDocument" CausesValidation="False" />
						
           </div>
           <div style="width:70%;float:right">
               <table style="width:100%; height:35px;font-size:18px; font-family:Verdana;">
                   <tr>
                       <td>video title</td>
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="title" runat="server" CssClass="textbox"></asp:TextBox> 
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="title" ErrorMessage="Please Enter Video title" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           &nbsp;</td>
                   </tr>
                   <tr>
                       <td>Description</td>

                   </tr>
                   <tr>
                       <td><asp:TextBox ID="description" runat="server" CssClass="textbox" TextMode="MultiLine" Height="100px" placeholder="optional"></asp:TextBox></td>
                   </tr>
               </table>
           </div>
       </div>
       <hr />
      
       <div style="width:100%;height:200px;padding-left:50px;">
           <h3> Advanced Setting</h3>
           <table style="width:100%; height:35px;font-size:18px; font-family:Verdana;">
               <tr>
                   <td>Category</td>
               </tr>
                <tr>
                   <td><asp:DropDownList ID="category" runat="server" style="width:50%; border-radius:5px;">
                       <asp:ListItem Value="--select--"></asp:ListItem>
                       <asp:ListItem>Action</asp:ListItem>
                       <asp:ListItem>Music &amp; Dance</asp:ListItem>
                       <asp:ListItem>Commedy</asp:ListItem>
                       <asp:ListItem>Movies</asp:ListItem>
                        <asp:ListItem>News</asp:ListItem>
                       <asp:ListItem>Sports</asp:ListItem>
                        <asp:ListItem>Commedy</asp:ListItem>
                       <asp:ListItem>Movies</asp:ListItem>
                       </asp:DropDownList> 
                       <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
               </tr>
                <tr>
                   <td>Tags </td>
                    
               </tr>
                <tr>
                   <td><asp:TextBox ID="tags" runat="server" style="width:50%;" placeholder= "Seprated by commas(,)" CssClass="textbox"></asp:TextBox> 
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tags" Display="Dynamic" ErrorMessage="Please Enter Tags" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
               </tr>
           </table>
       </div>
       <hr />
       <div style="width:100%;height:150px;padding-left:50px;">
          <div style="float:right;margin-right:100px;">
              
               <asp:Button ID="upload" runat="server" Text="Upload"  CssClass="button" OnClick="upload_Click" />
                                    
           </div>
           
       </div>
       <div></div>
                           
   </div>
</asp:Content>

