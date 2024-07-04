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
<title>Payment</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<%! String BusNo="",Bname="",Fcity="",Tcity="",Date="",Time="";int Price;%>
<% 
String Email=request.getParameter("email");
String Mno=request.getParameter("mno");
int Nop=Integer.parseInt(request.getParameter("nop"));

HttpSession hs=request.getSession(false);

hs.setAttribute("email",Email);
hs.setAttribute("mno",Mno);
hs.setAttribute("nop",Nop);
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=ConnectionFactory.getConnection();
	PreparedStatement pst=con.prepareStatement("select *from Booking where Bno=?");
	pst.setString(1,(String)hs.getAttribute("Bno"));
	ResultSet rs=pst.executeQuery();
	boolean b=rs.next();
	if(b==true){
		BusNo=rs.getString(1);
		Bname=rs.getString(2);
		Fcity=rs.getString(3);
		Tcity=rs.getString(4);
		Date=rs.getString(5);
		Time=rs.getString(6);
		Price=Integer.parseInt(rs.getString(7));	
	}
	
	
}
catch(Exception e){
	e.printStackTrace();
	
}

%>
<body class="back">
<div class="container mt-5">
    <div class="card" style="position:relative;left:0vh;width: 28rem;">
  <div class="card-header">
    <h4>Details</h4>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">BusNo          :<%=BusNo %></li>
    <li class="list-group-item">Bus Name       :<%=Bname %></li>
    <li class="list-group-item">From City      :<%=Fcity %></li>
    <li class="list-group-item">To City         :<%=Tcity %></li>
    <li class="list-group-item">Date           :<%=Date %></li>
    <li class="list-group-item">Time           :<%=Time %></li>
    <li class="list-group-item">Email :<%=Email %></li>
    <li class="list-group-item">Mobile no :<%=Mno %></li>
    <li class="list-group-item">No of Persons :<%=Nop %></li>
    <li class="list-group-item">Total Price($) :<%=Price*Nop %></li>
  </ul>
</div>
</div>

  <form action="booked" method="POST" class="row g-3" style="position:relative;left:55vw;top:-70vh;width: 35rem;">
   <h4>Pay</h4>
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Card Number</label>
    <input type="text" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Expiry date</label>
    <input type="date" class="form-control" id="inputPassword4">
  </div>
  
  <div class="col-md-2">
    <label for="inputZip" class="form-label">CVV</label>
    <input type="password" class="form-control" id="inputZip">
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Pay Securely</button>
  </div>
</form>


</body>
</html>