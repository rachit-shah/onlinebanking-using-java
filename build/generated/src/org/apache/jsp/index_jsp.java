package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import bank.sqldb;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!--\r\n");
      out.write("To change this license header, choose License Headers in Project Properties.\r\n");
      out.write("To change this template file, choose Tools | Templates\r\n");
      out.write("and open the template in the editor.\r\n");
      out.write("-->\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("        <title>Online Banking</title>\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/the-big-picture.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"navbar navbar-inverse navbar-fixed-top\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            ");
if ((session.getAttribute("email") == null)
                                || (session.getAttribute("email") == "")) {
      out.write("\r\n");
      out.write("            <button class=\"btn btn-sm padding-2 btn-success\" id=\"loginbtn\"><a class=\"h3\" href=\"Login.jsp\" style=\"text-decoration: none;\">Login</a></button>\r\n");
      out.write("            <button class=\"btn btn-sm padding-2 btn-danger\" id=\"regbtn\"><a class=\"h3\" href=\"Registration.jsp\" style=\"text-decoration: none;\">Register</a></button>\r\n");
      out.write("            ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            ");
if ((session.getAttribute("email") != null)
            && (session.getAttribute("email") != "")) {
      out.write("\r\n");
      out.write("            <button class=\"btn btn-sm padding-2 btn-info\" id=\"transbtn\"><a class=\"h3\" href=\"transact.jsp\" style=\"text-decoration: none;\">Transact</a></button>\r\n");
      out.write("            ");
}
      out.write("                                \r\n");
      out.write("            <div class=\"pull-right\"><span class=\"well\" id=\"loginfo\" style=\"margin:0px; font-size:24px; vertical-align: central; \">\r\n");
      out.write("                    ");

                        if ((session.getAttribute("email") == null)
                                || (session.getAttribute("email") == "")) {
                    
      out.write("\r\n");
      out.write("                    You are not logged in\r\n");
      out.write("                    ");
  } else {
                    
      out.write("\r\n");
      out.write("                    Welcome <a href=\"profile.jsp\">\r\n");
      out.write("                        ");

                            sqldb.connect();
                            String query = "select * from registration where Email='" + session.getAttribute("email") + "'";
                            ResultSet res = sqldb.fetchdata(query);
                            if (res.next()) {
                                out.println(res.getString("f_name") + " " + res.getString("m_name") + " " + res.getString("l_name"));
                            }
                        
      out.write("</a>\r\n");
      out.write("                    <button class=\"btn\"><a href=\"Logout.jsp\">Log Out</a></button>\r\n");
      out.write("\r\n");
      out.write("                    ");

                        }
                        sqldb.connclose();
                    
      out.write("       \r\n");
      out.write("                </span></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- Navigation -->\r\n");
      out.write("        <nav class=\"navbar navbar-fixed-bottom navbar-inverse\" role=\"navigation\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <!-- Brand and toggle get grouped for better mobile display -->\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">ABC Bank</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#\">About</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#\">Services</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#\">Contact</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <div class=\"pull-right padding-2\">\r\n");
      out.write("                        <span class=\"breadcrumb\">&copy;2017 Rachit Shah and Abhi Shah</span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"pull-right padding-2\"><span class=\"breadcrumb\" id=\"visitcount\">\r\n");
      out.write("                            ");

                                sqldb.connect();
                                ResultSet res;
                                res = sqldb.fetchdata("select htotal from visitcount");
                                if (res.next()) { 
      out.write("\r\n");
      out.write("                            ");
 out.println("Visitors:" + res.getInt("htotal"));
                            
      out.write("\r\n");
      out.write("                            ");
 }
                                sqldb.connclose();
                            
      out.write("\r\n");
      out.write("                        </span></div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- /.navbar-collapse -->\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.container -->\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <!-- Page Content -->\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-md-6 col-sm-12\">\r\n");
      out.write("                    <h1 style=\"color:#bababa;\">Welcome to the Online Banking Website of ABC Bank</h1>\r\n");
      out.write("                    <p></p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("                <!-- Indicators -->\r\n");
      out.write("                <ol class=\"carousel-indicators\">\r\n");
      out.write("                    <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("                    <li data-target=\"#myCarousel\" data-slide-to=\"1\"></li>\r\n");
      out.write("                    <li data-target=\"#myCarousel\" data-slide-to=\"2\"></li>\r\n");
      out.write("                </ol>\r\n");
      out.write("\r\n");
      out.write("                <!-- Wrapper for slides -->\r\n");
      out.write("                <div class=\"carousel-inner\" role=\"listbox\">\r\n");
      out.write("                    <div class=\"item active\">\r\n");
      out.write("                        <img src=\"assets/slide01.jpg\" alt=\"Chania\">\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"item\">\r\n");
      out.write("                        <img src=\"assets/slide02.jpg\" alt=\"Chania\">\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"item\">\r\n");
      out.write("                        <img src=\"assets/slide03.jpg\" alt=\"Flower\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- Left and right controls -->\r\n");
      out.write("                <a class=\"left carousel-control\" href=\"#myCarousel\" role=\"button\" data-slide=\"prev\">\r\n");
      out.write("                    <span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>\r\n");
      out.write("                    <span class=\"sr-only\">Previous</span>\r\n");
      out.write("                </a>\r\n");
      out.write("                <a class=\"right carousel-control\" href=\"#myCarousel\" role=\"button\" data-slide=\"next\">\r\n");
      out.write("                    <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>\r\n");
      out.write("                    <span class=\"sr-only\">Next</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.container -->\r\n");
      out.write("\r\n");
      out.write("            <!-- jQuery -->\r\n");
      out.write("            <script src=\"js/jquery.js\"></script>\r\n");
      out.write("\r\n");
      out.write("            <!-- Bootstrap Core JavaScript -->\r\n");
      out.write("            <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
