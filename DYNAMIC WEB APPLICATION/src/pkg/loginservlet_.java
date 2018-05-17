/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ABDUL SATTAR MAPARA
 */
public class loginservlet_ extends HttpServlet 
{

 
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,Exception {
        response.setContentType("text/html;charset=UTF-8");
          response.setHeader("Cache-Control", "private,no-store,no-cache");

        PrintWriter out = response.getWriter();
        
        HttpSession session=request.getSession();
        String email=request.getParameter("email");
        String pass=request.getParameter("password");
        String s=(String)session.getAttribute("session");
        String i=(String)session.getAttribute("invalid");
        
        if(s!=null && i!=null && s.equals("TRUE") && i.equals("FALSE"))
        {
            RequestDispatcher rd=request.getRequestDispatcher("/loggedin.jsp");
            rd.forward(request,response);
        }
        else
        {
                                boolean isLoggedIn=false;

            try
            {
                //database code here
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt=con.prepareStatement("SELECT * FROM CUSTOMERS"); 
                    ResultSet rs=pstmt.executeQuery();
                 if(email != null && pass != null)
                 {
                    if(rs!=null)
                    {
                        while(rs.next() && !isLoggedIn)
                        {
                            if(rs.getString("EMAIL").equals(email) && rs.getString("PASSWORD").equals(pass))
                            {
                                isLoggedIn=true;
                                session.setAttribute("session","TRUE");
                                session.setAttribute("invalid","FALSE");
                                session.setAttribute("username",email);
                                session.setAttribute("password",pass);
                            }
                        }
                    }
                 }
                 else
                 {
                     session.setAttribute("server_message_invalid","PLEASE CHECK YOUR DATA");
                                response.sendRedirect("login.jsp");

                 }
                 if(!isLoggedIn)
                 {
                    session.setAttribute("server_message_invalid","INVALID USERNAME/PASSWORD");
                               response.sendRedirect("login.jsp");


                 }
                 else
                 {
                                response.sendRedirect("loggedin.jsp");

                 }
                 
            }
            catch(Exception e){
                throw new Exception();
            }
        }
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        try{
        processRequest(request, response);
        }catch(Exception e){
            RequestDispatcher rd=request.getRequestDispatcher("/Error.jsp");
            rd.forward(request, response);
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
