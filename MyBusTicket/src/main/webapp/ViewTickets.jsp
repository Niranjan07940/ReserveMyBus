<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.io.*" %>
    <%@ page import ="java.util.*" %>
    <%@ page import ="Factory.ConnectionFactory" %>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<%
HttpSession hs=request.getSession(false);
String Uname=(String)hs.getAttribute("Uname");
if("Admin@123".equals(hs.getAttribute("uname"))){
	RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
	rd.forward(request,response);
}
 %>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body class="back">
     <div class="container" style="position:relative;top:19vh;">
     <div class="alert alert-primary" role="alert">
                     <%=hs.getAttribute("success") %>
          </div>
         
      </div>
     

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
       <div class="container mt-5" style="position:relative;top:15vh;">
    
    <table class="table table-responsive table-bordered border-dark table-hover text-center text-capitalize">
    
    <tr  id="conatiner2" class="table-dark table-active text-uppercase text-white">
      
      <th>Bus Name</th>
      <th>From City</th>
      <th>To City</th>
      <th>Date</th>
      <th>Time</th>
      <th>Email</th>
      <th>Mobile</th>
      <th>Nop</th>
    </tr>
      <tr>
    <% 
    
    try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=ConnectionFactory.getConnection();
	PreparedStatement pst=con.prepareStatement("select Bname,Fcity,Tcity,Date,Time,Email,Mobile,Nop from Booking,Details where Booking.Bno=Details.Bno and Uname=?");
	pst.setString(1,(String)hs.getAttribute("uname"));
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		%>
		
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getInt(8) %></td>
		
		</tr>
		<% 
		
		
		
	
	}
}
catch(Exception e){
	e.printStackTrace();
	
}
	%>
    
    
    
    </table>
    </div>

</body>
</html>