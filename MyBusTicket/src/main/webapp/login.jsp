<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="manual.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body class="back">
<div  class="container-fluid">
      <form class="mx-auto" action="login" method="POST">
      <div class="alert alert-primary" role="alert">
           Login as User/Admin
        </div>
      <h4 class="text-center">Login</h4>
  <div class="mb-3 mt-5">
    <label for="exampleInputEmail1" class="form-label">Email address/username</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uname">
    
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="pwd">
    <div id="emailHelp" class="form-text">Forget password?</div>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
  <div id="emailHelp" class="form-text">Don't have an account?<a href="Registration.jsp">Register</a></div>
</form>
</div>

</body>
</html>