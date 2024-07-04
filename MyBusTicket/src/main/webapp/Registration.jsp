<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body class="back">
<section class="container-fluid ">
       <form class="mx-auto " action="register" method="POST">
        <h4 class="text-center">Registration</h4>
       <div class="col mt-5">
    <label for="validationCustom01" class="form-label">First name</label>
    <input type="text" class="form-control mb-3" id="validationCustom01" name="fname"  required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  <div class="col mb-3">
    <label for="validationCustom02" class="form-label">Last name</label>
    <input type="text" class="form-control" id="validationCustom02" name="lname" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
  
 
  <div class="col mb-3">
    <label for="inputEmail4" class="form-label">Email</label>
    <input type="email" class="form-control"  name="email" id="inputEmail4">
  </div>
  <div class="col">
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="password" class="form-control mb-3"  name="pwd" id="inputPassword4">
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
    <button type="submit" class="btn btn-primary">Sign-up</button>
  </div>
  <div id="emailHelp" class="form-text">Already have an account?<a href="login.jsp">Sign-in</a></div>
</form>
</section>

</body>
</html>