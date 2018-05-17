<%-- 
    Document   : LogIn
    Created on : 9 Mar, 2018, 7:00:53 PM
    Author     : ABDUL SATTAR MAPARA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%  response.setHeader("Cache-Control", "private,no-store,no-cache"); %>

<!DOCTYPE html>
<html>
<head>

    <%
       response.setHeader("Cache-Control", "private,no-store,no-cache");
        String s=(String)session.getAttribute("session");
        String i=(String)session.getAttribute("invalid");
        String uname=(String)session.getAttribute("username");
        String msg=(String)session.getAttribute("server_message");
        String inval=(String)session.getAttribute("server_message_invalid");
        boolean show=true;
        //show = false if login already made
        if(s != null && (i != null) && uname != null)
        {
            if(s.equals("TRUE") && (i.equals("FALSE")))
            {
                show=false;
            }
        }
        if(show){
    %>
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>
		VNIT-LOGIN
	</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	  
<script type="text/javascript">
(function() {
    'use strict';
    window.addEventListener('load', function() {
      var form = document.getElementById('needs-validation');
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    }, false);
  })();
	  </script>
	  <style type="text/css">
	  	#vlogin .has-error .help-block,
#vlogin .has-error .form-control-feedback{
    color:#FF0000;
}
#vlogin .has-success .help-block,
#vlogin .has-success .form-control-feedback{
    color:#DDAA55;
}
	  </style>
<style type="text/css">
	* { -webkit-box-sizing:border-box; box-sizing:border-box;}
html,body{
	min-width: 100%;
}

body {
	font-family: Helvetica;
	background: #eee;
  -webkit-font-smoothing: antialiased;
}

hgroup { 
	text-align:center;
	margin-top: 4em;
}

h1, h3 { font-weight: 300; }

