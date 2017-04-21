/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;


/**
 *
 * @author Rachit
 */
public class Err extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.Exception");
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String servletName = (String)
        request.getAttribute("javax.servlet.error.servlet_name");
        if (servletName == null){
        servletName = "Unknown";}
        String requestUri = (String)
        request.getAttribute("javax.servlet.error.request_uri");
        if (requestUri == null){
        requestUri = "Unknown";
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Error/Exception Information";
        String docType =
        "<!doctype html public \"-//w3c//dtd html 4.0 " +
        "transitional//en\">\n";
        out.println(docType +
        "<html>\n" +
        "<head><title>" + title + "</title></head>\n" +
        "<body bgcolor=\"#f0f0f0\">\n");
        if (throwable == null && statusCode == null){
        out.println("<h2>Error information is missing</h2>");
        out.println("Please return to the <a href=\"" +
        response.encodeURL("http://localhost:9999/") +
        "\">Home Page</a>.");
        }else if (statusCode != null){
        out.println("The status code : " + statusCode);
        }else{
        out.println("<h2>Error information</h2>");
        out.println("Servlet Name : " + servletName +
        "</br></br>");
        out.println("Exception Type : " +
        throwable.getClass( ).getName( ) +
        "</br></br>");
        out.println("The request URI: " + requestUri +
        "<br><br>");
        out.println("The exception message: " +
        throwable.getMessage( ));
        }
        out.println("</body>");
        out.println("</html>");
    }
    
}
