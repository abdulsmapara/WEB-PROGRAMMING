<%-- 
    Document   : leaderboard
    Created on : Apr 18, 2018, 6:46:15 PM
    Author     : ABDUL SATTAR MAPARA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<% response.setHeader("Cache-Control", "private,no-store,no-cache"); %>
<%
    String s=(String)session.getAttribute("session");
    String msg=(String)session.getAttribute("server_message");
    String name= request.getParameter("name");
    String inval=(String)session.getAttribute("server_message_invalid");
   String i=(String)session.getAttribute("invalid");
   if(s!=null && i!= null && s.equals("TRUE") && i.equals("FALSE") &&  name!=null)
   {
       
    String email=(String)session.getAttribute("username");
    String password=(String)session.getAttribute("password");
     Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SL","root","Mapara");
                    PreparedStatement pstmt2=con.prepareStatement("select * from "+name+"users order by points DESC");
                    PreparedStatement self=con.prepareStatement("select * from "+name+"users where name=\""+email+"\"");
                    ResultSet self_=self.executeQuery();
                 PreparedStatement pstmt3=con.prepareStatement("select * from "+name);
                    ResultSet users_competition=pstmt2.executeQuery();
                    ResultSet compete_table=pstmt3.executeQuery();
                     java.util.Date today=new java.util.Date();
                            Calendar cal = Calendar.getInstance();
                            cal.setTime(today);
                            int year = cal.get(Calendar.YEAR);
                            int month = cal.get(Calendar.MONTH);
                            month++;
                            int day = cal.get(Calendar.DAY_OF_MONTH);
                         PreparedStatement pstmt2__=con.prepareStatement("update ALLCOMPETITIONS set status=\"live\" where start=\""+day+"-"+month+"-"+year+"\"");
                         pstmt2__.executeUpdate();
                         PreparedStatement pstmt3__=con.prepareStatement("update ALLCOMPETITIONS set status=\"ended\" where end=\""+day+"-"+month+"-"+year+"\"");
                         pstmt3__.executeUpdate();
                         
                        
%>

<!DOCTYPE html>
<html>
    <head>
        <title>CODEingZONE-<%= name %>COMPETITION</title>
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

  function search_country()
{
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("leaderboard_input2");
  filter = input.value.toUpperCase();
  table = document.getElementById("leaderboard");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
        </script>
        <script>
function search()
{
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("leaderboard_input");
  filter = input.value.toUpperCase();
  table = document.getElementById("leaderboard");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
    </head>
       <body class="fixed-nav sticky-footer" id="page-top" style="background:white;overflow-x:hidden" onload="pass=false;">
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
          <a class="nav-link" href="compete.jsp">
            <i class="fa fa-fw fa-book"></i>
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
      <i class="fa fa-fw fa-user"></i><%= email %>
  </button>
  
  <ul class="dropdown-menu dropdown-menu-right" role="menu" style="overflow-x:hidden;background:white">
      <a class="dropdown-item" href="competition.jsp" style="background:white"><span class="logout_style"><i class="fa fa-fw fa-user"></i>Make A Competition</span></a>
      <a class="dropdown-item" href="profile.jsp" style="background:white"><span class="logout_style"><i class="fa fa-fw fa-user"></i>PROFILE</span></a>
          <a class="dropdown-item" href="loggedout"  style="background:white"><span class="logout_style"><i class="fa fa-fw fa-sign-out"></i>LOGOUT</span></a>                      

    </ul>
</div>
        </li>
        </form>
      </ul>
    </div>
  </nav>
  <br />
  <br />
       <center><h3><%= name %></h3></center>
  <div class="container">
      <form class="form-inline">
      <input type="text" id="leaderboard_input" class="form-control" style="width:25%"  onkeyup="search();" placeholder="Search by username.."/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" id="leaderboard_input2" class="form-control" style="width:25%"  onkeyup="search_country();" placeholder="Search by country.."/><br />
      </form>
      <table class="table table-hover" id="leaderboard">
          <thead>
          <th>
          <center>RANKING</center>
          </th>
          <th>
             <center> USERNAME</center>
          </th>
          <th>
              <center>POINTS</center>
          </th>
          
          <th>
              <center>COUNTRY</center>
          </th>
          </thead>
          <%
              int store_rank=-1 ;
              if(users_competition != null)
              {
                  int rank = 1,start= -1;
                  while(users_competition.next())
                  {
                      if(users_competition.getString("name").equals(email))
                      {
                          store_rank = rank;
                      }
                      if(start !=-1)
                      {
                          if(users_competition.getInt("points")==start)
                          {
                              ;
                          }
                          else
                          {
                              rank++;
                          }
                      }
                      %>
                      <tr>
                          <td><center><h5><%= rank %></h5></center></td>
      <td><center><h5><%= users_competition.getString("name") %></h5></center></td>
                                <td><center><h5><%= users_competition.getInt("points") %></h5></center></td>
                                <td><center><h5><%= users_competition.getString("country") %></h5></center></td>

                      </tr>
                      <%
                          start= users_competition.getInt("points");
                          
                  }
                  if(self_ != null && self_.next())
                {
%>
<tr style="background:grey"><td><center><%= store_rank %></center></td>
                <td><center><%= email %></center></td>
      <td><center><%= self_.getInt("points") %></center></td> 
       <td><center><%= self_.getString("country") %></center></td>

                </tr>

                  <%
                }   
                else
{
    out.print("<h6><center>YOU DIDN'T PARTICIPATE IN THIS CONTEST</center></h6>");
}
              }
              %>
              
              
      </table>
  </div>


            

<%
    }

    else
    {
        
    }
    %>