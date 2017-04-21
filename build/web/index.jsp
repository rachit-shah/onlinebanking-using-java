<%@page import="java.sql.ResultSet"%>
<%@page import="bank.sqldb"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Online Banking</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/the-big-picture.css" rel="stylesheet">
    </head>
    <body>


        <div class="navbar navbar-inverse navbar-fixed-top">


            <%if ((session.getAttribute("email") == null)
                                || (session.getAttribute("email") == "")) {%>
            <button class="btn btn-sm padding-2 btn-success" id="loginbtn"><a class="h3" href="Login.jsp" style="text-decoration: none;">Login</a></button>
            <button class="btn btn-sm padding-2 btn-danger" id="regbtn"><a class="h3" href="Registration.jsp" style="text-decoration: none;">Register</a></button>
            <%}%>


            <%if ((session.getAttribute("email") != null)
            && (session.getAttribute("email") != "")) {%>
            <button class="btn btn-sm padding-2 btn-info" id="transbtn"><a class="h3" href="transact.jsp" style="text-decoration: none;">Transact</a></button>
            <%}%>                                
            <div class="pull-right"><span class="well" id="loginfo" style="margin:0px; font-size:24px; vertical-align: central; ">
                    <%
                        if ((session.getAttribute("email") == null)
                                || (session.getAttribute("email") == "")) {
                    %>
                    You are not logged in
                    <%  } else {
                    %>
                    Welcome <a href="profile.jsp">
                        <%
                            sqldb.connect();
                            String query = "select * from registration where Email='" + session.getAttribute("email") + "'";
                            ResultSet res = sqldb.fetchdata(query);
                            if (res.next()) {
                                out.println(res.getString("f_name") + " " + res.getString("m_name") + " " + res.getString("l_name"));
                            }
                        %></a>
                    <button class="btn"><a href="Logout.jsp">Log Out</a></button>

                    <%
                        }
                        sqldb.connclose();
                    %>       
                </span></div>
        </div>
        <!-- Navigation -->
        <nav class="navbar navbar-fixed-bottom navbar-inverse" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">ABC Bank</a>
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
                    <div class="pull-right padding-2"><span class="breadcrumb" id="visitcount">
                            <%
                                sqldb.connect();
                                ResultSet res;
                                res = sqldb.fetchdata("select htotal from visitcount");
                                if (res.next()) { %>
                            <% out.println("Visitors:" + res.getInt("htotal"));
                            %>
                            <% }
                                sqldb.connclose();
                            %>
                        </span></div>
                </div>

                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <h1 style="color:#bababa;">Welcome to the Online Banking Website of ABC Bank</h1>
                    <p></p>
                </div>
            </div>

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="assets/slide01.jpg" alt="Chania">
                    </div>

                    <div class="item">
                        <img src="assets/slide02.jpg" alt="Chania">
                    </div>

                    <div class="item">
                        <img src="assets/slide03.jpg" alt="Flower">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- /.container -->

            <!-- jQuery -->
            <script src="js/jquery.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>
