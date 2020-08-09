<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
body {
	margin: 0;
	padding: 0;
}

.login-form {
	margin: auto;
	margin-top: 20px;
	border: 2px solid lightgray;
	border-radius: 14px;
	width: 28%;
}

.login-form h1 {
	text-align: center;
	font-size: 20px;
	padding: 3px;
	font-weight: bold;
}

.login-form p {
	text-align: center;
	font-size: 14px;
}

.form-group {
	width: 90%;
	margin-bottom:26px;
	height: 40px;
	margin-left : 20px;
}
a:hover {
	text-decoration: none;
}
input:required:valid {
 border:1px solid;
 border-color: green;
}
</style>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Home.jsp">Company Reviews</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="Signup.jsp"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="Companies.jsp"><span
						class=" glyphicon glyphicon-envelope"></span>Companies</a></li>
			</ul>
		</div>
	</nav>
	<form method="post" action="Login" name="login" onsubmit="return validate()">
		<div class="login-form">
			<h1>Login</h1>
			<p>
				<b>Login to your account</b>
			</p>
			<div class="form-group">
				<label>Username<span class="mandatory"
					style="color: red; padding: 4px;">*</span></label> <input type="text"
					class="form-control" name="uname" id="uname" required>
			</div>
			<div class="form-group">
				<label>Password<span class="mandatory"
					style="color: red; padding: 4px;">*</span></label> <input type="password"
					class="form-control" name="pass" id="pass" required>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-success" value="Login" name="submit">
				<input type="reset" class="btn btn-success" value="Reset">
				<a href="ChangePassword.jsp">forgot password ?</a>
			</div>
			<div class="form-group">
				Create a account ? <a href="Signup.jsp">Signup Here</a>

			</div>

		</div>
	</form>
<div class="footer"
		style="padding: 8px; background-color: #cfe2d9	; margin-top: 200px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
</body>
</html>