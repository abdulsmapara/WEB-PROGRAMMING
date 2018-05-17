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
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ABDUL SATTAR MAPARA
 */
public class makecompetition_ extends HttpServlet {

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
       HttpSession session=request.getSession();
 String s=(String)session.getAttribute("session");
   String i=(String)session.getAttribute("invalid");
   String msg=(String)session.getAttribute("server_message");
    String start=(String)request.getParameter("start");
    
    String end=(String)request.getParameter("end");
        String des=(String)request.getParameter("describe");

    String inval=(String)session.getAttribute("server_message_invalid");
    String name=request.getParameter("nameofcompetition");
   if(s!=null && i!= null && s.equals("TRUE") && i.equals("FALSE") && name !=null)
   {
                             PrintWriter out=response.getWriter();

    String email=(String)session.getAttribute("username");
        try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con;
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                        PreparedStatement pstmt=con.prepareStatement("CREATE TABLE "+name+" (code_link varchar(100),question varchar(500),points int,opt1 varchar(30),opt2 varchar(30),opt3 varchar(30),opt4 varchar(30),correct int)");
                      PreparedStatement pstmt2=con.prepareStatement("UPDATE CUSTOMERS set ADMIN=\""+"TRUE"+"\" where email=\""+email+"\"");
                                            PreparedStatement pstmt3=con.prepareStatement("INSERT INTO ALLCOMPETITIONS VALUES(?,?,?,?,?)");
                                            pstmt3.setString(1,name);
                                           // pstmt3.setString(3,start);
                                           // pstmt3.setString(4,end);
                                            
                                            pstmt3.setString(5,des);
                                            String[] arr1=start.split("-");
                                            String[] arr2;
                                            int sdate,smonth,syear,edate,emonth,eyear;
                                            sdate=Integer.parseInt(arr1[2]);
                                            
                                            smonth=Integer.parseInt(arr1[1]);
                                            
                                            syear=Integer.parseInt(arr1[0]);
                                            arr2=end.split("-");
                                             edate=Integer.parseInt(arr2[2]);
                                            
                                            emonth=Integer.parseInt(arr2[1]);
                                            
                                             eyear=Integer.parseInt(arr2[0]);
                                             Calendar scal= Calendar.getInstance();
                                             scal.set(Calendar.DAY_OF_MONTH,sdate);
                                             scal.set(Calendar.MONTH,smonth-1);
                                             scal.set(Calendar.YEAR,syear);
                                             Date s_date=scal.getTime();
                                             Calendar ecal= Calendar.getInstance();
                                             ecal.set(Calendar.DAY_OF_MONTH,edate);
                                             ecal.set(Calendar.MONTH,emonth-1);
                                             ecal.set(Calendar.YEAR,eyear);
                                             Date e_date=ecal.getTime();
                                             Date today=new Date();
                                            //out.print(today+" "+s_date);
                                             if(s_date.before(today)||e_date.before(s_date))
                                             {
                                                 //out.print(sdate);
                                                 throw new Exception();
                                             }
                                             else
                                             {
                                                 
                                            pstmt3.setString(3,String.valueOf(sdate)+"-"+String.valueOf(smonth)+"-"+String.valueOf(syear));
                                            pstmt3.setString(4,String.valueOf(edate)+"-"+String.valueOf(emonth)+"-"+String.valueOf(eyear));
                                                 if(s_date.equals(today))
                                                 {
                                                     pstmt3.setString(2,"live");
                                                 }
                                                 else
                                                 {
                                                     pstmt3.setString(2,"upcoming");
                                                 }
                                                 pstmt3.executeUpdate();
                                             }
                                                                     pstmt.execute();

                                            pstmt2.executeUpdate();
                     PreparedStatement pstmtn=con.prepareStatement("CREATE TABLE "+name+"users (name varchar(35),registered varchar(30),status varchar(30),points int,rank int,country varchar(30))");
                     pstmtn.execute();
                                                     response.sendRedirect("continue_make.jsp?name="+name);

        }catch(Exception e)
        {
            out.print(e);

            session.setAttribute("server_message_invalid","ERROR<br />PROBABLY-DUPLICATE NAME OF THE COMPETITION!<br/>PROBABLY-WRONG DATE OF COMPETITION");
         //response.sendRedirect("admin.jsp");
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
