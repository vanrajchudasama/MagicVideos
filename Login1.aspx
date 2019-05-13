<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Login1.aspx.cs" Inherits="Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
      <style>
        table td
        {
            text-align:left;
            font-size:22px;
          
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
                <h2>Sign In</h2>
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
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter username" ControlToValidate="TextBox1" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>

                       </td>
                   </tr>
                   <tr>
                       <td>Password :</td>
                   </tr>
                   <tr>
                       <td><asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" TextMode="Password" Font-Size="Small"></asp:TextBox></td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter password" ControlToValidate="TextBox2" ForeColor="Red" Font-Size="Smaller"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                       <td> <asp:Button ID="Button2" runat="server" Text="Login" CssClass="btn" OnClick="Button1_Click" style="float:right"/></td>
                   </tr>
               </table>
                 <div style="margin-top:50px;height:50px;"> 
                    <div style="float:left;width:50%;font-size:15px">
                       <a href="Forgot.aspx"> Forgot Password? </a>
                    </div>
                    <div style="float:right;width:50%;height:50px;font-size:15px">
                         Don't have an account? <a href="Registration.aspx">Sing up</a></div>
                </div> 
            </div>
    </div>
       </div>


 </asp:Content>