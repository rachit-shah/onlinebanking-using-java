<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <link rel="stylesheet" href="style3.css"/>

        <title>Profile</title>
        <script>
            function editpro() {
                var inputs = document.forms["profile"].getElementsByTagName("input");
                for (var i = 0; i < inputs.length; i++) {

                    inputs[i].disabled = false;

                }
                var select = document.forms["profile"].getElementsByTagName("select");
                for (var i = 0; i < select.length; i++) {

                    select[i].disabled = false;

                }
                document.getElementById("edprobtn").style.display = 'none';
                document.getElementById("subtn").style.display = 'block';
            }
            function editpro2() {
                var inputs = document.forms["profile2"].getElementsByTagName("input");
                for (var i = 0; i < inputs.length; i++) {

                    inputs[i].disabled = false;

                }
                var select = document.forms["profile2"].getElementsByTagName("select");
                for (var i = 0; i < select.length; i++) {

                    select[i].disabled = false;

                }

                document.getElementById("edprobtn2").style.display = 'none';
                document.getElementById("subtn2").style.display = 'block';
            }
            function validateEmail() {
                email = document.getElementById('Email').value;
                var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                if (!re.test(email))
                    document.getElementById('Email').style.borderColor = "RED";
                else
                    document.getElementById('Email').style.borderColor = "rgba(178,147,204,1.00)";

            }
            function checkpass() {
                var pass1 = document.getElementById('pass1').value;
                var pass2 = document.getElementById('pass2').value;
                if (pass1 != pass2)
                {
                    document.getElementById('pass2').style.borderColor = "RED";
                } else
                    document.getElementById('pass2').style.borderColor = "rgba(178,147,204,1.00)";



            }
            function validateMobile() {
                var mo = document.getElementById('mobile').value;
                if (mo.length != 10)
                    document.getElementById('mobile').style.borderColor = "RED"
                else
                    document.getElementById('mobile').style.borderColor = "rgba(178,147,204,1.00)";

            }
            function validateForm() {
                var pass1 = document.getElementById('pass1');
                var pass2 = document.getElementById('pass2');
                var mobile = document.getElementById('mobile');

                if (mobile.value.length != 10) {
                    mobile.focus();
                    return false;
                }



                if (pass1.value != pass2.value || pass1.value == null || pass2.value == null || pass1.value == "")
                {
                    pass2.focus();
                    return false;
                }




                return true;
            }
            function validateForm2() {

                var flat = document.getElementById('flat');
                //var p_flat = document.getElementById('p_flat');
                var street = document.getElementById('street');
                //var p_street = document.getElementById('p_street');
                var landmark = document.getElementById('landmark');
                //var p_landmark = document.getElementById('p_landmark');
                var district = document.getElementById('district');
                //var p_district = document.getElementById('p_district');
                var state = document.getElementById('state');
                //var p_state = document.getElementById('p_state');
                var pin = document.getElementById('PIN');
                //var p_pin = document.getElementById('p_pin');
                var city = document.getElementById('city');
                //var p_city = document.getElementById('p_city');
                var tele = document.getElementById('tele');
                //var p_tele = document.getElementById('p_tele');
                var mobile = document.getElementById('mobile');
                //var p_mo = document.getElementById('p_mo');



                if (pin.value.length != 6)
                {
                    pin.focus();
                    return false;
                }
                if (mobile.value.length != 10)
                {

                    mobile.focus();
                    return false;
                }


                return true;
            }
        </script>
    </head>
    <body class="">
        <div class="navbar navbar-inverse navbar-fixed-top">


            <%if ((session.getAttribute("email") == null)
                        || (session.getAttribute("email") == "")) {%>
            <button class="btn btn-sm padding-2 btn-success" id="loginbtn"><a class="h3" href="Login.jsp" style="text-decoration: none;">Login</a></button>
            <button class="btn btn-sm padding-2 btn-danger" id="regbtn"><a class="h3" href="Registration.jsp" style="text-decoration: none;">Register</a></button>
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
                        Blob image = null;
                        byte[] imgData = null;

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
        <%       String query = "select * from registration where Email='" + session.getAttribute("email") + "'";
            ResultSet res = sqldb.fetchdata(query);
            res = sqldb.fetchdata(query);
            boolean flag = false;
            if (res.next()) {
                flag = true;
            }


        %>

        <div class="container">
            <div class="row profile">
                <div class="col-md-3 padding-0">
                    <div class="profile-sidebar padl">
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">
                                <%                              
                                
                                image = res.getBlob("photo");
                                imgData = image.getBytes(1, (int) image.length());
                                BASE64Encoder base64Encoder = new BASE64Encoder();
                                StringBuilder imageString = new StringBuilder();
                                imageString.append("data:image/png;base64,");
                                imageString.append(base64Encoder.encode(imgData));
                                String img = imageString.toString();
                                //out.println(img);
                                

                            %>


                            
                            <img src="<% out.println(img); %>" class="img-responsive img-rounded" alt="" height=150>
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                                <%                                    if (flag == true) {
                                        out.println(res.getString("f_name") + " " + res.getString("m_name") + " " + res.getString("l_name"));
                                    } else {
                                        out.println("ABC XYZ");
                                    }

                                %>
                            </div>
                            <div class="profile-usertitle-job">
                                <%if (flag == true) {
                                        out.println(res.getString("C_Type"));
                                    } else {
                                        out.println("Anonymous");
                                    }
                                %>
                            </div>
                            <div class="profile-usertitle-job">
                                <%if (flag == true) {
                                        out.println(res.getString("actype") + " Account");
                                    } else {
                                        out.println("Account not defined");
                                    }
                                %>
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        <div class="profile-userbuttons">
                            <!--<button type="button" class="btn btn-success btn-sm">Change Profile Image</button>-->
                        </div>
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
                                    <a data-toggle="tab" href="#overview">
                                        <i class="glyphicon glyphicon-home"></i>
                                        Overview </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#address">
                                        <i class="glyphicon glyphicon-user"></i>
                                        Address </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#account">
                                        <i class="glyphicon glyphicon-user"></i>
                                        Transaction History </a>
                                </li>

                            </ul>
                        </div>
                        <!-- END MENU -->
                    </div>
                </div>
                <div class="col-md-9 padding-0">
                    <div class="profile-content">
                        <div class="tab-content clearfix">
                            <div id="overview" class="tab-pane active">

                                <form name="profile" action="Editprofile" method="post" onsubmit="return validateForm()" >
                                    <span style="font-size:40px;"><b>Personal Details</b></span>
                                    <%  String op = (String) session.getAttribute("op");
                                        if (session.getAttribute("op") != null && op.equals("success")) {
                                            session.setAttribute("op", "");%>
                                    <script>alert('Updated Successfully')</script>
                                    <% } %>        
                                    <button type="button" id="edprobtn" class="btn-danger pull-right" onclick="editpro()">Edit Profile</button> <input id="subtn" type="submit" class="btn-success pull-right" style="display:none" value="Save Changes"/>
                                    <label><span><span class="required">*</span>Name: </span><select name="dropdown" required disabled>
                                            <option value="Mr.">Mr.</option>
                                            <option value="Mrs."<% if (res.getString("gender").equals("Female")) {%>selected<%}%> 
                                                    >Mrs.</option>
                                        </select>
                                        <input type="text" name="First Name"  id="name" required disabled value="<%out.println(res.getString("f_name").toString());%>">
                                        <input type="text" name="Middle Name" placeholder="Middle Name" required disabled value="<%out.println(res.getString("m_name").toString());%>">
                                        <input type="text" name="Last Name" placeholder="Last Name" required disabled value="<%out.println(res.getString("l_name").toString());%>">
                                    </label>
                                    <br>

                                    <label><span><span class="required">*</span>Date of Birth:</span> <input type="text" name="DOB" id='DOB' required disabled value="<%out.println(res.getDate("DOB").toString());%>" ></label><br>
                                    <label><span><span class="required">*</span>Gender:</span><span><input type="radio" name="gender" value="Male" <%if (res.getString("Gender").equals("Male")) {%>checked<%}%> disabled>Male</span><span><input type="radio" name="gender" value="Female" disabled <%if (res.getString("Gender").equals("Female")) {%>checked<%}%>>Female</span></label>
                                    <br><br>

                                    <label><span><span class="required">*</span>Mobile:</span> <input type="text" name="mobile" id="mobile" required disabled value="<%out.println(res.getString("M_No").toString());%>" onkeyup="validateMobile()"></label>
                                    <br>

                                    <label><span><span class="required">*</span>Nationality:</span> 
                                        <select required name="nationality" disabled>
                                            <option value="Indian"  <%if (res.getString("Nationality").equals("Indian")) {%>selected<%}%>>Indian</option>
                                            <option value="American" <%if (res.getString("Nationality").equals("American")) {%>selected<%}%>>American</option>
                                        </select>
                                    </label><br>

                                    <label><span><span class="required">*</span>Martial Status:</span> 
                                        <select  name="martial" required disabled>
                                            <option value="Single" <%if (res.getString("Martial_Status").equals("Single")) {%>selected<%}%> >Single</option>
                                            <option value="Married" <%if (res.getString("Martial_Status").equals("Married")) {%>selected<%}%>>Married</option>
                                        </select></label>
                                    <br>

                                    <label><span><span class="required">*</span>Password:</span> <input type="password" name="pwd" id="pass1" required disabled value="<%out.println(res.getString("password").toString());%>"></label>
                                    <br>
                                    <label><span><span class="required">*</span>Confirm Password:</span> <input type="password" name="cpwd" id="pass2" required onkeyup="checkpass()" disabled value="<%out.println(res.getString("password").toString());%>"></label>
                                    <input type="text" style="display:none;" name="email" value="<%out.println(session.getAttribute("email").toString());%>">
                                    <br>
                                </form>
                            </div>

                            <div id="address" class="tab-pane">
                                <form name="profile2" action="Editaddress" method="post" onsubmit="return validateForm2()">
                                    <span style="font-size:40px;"><b>Correspondent Address</b></span>
                                    <% String op2 = (String) session.getAttribute("op2");
                                        if (session.getAttribute("op2") != null && op2.equals("success")) {
                                            session.setAttribute("op2", "");%>
                                    <script>alert('Updated Successfully')</script>
                                    <% } %>        
                                    <button type="button" id="edprobtn2" class="btn-danger pull-right" onclick="editpro2()">Edit Address</button> <input id="subtn2" type="submit" class="btn-success pull-right" style="display:none" value="Save Changes">
                                    <br><br>
                                    <span class="required">*</span><input type="text" name="FlatNo" id='flat' placeholder="Door/FlatNo./Building/Society" required disabled value="<%out.println(res.getString("Flat").toString());%>"><br><br>
                                    <span class="required">*</span><input type="text" name="Street" id='street' placeholder="Street/Road Name/Block" required disabled value="<%out.println(res.getString("Street").toString());%>"><br><br>
                                    <label><span><span class="required">*</span>Landmark/Street:</span> <input type="text" name="Landmark" id='landmark' placeholder="Locality/Village/Tehsil" disabled required value="<%out.println(res.getString("Landmark").toString());%>"></label><br>
                                    <label><span><span class="required">*</span>District:</span> <input type="text" name="District" id='district' required disabled value="<%out.println(res.getString("District").toString());%>"></label><br>
                                    <label><span><span class="required">*</span>State:</span> <select name="State" id='state' required disabled>
                                            <option value="Gujarat" <%if (res.getString("State").equals("Gujarat")) {%>selected<%}%>>Gujarat</option>
                                            <option value="Punjab" <%if (res.getString("State").equals("Punjab")) {%>selected<%}%>>Punjab</option>
                                        </select></label><br>
                                    <label><span><span class="required">*</span>PIN:</span>  <input type="text" name="PIN" id='PIN' required onkeyup='validatePIN()' disabled value="<%out.println(res.getInt("PIN"));%>"></label><br>
                                    <label><span><span class="required">*</span>City:</span> <select name="City" id='city' required disabled>
                                            <option value="Ahmedabad" <%if (res.getString("City").equals("Ahmedabad")) {%>selected<%}%>>Ahmedabad</option>
                                            <option value="Baroda" <%if (res.getString("City").equals("Baroda")) {%>selected<%}%>>Baroda</option>
                                        </select></label>
                                    <br>
                                    <label><span>Telephone No(With STD code):</span> <input type="tel" id='tele' name="telephone" disabled value="<%out.println(res.getString("T_No").toString());%>"></label><br>
                                    <input type="text" style="display:none;" name="email" value="<%out.println(session.getAttribute("email").toString());%>">
                                </form>
                            </div>

                            <div id="account" class="tab-pane">
                                <table class="table table-hover">
                                    <thead class="thead-inverse">
                                        <tr>
                                            <th>No.</th>
                                            <th>Type</th>
                                            <th>Amount</th>
                                            <th>Payee</th>
                                            <th>Timestamp</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            sqldb.connect();
                                            String qry = "select * from history where Email='" + session.getAttribute("email") + "'";
                                            ResultSet result = sqldb.fetchdata(qry);
                                            int i = 1;

                                            while (result.next()) {
                                        %>
                                        <tr>
                                            <td><%out.println(i++);%></td>
                                            <td><%out.println(result.getString("type"));%></td>
                                            <td><%out.println(result.getDouble("amt"));%></td>
                                            <td><%out.println(result.getString("Payee"));%></td>
                                            <td><%out.println(result.getDate("date").toString());%></td>
                                        </tr>
                                        <%}
                                            sqldb.connclose();
                                        %>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
<%}%>




        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>            


    </body>
</html>
