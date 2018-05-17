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
public class registerservlet_ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String email=(String)session.getAttribute("username");
      String s=(String)session.getAttribute("session");
      String i=(String)session.getAttribute("invalid");
      String country=(String)request.getParameter("country");
      String competition=(String)request.getParameter("name");
      boolean exist=false;
      if(s!=null && i!=null && s.equals("TRUE") && i.equals("FALSE") && email!=null && country!=null && competition != null)
      {
          try
          {
              Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt=con.prepareStatement("INSERT INTO "+competition+"users VALUES(?,?,?,?,?,?)");
                    PreparedStatement pstmt2=con.prepareStatement("select * from "+ competition+"users");
                    ResultSet rs=pstmt2.executeQuery();
                    // PreparedStatement pstmtn=con.prepareStatement("CREATE TABLE "+name+"users (name varchar(35),registered varchar(30),status varchar(30),points int,rank int)");

                    if(rs!=null)
                    {
                        while(rs.next() && !exist)
                        {
                            if(rs.getString("name").equals(email))
                                exist=true;
                        }
                    }
                    
                   pstmt.setString(1, email);
                   //pstmt.setString(2, country);
                   pstmt.setString(2,"REGISTERED");
                   pstmt.setString(3,"NOT");
                   pstmt.setInt(4,0);
                   pstmt.setInt(5,0);
                   pstmt.setString(6,country);
                   
                   
                   
                   if((country.equalsIgnoreCase("IND") || country.equalsIgnoreCase("AUS") || country.equalsIgnoreCase("JPN")) && !exist)
                   {
                       pstmt.executeUpdate();
                       
                       response.sendRedirect("competition.jsp?name="+competition);
                   }
                    else
                   {
                       if(exist)
                       {
                           response.sendRedirect("competition.jsp?name="+competition);
                       }
                       else
                       {
                       session.setAttribute("server_message_invalid","This Competition is not available for your country");
                       response.sendRedirect("warmup1.jsp?name="+competition);
                       }
                   }    
                   
                
              
          }
          catch(Exception e)
          {
              response.getWriter().print(e);
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
