package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {

	public boolean exception;
	private String url="jdbc:mysql://localhost:3306/gig_economy";
	private String uname="root";
	private String pass="root";
	private Connection con;

	public Connection getCon()  
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			exception=false;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			exception=true;
		}
		try {
			con=DriverManager.getConnection(url, uname, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			exception=true;
		}
		return con;
	}
}
