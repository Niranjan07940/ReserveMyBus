package Controller;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Factory.ConnectionFactory;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String Email=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=ConnectionFactory.getConnection();
			PreparedStatement pst=con.prepareStatement("select *from Registration where Email=? and Password=?");
			pst.setString(1, Email);
			pst.setString(2, pwd);
			ResultSet rs=pst.executeQuery();
			boolean b=rs.next();
			if(b==true) {
				HttpSession hs= request.getSession();
				
				if(Email.equals("Admin@123") && pwd.equals("root")) {
					hs.setAttribute("uname", Email);
					hs.setAttribute("pwd",pwd);
					RequestDispatcher rd= request.getRequestDispatcher("/Admin.jsp");
					rd.forward(request, response);
				}
				else {
					
					hs.setAttribute("uname", Email);
					hs.setAttribute("pwd",pwd);
					RequestDispatcher rd= request.getRequestDispatcher("/Welcome.jsp");
					rd.forward(request, response);
					
				}
			}
			else {
				RequestDispatcher rd= request.getRequestDispatcher("/login.jsp");
				rd.include(request, response);
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
