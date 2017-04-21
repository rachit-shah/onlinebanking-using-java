<%-- 
    Document   : Logout.jsp
    Created on : Mar 2, 2017, 10:21:26 AM
    Author     : c
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%
        session.setAttribute("email", null);
        session.setAttribute("op", null);
        session.invalidate();
        response.sendRedirect("index.jsp");
        //response.sendError(404);
        %>
    </body>
</html>
