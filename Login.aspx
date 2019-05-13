<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login/css/main.css">
<!--===============================================================================================-->
<style>
     .model
        {
            position:fixed;
            z-index:999;
           
            top:0;
            
            filter:alpha(opacity=60);
            opacity:0.6;

        }
        .center
        {
            z-index:1000;
            margin:300px auto;
            padding:10px;
            width:130px;
           
            opacity:1;

        }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                                <ContentTemplate>
				<span class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Login
					</span>
                    <div style="margin-bottom:20px;padding:10px;">
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label></div>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Username</span>
                        <asp:TextBox ID="TextBox1" runat="server" class="input100" placeholder="Type your username"></asp:TextBox>
						
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
                        <asp:TextBox ID="TextBox2" runat="server" class="input100" placeholder="Type your password" TextMode="Password"></asp:TextBox>
						
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="Forgot.aspx">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
                            <asp:Button ID="Button1" runat="server" Text="Button" class="login100-form-btn" BackColor="Blue" OnClick="Button1_Click"/>
							
						</div>
					</div>

					

					<%--<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>--%>

					<div class="flex-col-c p-t-155">
						

						<a href="Registration.aspx" class="txt2">
							Sign Up
						</a>
					</div>
				</span>
                 </ContentTemplate>
                              </asp:UpdatePanel>
                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <ProgressTemplate>
                                    <div class="model">
                                <div class="center">
                                    <img src="icon/6.gif"  alt="Please wait...."/>
                                    
                                </div>
                                     </div>
                                 </ProgressTemplate>
                            </asp:UpdateProgress>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="Login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/bootstrap/js/popper.js"></script>
	<script src="Login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/daterangepicker/moment.min.js"></script>
	<script src="Login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Login/js/main.js"></script>

    </form>
</body>
</html>
