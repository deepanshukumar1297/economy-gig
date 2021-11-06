package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import pojo.JobSkill;

public class DJobSkill {

	public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public void insert(JobSkill skill,int number_of_skill,int job_id)
	{
		String query= "insert into job_skill values(?,?)";   //job_id skills
		try
		{
			PreparedStatement pst= con.prepareStatement(query);
			
			for(int i=0; i<number_of_skill; i++)
			{
				pst.setInt(1, job_id); 
				pst.setString(2, skill.getSkills()[i]);
				System.out.println(skill.getSkills()[i]+" djobskill");
				
				pst.addBatch();
			}
			
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
