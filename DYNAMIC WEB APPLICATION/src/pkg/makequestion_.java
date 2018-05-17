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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ABDUL SATTAR MAPARA
 */
public class makequestion_ extends HttpServlet {

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
            throws ServletException, IOException,Exception {
       response.setContentType("text/html;charset=UTF-8");
        
       response.setHeader("Cache-Control", "private,no-store,no-cache"); 
       HttpSession session=request.getSession();
 String s=(String)session.getAttribute("session");
   String i=(String)session.getAttribute("invalid");
   String msg=(String)session.getAttribute("server_message");
        String inval=(String)session.getAttribute("server_message_invalid");
    String name=request.getParameter("name");
    String url=request.getParameter("url");
    String question=request.getParameter("question");
    
    int points=Integer.parseInt(request.getParameter("points"));
    String opt1=request.getParameter("opt1");
    String opt2=request.getParameter("opt2");
    String opt3=request.getParameter("opt3");
    String opt4=request.getParameter("opt4");
    int correct=Integer.parseInt(request.getParameter("correct"));
   if(s!=null && i!= null && s.equals("TRUE") && i.equals("FALSE") && name !=null && question != null)
   {
       
    String email=(String)session.getAttribute("username");
        String password=(String)session.getAttribute("password");
        try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con;
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                        PreparedStatement pstmt=con.prepareStatement("INSERT INTO "+name+" VALUES (?,?,?,?,?,?,?,?)");
                        if(url!=null && !url.equals(""))
                        {
                                                    pstmt.setString(1,url);

                        }
                        else
                        {
                            pstmt.setString(1,"null");

                        }
                        pstmt.setString(2,question);
                        pstmt.setInt(3,points);
                        pstmt.setString(4,opt1);
                        pstmt.setString(5,opt2);
                        pstmt.setString(6,opt3);
                        pstmt.setString(7,opt4);
                        pstmt.setInt(8,correct);
                        pstmt.executeUpdate();
                        session.setAttribute("server_message","SUCCESSFUL");
                        response.sendRedirect("continue_make.jsp?name="+name);
        }catch(Exception e){
            
            response.getWriter().print(e);            
            session.setAttribute("server_message_invalid","FAILED");
             response.sendRedirect("continue_make.jsp?name="+name);

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
        try{
        processRequest(request, response);
        }catch(Exception e){
            response.getWriter().print(e);
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
 try{
        processRequest(request, response);
        }catch(Exception e){
            response.getWriter().print(e);
        }    }

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
