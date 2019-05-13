<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot0.aspx.cs" Inherits="Forgot" %>

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
</head>
<body>
    <form id="form1" runat="server">
      <div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<span class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Forgot Password
					</span>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label></div>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Email</span>
                        <asp:TextBox ID="TextBox1" runat="server" class="input100" placeholder="Type your username"></asp:TextBox>
						
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">New Password</span>
                        <asp:TextBox ID="TextBox2" runat="server" class="input100" TextMode="Password" placeholder="Type your password"></asp:TextBox>
						
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Security Code</span>
                         <asp:TextBox ID="securitycode" class="input100" runat="server" ></asp:TextBox>
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<br />
                   <br />

					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
                            <asp:Button ID="Button1" runat="server" Text="Button" class="login100-form-btn" BackColor="Blue" OnClick="Button1_Click"/>
							
						</div>
					</div>

					
				</span>
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
