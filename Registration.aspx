<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <style>
        table td
        {
            text-align:left;
            font-size:22px;
            width:400px;
            font-family:Arial;
           
           
        }
        table tr
        {
           
        }
        .textbox
        {
           
            border-radius:5px;
            width:300px;
            height:30px;
            font-size:15px;
        }
        .dropbox
        {
            width:100px;
            border-radius:5px;
            
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
            margin:300px auto;
            padding:10px;
            width:130px;
            background-color:white;
            border-radius:10px;
            opacity:1;

        }
    </style>

    <div style="padding:5px;margin-bottom:20px;background-color:#808080">
        <div style="margin-left:20%;margin-right:20%;background-color:white;border-radius:10px">
                        
            <div style="height:70px;background-color:#0ed2f0;color:white;padding:4px;border-radius:5px;">
                <h2>Sing Up</h2>
            </div>
            <span style="padding:20px;color:red;padding-left: 100px;margin-top:30px;">
                <asp:Label ID="Label1" runat="server" Text="" Font-Size="X-Large"></asp:Label></span>
            <div style="padding: 20px; padding-left: 100px">
                
               
                <div>
                    <table style="padding:5px">
                        <tr>
                            <td colspan="3">Name :</td>
                           
                        </tr>
                        <tr>
                            <td>
                                 <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox" AutoCompleteType="Email" EnableViewState="False" MaxLength="20"></asp:TextBox>

                            </td>
                            <td style="color:red;font-size:15px" colspan="2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Name" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Phone no:</td>
                           
                        </tr>
                        <tr>
                            <td> <asp:TextBox ID="TextBox7" runat="server" CssClass="textbox" MaxLength="10" ></asp:TextBox>
                            </td>
                            <td style="color:red;font-size:15px" colspan="2">

                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Please enter phone no."></asp:RequiredFieldValidator>
                               

                                <br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="Invalid Phone Number" ValidationExpression="^([0-9\(\)\/\+ \-]*)$"></asp:RegularExpressionValidator>

                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="3">Email :</td>
                            
                           
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" TextMode="Email" MaxLength="30"></asp:TextBox>

                            </td>
                            <td style="color:red;font-size:15px" colspan="2"> 
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter email id"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Password :</td>
                            
                            
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" TextMode="Password" MaxLength="12"></asp:TextBox>

                            </td>
                            <td style="color:red;font-size:15px" colspan="2"> 
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="atleast 7 character" ValidationExpression="^[a-zA-Z0-9\s]{7,10}$"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" ErrorMessage="please enter password"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Confirm Password :</td>
                            
                            
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>

                            </td>
                            <td colspan="2" style="color:red;font-size:15px"> <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="password not match"></asp:CompareValidator>
                            </td>
                            </tr>
                        <tr>
                            <td colspan="3">Channel Name :</td>
                            
                           
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox" MaxLength="20"></asp:TextBox>

                            </td>
                            <td style="color:red;font-size:15px">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="channel name must be 7 character" ValidationExpression="^[a-zA-Z0-9\s]{7,10}$"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="please enter channel name"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Birth Date :</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropbox">
                                    <asp:ListItem>DD</asp:ListItem>
                                    <asp:ListItem>01</asp:ListItem>
                                    <asp:ListItem>02</asp:ListItem>
                                    <asp:ListItem>03</asp:ListItem>
                                    <asp:ListItem>04</asp:ListItem>
                                    <asp:ListItem>05</asp:ListItem>
                                    <asp:ListItem>06</asp:ListItem>
                                    <asp:ListItem>07</asp:ListItem>
                                    <asp:ListItem>08</asp:ListItem>
                                    <asp:ListItem>09</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                   
                                </asp:DropDownList>

                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropbox">
                                    <asp:ListItem>MM</asp:ListItem>
                                    <asp:ListItem>January</asp:ListItem>
                                    <asp:ListItem>February</asp:ListItem>
                                    <asp:ListItem>March</asp:ListItem>
                                    <asp:ListItem>April</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>June</asp:ListItem>
                                    <asp:ListItem>July</asp:ListItem>
                                    <asp:ListItem>August</asp:ListItem>
                                    <asp:ListItem>September</asp:ListItem>
                                    <asp:ListItem>October</asp:ListItem>
                                    <asp:ListItem>November</asp:ListItem>
                                    <asp:ListItem>December</asp:ListItem>
                                </asp:DropDownList>

                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="dropbox">
                                    <asp:ListItem>YY</asp:ListItem>
                                    <asp:ListItem>1990</asp:ListItem>
                                    <asp:ListItem>1991</asp:ListItem>
                                    <asp:ListItem>1992</asp:ListItem>
                                    <asp:ListItem>1993</asp:ListItem>
                                    <asp:ListItem>1994</asp:ListItem>
                                    <asp:ListItem>1995</asp:ListItem>
                                    <asp:ListItem>1996</asp:ListItem>
                                    <asp:ListItem>1997</asp:ListItem>
                                    <asp:ListItem>1998</asp:ListItem>
                                    <asp:ListItem>1999</asp:ListItem>
                                    <asp:ListItem>2000</asp:ListItem>
                                    <asp:ListItem>1993</asp:ListItem>
                                    <asp:ListItem>1994</asp:ListItem>
                                    <asp:ListItem>1995</asp:ListItem>
                                    <asp:ListItem>1996</asp:ListItem>
                                    <asp:ListItem>1997</asp:ListItem>
                                    <asp:ListItem>1998</asp:ListItem>
                                    <asp:ListItem>1999</asp:ListItem>
                                    <asp:ListItem>2000</asp:ListItem>
                                    <asp:ListItem>2001</asp:ListItem>
                                    <asp:ListItem>2002</asp:ListItem>
                                    <asp:ListItem>2003</asp:ListItem>
                                    <asp:ListItem>2004</asp:ListItem>
                                    <asp:ListItem>2005</asp:ListItem>
                                    <asp:ListItem>2006</asp:ListItem>
                                    <asp:ListItem>2007</asp:ListItem>
                                    <asp:ListItem>2008</asp:ListItem>
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                   
                                </asp:DropDownList>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Security code :
                            </td>
                        </tr>
                        <tr>
                            <td> <asp:TextBox ID="TextBox5"  runat="server" CssClass="textbox" MaxLength="10"></asp:TextBox>
                                   </td>
                            <td colspan="2" style="font-size:15px"> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter Security Code" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                    </table>
                   
                </div>
                <div style="margin-top:50px;height:50px;"> 
                    <div style="float:left;width:50%;font-size:15px">
                        Have an account? <a href="Login1.aspx">Login</a>
                    </div>
                    <div style="float:right;width:50%;height:50px;">
                        <asp:Button ID="Button1" runat="server" Text="Sing Up" CssClass="btn" OnClick="Button1_Click"/></div>
                </div>
            </div>
       
        </div>

    </div>
    </asp:Content>
