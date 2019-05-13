<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forgot.aspx.cs" Inherits="Forgot" %>

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
        <div style="margin-left:25%;margin-right:25%;margin-top:20px;margin-bottom:200px; background-color:white;border-radius:10px;">
            <div style="height:70px;background-color:#0ed2f0;color:white;padding:4px;border-radius:5px;">
                <h2>Forgot Password</h2>

            </div>
            <div>
                <p>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></p>
            </div>
            <div style="padding: 20px; padding-left: 100px;color:red;">
                <h3>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
            </div>
            <div style="padding: 20px; padding-left: 100px">
               <table>
                   <tr>
                       <td>Email :</td>
                          
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox></td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage=" * required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td> 
                   </tr>
                   <tr>
                       <td>New Password :</td>
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" TextMode="Password" MaxLength="12"></asp:TextBox></td>
                       <td>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*  must be 7 character" Font-Size="Smaller" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]{7,10}$"></asp:RegularExpressionValidator>
                                <br />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" * required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           Security Code :
                       </td>
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="securitycode" CssClass="textbox" runat="server" ></asp:TextBox>

                       </td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="securitycode" ErrorMessage=" * required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                       <td> <asp:Button ID="Button2" runat="server" Text="Forgot Password" CssClass="btn"  style="float:right;width:160px" OnClick="Button2_Click"/></td>
                   </tr>
               </table>
                 <div style="margin-top:50px;height:50px;"> 
                   
                    <div style="float:right;width:50%;height:50px;font-size:15px">
                         Don't have an account? <a href="Registration.aspx">Sign up</a></div>
                </div> 
            </div>
    </div>
       </div>
    </div>
</asp:Content>

