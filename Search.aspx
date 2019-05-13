<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main-grids">
   

				<div class="recommended">
					<div class="recommended-grids">
						<div class="recommended-info">
							
						</div>
                        <h1 style="text-align:center">
                            <asp:Label ID="Label1" runat="server" Text="No Record Found...!" Visible="false"></asp:Label>

                        </h1>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
						<div class="col-md-3 resent-grid recommended-grid" style="padding-bottom:20px;">
							<div class="resent-grid-img recommended-grid-img">
								<a href="single.aspx?id=<%# Eval("id") %>"><img src="<%# Eval("img") %>" height="210px" alt="" /></a>
								<div class="time small-time">
									<p><%# Eval("duration") %></p>
								</div>
								
							</div>
							<div class="resent-grid-info recommended-grid-info video-info-grid">
								<h5><a href="single.aspx?id=<%# Eval("id") %>" class="title"><%# Eval("title") %></a></h5>
								<ul>
									<li><p class="author author-info"><a href="#" class="author"><%# Eval("user_name") %></a></p></li>
									<li class="right-list"><p class="views views-info">Views <%# Eval("views") %></p></li>
								</ul>
							</div>
						</div>
                                </ItemTemplate>
                           </asp:Repeater>
                        <div class="clearfix"> </div>
						</div>
                    </div>
    </div>
</asp:Content>

