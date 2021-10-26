package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.Info;


public class DInfo {


	String url="jdbc:mysql://localhost:3306/gig_economy";
	String uname="root";
	String pass="root";
	
	public void getCon()  
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public boolean insert(Info info)
	{
		getCon();
		String query= "insert into info values(?,?,?,?)";	//email , name , contact_no , aadhar_card
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, info.getEmail_id());
			pst.setString(2, info.getName());
			pst.setString(3, info.getContact_number());
			pst.setString(4, info.getAadhar_card());
			
			pst.addBatch();
			
			pst.executeBatch();
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean getVerification(String email) {
		getCon();
		String query= String.format("select email from info where email=('%s')",email);
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(rs.next())
			{
				return true;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
