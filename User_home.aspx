<%@ Page Title="" Language="C#" MasterPageFile="~/User_Profile.master" AutoEventWireup="true" CodeFile="User_home.aspx.cs" Inherits="User_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
       <div style="padding:10px;">
           <div>
               <div style="float:left;width:90%;margin-bottom:20px;">
                   <table>
                       <tr>
                           <td>
                               <h4>My Videos | </h4>
                           </td>
                           <td> <h5> <%= tot_videos %> videos</h5></td>
                       </tr>
                   
                       </table>
               </div>
               <div style="float:right;width:10%;">
                   <asp:Button ID="Button1" runat="server" Text="Delete All" style="background-color:white;border-radius:10px;height:30px;width:100px;"/>
               </div>
           </div>
           <div style="height:500px;width:100%;overflow-y:scroll">
               <asp:Repeater ID="Repeater1" runat="server">
                   <ItemTemplate>

                  
               <div style="margin-right:10px;float:left;margin-bottom:15px;">
              <table>
                  <tr>
                      <td colspan="2"><a href="single.aspx?id=<%# Eval("id") %>" > <img src="<%# Eval("img") %>" alt="" height="100px" width="180px" /></a></td>
                  </tr>
                  <tr>
                      <td>
                       <a href="single.aspx?id=<%# Eval("id") %>"><%# Eval("title") %></a>
                      </td>
                      <td> </td>
                    
                  </tr>
                  <tr>
                      <td colspan="2"><%# Eval("publish_date") %></td>
                  </tr>
                  <tr>
                      <td><a href="upload_detail.aspx?ids=<%# Eval("id") %>">Edit</a></td>
                      <td><a href="Delete_video.aspx?id=<%# Eval("id") %>">Delete</a></td>
                  </tr>
              </table>
                   </div>
                </ItemTemplate>
               </asp:Repeater>
           </div>
           
       </div>
        
</asp:Content>

