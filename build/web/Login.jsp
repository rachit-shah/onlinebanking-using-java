<%@page import="java.sql.ResultSet"%>
<%@page import="bank.sqldb"%>
<%-- 
    Document   : Login
    Created on : Mar 6, 2017, 2:04:36 AM
    Author     : Rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style2.css"/>
        
        <title>Login</title>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top"> 
            <div class="pull-right"><span class="well" id="loginfo" style="margin:0px; font-size:24px; vertical-align: central; ">
                <%
                    if ((session.getAttribute("email") == null) || 
                            (session.getAttribute("email") == "")) {
                %>
                You are not logged in
                <%  } else {
                %>
                    Welcome <%=session.getAttribute("email")%>
                    <button class="btn"><a href="Logout.jsp">Log Out</a></button>

                <%
                    }
                %>
                </span></div>
        </div>
        <nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">ABC Bank</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="#">About</a>
                        </li>
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li>
                            <a href="#">Contact</a>
                        </li>
                    </ul>
                    <div class="pull-right padding-2">
                        <span class="breadcrumb">&copy;2017 Rachit Shah and Abhi Shah</span>
                    </div>
                    
                </div>
                
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
    
            
              <!-- LOGIN FORM -->
<div class="text-center" style="position:fixed;top:23%;left:42%;">
	<div class="logo">login</div>
	<!-- Main Form -->
	<div class="login-form-1">
            <form action="LoginServlet" method="POST" id="login-form" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
                                            
						<label for="lg_username" class="sr-only">Email</label>
						<input type="text" class="form-control" id="email" name="email" placeholder="Email">
					</div>
					<div class="form-group">
						<label for="lg_password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="pwd" name="pwd" placeholder="password">
					</div>
					<div class="form-group login-group-checkbox">
						<input type="checkbox" id="lg_remember" name="lg_remember">
						<label for="lg_remember">remember</label>
					</div>
                                    <button type="submit" class="btn btn-block">Login</button>
				</div>
				
			</div>
			<div class="etc-login-form">
				
                                <p>new user? <a href="Registration.jsp">create new account</a></p>
			</div>
		</form>
	</div>
	<!-- end:Main Form -->
</div>
            
 
                   
            
        
        
    </body>
</html>
