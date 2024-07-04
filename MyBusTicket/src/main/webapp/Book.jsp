<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.io.*" %>
    <%@ page import ="java.util.*" %>
    <%@ page import ="Factory.ConnectionFactory" %>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>


<%
String Bno=request.getParameter("bno");
String Bname=request.getParameter("bname");
String Fcity=request.getParameter("fcity");
String Tcity=request.getParameter("tcity");
String Date=request.getParameter("date");
String Time=request.getParameter("time");
String Price=request.getParameter("price");
HttpSession hs=request.getSession(false);

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=ConnectionFactory.getConnection();
	PreparedStatement pst=con.prepareStatement("insert into Booking values(?,?,?,?,?,?,?,?)");
	pst.setString(1,Bno);
	pst.setString(2,Bname);
	pst.setString(3,Fcity);
	pst.setString(4,Tcity);
	pst.setString(5,Date);
	pst.setString(6,Time);
	pst.setString(7,Price);
	pst.setString(8,(String)hs.getAttribute("uname"));
	int x=pst.executeUpdate();
	hs.setAttribute("Bno",Bno);
	if(x==1){
		hs.setAttribute("success","Bus Booking");
	}
	else{
		hs.setAttribute("success","Bus not Avalaible");
	}
}
catch(Exception e){
	e.printStackTrace();
}

%>
<html>
<head>
<meta charset="UTF-8">
<title>book</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</head>
<body class="back">
    <div class="container">
    <div class="alert alert-primary" role="alert">
               <%=hs.getAttribute("success") %>
           </div>
    </div>
    <section class="container-fluid ">
       <form class="mx-auto " action="Payment.jsp" method="POST">
        <h4 class="text-center">Details</h4>
       <div class="col ">
    <label for="validationCustom01" class="form-label">Email*</label>
    <input type="email" class="form-control mb-3" id="validationCustom01" name="email"  required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col mb-3">
    <label for="validationCustom02" class="form-label">Mobile no*</label>
    <input type="number" class="form-control" id="validationCustom02" name="mno" required>
    <div class="valid-feedback">
      Looks good!
    </div>
    
  </div>
   <div class="col mb-3">
    <label for="validationCustom02" class="form-label">No of Persons*</label>
    <input type="text" class="form-control" id="validationCustom02" name="nop" required>
    <div class="valid-feedback">
      Looks good!
    </div>
    
  </div>
  <div class="col-12">
    <div class="form-check mb-3">
      <input class="form-check-input mb-3" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="col-12 mb-3">
    <button type="submit" class="btn btn-primary">Confirm Details</button>
  </div>
  <a href="BookBus.jsp"><button  class="btn btn-primary">Cancel</button></a>
    
</form>


</section>
    




</body>
</html>