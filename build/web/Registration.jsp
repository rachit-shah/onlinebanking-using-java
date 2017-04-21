<%@page import="java.sql.ResultSet"%>
<%@page import="bank.sqldb"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css"/>
        <title>Registration</title>
        <script>
            function hiddrop() {
                //alert('Hi');


                var hide = document.forms["regform"]["dropdown1"].value;
                if (hide == "Yes") {
                    document.getElementById('hiddiv').style.display = "none";
                }
                if (hide == "No") {
                    document.getElementById('hiddiv').style.display = "initial";
                    p_flat.value = "";
                    p_street.value = "";
                    p_landmark.value = "";
                    p_district.value = "";
                    p_state.value = "";
                    p_pin.value = "";
                    p_city.value = "";
                    p_tele.value = "";
                    p_mo.value = "";
                }

            }

            function validateEmail() {
                email = document.getElementById('Email').value;
                var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                if (!re.test(email))
                    document.getElementById('Email').style.borderColor = "RED";
                else
                    document.getElementById('Email').style.borderColor = "rgba(178,147,204,1.00)";

            }

            function validatePIN() {
                PIN = document.getElementById('PIN').value;
                if (PIN.length != 6)
                    document.getElementById('PIN').style.borderColor = "RED"
                else
                    document.getElementById('PIN').style.borderColor = "rgba(178,147,204,1.00)";

            }

            function validateMobile() {
                var mo = document.getElementById('mo').value;
                if (mo.length != 10)
                    document.getElementById('mo').style.borderColor = "RED"
                else
                    document.getElementById('mo').style.borderColor = "rgba(178,147,204,1.00)";

            }

            function p_validatePIN() {
                PIN = document.getElementById('p_pin').value;
                if (PIN.length != 6)
                    document.getElementById('p_pin').style.borderColor = "RED"
                else
                    document.getElementById('p_pin').style.borderColor = "rgba(178,147,204,1.00)";

            }

            function p_validateMobile() {
                var mo = document.getElementById('p_mo').value;
                if (mo.length != 10)
                    document.getElementById('p_mo').style.borderColor = "RED"
                else
                    document.getElementById('p_mo').style.borderColor = "rgba(178,147,204,1.00)";

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

            function validateForm() {
                var pass1 = document.getElementById('pass1');
                var pass2 = document.getElementById('pass2');
                var flat = document.getElementById('flat');
                var p_flat = document.getElementById('p_flat');
                var street = document.getElementById('street');
                var p_street = document.getElementById('p_street');
                var landmark = document.getElementById('landmark');
                var p_landmark = document.getElementById('p_landmark');
                var district = document.getElementById('district');
                var p_district = document.getElementById('p_district');
                var state = document.getElementById('state');
                var p_state = document.getElementById('p_state');
                var pin = document.getElementById('PIN');
                var p_pin = document.getElementById('p_pin');
                var city = document.getElementById('city');
                var p_city = document.getElementById('p_city');
                var tele = document.getElementById('tele');
                var p_tele = document.getElementById('p_tele');
                var mo = document.getElementById('mo');
                var p_mo = document.getElementById('p_mo');

                var hide = document.forms["regform"]["dropdown1"].value;
                if (hide == "Yes") {
                    p_flat.value = flat.value;
                    p_street.value = street.value;
                    p_landmark.value = landmark.value;
                    p_district.value = district.value;
                    p_state.value = state.value;
                    p_pin.value = pin.value;
                    p_city.value = city.value;
                    p_tele.value = tele.value;
                    p_mo.value = mo.value;

                }


                if (pass1.value != pass2.value || pass1.value == null || pass2.value == null || pass1.value == "")
                {
                    pass2.focus();
                    return false;
                }
                if (pin.value.length != 6)
                {

                    pin.focus();
                    return false;
                }
                if (p_pin.value.length != 6)
                {
                    p_pin.focus();
                    return false;
                }
                 if (mo.value.length != 10)
                {

                    mo.focus();
                    return false;
                }
                if (p_mo.value.length != 10)
                {
                    p_mo.focus();
                    return false;
                }

                return true;
            }

        </script>

    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="pull-left"><span class="h1">Registration Form</span></div>
            <div class="pull-right"><span class="well" id="loginfo" style="margin:0px; font-size:24px; vertical-align: central; ">
                    <%
                        if ((session.getAttribute("email") == null)
                                || (session.getAttribute("email") == "")) {
                    %>
                    You are not logged in
                    <%  } else {
                    %>
                    Welcome <%=session.getAttribute("email")%>
                    <button class="btn"><a href="Logout.jsp">Log Out</a></button>

                    <%
                        }
                    %>
                    <%
                        if (request.getAttribute("Error") != null) {
                            System.out.println("ERROR");
                            request.removeAttribute("Error");
                            //System.out.println(request.getParameter("First Name"));
/*
                            String c_type = request.getParameter("customer_type");
                            String f_name = request.getParameter("First Name");
                            String m_name = request.getParameter("Middle Name");
                            String l_name = request.getParameter("Last Name");
                            String DOB = request.getParameter("DOB");
                            String gender = request.getParameter("gender");
                            String nationality = request.getParameter("nationality");
                            String martial = request.getParameter("martial");
                            String father_name = request.getParameter("Father Name");
                            String mother_name = request.getParameter("Mother Name");
                            String password = request.getParameter("pwd");
                            String email = request.getParameter("email");
                            String flatno = request.getParameter("FlatNo");
                            String street = request.getParameter("Street");
                            String landmark = request.getParameter("Landmark");
                            String district = request.getParameter("District");
                            String state = request.getParameter("State");
                            String pin = request.getParameter("PIN");
                            String city = request.getParameter("City");
                            String tele = request.getParameter("telephone");
                            String mobile = request.getParameter("mobile");
                            String p_flatno = request.getParameter("P_FlatNo");
                            String p_street = request.getParameter("P_Street");
                            String p_landmark = request.getParameter("P_Landmark");
                            String p_district = request.getParameter("P_District");
                            String p_state = request.getParameter("P_State");
                            String p_pin = request.getParameter("P_PIN");
                            String p_city = request.getParameter("P_City");
                            String p_tele = request.getParameter("P_telephone");
                            String p_mobile = request.getParameter("P_mobile");
                             */

                    %>
                    <script>
                        alert("Email already exists")
                    </script>
                    <%        }
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

            <!-- /.container -->
        </nav>

        <div class="out-container">
            <form name="regform" method="post" action="RegistrationData" enctype="multipart/form-data">

                <div class="det" id="per-sdet">
                    <h1><b>Personal Details</b></h1>

                    <div class="cont">
                        <label><span><span class="required">*</span>Customer Type: </span><span><input type="radio" name="customer_type" value="Public" checked required>Public</span><span><input type="radio" name="customer_type" value="Staff">Staff</span></label><br><br>

                        <label><span><span class="required">*</span>Name: </span><select name="dropdown" required>
                                <option value="Mr." selected>Mr.</option>
                                <option value="Mrs.">Mrs.</option>
                            </select>
                            <input type="text" name="First Name" placeholder="First Name" id="name" required>
                            <input type="text" name="Middle Name" placeholder="Middle Name" required>
                            <input type="text" name="Last Name" placeholder="Last Name" required>
                        </label>
                        <br>

                        <label><span><span class="required">*</span>Date of Birth:</span> <input type="date" name="DOB" id='DOB' required></label><br>
                        <label><span><span class="required">*</span>Gender:</span><span><input type="radio" name="gender" value="Male" checked>Male</span><span><input type="radio" name="gender" value="Female">Female</span></label>
                        <br><br>
                        
                        <label><span><span class="required">*</span>Account Type:</span> 
                            <select required name="actype">
                                <option value="Savings" selected>Savings</option>
                                <option value="Current">Current</option>
                            </select>
                        </label><br>

                        <label><span><span class="required">*</span>Nationality:</span> 
                            <select required name="nationality">
                                <option value="Indian" selected>Indian</option>
                                <option value="American">American</option>
                            </select>
                        </label><br>

                        <label><span><span class="required">*</span>Martial Status:</span> 
                            <select  name="martial" required>
                                <option value="Married" >Single</option>
                                <option value="Single" selected>Married</option>
                            </select></label>
                        <br>
                        
                        <label><span><span class="required">*</span>Passport-size Photograph</span> 
                            <input type="file" name="photo" size="50"/></label>
                        <br>

                        <label><span>Father's Maiden Name:</span> <input type="text" name="Father Name" ></label>
                        <br>

                        <label><span>Mother's Maiden Name:</span> <input type="text" name="Mother Name" ></label><br>

                        <label><span><span class="required">*</span>Password:</span> <input type="password" name="pwd" id="pass1" required></label>
                        <br>
                        <label><span><span class="required">*</span>Confirm Password:</span> <input type="password" name="cpwd" id="pass2" required onkeyup="checkpass()"></label>

                        <br>

                        <label><span><span class="required">*</span>Email Address:</span> <input type="text" name="email" id='Email' required onkeyup="validateEmail()"></label>
                    </div>
                </div>

                <br>
                <div class="det">

                    <h1>
                        <b>Correspondance Address(Cuurrent Residential/Office)</b>
                    </h1>
                    <div class="cont">
                        <span class="required">*</span><input type="text" name="FlatNo" id='flat' placeholder="Door/FlatNo./Building/Society" required><br><br>
                        <span class="required">*</span><input type="text" name="Street" id='street' placeholder="Street/Road Name/Block" required><br><br>
                        <label><span><span class="required">*</span>Landmark/Street:</span> <input type="text" name="Landmark" id='landmark' placeholder="Locality/Village/Tehsil" required></label><br>
                        <label><span><span class="required">*</span>District:</span> <input type="text" name="District" id='district' required ></label><br>
                        <label><span><span class="required">*</span>State:</span> <select name="State" id='state' required>
                                <option value="Gujarat" selcted>Gujarat</option>
                                <option value="Punjab" >Punjab</option>
                            </select></label><br>
                        <label><span><span class="required">*</span>PIN:</span>  <input type="number" name="PIN" id='PIN' required onkeyup='validatePIN()'></label><br>
                        <label><span><span class="required">*</span>City:</span> <select name="City" id='city' required>
                                <option value="Ahmedabad" selcted>Ahmedabad</option>
                                <option value="Baroda" >Baroda</option>
                            </select></label>
                        <br>
                        <label><span>Telephone No(With STD code):</span> <input type="tel" id='tele' name="telephone"></label><br>
                        <label><span><span class="required">*</span>Mobile No:</span> <input type="tel" id='mo' name="mobile" required id='MNO' onkeyup="validateMobile()"></label>
                    </div>
                </div>
                <br>

                <div class="det">

                    <h1>
                        <b>Permanent Address</b>
                    </h1>
                    <div class="cont">
                        <label><span>Same as Correspondance Address:</span>  
                            <select name="dropdown1" onchange="hiddrop()">
                                <option value="Yes" >Yes</option>
                                <option value="No" selected>No</option>
                            </select></label>
                        <br><br>
                        <div id="hiddiv">
                            <span class="required">*</span><input type="text" name="P_FlatNo" id="p_flat" placeholder="Door/FlatNo./Building/Society" required><br><br>
                            <span class="required">*</span><input type="text" name="P_Street" id="p_street" placeholder="Street/Road Name/Block" required><br><br>
                            <label><span><span class="required">*</span>Landmark/Street:</span> <input type="text" name="P_Landmark" id='p_landmark' placeholder="Locality/Village/Tehsil" required></label><br>
                            <label><span><span class="required">*</span>District:</span> <input type="text" name="P_District" id="p_district" required></label><br>
                            <label><span><span class="required">*</span>State:</span> <select name="P_State" id='p_state' required>
                                    <option value="Gujarat" selcted>Gujarat</option>
                                    <option value="Punjab" >Punjab</option>
                                </select></label><br>
                            <label><span><span class="required">*</span>PIN: </span> <input type="text" name="P_PIN" id='p_pin'onkeyup='p_validatePIN()' required></label><br>
                            <label><span><span class="required">*</span>City:</span> <select  name="P_City" id='p_city' required>
                                    <option value="Ahmedabad" selected>Ahmedabad</option>
                                    <option value="Baroda" >Baroda</option>
                                </select></label>
                            <br>
                            <label><span>Telephone No(With STD code):</span> <input type="tel" name="P_telephone" id='p_tele'></label><br>
                            <label><span><span class="required">*</span>Mobile No:</span> <input type="tel" name="P_mobile" id="p_mo" onkeyup="p_validateMobile()" required></label>
                        </div>
                    </div>
                    <br>
                </div>
                <input type="submit" value="Submit" align="center" onclick="return validateForm()">
            </form>  
        </div>


    </body>
</html>
