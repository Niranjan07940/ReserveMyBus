package Action;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Beans.User;
import Factory.ConnectionFactory;

public class RegisterAction {
	String status="";
	public String add(User user) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=ConnectionFactory.getConnection();
			PreparedStatement pst=con.prepareStatement("insert into Registration values(?,?,?,?)");
			pst.setString(1,user.getFname());
			pst.setString(2,user.getLname());
			pst.setString(3,user.getEmail());
			pst.setString(4,user.getPassword());
			int x=pst.executeUpdate();
			if(x==1) {
				status="success";
			}
			else {
				status="unsuccess";
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}

}
