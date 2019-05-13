<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="chenge_password.aspx.cs" Inherits="chenge_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div>
       
   <style>
        table td
        {
            text-align:left;
            font-size:22px;
          height:30px;
            font-family:Arial;
           
        }
        table tr
        {
            padding:10px;
        }
        .textbox
        {
           
            border-radius:5px;
            width:300px;
            height:30px;
            font-size:20px;
        }
        .dropbox
        {
            width:100px;
            border-radius:5px;
            height:30px;
        }
        .btn
        {
            border:none;
            width:120px;
            height:35px;
            font-size:18px;
            border-radius:5px;
            background-color:#0ed2f0;
            float:right;
            color:white;
            margin-top:10px;
        }
    </style>

   <div style="padding:5px;background-color:#808080">
        <div style="margin-left:25%;margin-right:25%;margin-top:0px;margin-bottom:20px; background-color:white;border-radius:10px;">
            <div style="height:70px;background-color:#0ed2f0;color:white;padding:20px;border-radius:5px;">
                <h2>Change Password</h2>

            </div>
            <div>
                <p>
                    &nbsp;</p>
            </div>
            <div style="padding: 20px; padding-left: 100px;color:red;">
                <h3>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
            </div>
            <div style="padding: 0px; padding-left: 100px">
               <table>
                   <tr>
                     <td>Current Password</td>
                <td></td>
                          
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="currentpass" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox></td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="currentpass" runat="server" ErrorMessage=" * required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td> 
                   </tr>
                   <tr>
                       <td>New Password :</td>
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="newpass" runat="server" CssClass="textbox" TextMode="Password" MaxLength="12" ></asp:TextBox></td>
                       <td>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="newpass" ErrorMessage="*  must be 7 character" Font-Size="Smaller" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]{7,10}$"></asp:RegularExpressionValidator>
                                <br />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newpass" ErrorMessage=" * required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                        <td>New Password Confirmation</td>
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="newpassconf" CssClass="textbox" runat="server" MaxLength="12" TextMode="Password" ></asp:TextBox>

                       </td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="newpassconf" ErrorMessage=" * required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                      <td> <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn"  style="float:left;margin-right:10px;" CausesValidation="False" OnClick="btncancel_Click" />
                        <asp:Button ID="btnchange" runat="server" Text="Change Password" CssClass="btn"  style="float:left;width:170px" OnClick="btnchange_Click" /></td>
                   </tr>
               </table>
                 
            </div>
    </div>
       </div>
    </div>
</asp:Content>

