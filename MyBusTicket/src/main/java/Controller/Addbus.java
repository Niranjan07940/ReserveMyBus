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

@WebServlet("/addbus")
public class Addbus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession hs=request.getSession();
		PrintWriter out =response.getWriter();
		
		String Busno=request.getParameter("bno");
		String Busname=request.getParameter("bname");
		String Fcity=request.getParameter("fcity");
		String Tcity=request.getParameter("tcity");
		String Date=request.getParameter("date");
		String Time=request.getParameter("time");
		String Price=request.getParameter("price");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=ConnectionFactory.getConnection();
			PreparedStatement pst=con.prepareStatement("select *from AddBus where BusNo=?");
			pst.setString(1, Busno);
			ResultSet rs=pst.executeQuery();
			boolean b=rs.next();
			if(b==true) {
				hs.setAttribute("success", "Already existed");
				RequestDispatcher rd= request.getRequestDispatcher("/AddBus.jsp");
				rd.include(request, response);	
			}
			PreparedStatement pst1=con.prepareStatement("insert into AddBus values(?,?,?,?,?,?,?)");
			pst1.setString(1, Busno);
			pst1.setString(2, Busname);
			pst1.setString(3, Fcity);
			pst1.setString(4, Tcity);
			java.sql.Date date=java.sql.Date.valueOf(Date);
			pst1.setDate(5, date);
			pst1.setString(6, Time);
			pst1.setString(7, Price);
			int x=pst1.executeUpdate();
			if(x==1) {
				hs.setAttribute("success","Bus Added");
				RequestDispatcher rd= request.getRequestDispatcher("/AvaliableBus.jsp");
				rd.forward(request, response);
			}
			else {
				hs.setAttribute("success","Bus Already exist!!");
				RequestDispatcher rd= request.getRequestDispatcher("/AddBus.jsp");
				rd.forward(request, response);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
