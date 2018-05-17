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
public class end_test extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
       response.setHeader("Cache-Control", "private,no-store,no-cache"); 
       HttpSession session=request.getSession();
 String s=(String)session.getAttribute("session");
 int qno=Integer.parseInt(request.getParameter("qno"));
   String i=(String)session.getAttribute("invalid");
    String name=request.getParameter("name");
    String email=(String)session.getAttribute("username");
   if(s!=null && i!= null && s.equals("TRUE") && i.equals("FALSE") && name !=null)
   {
       PrintWriter out=response.getWriter();
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt=con.prepareStatement("SELECT * FROM "+name);
                                       
                    ResultSet rs=pstmt.executeQuery();
                    if(rs != null)
                    {
                        for(int it=1;it <= qno && rs.next();it++)
                        {
                            //it-iterator
                            int ans_user=Integer.parseInt(request.getParameter("q"+it));
                            int correct;
                            correct=rs.getInt("correct");
                            if(ans_user==correct)
                            {
                                 PreparedStatement pstmt2=con.prepareStatement("SELECT * FROM "+name+"users where name=\""+email+"\"");
                                        ResultSet user_update=pstmt2.executeQuery();
                                        if(user_update!=null && user_update.next()){
                                //out.print(rs.getInt("points")+" "+user_update.getInt("points"));
                                    int update=rs.getInt("points")+user_update.getInt("points");
                                    PreparedStatement ps=con.prepareStatement("UPDATE "+name+"users set points="+update+" where name=\""+email+"\"") ;
                               ps.execute();
                                        }
                               
                            }
                        }
                        PreparedStatement ps=con.prepareStatement("UPDATE "+name+"users set status=\"done\" where name=\""+email+"\"") ;
                       ps.execute();
                       response.sendRedirect("leaderboard.jsp?name="+name);
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
                                                        response.getWriter().println(e);

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
                                            response.getWriter().println(e);

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
