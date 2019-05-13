<%@ Page Title="" Language="C#" MasterPageFile="~/User_Profile.master" AutoEventWireup="true" CodeFile="MySubscription.aspx.cs" Inherits="Myplaylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .content-1
        {
            width:90%;
            margin-left:5%;
            margin-right:5%;

        }
    </style>
  <div class="content-1"> 
      <div style="width:100%;height:70px;">
          <div style="width:50%;float:left;">
              <table style="width:40%;">
                  <tr>
                      <td> <h4> My Subscriptions  </h4></td>
                      <td><h5> <%=tot_channel %> Channel</h5></td>
                  </tr>
              </table>
                

          </div>
         
      </div>
      <div style="height: 500px;">
          <asp:Repeater ID="Repeater1" runat="server">
              <ItemTemplate>


                  <div style="margin-right: 10px; float: left; height: 150px;margin-bottom:20px;">
                      <table style="height: 200px">
                          <tr>
                              <td colspan="2"><center>
                                  <a href="Search.aspx?search_query=<%# Eval("channel_id") %>">
                                  <img src="<%# Eval("ch_img") %>" alt="" style="height: 100px; width: 100px; border-radius: 100px;" />
                                   </a> 
                                  </center>
                              </td>
                          </tr>
                          <tr>
                              <td style="text-align: center;">
                                  <center>
                                         <a href="Search.aspx?search_query=<%# Eval("channel_id") %>">
                                  <%# Eval("ch_nm") %>
                                             </a>
                              </td>
                          </tr>
                          <tr>
                              <td style="text-align: center;">
                                  <center>
                                  <ul style="background-color:red">
                                      <li style="list-style:none;width:100px;height:30px;background-color:#11e7f5;float:left;font-size:15px;line-height:28px;">
                               <a href="Unsubscribe.aspx?unsubscribe=<%#Eval("user_id") %>&id=<%#Eval("channel_id") %>" style="text-decoration:none;color:white;">Unsubscribe</a>
                                    </li>
                                          </ul>
                                      </center>
                              </td>
                          </tr>
                      </table>
                  </div>
              </ItemTemplate>
          </asp:Repeater>
      </div>
      
  </div>
</asp:Content>

