
package pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
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
public class signupservletuser extends HttpServlet
{

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException ,Exception
    {
          response.setHeader("Cache-Control", "private,no-store,no-cache");

        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String pass=request.getParameter("password");
        HttpSession session=request.getSession();
        String s=(String)session.getAttribute("session");
        String i=(String)session.getAttribute("invalid");
        response.setContentType("text/html;charset=UTF-8");
       
        
        PrintWriter  out =response.getWriter();

            if(s!=null && i!=null && s.equals("TRUE"))
            {           response.sendRedirect("loggedin.jsp");

              }
            else
            {
                try
                {
                    //database code here
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt=con.prepareStatement("INSERT INTO users VALUES(?,?,?)");
                    PreparedStatement pstmt2=con.prepareStatement("SELECT * FROM users"); 

                    if(name!=null && email!=null && pass!=null)
                    {
                        boolean found=false;
                        ResultSet rs=pstmt2.executeQuery();
                        if(rs!=null)
                        {
                            while(rs.next() && !found)
                            {
                                if(rs.getString("email").equals(email))
                                    found=true;
                            }
                         }
                            if(found)
                            {
                                        session.setAttribute("server_message_invalid","USERNAME ALREADY EXISTS");

                            }
                            else
                            {
                            pstmt.setString(1,name);
                            pstmt.setString(2,email);
                            pstmt.setString(3,pass);
                            pstmt.executeUpdate();
                            session.setAttribute("server_message","YOU HAVE SIGNED UP SUCCESSFULLY!<br />LOG-IN TO CONTINUE");
                            }
                      
                     }
                    else
                    {
                       session.setAttribute("server_message_invalid","PLEASE CHECK YOUR DATA");
                       
                    }
                    con.close();
                    request.getRequestDispatcher("/signup.jsp").include(request,response);

                }
                catch(Exception e)
                {
                    out.print(e);
                    //throw new Exception("ERROR IN DATABASE");
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
        return "WEB-APP AS A PART OF SOFTWARE LAB 2 ASSIGNMENT BY ABDUL SATTAR MAPARA";
    }// </editor-fold>

}
