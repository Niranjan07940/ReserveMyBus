<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.io.*" %>
    <%@ page import ="java.util.*" %>
    <%@ page import ="Factory.ConnectionFactory" %>
    <%@ page import ="java.sql.*" %>
    <%@ page import ="java.text.*"%>
<!DOCTYPE html>

<%
HttpSession hs=request.getSession(false);
String user=(String)hs.getAttribute("uname");
String Uname=(String)hs.getAttribute("Uname");
if("Admin@123".equals(hs.getAttribute("uname"))){
	RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
	rd.forward(request,response);
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
</head>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



<body>
     <nav class="navbar navbar-expand-lg fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand me-auto" href="#">LOGO</a>
    
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active mx-lg-2" aria-current="page" href="Welcome.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-2" href="About.jsp">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-2" href="BookBus.jsp">Book Bus</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-2" href="ViewTickets.jsp">View Tickets</a>
          </li>
        </ul>
       
      </div>
    </div>
    
    
    
     <a class="nav-link mx-lg-2" href=""><%=Uname %></a>
    <a href="logout.jsp" class="login-button">Logout</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>
      

<div class="wrapper">
<div class="testimonial">
<article class="all">
<h1 class="tt">ABOUT</h1>
<image class="imageme" src="./photos/Bus3.jpg">
<blockquote class="tt">An Online Bus Ticket Reservtion System
The entire project is based on purely Java  HTML,CSS and Bootstrap.In this project the Frontend part is purely desigined 
with the help of HTML,CSS and Bootstrap.The entire backend part is desigined based on Java ( JDBC ,SERVLETS and JSP's) and used SQL 
as the Database.
In the Frontend part the dynaminc content will be displayed with the help of JSP's
The main idea of this project is about Backend part not about Frontend.Hence the Frontend part is not be upto the required standards.
</blockquote>
<h5 class="tt">Niranjan Reddy Police</h5>

</article>
</div>
</div>


</body>
</html>