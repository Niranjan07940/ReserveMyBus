package Controller;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;

import Action.RegisterAction;
import Beans.User;
@WebServlet("/register")

public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String status="";
		String Fname=request.getParameter("fname");
		String Lname=request.getParameter("lname");
		String Email=request.getParameter("email");
		String Password=request.getParameter("pwd");
		User user=new User();
		user.setFname(Fname);
		user.setLname(Lname);
		user.setEmail(Email);
		user.setPassword(Password);
		RegisterAction ra= new RegisterAction();
		status=ra.add(user);
		if(status.equals("success")) {
			HttpSession hs=request.getSession();
			
			RequestDispatcher rd= request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			
		}
		
		
	}

}
