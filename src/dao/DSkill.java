package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.Skill;

public class DSkill {

	public boolean exception;
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public ArrayList<String> fetch() 
	{
		ArrayList<String> skill= new ArrayList<String>();
		String query= "select skills from skill order by skills";
		try
		{
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				String skill_type = rs.getString(1);
				skill.add(skill_type);
			}
			exception=false;
		}
		catch(SQLException e){
			e.printStackTrace();
			exception=true;
		}
		return skill;
	}
	
	public boolean insert()
	{
		String query= "insert into info values(?)";	//email , name , contact_no , aadhar_card
		Skill skill = new Skill();
		try
		{
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, skill.getSkills());
			
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
}
