<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body class="back">
<%! String Email="";String Uname=""; String Password="";%>
<%
HttpSession hs=request.getSession(false);
Uname=(String)hs.getAttribute("Uname");
String user=(String)hs.getAttribute("uname");

if(!"Admin@123".equals(hs.getAttribute("uname"))){
	RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
	rd.forward(request,response);
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
            <a class="nav-link active mx-lg-2" aria-current="page" href="Admin.jsp">Home</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link mx-lg-2" href="AddBus.jsp">Add Bus</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-2" href="AvaliableBus.jsp">Avaliable Bus</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-2" href="BookReport.jsp">Book Report</a>
          </li>
         
          

        </ul>
       
      </div>
    </div>
    <a class="nav-link mx-lg-2" href="#"><%=Uname %></a>
    <a href="logout.jsp" class="login-button">Logout</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

         

<section class="container-fluid ">
       <form class="mx-auto " action="addbus" method="POST">
       <div class="alert alert-danger" role="alert">
           <%=hs.getAttribute("success") %>
          </div>
        <h4 class="text-center">ADD BUS</h4>
      
       <div class="col ">
    <label for="validationCustom01" class="form-label">Bus No*</label>
    <input type="text" class="form-control " id="validationCustom01" name="bno"  required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col ">
    <label for="validationCustom02" class="form-label">Bus Name*</label>
    <input type="text" class="form-control" id="validationCustom02" name="bname" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col ">
    <label for="validationCustom02" class="form-label">From City*</label>
    <input type="text" class="form-control" id="validationCustom02" name="fcity" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col">
    <label for="validationCustom02" class="form-label">To City*</label>
    <input type="text" class="form-control" id="validationCustom02" name="tcity" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col ">
    <label for="validationCustom02" class="form-label">Date*</label>
    <input type="date" class="form-control" id="validationCustom02" name="date" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col ">
    <label for="validationCustom02" class="form-label">Time*</label>
    <input type="text" class="form-control" id="validationCustom02" name="time" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col ">
    <label for="validationCustom02" class="form-label">Price*</label>
    <input type="text" class="form-control" id="validationCustom02" name="price" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  
  <div class="col-12">
    <div class="form-check mb-3">
      <input class="form-check-input mb-3"  value="input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="col-12 ">
    <button type="submit" class="btn btn-primary">Add Bus</button>
  </div>
  
</form>
</section>



</body>
</html>