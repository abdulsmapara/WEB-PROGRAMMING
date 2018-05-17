<%-- 
    Document   : loggedin
    Created on : Apr 13, 2018, 7:15:48 PM
    Author     : ABDUL SATTAR MAPARA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%  response.setHeader("Cache-Control", "private,no-store,no-cache"); %>

<%
   String s=(String)session.getAttribute("session");
   String i=(String)session.getAttribute("invalid");
   if(s!=null && i!= null && s.equals("TRUE") && i.equals("FALSE"))
   {
       
    String email=(String)session.getAttribute("username");
    String password=(String)session.getAttribute("password");
 %>

<!DOCTYPE html>
<html>
    <head>
        <title>CODEingZONE-WELCOME</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/validation.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    
  <script type="text/javascript">
    //from w3schools.com
    $(document).ready(function(){
  // Add smooth scrolling to all links
  $("a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
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
    } // End if
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
        </style>
    </head>
       <body class="fixed-nav sticky-footer" id="page-top" style="background:white">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark" id="mainNav">
    <a class="navbar-brand" href="index.jsp" style="color:#11DDAA">CODEingZONE</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link active" href="loggedin.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text" style="color:#11DDAA">DASHBOARD</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="compete.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text" style="color:#11DDAA">COMPETITIONS</span>
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
            <%= email %>
<i class="fa fa-fw fa-user"></i>
  </button>
  
  <ul class="dropdown-menu dropdown-menu-right" role="menu" style="overflow-x:hidden;background:white">
       <a class="dropdown-item" href="admin.jsp" style="background:white"><span class="logout_style"><i class="fa fa-fw fa-trophy"></i>Make A Competition</span></a>
      <a class="dropdown-item" href="" style="background:white"><span class="logout_style"><i class="fa fa-fw fa-user"></i>PROFILE</span></a>
          <a class="dropdown-item" href="loggedout"  style="background:white"><span class="logout_style"><i class="fa fa-fw fa-sign-out"></i>LOGOUT</span></a>                      

    </ul>
</div>
        </li>
        </form>
      </ul>
    </div>
  </nav>




  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="loggedin.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><%= email %> </li>
      </ol>
      <!-- Icon Cards-->
      <div class="row">
        <div class="col-md-3">
          <div class="card text-white bg-dark o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-list"></i>
              </div>
              <div class="mr-5">ALGORITHMS and DATA STRUCTURES</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="algo.jsp">
              <span class="float-left">LEARN NOW</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-list"></i>
              </div>
              <div class="mr-5">FRONT END WEB DEVELOPMENT</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="coming_soon.html">
              <span class="float-left">LEARN NOW</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-list"></i>
              </div>
              <div class="mr-5">BACK END WEB DEVELOPMENT</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="coming_soon.html">
              <span class="float-left">LEARN NOW</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card text-white bg-info o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-shopping-compete"></i>
              </div>
              <div class="mr-5">COMPETITIONS</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="compete.jsp">
              <span class="float-left">COMPETE NOW!</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
      </div>
          <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="loggedin.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item">GIVE IT A THOUGHT</li>
      </ol>
      <div class="row">
        <div class="col-md-6">
           <div class="card text-white bg-dark o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-comments"></i>QUESTION OF THE DAY
              </div>
              <div class="mr-5">TOPIC:  STRINGS<p>FIND THE LARGEST PALINDROMIC SUBSTRING IN A GIVEN STRING.</p></div>
            </div>
            
          </div>
        </div>
        <div class="col-md-6">
           <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-trophy"></i>APRRECIATION FOR MOTIVATION
              </div>
              <div class="mr-5">YESTERDAY'S ANSWERER:<p style="color:black">N/A</p></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="solutionque.php">
              <span class="float-left">JUMP TO SOLUTION</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
      </div>
        </div>
        <!--<div class="col-xl-3 col-sm-6 mb-3">
         <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-support"></i>
              </div>
              <div class="mr-5">13 New Tickets!</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="#">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>-->
      </div>
</div>
</div>
<br /><br /><br /><br /><br /><br />

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
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="about.jsp">ABOUT</a></li>
                    
                    
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
                <textarea name="message"  class="form-control" cols="28"; placeholder="Message" style="background: black; border-width: 1px;color:white;overflow: hidden;" onfocus="document.getElementById('alert-email').style.display='none'"></textarea>
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
   
</div>


</footer>
            
            
       </body>
</html>
<%
    }
    else
    {
%>
<html>
    <body>
    <center>
        <h3>ACCESS DENIED</h3>
        <a href="login.jsp">LOG-IN</a>
        <a href="signup.jsp">SIGN-UP</a>
    </center>
    </body>
</html>
<%
    }
%>