<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="single.aspx.cs" Inherits="single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <div class="show-top-grids">
        <div class="col-sm-8 single-left">
            
            <div class="song" style="width: 100%;">
                <%--<div class="song-info" >
                    <h3>Etiam molestie nisl eget consequat pharetra</h3>
                </div>--%>
                <div class="video-grid">
                    <iframe src='<%=video_path %>' style="border: 0;background-color:#808080" allow='autoplay'></iframe>

                </div>
            </div>


            <div class="clearfix"></div>
            <div style="width: 100%; padding: 5px; box-shadow: 1px 1px 1px 1px #e8e8e8">
                <div style="width: 100%; height: 40px;">
                    <h4><%=video_title%></h4>
                </div>
                <hr />
                <div style="width: 100%; height: 25px;">
                    <div style="width: 70%; float: left; height: 100%;">
                        <img src="<%= user_img %>"  style="width: 50px; height: 40px;"/>
                        <%--<asp:Image ID="Image1" runat="server" ImageUrl="<%= user %>" Style="width: 50px; height: 40px;" />--%>
                        <span style="height: 100%; font-size: 15px; margin-left: 20px; margin-right: 20px"><%= user_channel %></span>


                        <span>
                            <%
                                if(return_subscribe()) {%>
                             <asp:Button ID="Button3" runat="server" Text="UNSUBSCRIBE" Height="40px" Style="border: none; background-color: red; color: white; font-size: larger" OnClick="Button2_Click1" /><asp:Button ID="Button4" runat="server" Text="" Height="40px" Enabled="false" Style="background-color: white; border: 1px solid #e1dede; font-size: larger; color: #c5c5c5" /></span>
                        <%}
                          else
                          { %>
                            <asp:Button ID="Button2" runat="server" Text="SUBSCRIBE" Height="40px" Style="border: none; background-color: #31e4ef; color: white; font-size: larger" OnClick="Button2_Click1" /><asp:Button ID="Button5" runat="server" Text="" Height="40px" Enabled="false" Style="background-color: white; border: 1px solid #e1dede; font-size: larger; color: #c5c5c5" /></span>
                        <%} %>
                    </div>

                    <div style="width: 30%; float: right; height: 100%;"><span style="float: right; font-size: 15px; color: #808080; line-height: 50px">
                        <%--<asp:Button ID="Button3"  Height="30px" runat="server" Text="Like" style="background-color:#11fcff;color:white;" OnClick="Button2_Click"/>--%><%= tot_views%> views</span></div>
                </div>
                <hr />
                <div style="width: 100%; height: 35px;">
                    <div style="width: 50%; float: left; height: 100%;">
                        <table style="width:100%">
                            <tr>
                                <td><asp:ImageButton ID="ImageButton4" runat="server" Height="25px" Width="25px" ImageUrl="~/icon/download.png" OnClick="ImageButton4_Click" /></td>
                                <td><a target="_blank" title="shere with gmail" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=http://www.MagicVideos.com/conference2014/#Register&p[images]=&[title]=&p[summary]=" ">
                                    <img src="icon/facebook.png" style="width:25px;height:25px"/></a>

                                </td>
                                <td><a target="_blank" title="shere with gmail" href="https://wa.me/7802871800/?text=www.magicvideo.com">
                                    <img src="icon/whatsapp.png" style="width:25px;height:25px"/></a>

                                </td>
                                <td><a target="_blank" title="shere with gmail" href="http://twitter.com/intent/tweet?url={URL}&text={title}&via={username}&hashtags={hashtag}" target="_blank">
                                    <img src="icon/twitter.png" style="width:25px;height:25px"/></a>

                                </td>
                                <td><a target="_blank" title="shere with gmail" href="http://www.linkedin.com/shareArticle?mini=true&url={www.magic.com}&title={title}">
                                    <img src="icon/linkedin.png" style="width:25px;height:25px"/></a>

                                </td>
                               
                            </tr>
                        </table>
                        
                    </div>
                    <div style="width: 50%; float: right;">
                          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                        <span style="float: right; font-size: 10px;">
                            
                                    <table>
                                        <tr>

                                            <%if (return_like())
                                              {%>
                                            <td style="width: 40px; text-align: center; color: #808080"><%=tot_like%>   </td>
                                            <%--<asp:Button ID="Button3"  Height="30px" runat="server" Text="Like" style="background-color:#11fcff;color:white;" OnClick="Button2_Click"/>--%>
                                            <td style="width: 40px;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/icon/likeon.png" OnClick="Button2_Click" />
                                            </td>

                                            
                                            <%}%>
                                              <%else
                                              {%>
                                            <td style="width: 40px; text-align: center; color: #808080">
                                                <%=tot_like %></td>
                                            <td style="width: 40px;">
                                                <asp:ImageButton ID="ImageButton2" runat="server" Height="40px" ImageUrl="~/icon/likeoff.png" OnClick="Button2_Click" />
                                            </td>

                                            
                                            <%} %>
                                            <%if(return_dislike()){ %>
                                            <td style="width: 40px; text-align: center; color: #808080">
                                                <%=tot_dislikes %></td>
                                            <td style="width: 40px;">
                                                <asp:ImageButton ID="ImageButton3" runat="server" Height="40px" ImageUrl="~/icon/dislikeon.png" OnClick="imgbtndislike_Click" />
                                            </td>
                                            <%}else{ %>
                                            <td style="width: 40px; text-align: center; color: #808080">
                                                <%=tot_dislikes %></td>
                                            <td style="width: 40px;">
                                                <asp:ImageButton ID="imgbtndislike" runat="server" Height="40px" ImageUrl="~/icon/dislikeoff.png" OnClick="imgbtndislike_Click" />
                                            </td>
                                            <%} %>
                                        </tr>
                                    </table>
                               
                        </span>
                                        </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>

                </div>

            </div>
            <div class="published">
                
               
                <script>
                    function myFunction() {
                        var x = document.getElementById("load_more");
                        if (x.style.display == "block") {
                            x.style.display = "none";

                        }
                        else {
                            x.style.display = "block";
                        }
                    }
                </script>
                <div onclick="myFunction()" style="width:100%;height:30px;"><h5 style="float:left;width:50%"> Description</h5><span style="float:right;color:blue;width:50%;">Show More..</span> </div>
                <div id="load_more" style="display:none;">
                    
                    <ul >
                        <li>
                            <h4>Published on 1-2-2019</h4>
                            <p>
                       
                            </p>
                        </li>
                        <li>
                            <p> <%= video_disc %></p>
                            <p>Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo. Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo, ac dignissim diam velit id tellus. Morbi luctus velit quis semper egestas. Nam condimentum sem eget ex iaculis bibendum. Nam tortor felis, commodo faucibus sollicitudin ac, luctus a turpis. Donec congue pretium nisl, sed fringilla tellus tempus in.</p>
                            <div class="load-grids">
                                <div class="load-grid">
                                    <p>Category</p>
                                </div>
                                <div class="load-grid">
                                    <a href="Search.aspx?cat=<%= category %>"><%= category %></a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>

            <div class="all-comments">
                <div class="all-comments-info">

                   
                            <a href="#">All Comments (<%= a %>)</a>
                            <div class="box">
                                <form>
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="200px"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" Text="SEND" OnClick="Button1_Click" />

                                    <div class="clearfix"></div>
                                </form>
                            </div>
                            <div class="all-comments-buttons">
                                <ul>
                                    <li><a href="#" class="top">Top Comments</a></li>
                                    <li><a href="#" class="top newest">Newest First</a></li>
                                    <li><a href="#" class="top my-comment">My Comments</a></li>
                                </ul>
                            </div>
                      
                </div>

                <div class="media-grids">
                    <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate>
                            <div class="media">
                                <h5><%#Eval("user_name") %></h5>
                                <div class="media-left">
                                    <a href="#"></a>
                                </div>
                                <div class="media-body">
                                    <p><%#Eval("comment") %></p>
                                    <span>View all posts by :<a href="#"> Admin </a></span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                   
                </div>
            </div>
        </div>
        <div class="col-md-4 single-right">
            <h3>Up Next</h3>
            <div class="single-grid-right">
              
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.aspx?id=<%# Eval("id") %>">
                                    <img src="<%#Eval("img") %>" alt="" height="65px" /></a>
                               
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                             <a href="single.aspx?id=2" class="title"><%#Eval("title") %></a>
                                <p class="author"><a href="#" class="author"><%#Eval("user_name") %></a></p>
                                <p class="views">Views <%#Eval("views") %></p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
        <div class="clearfix"></div>
    </div>
                                 
</asp:Content>

