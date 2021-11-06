package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pojo.Info;

public class DInfo {
	
	public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	public void insert(Info info)
	{
		String query= "insert into info values(?,?,?,?)";	//email , name , contact_no , aadhar_card
		try
		{
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, info.getEmail_id());
			pst.setString(2, info.getName());
			pst.setString(3, info.getContact_number());
			pst.setString(4, info.getAadhar_card());
			
			pst.addBatch();
			
			pst.executeBatch();
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
	}
	
	public int getVerification(String email) {
		String query= String.format("select email from info where email=('%s')",email);
		try
		{
			if(con.createStatement().executeQuery(query).next()){return 1;}
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return 0;
	}
	
	
	public ArrayList<Info> fetch(String email) {
		String query= String.format("select * from info where email=('%s')",email);
		//System.out.println(query);
		ArrayList<Info> list=new ArrayList<Info>();
		Info info = new Info();
		try
		{
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())
			{
				String aadhar_card = rs.getString("aadhar_card");
				String name=rs.getString("name");
				String contact_number=rs.getString("contact_number");
				
				info.setAadhar_card(aadhar_card);
				info.setContact_number(contact_number);
				info.setName(name);
				
				list.add(info);
			}
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return list;
	}

	public void deleteAccount(String email) {
		String query= String.format("delete from info where email=('%s')",email);
		try
		{
			con.createStatement().executeUpdate(query);
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		
	}
}
