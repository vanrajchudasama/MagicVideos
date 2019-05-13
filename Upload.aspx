<%@ Page Title="" EnableViewState="true" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- upload -->
    <script type="text/javascript">
        function UploadFile(fileUpload) {

            if (fileUpload.value != '') {
                document.getElementById("<%= btnUploadDoc.ClientID%>").click();
            }
        }
    </script>
		<div class="upload">
			<!-- container -->
			<div class="container">
				<div class="upload-grids">
					<div class="upload-right">
						<div class="upload-file">
							<div class="services-icon">
								<span class="glyphicon glyphicon-open" aria-hidden="true"></span>
							</div>
                            <asp:FileUpload ID="fuDocument" runat="server" onchange="UploadFile(this);" accept=".avi,.mp4,.hd,.wmv"/>
                           
                            <asp:Button ID="btnUploadDoc" Text="upload" runat="server" OnClick="UploadDocument" style="display:none;" />
							<%--<input type="file" value="Choose file..">--%>
                            <div style="text-align:center">
                                <asp:Label ID="Label1" runat="server" Text="Video file to large (maxlangth<100mb)" Visible="false" ForeColor="Red"></asp:Label>
                                <%--<asp:CustomValidator ID="CustomValidator1" ControlToValidate="fuDocument" OnServerValidate="filesize" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>--%>
                                </div>
						</div>
						<div class="upload-info">
							<h5>Select files to upload</h5>
							<span>or</span>
							<p>Drag and drop files</p>
						</div>
					</div>
					<div class="upload-right-bottom-grids">
						<div class="col-md-4 upload-right-bottom-left">
							<h4>Help and Suggestions</h4>
							<div class="upload-right-top-list">
								<ul>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
									<li><a href="#">Fusce egestas tincidunt massa</a></li>
									<li><a href="#">Pellentesque vehicula quis tellus</a></li>
									<li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
									<li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
									<li><a href="#">Fusce sed enim non orci molestie</a></li>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-4 upload-right-bottom-left">
							<h4>Import videos</h4>
							<div class="upload-right-top-list">
								<ul>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
									<li><a href="#">Fusce egestas tincidunt massa</a></li>
									<li><a href="#">Pellentesque vehicula quis tellus</a></li>
									<li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
									<li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
									<li><a href="#">Fusce sed enim non orci molestie</a></li>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-4 upload-right-bottom-left">
							<h4>Live streaming</h4>
							<div class="upload-right-top-list">
								<ul>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
									<li><a href="#">Fusce egestas tincidunt massa</a></li>
									<li><a href="#">Pellentesque vehicula quis tellus</a></li>
									<li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
									<li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
									<li><a href="#">Fusce sed enim non orci molestie</a></li>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								</ul>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- //upload -->
</asp:Content>

