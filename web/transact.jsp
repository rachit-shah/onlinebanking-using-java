<%@page import="onlinebanking.BankingBLocal"%>
<%@page import="javax.naming.InitialContext"%>
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

        <title>Transactions</title>
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
            <div class="pull-left"><span class="h1" style="color:#bababa;">Transact</span></div>


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
        <%if ((session.getAttribute("email") == null)
                    || (session.getAttribute("email") == "")) {
                out.println("<h1 class='text-success' style='position:fixed;top:40%;left:35%;'>You are not logged in. <a href='Login.jsp'>Login here</a></h1>");
            } else {

            %>

        <!-- Page Content -->
        <div class="container" style="margin-top:10%;">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-deposit bor0">
                        <div class="panel-heading pad0">
                            <div class="row bal">
                                Balance: <%
                                    try {
                                        InitialContext context = new InitialContext();
                                        BankingBLocal bankTransact = (BankingBLocal) context.lookup("stateful123");
                                        String email = session.getAttribute("email").toString();
                                        out.print(bankTransact.GetBalance(email));
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </div>
                            <div class="row">
                                <div class="col-xs-4">
                                    <a href="#" class="active" id="deposit-form-link" >Deposit</a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="#" id="withdraw-form-link">Withdraw</a>
                                </div>
                                <div class="col-xs-4">
                                    <a href="#" id="transfer-form-link">Transfer</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body" style="padding-bottom:0px;">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="deposit-form" action="Transact" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <label for="amount" class="text-success" style="color:#59B2E0;">Enter amount:</label>
                                            <input type="number" min="0" name="amount" id="amount" tabindex="1" class="form-control" placeholder="Enter amount" value="0">
                                        </div>
                                        <input type="hidden" name="transaction" value="deposit"/>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="deposit-submit" id="deposit-submit" tabindex="4" class="form-control btn btn-deposit" value="Deposit">
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                    <form id="withdraw-form" action="Transact" method="post" role="form" style="display: none;">
                                        <div class="form-group">
                                            <label for="amount" class="text-success">Enter amount:</label>
                                            <input type="number" min="0" name="amount" id="amount" tabindex="1" class="form-control" placeholder="Enter amount" value="0">

                                            <input type="hidden" name="transaction" value="withdraw"/>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="withdraw-submit" id="withdraw-submit" tabindex="4" class="form-control btn btn-withdraw" value="Withdraw">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="transfer-form" action="Transact" method="post" role="form" style="display: none;">
                                        <div class="form-group">
                                            <label for="amount" class="text-success" style="color:#63444a;">Enter amount:</label>
                                            <input type="number" name="amount" min="0" id="amount" tabindex="1" class="form-control" placeholder="Enter amount" value="0"><br>

                                            <label for="payee" class="text-success" style="color:#63444a;">Enter payee:</label><br>
                                            <select class="form-control" name="payee" id="payee">
                                                
                                                <% sqldb.connect();
                                                    String query = "select * from registration";
                                                    ResultSet res = sqldb.fetchdata(query);
                                                    while (res.next()) {

                                                %>

                                                <option class="form-control"><%= res.getString("email")%></option>
                                                <% }
                                                    sqldb.connclose();
                                                %>


                                            </select>

                                            <input type="hidden" name="transaction" value="transfer"/>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="transfer-submit" id="transfer-submit" tabindex="4" class="form-control btn btn-transfer" value="Transfer">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row bal" id="success-alert" style="margin-bottom: 0px;">
                                <%                                    if (session.getAttribute("stat") == "" || session.getAttribute("stat") == null) {
                                        out.println("");
                                        session.setAttribute("stat", "");
                                    } else if (session.getAttribute("stat") == "dep-suc") {
                                        out.println("Deposited Successfully");
                                        session.setAttribute("stat", "");

                                    } else if (session.getAttribute("stat") == "dep-err") {
                                        out.println("Error in depositing");
                                        session.setAttribute("stat", "");
                                    } else if (session.getAttribute("stat") == "wit-err") {
                                        out.println("Insufficient Balance");
                                        session.setAttribute("stat", "");
                                    } else if (session.getAttribute("stat") == "wit-suc"){
                                        out.println("Withdrawal Successful");
                                        session.setAttribute("stat", "");
                                    } else if (session.getAttribute("stat") == "tra-suc"){
                                        out.println("Transfer Successful");
                                        session.setAttribute("stat", "");
                                    } else if (session.getAttribute("stat") == "tra-err"){
                                        out.println("Error while transfering. Check whether you have sufficient balance.");
                                        session.setAttribute("stat", "");
                                    } else{
                                        out.println("Unknown Error.");
                                        session.setAttribute("stat", "");
                                    }
                                %>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
<%}%>


        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <script>
            $(function () {

                $('#deposit-form-link').click(function (e) {
                    $("#deposit-form").delay(100).fadeIn(100);
                    $("#withdraw-form").fadeOut(100);
                    $("#transfer-form").fadeOut(100);
                    $('#withdraw-form-link').removeClass('active');
                    $('#transfer-form-link').removeClass('active');
                    $(this).addClass('active');

                    e.preventDefault();
                });
                $('#withdraw-form-link').click(function (e) {
                    $("#withdraw-form").delay(100).fadeIn(100);
                    $("#deposit-form").fadeOut(100);
                    $("#transfer-form").fadeOut(100);
                    $('#deposit-form-link').removeClass('active');
                    $('#transfer-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#transfer-form-link').click(function (e) {
                    $("#transfer-form").delay(100).fadeIn(100);
                    $("#deposit-form").fadeOut(100);
                    $("#withdraw-form").fadeOut(100);
                    $('#deposit-form-link').removeClass('active');
                    $('#withdraw-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });

            });

            $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
                $("#success-alert").slideUp(500);
            });
        </script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
