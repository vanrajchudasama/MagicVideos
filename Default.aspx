<%@ Page Title=""  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-grids">
			
				<div class="recommended">
					<div class="recommended-grids">
						<div class="recommended-info">
							<h3>Recommended</h3>
						</div>
                       <asp:Repeater ID="Repeater1" runat="server">
                           <ItemTemplate>
						<div class="col-md-3 resent-grid recommended-grid" style="padding-bottom:20px;">
							<div class="resent-grid-img recommended-grid-img">
								<a href="single.aspx?id=<%# Eval("id") %>"><img src='<%# Eval("img") %>' height="210px" alt="" /></a>
								<div class="time small-time">
									<p><%#Eval("duration") %></p>
								</div>
								
							</div>
							<div class="resent-grid-info recommended-grid-info video-info-grid">
								<h5><a href="single.aspx?id=<%# Eval("id") %>" class="title"><%# Eval("title") %></a></h5>
								<ul>
									<li><p class="author author-info"><a href="#" class="author"><%# Eval("user_name") %></a></p></li>
									<li class="right-list"><p class="views views-info"><%# Eval("views") %> views</p></li>
								</ul>
							</div>
						</div>
                               </ItemTemplate>
                        </asp:Repeater>
						
						<div class="clearfix"> </div>
					</div>
					
				</div>
				<div class="recommended">
					<div class="recommended-grids">
						<div class="recommended-info">
							<h3>Sports</h3>
						</div>
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>

						<div class="col-md-3 resent-grid recommended-grid">
							<div class="resent-grid-img recommended-grid-img">
								<a href="single.aspx?id=<%# Eval("id") %>"><img src="<%# Eval("img") %>" alt="" /></a>
								<div class="time small-time">
									<p><%# Eval("duration") %></p>
								</div>
								<div class="clck small-clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div class="resent-grid-info recommended-grid-info video-info-grid">
								<h5><a href="single.aspx?id=<%# Eval("id") %>" class="title"><%# Eval("title") %></a></h5>
								<ul>
									<li><p class="author author-info"><a href="#" class="author"><%# Eval("user_name") %></a></p></li>
									<li class="right-list"><p class="views views-info"><%# Eval("views") %> views</p></li>
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

