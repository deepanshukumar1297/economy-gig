package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import pojo.CandidateSkill;

public class DCandidateSkill {
public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public void insert(CandidateSkill skill,int number_of_skill,int candidate_id)
	{
		String query= "insert into candidate_skill values(?,?)";   //candidate_id skills
		try
		{
			PreparedStatement pst= con.prepareStatement(query);
			
			for(int i=0; i<number_of_skill; i++)
			{
				pst.setInt(1, candidate_id);
				pst.setString(2, skill.getSkills()[i]);
				
				pst.addBatch();
			}
			
			pst.executeBatch();
			
			exception=false;
			//System.out.println("dcs try");

		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
			//System.out.println("dcs catch");
			
		}
	}
}
