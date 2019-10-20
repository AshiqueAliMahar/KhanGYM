<%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html>
<head>
<title>LogIn</title>
<meta charset="utf-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<%
		
			if(session.getAttribute("log")!=null)
				if (session.getAttribute("log").equals(true)) {
					response.sendRedirect("home.jsp");
				}
		
	%>
	<div class="main">
		<div class="login-form">
			<h1>Member Login</h1>
			<div class="head">
				<img src="Images/user.png" alt="" />
			</div>
			<form action="users.action" method="post">
				<input type="text" class="text" value="Email" name="email"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'USERNAME';}">
				<input type="password" value="Password" name="password"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Password';}">
					<label class="h4"><s:property value="message" default=""/> </label>
				<div class="submit">
					<input type="submit" value="LogIn">
				</div>
				<p>
					<a href="SignUp.html">New User</a>
				</p>
			</form>
		</div>
		<!--//End-login-form-->
	</div>
	<!-----//end-main---->
	<%
		if(request.getParameter("message")!=null){
	%>
		<script type="text/javascript">
			alert('<%=request.getParameter("message")%>');
		</script>
	<%
		
		}
	%>
	<s:actionmessage/>
</body>
</html>