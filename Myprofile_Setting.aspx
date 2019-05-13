<%@ Page Title=""  Language="C#" MasterPageFile="~/User_Profile.master" AutoEventWireup="true" CodeFile="Myprofile_Setting.aspx.cs" Inherits="Myprofile_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .content
        {
        width:100%;padding:5px;background-color:#fff;box-shadow:1px 1px 1px 1px;
        }
        .sub-content
        {
            width:100%;height:30px;
        }
        ul li
        {
        list-style:none;height:100%;width:130px;text-align:center;float:left;line-height:40px;color:black;
        }
         .content .sub-content   ul li:hover
            {
                border-bottom:3px solid ;
                border-right:3px solid;
                border-color:blue;
            }
        li a
        {
            text-decoration:none;color:black;font-size:15px
        }
            li a:hover
            {
                text-decoration:none;
                color:blue;
                
            }
            li a:active
            {
                text-decoration:none;
                color:blue;

            }
            .content-1
        {
           width:90%;
           
            margin-left:5%;
            margin-right:5%;
           
        }
        .textbox
        {
            border-radius:5px;
            height:30px;
            width:180px;
            font-size:16px;
        }
        table tr td
        {
            height:35px;
           
        }
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
   </style>
   <script type="text/javascript">
       function UploadFile(fileUpload) {

           if (fileUpload.value != '') {
               document.getElementById("<%= btnUploadDoc.ClientID%>").click();
            }
        }
    </script>
       <div class="sub-content">
           <ul>
               <li>
                   <a href="Myprofile.aspx">My Profile</a>
               </li>

                <li>
                   <a href="Myprofile_Setting.aspx">Profile Setting</a>
               </li>
               
              
           </ul>
       </div>
       <hr />
       <div class="content-1">
          <div style="height:400px;">
              <div style="width:20%;float:left;position:relative;">
                   <image src="<%= user_image %>" style="width:200px;height:200px;border-radius:200px;margin-top:50px;border:5px solid #fff;background-color:#d4cfcf" />
                              
                  <div style="position:absolute;top:50px;width:200px;height:200px;border-radius:200px;">
                      <asp:FileUpload ID="fuDocument" runat="server" style="height:100%;width:100%;opacity:-1"  onchange="UploadFile(this);" accept=".png,.jpg,.jpeg"/>
                           
                  </div>
                  <div style="text-align:center;height:50px;top:200px">
                  <asp:Label ID="Label3" runat="server" Text="ksjfjdf" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                  </div>
                  <asp:Button ID="btnUploadDoc" runat="server" Text="Select new photo" OnClick="UploadDocument"  CssClass="button" style="margin-top:50px;display:none;"/>
                              
<%--                  <table>
                      <tr>
                          <td>
                              <di
                              <image src="<%= user_image %>" style="width:200px;height:200px;border-radius:200px;margin-top:50px;border:5px solid #fff;background-color:#d4cfcf" />
                              
                              </td>
                             
                      </tr>
                      <tr>
                          <td >
                              <asp:Button ID="btnUploadDoc" runat="server" Text="Select new photo" OnClick="UploadDocument"  CssClass="button" style="margin-top:50px;display:none;"/>
                              <asp:FileUpload ID="fuDocument" runat="server"  onchange="UploadFile(this);" />
                           
                           
                          </td>
                      </tr>
                  </table>--%>
              </div>

              <div style="width:80%;float:right;padding-left:100px;">
                  <table style="width:100%; height:35px;font-size:18px; font-family:Verdana;">
                      <tr><td> Name </td></tr>
                      <tr>
                          <td>
                              <asp:TextBox ID="txtname" CssClass="textbox" runat="server" MaxLength="20"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="required" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                       <tr><td>Channel Name </td></tr>
                      <tr>
                          <td>
                              <asp:TextBox ID="txtchannelnm"  CssClass="textbox" runat="server" style="width:100%;" MaxLength="20"></asp:TextBox>

                          </td>
                           <td style="color:red;font-size:15px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtchannelnm" ErrorMessage="channel name must be 7 character" ValidationExpression="^[a-zA-Z0-9\s]{7,10}$"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtchannelnm" ErrorMessage="please enter channel name"></asp:RequiredFieldValidator>
                            </td>
                      </tr>
                      <tr>
                          <td>
                              Tell something about yourself
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <asp:TextBox ID="txtdesc" runat="server"  CssClass="textbox" TextMode="MultiLine" Height="150px" Width="280px" MaxLength="300"></asp:TextBox></td>
                      </tr>
                      <tr><td>Country</td><td>City</td><td>Phone No.</td></tr>
                      <tr><td>
                          <%--<asp:TextBox ID="TextBox3" CssClass="textbox" runat="server"></asp:TextBox>--%>
                          <asp:DropDownList ID="country" runat="server" CssClass="textbox">
                              <asp:ListItem>--select--</asp:ListItem>
                              <asp:ListItem>India</asp:ListItem>
                          </asp:DropDownList>
                          </td>
                          <td>
                              <asp:TextBox ID="txtcity" CssClass="textbox" runat="server" MaxLength="15"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcity" ErrorMessage="required"></asp:RequiredFieldValidator>
                          </td>
                          <td><asp:TextBox ID="txtphone" CssClass="textbox" runat="server" MaxLength="10"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtphone" ErrorMessage="required"></asp:RequiredFieldValidator>
                          </td>
                      </tr>

                      <tr>
                          <td>Birth Date</td>
                      </tr>
                      <tr>
                         <td> <asp:TextBox ID="txtbdate" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox></td>
                      </tr>
                  </table>
              </div>
             
                      
             
          </div>
            
       </div>
     <hr style="margin-top:100px;"/>
    <div class="content-1" >
       
        <h3><a href="chenge_password.aspx">Change Account Password</a></h3>

       
    </div>
     <hr />
    <div class="content-1">
        <h3>Change Account Email</h3>
        <table style="width:60%; height:35px;font-size:18px; font-family:Verdana;">
            <tr>
                <td>Current Email</td>
                <td>New Email</td>
            </tr>
            <tr>
               <td style="color:red;font-size:15px" > 
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnewmail" ErrorMessage="Please Enter valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                      </td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtemail" CssClass="textbox" runat="server"></asp:TextBox> </td>
                <td>
                    <asp:TextBox ID="txtnewmail" CssClass="textbox" runat="server" MaxLength="30"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="" ></asp:Label>
                </td>
            </tr>
          
        </table>
    </div>
    <hr />

    <div style="height:35px;width:100%;margin-top:10px;">
               <asp:Button ID="btnupdate" CssClass="button"  style="float:right;margin-right:100px;" runat="server" Text="Save Profile Setting" OnClick="btnupdate_Click" UseSubmitBehavior="False"  />
        
           </div>
           
</asp:Content>

