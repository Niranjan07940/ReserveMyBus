package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import Factory.ConnectionFactory;

@WebServlet("/booked")
public class Booked extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession hs=request.getSession(false);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=ConnectionFactory.getConnection();
			PreparedStatement pst=con.prepareStatement("insert into details values(?,?,?,?)");
			pst.setString(1, (String)hs.getAttribute("email"));
			pst.setString(2, (String)hs.getAttribute("mno"));
			pst.setInt(3, (Integer)hs.getAttribute("nop"));
			pst.setString(4, (String)hs.getAttribute("Bno"));
			int x=pst.executeUpdate();
			if(x==1) {
				hs.setAttribute("success","Bus Booked");
				RequestDispatcher rd=request.getRequestDispatcher("/ViewTickets.jsp");
				rd.forward(request, response);
			}
			else {
				hs.setAttribute("success","not booked");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
