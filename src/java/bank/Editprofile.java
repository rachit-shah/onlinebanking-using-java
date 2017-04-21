/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abhi
 */
public class Editprofile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String f_name=request.getParameter("First Name");
        String m_name=request.getParameter("Middle Name");
        String l_name=request.getParameter("Last Name");
        String DOB=request.getParameter("DOB");
        String gender=request.getParameter("gender");
        String nationality=request.getParameter("nationality");
        String martial=request.getParameter("martial");
        String password=request.getParameter("pwd");   
        String mobile=request.getParameter("mobile");
        String email = request.getParameter("email");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String query = "update registration set f_name = '" + f_name + 
                   "', m_name = '" + m_name + 
                   "', l_name = '" + l_name +
                   "', DOB = '" + DOB +
                   "', Gender = '" + gender +
                   "', Nationality = '" + nationality +
                    "', Martial_Status = '" + martial +
                    "', password = '" + password +
                    "', M_No='" + mobile +
                   "' where Email = '" + email+"'";
           sqldb.connect();
           int res=sqldb.iud_data(query);
            try {
                //sqldb.conn.commit();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
           sqldb.connclose();
           if(res>0){ 
               //System.out.println(query);
               //out.print("add successfully");
               HttpSession s = request.getSession();
               s.setAttribute("op", "success");
               response.sendRedirect("profile.jsp");               
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
