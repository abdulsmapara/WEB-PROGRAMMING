<%-- 
    Document   : warmup_
    Created on : Apr 17, 2018, 6:37:50 PM
    Author     : ABDUL SATTAR MAPARA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% response.setHeader("Cache-Control", "private,no-store,no-cache"); %>
<%
    String s=(String)session.getAttribute("session");
    String msg=(String)session.getAttribute("server_message");
    
    String inval=(String)session.getAttribute("server_message_invalid");
   String i=(String)session.getAttribute("invalid");
   if(s!=null && i!= null && s.equals("TRUE") && i.equals("FALSE"))
   {
       
    String email=(String)session.getAttribute("username");
    String password=(String)session.getAttribute("password");
     Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt2=con.prepareStatement("select * from warmup where email='"+email+"'");
                    ResultSet res=pstmt2.executeQuery();
                    boolean exist=false ;
                    if(res!=null)
                    {
                        if(res.next() && !exist)
                        {
                                exist=true;
                        }
                    }
                    if(exist){
                        
                    

 %>
<!DOCTYPE html>
<html>
    <head>
        <title>CODEingZONE-WARMUP COMPETITION</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/validation.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script>
function openTab(evt, type) {
  var i, x, tablinks;
  x = document.getElementsByClassName("code");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(type).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}
</script>
<script>
    function submit_comment()
    {
        var formdata=new FormData();
        var username="<%= email%>" ;
        //alert(username);
            formdata.append("username",username);
        var comment=document.getElementById('comment').value;
        formdata.append("comment",comment);
        var question="dsalgo1";
        formdata.append("identity",question);
        var request;
            try{
                request=new XMLHttpRequest();
                request.onreadystatechange=function(){
                    if(request.readyState==4){
                        history.go(0);
                        document.getElementById('update').innerHTML=request.responseText;
        }
                };
                request.open("POST","comments_servlet",true);
                request.send(formdata);
            }catch(e1){
                alert('please upgrade your browser');
            }

    }
</script>
    
  <script type="text/javascript">
   $(document).ready(function() { $(function() { $('.explain').click(); }); }); 
    
    $(document).ready(function(){
  // Add smooth scrolling to all links
  $("a").on('click', function(event) {

    if (this.hash !== "") {
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } 
  });
});
$(function(){
    $('.nav-link').click(function () {
        $('.nav-link').removeClass('active');
        $(this).addClass('active');
     });
 });
 
  </script>
        <style>
        .logout_style{
            color:black;
            font-weight:500;
        }
        .logout_style:hover{
            color:grey;
        }
        .userbtn{
            background:black;
        }
         .nav-link:hover
            {
                border-top:1.5px solid hidden;
                border-bottom:1.5px solid hidden;
            }
            .active
            {
                border-top:1.5px solid #11DDAA;
                border-bottom:1.5px solid #11DDAA;
                
            }
            .nav-link:hover
            {
                border-top:1.5px solid white;
                border-bottom:1.5px solid white;
            }
            .links-footer
            {
                color:#1133DD;
            }
            .links-footer:hover
            {
                color:#113399;
                text-decoration:none;
            }
            .algo-content a:hover{
               color:#11DDAA;
           }
        </style>
        <script>

  
        </script>
    </head>
       <body class="fixed-nav sticky-footer" id="page-top" style="background:white;overflow-x:hidden">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark" id="mainNav">
    <a class="navbar-brand" href="index.jsp" style="color:#11DDAA">CODEingZONE</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="loggedin.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text" style="color:#11DDAA">DASHBOARD</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link active" href="tables.html">
            <i class="fa fa-fw fa-book"></i>
            <span class="nav-link-text" style="color:#11DDAA">PRACTICE</span>
          </a>
        </li>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="algo.jsp">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text" style="color:#11DDAA">ALGORITHMS</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto" style="padding-right:80px">
        
       
        <li class="nav-item">
             
            
           
 <div class="dropdown">
  <button type="button" class="btn btn-success userbtn dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
      <i class="fa fa-fw fa-user"></i><%= email %>
  </button>
  
  <ul class="dropdown-menu dropdown-menu-right" role="menu" style="overflow-x:hidden;background:white">
      
      <a class="dropdown-item" href="profile.jsp" style="background:white"><span class="logout_style"><i class="fa fa-fw fa-user"></i>PROFILE</span></a>
          <a class="dropdown-item" href="loggedout"  style="background:white"><span class="logout_style"><i class="fa fa-fw fa-sign-out"></i>LOGOUT</span></a>                      

    </ul>
</div>
        </li>
        </form>
      </ul>
    </div>
  </nav>




            
            
            <div class="row">
                <div class="col-sm-10">
                    <h3 style="text-align:center;font-size:15px;">QUESTION-1:</h3>

                </div>
                <div class="col-sm-2">
                    <h6>POINTS :<%= res.getInt("points") %></h6>

                </div>
            </div>
        
        
<div class="row">
    <div class="col-sm-1"></div>
  <div id="Explaination" class="col-sm-10" style="background:#AAAAAA;height:max-content">
    <p>
        
    </p>       
<div  data-pym-src="https://www.jdoodle.com/embed/v0/teT"></div>

    <p>
    <h3>PROBLEM</h3>
    <h6>GIVEN A FUNCTION FOR SORTING AN ARRAY FIND THE BIG-O TIME COMPLEXITY OF THE ALGORITHM</h6>
    </p>

    <br />
    <form action="evaluate">
        <input type="text" value="1" hidden>
        <input type="radio" name="q1" value="1" />    O(n)<br/>
        <input type="radio" name="q1" value="2" />    O(n<sup>2</sup>)<br/>
        <input type="radio" name="q1" value="3" />    O(nlogn)<br/>
        <input type="radio" name="q1" value="4" />    None<br/>
        <br />
        <br />
        <div class="row">
     <div class="col-sm-4"></div>
     <div class="col-sm-4" style="padding-left:10%">
             <input type="submit" class="btn btn-success" value="CHECK" />

    </div>
</div>
   </form>
    
  </div>
  </div>
  <br />
 
 <div class="row">
     <div class="col-sm-4"></div>
     <div class="col-sm-4" style="padding-left:10%">
     <a href="#" class="btn btn-info" disabled>
         PREV
     </a>

     <a href="warmup_2.jsp" class="btn btn-info">
         NEXT
     </a>
    </div>
</div>
  <br />
       
 <%
       Class.forName("com.mysql.jdbc.Driver");
                    Connection conn;
                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt=conn.prepareStatement("select * from discuss");
                    ResultSet rs=pstmt.executeQuery();
                    
                    if(rs!=null)
                    {
                        
                        
                        out.println("<div class='row' > <div class='col-sm-1'></div><div class='col-sm-10' style='background:grey'><center><h3>COMMENTS</h3></center><br />");
                        while(rs.next())
                        {
                            if(rs.getString("identity").equals("warmup_.jsp")){
                            out.print("<span style='color:#11DDAA'>"+rs.getString("email")+"</span> :"+"<input type='text' readonly='true' class='form-control' value='"+rs.getString("comment")+"'/><br>");
                            }
                         }
                        out.println("</div>");
                        out.println("</div>");
                    }
 %>
 <div class="row">
     <div class="col-sm-1"></div>
     <div class="col-sm-10" style="background:grey">
        <form action="comments_servlet"  method='POST'>
            <input type="text" name="username" value="<%= email %>" hidden />

            <input type="text" name="identity" value="warmup_.jsp" hidden />

            <textarea id='comment' name="comment" class='form-control' cols="100" placeholder='Leave your comment here <%= email%>...' required="true"></textarea>
            <br />
            <%
                if((String)session.getAttribute("invalid_comment")!=null)
                {
                                
                %>
                <div class="alert alert-danger"><% out.print((String)session.getAttribute("invalid_comment"));session.setAttribute("invalid_comment",null);%> </div>
                <%
                }
                %>
            <input type="submit" value="COMMENT" class='btn btn-success'></input>
        </form>
            <br />
     </div>
 </div>
   <br />
   <span id='update'></span>
   <div class="algo-content" style="background:#555;color:white">
    <!-- display content-->
    <h3 style="text-align:center">ALGORITHMS</h3>
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-5">
            <h3 style="text-align:center">
                BASIC ALGORITHMS
            </h3>
            <table>
                <tr>
                    <td>
                        1]
                    </td>
                    <td>
                        <a href="palgo1.php">FIND THE SUM OF SQUARES OF FIRST n NATURAL NUMBERS(without loop)</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        2]
                    </td>
                    <td>
                        <a href="palgo2.php"> GIVEN A REAL NUMBER FIND ITS SQUARE ROOT </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        3]
                    </td>
                    <td>
                        <a href="palgo3.php">CALCULATE POWER OF A FLOAT TO AN INTEGER</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        4]
                    </td>
                    <td>
                        <a href="palgo4.php">SEQUENCE AND SERIES-1-(1/1+1/2+..+1/n)</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        5]
                    </td>
                    <td>
                        <a href="palgo4.php">SEQUENCE AND SERIES-2-(sine and max error)</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-sm-5">
             <h3 style="text-align:center">
                DATA STRUCTURES and ALGORITHMS
            </h3>
            <table>
                <th>
                    ARRAYS
                </th>
                
                <tr>
                    <td>
                        1]
                    </td>
                    <td>
                        <a href="dsalgo1.php"  style="color:#11DDFF">FILL AN ARRAY OF A GIVEN SIZE FROM USER</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        2]
                    </td>
                    <td>
                        <a href="dsalgo2.php"> FINDING THE MISSING NUMBER OUT OF 1ST n NATURAL NUMBERS (TRICKS AND CATCH IN NAIVE APPROACH)</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br />
    <br />
    <br />
