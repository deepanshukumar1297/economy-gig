package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import pojo.Address;

public class DAddress {
public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public void insert(Address address)
	{
		String query= "insert into address values(?,?,?.?)";   //email state city village
		try
		{
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, address.getEmail());
			pst.setString(2, address.getState());
			pst.setString(3, address.getState());
			pst.setString(4, address.getVillage());
			
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
}
