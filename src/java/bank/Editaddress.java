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
public class Editaddress extends HttpServlet {

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
        
        String flatno=request.getParameter("FlatNo");
        String street=request.getParameter("Street");
        String landmark=request.getParameter("Landmark");
        String district=request.getParameter("District");
        String state=request.getParameter("State");
        String pin=request.getParameter("PIN");
        String city=request.getParameter("City");
        String tele=request.getParameter("telephone");
        String email = request.getParameter("email");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String query = "update registration set Flat = '" + flatno + 
                   "', Street = '" + street + 
                   "', Landmark = '" + landmark +
                   "', District = '" + district +
                   "', State = '" + state +
                   "', PIN = " + pin +
                    ", City = '" + city +
                    "', T_No = '" + tele +
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
               s.setAttribute("op2", "success");
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
