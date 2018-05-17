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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ABDUL SATTAR MAPARA
 */
public class comments_servlet extends HttpServlet 
{

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
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "private,no-store,no-cache");
         HttpSession session= request.getSession();
       String s=(String)session.getAttribute("session");
       String i=(String)session.getAttribute("invalid");
       String email=(String)request.getParameter("username");
       String comment=(String)request.getParameter("comment");
       String identity=(String)request.getParameter("identity");
       if(s!=null && i!=null && s.equals("TRUE") && i.equals("FALSE"))
       {
           PrintWriter out =response.getWriter();
           if(email!=null && comment!=null && identity != null && comment.length() > 5 )
           {
               try
               {
                Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt=con.prepareStatement("INSERT INTO discuss VALUES(?,?,?)");
                   pstmt.setString(1, identity);
                   pstmt.setString(2, email);
                   pstmt.setString(3, comment);
                   pstmt.executeUpdate();
                   response.sendRedirect(identity);
               }
                    catch(Exception e)
                    {
                        out.print("here "+e);
                    }
                   
           }
           else
           {
               session.setAttribute("invalid_comment","YOUR COMMENT WAS TOO SMALL TO BE POSTED!");
                                  response.sendRedirect(identity);

           }
       }
       else
       {
          session.setAttribute("server_message_invalid", "ILLEGAL ACCESS"); 
          response.sendRedirect("login.jsp");
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
