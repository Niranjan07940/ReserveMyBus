<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.io.*" %>
    <%@ page import ="java.util.*" %>
    <%@ page import ="Factory.ConnectionFactory" %>
    <%@ page import ="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Welcome</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<%! String Email="";String Uname=""; String Password="";%>
<%
HttpSession hs=request.getSession(false);
String user=(String)hs.getAttribute("uname");
if("Admin@123".equals(hs.getAttribute("uname"))){
	RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
	rd.forward(request,response);
}
Email =(String)hs.getAttribute("uname");
Password=(String)hs.getAttribute("pwd");
try{
	Connection con=ConnectionFactory.getConnection();
	PreparedStatement pst=con.prepareStatement("select FirstName from Registration where Email=? and Password=?");
	pst.setString(1,Email);
	pst.setString(2,Password);
	ResultSet rs=pst.executeQuery();
	boolean b=rs.next();
	if(b==true){
		Uname=rs.getString(1);
		hs.setAttribute("Uname",Uname);
	}
	
}
catch(Exception e){
	e.printStackTrace();
}

%>

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
            <a class="nav-link mx-lg-2" href="ViewTickets.jsp.jsp">View Tickets</a>
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

<section class="hero-section">
<div class=" container d-flex align-items-center justify-content-center fs-1 text-white flex-column">
          
            
           

</div>
</section>
</body>
</html>