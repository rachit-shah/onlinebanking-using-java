/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import onlinebanking.BankingBLocal;
import onlinebanking.BankingB;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abhi
 */
public class Transact extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //BankingB bankTransact;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        try (PrintWriter out = response.getWriter()) {
            InitialContext context = new InitialContext();
            BankingBLocal bankTransact = (BankingBLocal) context.lookup("stateful123");
            String s = request.getParameter("transaction");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String email = session.getAttribute("email").toString();
            String email2 = request.getParameter("payee");
            System.out.println(email2);
            if (s.equals("deposit")) {
                boolean st = bankTransact.deposit(amount, email, false);
                if (st == true) {
                    session.setAttribute("stat", "dep-suc");
                    //out.println("<h4 style='margin-top:100px;color:rgba(210,100,100,0.9);text-align:center;'>Deposited Successfully</h4>");
                } else {
                    session.setAttribute("stat", "dep-err");
                    //out.println("<h4 style='margin-top:100px;color:rgba(210,100,100,0.9);text-align:center;'>Error</h4>");
                }
                response.sendRedirect("transact.jsp");

            } else if (s.equals("withdraw")) {
                double wit = bankTransact.withdraw(amount, email, false);
                if (wit == -1) {
                    session.setAttribute("stat", "wit-err");
                    //out.println("<h4 style='margin-top:100px;color:rgba(210,100,100,0.9);text-align:center;'>Insufficient Balance</h4>");
                } else {
                    session.setAttribute("stat", "wit-suc");
                    //out.println("<h4 style='margin-top:100px;color:rgba(210,100,100,0.9);text-align:center;'>Withdrew Rs."+wit+" successfully!</h4>");
                }
                response.sendRedirect("transact.jsp");
            }
            else if (s.equals("transfer")){
                double tra = bankTransact.transferTo(amount, email, email2);
                if (tra == -1){
                    session.setAttribute("stat", "tra-err");
                }
                else
                    session.setAttribute("stat", "tra-suc");
                response.sendRedirect("transact.jsp");
            }

        } catch (NamingException ex) {
            Logger.getLogger(Transact.class.getName()).log(Level.SEVERE, null, ex);
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
