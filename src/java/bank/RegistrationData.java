/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.websocket.Encoder;

/**
 *
 * @author Abhi
 */

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class RegistrationData extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String c_type=request.getParameter("customer_type");
        String f_name=request.getParameter("First Name");
        String m_name=request.getParameter("Middle Name");
        String l_name=request.getParameter("Last Name");
        String DOB=request.getParameter("DOB");
        String gender=request.getParameter("gender");
        String nationality=request.getParameter("nationality");
        String martial=request.getParameter("martial");
        String father_name=request.getParameter("Father Name");
        String mother_name=request.getParameter("Mother Name");
        String password=request.getParameter("pwd");
        String email=request.getParameter("email");
        String flatno=request.getParameter("FlatNo");
        String street=request.getParameter("Street");
        String landmark=request.getParameter("Landmark");
        String district=request.getParameter("District");
        String state=request.getParameter("State");
        String pin=request.getParameter("PIN");
        String city=request.getParameter("City");
        String tele=request.getParameter("telephone");
        String mobile=request.getParameter("mobile");
        String p_flatno=request.getParameter("P_FlatNo");
        String p_street=request.getParameter("P_Street");
        String p_landmark=request.getParameter("P_Landmark");
        String p_district=request.getParameter("P_District");
        String p_state=request.getParameter("P_State");
        String p_pin=request.getParameter("P_PIN");
        String p_city=request.getParameter("P_City");
        String p_tele=request.getParameter("P_telephone");
        String p_mobile=request.getParameter("P_mobile");
        String actype = request.getParameter("actype");
        
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        
        
        
     /*   String Query="insert into registration values('"+c_type+"','"+f_name+"','"+m_name+"','"+l_name+"','"+DOB+"','"+actype+"','"+
                gender+"','"+nationality+"','"+martial+"','"+father_name+"','"+mother_name+"','"+password+"','"+
                email+"','"+flatno+"','"+street+"','"+landmark+"','"+district+"','"+state+"',"+pin+",'"+
                city+"','"+tele+"','"+mobile+"','"+p_flatno+"','"+p_street+"','"+p_landmark+"','"+p_district+
                "','"+p_state+"',"+p_pin+",'"+p_city+"','"+p_tele+"','"+p_mobile+"',0,'"+inputStream+"')";
  */
        String sql = "INSERT INTO registration values (?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    sqldb.connect();
    PreparedStatement statement = sqldb.conn.prepareStatement(sql);
    statement.setString(1, c_type);

    statement.setString(2, f_name);
    statement.setString(3, m_name);
    statement.setString(4, l_name);
    statement.setString(5, DOB);
    statement.setString(6, actype);
    statement.setString(7, gender);
    statement.setString(8, nationality);
    statement.setString(9, martial);
    statement.setString(10, father_name);
    statement.setString(11, mother_name);
    statement.setString(12, password);
    statement.setString(13, email);
    statement.setString(14, flatno);
    statement.setString(15, street);
    statement.setString(16, landmark);
    statement.setString(17, district);
    statement.setString(18, state);
    statement.setString(19, pin);
    statement.setString(20, city);
    statement.setString(21, tele);
    statement.setString(22, mobile);
    statement.setString(23, p_flatno);
    statement.setString(24, p_street);
    statement.setString(25, p_landmark);
    statement.setString(26, p_district);
    statement.setString(27, p_state);
    statement.setString(28, p_pin);
    statement.setString(29, p_city);
    statement.setString(30, p_tele);
    statement.setString(31, p_mobile);
    
    statement.setInt(32, 0);
    if(inputStream!=null)
        statement.setBinaryStream(33, inputStream, (int) filePart.getSize());




    System.out.println(DOB);

    int val=statement.executeUpdate();
    //int val = sqldb.iud_data(Query);
    //PrintWriter p=response.getWriter();
     if (val == 1) {
            response.sendRedirect("index.jsp");
            
            response.setHeader("Cache-control", "no-cache, no-store");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Eresponse.setHeader(\"Cache-control\", \"no-cache, no-store\");\n" +
"xpires", "-1");
        } else {
            request.setAttribute("Error", "Email already Exists");
            RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
            rd.forward(request, response);
        }
        sqldb.connclose();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationData.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationData.class.getName()).log(Level.SEVERE, null, ex);
        }
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
