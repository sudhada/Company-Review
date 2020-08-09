<%@page import="java.sql.*"%>
<%
	String Name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String pass = request.getParameter("pass");

	try {
		int i=0;
		if (i == 0) {
			response.sendRedirect("Signup.jsp");
		}
		else if(i!=0)
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudha", "root", "tiger");
		PreparedStatement ps = con.prepareStatement("insert into users(name,email,phone,pass) values(?,?,?,?)");
		ps.setString(1, Name);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, pass);
		i = ps.executeUpdate();
		
		response.sendRedirect("login.jsp");
		}
	} catch (Exception e) {

	}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">
function check_Alpha(letters){
    var regex = /^[a-zA-Z]+$/;
    if(regex.test(letters.name.value) == false){
   alert("Name must be in alphabets only");
   letter.getElementById("error").style.visibility = "show";
   letters.name.focus();
   return false;
    }
    if(letters.name.value == " "){
      alert("Name Field cannot be left empty");
      letters.name.focus();
      return false;
    }
    return true;
  }
</script>


</script>
<style>
body {
	margin: 0;
	padding: 0;
}

.signup-form {
	margin: auto;
	border: 2px solid lightgray;
	border-radius: 14px;
	width: 28%;
}

.signup-form h2 {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.signup-form p {
	text-align: center;
	font-size: 14px;
}
.form-group {
	padding: 25px;
	margin-left: 20px; width : 90%;
	height: 30px;
	border: 2px solid groove;
	border-radius: 4px;
	width: 90%;
}
.hint-text {
	margin-left: 40px;
	padding: 4px;
}
input:required:valid {
	border-color: green;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="signup-form">
		<form method="post" onSubmit="return check_Alpha(this)">
			<h2>Sign Up</h2>
			<p>
				<b>Please fill this form to create an account!</b>
			</p>
			<div class="form-group">
				<label>Name<span class="mandatory"
					style="color: red; padding: 4px;">*</span></label> <input type="text"
					class="form-control" name="name" id="name">
					<label id="error" style="color:red; display:none;">Invalid name</label>
			</div>
			<div class="form-group">
				<label>Email<span class="mandatory"
					style="color: red; padding: 4px;">*</span></label> 
					<input type="text" class="form-control" name="email" id="email" >
			</div>
			<div class="form-group">
				<label>Phone<span class="mandatory"
					style="color: red; padding: 4px;">*</span></label> <input type="text"
					class="form-control" name="phone">
			</div>
			<div class="form-group">
				<label>Password<span class="mandatory"
					style="color: red; padding: 4px;">*</span></label> <input type="password"
					class="form-control" name="pass">
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-success" value="Signup"
					name="submit"> <input type="reset" class="btn btn-success"
					value="Reset">
			</div>
			<div class="form-group">
				Already have an account? <a href="login.jsp">Login Here</a>
			</div>
		</form>
	</div>
	<div class="footer"
		style="padding: 8px; background-color: #cfe2d9	; margin-top: 10px;">
		<P style="color: BLACK; text-align: center; font-size: 34px; font-style:oblique;">
			<b>Created by Sudhakar 2020</b>
		</P>
	</div>
</body>
</html>