h1 { color: #636363; }

h3 { color: #4a89dc; }

form {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	-webkit-box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
	        box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
}

.group { 
	position: relative; 
	margin-bottom: 45px; 
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	-webkit-appearance: none;
	display: block;
	background: #fafafa;
	color: #636363;
	width: 100%;
	border: none;
	border-radius: 0;
	border-bottom: 1px solid #757575;
}

input:focus { outline: none; }


/* Label */

label {
	color: #AAA; 
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	-webkit-transition: all 0.2s ease;
	transition: all 0.2s ease;
}


/* active */

input:focus ~ label, input.used ~ label {
	top: -20px;
  -webkit-transform: scale(.75);
          transform: scale(.75); left: -2px;
	/* font-size: 14px; */

/* Underline */

.bar {
	position: relative;
	display: block;
	width: 100%;
}
	color: #4a89dc;
}

.bar:before, .bar:after {
	content: '';
	height: 2px; 
	width: 0;
	bottom: 1px; 
	position: absolute;
	background: #4a89dc; 
	-webkit-transition: all 0.2s ease; 
	transition: all 0.2s ease;
}

.bar:before { left: 50%; }

.bar:after { right: 50%; }




input:focus ~ .bar:before, input:focus ~ .bar:after { width: 50%; }


.inval {
	position: relative;
	display: block;
	width: 100%;
}

.inval:before, .inval:after {
	content: '';
	height: 2px; 
	width: 0;
	bottom: 1px; 
	position: absolute;
	background: red; 
	-webkit-transition: all 0.2s ease; 
	transition: all 0.2s ease;
}

.inval:before { left: 50%; }

.inval:after { right: 50%; }




input:focus ~ .inval:before, input:focus ~ .inval:after { width: 50%; }




.highlight {
	position: absolute;
	height: 60%; 
	width: 100px; 
	top: 25%; 
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}




input:focus ~ .highlight {
	-webkit-animation: inputHighlighter 0.3s ease;
	        animation: inputHighlighter 0.3s ease;
}




@-webkit-keyframes inputHighlighter {
	from { background: #4a89dc; }
	to 	{ width: 0; background: transparent; }
}

@keyframes inputHighlighter {
	from { background: #4a89dc; }
	to 	{ width: 0; background: transparent; }
}




.button {
  position: relative;
  display: inline-block;
  padding: 12px 24px;
  margin: .3em 0 1em 0;
  width: 100%;
  vertical-align: middle;
  color: #fff;
  font-size: 16px;
  line-height: 20px;
  -webkit-font-smoothing: antialiased;
  text-align: center;
  letter-spacing: 1px;
  background: #4a89dc;
  border: 0;
  border-bottom: 2px solid #3160B6;
  cursor: pointer;
  -webkit-transition: all 0.15s ease;
  transition: all 0.15s ease;
}
.button:focus { outline: 0;}


/* Button modifiers */

.buttonBlue {
  background: #4a89dc;
  text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
}

.buttonBlue:hover { background: #357bd8; }

/*
 Ripples container 

.ripples {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: transparent;
}


 

.ripplesCircle {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  opacity: 0;
  width: 0;
  height: 0;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.25);
}

.ripples.is-active .ripplesCircle {
  -webkit-animation: ripples .4s ease-in;
          animation: ripples .4s ease-in;
}


 Ripples animation 

@-webkit-keyframes ripples {
  0% { opacity: 0; }

  25% { opacity: 1; }

  100% {
    width: 200%;
    padding-bottom: 200%;
    opacity: 0;
  }
}

@keyframes ripples {
  0% { opacity: 0; }

  25% { opacity: 1; }

  100% {
    width: 200%;
    padding-bottom: 200%;
    opacity: 0;
  }
}
*/
footer { text-align: center; }

footer p {
	color: #888;
	font-size: 13px;
	letter-spacing: .4px;
}

footer a {
	color: #4a89dc;
	text-decoration: none;
	-webkit-transition: all .2s ease;
	transition: all .2s ease;
}

footer a:hover {
	color: #666;
	text-decoration: underline;
}

footer img {
	width: 80px;
	-webkit-transition: all .2s ease;
	transition: all .2s ease;
}

footer img:hover { opacity: .83; }

footer img:focus , footer a:focus { outline: none; }
#alert-name
{
	display: none;
}
#alert-pass
{
	display: none;
}
#alert-user
{
	display: none;
}
  .text
  {
    position: relative;
    padding-top: 25px;
    padding-right: 0;
    padding-left: 0;
    
  }
  @media and screen(min-width: 960px)
  {
    .button
    {
      font-size:15px;
    }

  }
.nav-link
{
    border-top:1.5px hidden white;
    border-bottom:1.5px hidden white;
}
.nav-link:hover
{
    border-top:1.5px solid white;
    border-bottom:1.5px solid white;
}
.active
{
    border-top:1.5px solid #4a89dc;
    border-bottom:1.5px solid #4a89dc;
}
</style>
</head>
<body style="overflow-x:hidden !important ">
	 <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top" style="background:black;width:100vw">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="index.php" style="color:#4a89dc;font-weight:500">CODEingZONE</a>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp" style="color:#4a89dc">HOME<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="about.php" style="color:#4a89dc">ABOUT</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="login.jsp" style="color:#4a89dc;">LOG-IN</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="signup.jsp" style="color:#4a89dc;">SIGN-UP</a>
      </li>
    </ul>
    
  </div>
</nav>
	<div class="main_div" style="background: url('http://www.codeingzone.in/header-bg.jpg');">
		<header class="main">
			<nav>
				
			</nav>
		</header>
		<div class="row">
			<div class="container">
				<div class="text">
					<hgroup>
						<h1 style="color:white">CODEingZONE</h1>
						<p style="color:white;font-size: 17px;font-weight: 200">A PLATFORM TO THINK AND CODE LIKE A PRODIGY!</p>
					</hgroup>
				</div>
			</div>
		</div>
			<div class="row">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-4">
                                     <%
                                         if(msg != null){
                                       %>
                                    <div class="alert alert-success" >
                                        <center><b> <%= msg %></b></center>
                                    </div>
                                       <% msg=null;session.setAttribute("server_message",null);  } %>
                                        <%
                                         if(inval != null){
                                       %>
                                    <div class="alert alert-warning" >
                                        <center> <b><%= inval %></b></center>
                                    </div>
                                       <% inval=null;session.setAttribute("server_message_invalid",null);} %>

                                </div>
				<div class="col-sm-4">
				</div>
				
			</div>
			<div class="row">
				<div class="container">
					<div class="col-sm-12">
						<div class="text">
							<div class="form" style="min-width:60vw">
								<form action="loginservlet_" method="post" style="width:40%;min-width:250px;box-shadow:2px 2px 11px 11px #DDDDDD;" name="vlogin" id="needs-validation" novalidate>
          <table>
          	<tr>
          	<td>
          		
          	</td>
          	<td>
          		<center><h3>LOG-IN</h3></center>
          	</td>
          </tr>
  <div class="form-group">
            <tr>
            	<td>
            	</td>
              <td style="padding-top: 15px">

                <input type="text" class="form-control" name="email" size=39 maxlength=50 placeholder="EMAIL" style="border-width: 1px;color:#357bd8;" id="validationCustom01" pattern="[a-z0-9._]+@+[a-z]+\.+[a-z]{2,4}" required />
             <div class="invalid-feedback">
                  It seems you have not entered a correct EMAIL
                </div>
              </td>

              <tr><td>
                 
                 <div class="help-block with-errors" style="color:red"></div> 
              </td></tr>
              
            </tr>
            <tr>
           	</tr>

            </div>
              <div class="form-group">
            <tr>

            	<td>
            	</td>
              <td style="padding-top: 15px">

                <input type="PASSWORD" class="form-control" name="password" size=39 maxlength=50 placeholder="PASSWORD" style="border-width: 1px;color:#357bd8;" id="validationCustom01"  required/>
             <div class="invalid-feedback">
                  It seems you haven't entered a valid password.
                </div>
              </td>
              <tr><td>
                 
                 <div class="help-block with-errors" style="color:red"></div> 
              </td></tr>
              
            </tr>
            </div>   
            <div class="form-group">
            	<tr>
            		<td>
            		</td>

            		<td style="left: 100px;padding-top: 15px">
          			<input type="submit" name="SUBMIT" value="SUBMIT" class="btn" style="background:#3333EE;font-size:14px;color: white" >

            		</td>
            	</tr>
            </div>     

            
            
           
        </form>
</table>
							</div>	
						</div>				
					</div>
				</div>
			</div>
		</div>



<footer style="background:#0B0101;">

    <!--Footer Links-->
    <div class="container-fluid">
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
                    <li><a href="index.php">HOME</a></li>
                    <li><a href="about.php">ABOUT</a></li>
                    <li><a href="licenseSIGNINUP.txt">LICENSE</a></li>
                    
                </ul>
            </div>
           
      


 <div class="col-md-4" style="text-align: left">
  <div class="footer-contact" style="background:#0B0101;">
    <p style="color: white;
        font-weight: 500;font-size: 1.2rem;
        padding-top: 20px;">Contact Us</p>
    
    <table>
        <tr>
            <td>
               
                <i class="fa fa-envelope"></i>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="" style="color:grey"> abdulsmapara@gmail.com</span>
            </td>
        </tr>
        <tr>
            <td>
                
<i class="fa fa-phone"></i>

            
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="" style="color:grey">+91-8888743793</span>
            </td>
        </tr>
        <tr>
            <td>
                <i class="fa fa-globe"></i>
                </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.codeingzone.in/abdulsmapara"><span class="" style="color:grey"> www.codeingzone.in/abdulsmapara</span></a>
            </td>
        </tr>
    </table>
    <br />
    <br />
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
<jsp:include page="loggedin.jsp" />
<%
    }
%>

