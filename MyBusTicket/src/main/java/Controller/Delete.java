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

import Factory.ConnectionFactory;

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession hs=request.getSession(false);
		String Busno=request.getParameter("bno");
		String Date=request.getParameter("date");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=ConnectionFactory.getConnection();
			PreparedStatement pst=con.prepareStatement("delete from Addbus where BusNo=? and Date=?");
			pst.setString(1, Busno);
			pst.setString(2, Date);
			int x=pst.executeUpdate();
			if(x==1) {
				hs.setAttribute("success","Deleted Successfully");
				RequestDispatcher rd=request.getRequestDispatcher("/AvaliableBus.jsp");
				rd.forward(request, response);
				
			}
			else {
				hs.setAttribute("success","Not Deleted!");
			}
			
		
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
