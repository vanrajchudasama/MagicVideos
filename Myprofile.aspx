<%@ Page Title="" Language="C#" MasterPageFile="~/User_Profile.master" AutoEventWireup="true" CodeFile="Myprofile.aspx.cs" Inherits="Myprofile" %>

<%-- Add content controls here --%>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <style>
         .content-1
        {
            width: 90%;
            height: 300px;
            margin-left: 5%;
            margin-right: 5%;
        }
        .sub-content
        {
            width: 100%;
            height: 30px;
        }

        ul li
        {
            list-style: none;
            height: 100%;
            width: 130px;
            text-align: center;
            float: left;
            line-height: 40px;
            color: black;
        }

        .sub-content ul li:hover
        {
            border-bottom: 3px solid;
            border-right: 3px solid;
            border-color: blue;
        }

        li a
        {
            text-decoration: none;
            color: black;
            font-size: 15px;
            height: 100%;
            width: 100%;
        }

            li a:hover
            {
                text-decoration: none;
                color: blue;
            }

            li a:active
            {
                text-decoration: none;
                color: blue;
            }
    </style>

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
        <div style="float: left; width: 20%; height: 300px;">
            <image src="<%=user_image %>" style="width: 200px; height: 200px; border-radius: 200px; margin-top: 50px; border: 5px solid #fff; background-color: #d4cfcf"></image>
        </div>
        <div style="width: 80%; float: right; height: 300px; padding: 10px;">
            <div>
                <h2><%=user_name %></h2>
            </div>
            <div>
                Joined <%=user_date %>
            </div>
            <div style="margin-top: 100px;">
                <table style="width: 100%;">
                    <tr>
                        <td>Contry</td>
                        <td>City</td>
                        <td>Birth Date</td>
                    </tr>
                    <tr>
                        <td>
                            <h4>India</h4>
                        </td>
                        <td>
                            <h4><%=user_city %></h4>
                        </td>
                        <td>
                            <h4><%=user_dob %></h4>
                        </td>
                    </tr>
                </table>
            </div>

        </div>

    </div>
</asp:Content>