</div>

    <!--Footer-->
<footer style="background:#0B0101">

    <!--Footer Links-->
    <div class="container">
        <div class="row">

            <!--First column-->
            <div class="col-md-4">
                <h5 style="padding-top: 20px;
        color:white;text-align: left">CODEing ZONE</h5>
                <p style="color:white;text-align: left;">A PLATFORM TO THINK and CODE LIKE a PRODIGY.</p>
                <div style="padding-top: 20px;
        color: white;">
        <ul style="list-style-type: none;padding-left: 0px;text-align: left">

            <li style="display:inline-block;"><a href="https://www.facebook.com/abdulsmapara"><img src="https://png.icons8.com/color/50/000000/facebook.png" style="width: 30px"> </a></li>
            <li style="display:inline-block;"><a href="https://plus.google.com/u/0/"><img src="https://png.icons8.com/color/50/000000/google-plus.png" style="width: 30px"></a></li>
            <li style="display:inline-block;"><img src="https://png.icons8.com/color/50/000000/twitter.png" style="width: 30px"></li>
           

        </ul>
    </div>
            </div>
          

            <!--Second column-->
            <div class="col-md-4" style="text-align: left">
                <h5 style="color: white;
        padding-left: 40px;
        padding-top: 20px;">Links</h5>
                <ul style="list-style-type: none">
                    <li><a href="index.jsp" class="links-footer">HOME</a></li>
                    <li><a href="about.jsp" class="links-footer">ABOUT</a></li>
                    
                    
                </ul>
            </div>
           
      


 <div class="col-md-4" style="text-align: left">
  <div class="footer-contact" style="background:#0B0101;">
    <p style="color: white;
        font-weight: 500;font-size: 1.2rem;
        padding-top: 20px;">Contact Us</p>
    
        <form action="" method="POST" name="contact" id="contact" style="background:#0B0101;border:0px;padding-left:0px;margin:0px;padding-top:1px;width:80%">
          <table>
            <tr>
              <td>
                <input type="text" class="form-control" name="email" size=26; maxlength=50 placeholder="Email"  style="background: black ; border-width: 1px;color:white;" onfocus="document.getElementById('alert-msg').style.display='none'" />
              </td>
            </tr>
            <tr>
              <td>

              </td>
            </tr>
             <tr>
              <td>
                
              </td>
            </tr>
            <tr>
            <td style="padding:3px">
              
                <div class="alert alert-danger" id="alert-email" style="font-size: 13px;width:max-content;display:none;">INCORRECT E-MAIL ID!PLEASE CHECK</div>
              
            </td>
            </tr>
            
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            <tr>

              <td>
                <textarea name="message"  class="form-control" cols="28" placeholder="Message" style="background: black; border-width: 1px;color:white;overflow: hidden;" onfocus="document.getElementById('alert-email').style.display='none'"></textarea>
              </td>
            </tr>
            <tr>
              <td>
                <div class="alert alert-danger" id="alert-msg" style="font-size: 13px;width:max-content;display:none"> PLEASE PROVIDE A SENSIBLE MESSAGE!</div>
              </td>
            </tr>
               
            <tr>
              <td style="padding: 3px">
                <input type="Submit" name="SUBMIT" class="btn" style="background:#3333EE;font-size:14px;
        padding: 5px;
        text-align: center;
        color:white;
        border-radius:2px;
        font-weight: 400;
        opacity: 1;width:67px;" onMouseOver="this.style.background='#333388';" onmouseout="this.style.background='#3333EE'" onClick="return validate();">
                  
                </button>
              </td>
            </tr>
            <tr>
              <td style="padding:3px">
                <div class="alert alert-success" id="success" style="font-size: 13px;width:max-content;display:none">YOUR RESPONSE RECORDED.THANK YOU!</div>
                
              </td>
            </tr>
          </table>
           
        </form>

</div>
   <p style="text-align:center;color:white">NON-COMMERCIAL WEBSITE(made for learning purpose) </p>
</div>

</div>
</footer>
</body>
</html>
<script src="https://www.jdoodle.com/assets/jdoodle-pym.min.js" type="text/javascript"></script>

<%
    }
else
{
response.sendRedirect("warmup1.jsp") ;
}
}
else
{
response.sendRedirect("login.jsp");
}
    %>