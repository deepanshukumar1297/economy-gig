package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pojo.JobSkill;

public class DJobSkill {

	public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public void insert(JobSkill skill,int number_of_skill,int job_id)
	{
		try
		{
			String query= "insert into job_skill values(?,?)";   //job_id skills
			PreparedStatement pst= con.prepareStatement(query);
			
			for(int i=0; i<number_of_skill; i++)
			{
				pst.setInt(1, job_id); 
				pst.setString(2, skill.getSkills()[i]);
				
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
	
	public JobSkill fetchSkill(int job_id) {
		ArrayList<String> apparent=new ArrayList<String>();
		JobSkill jobSkill = new JobSkill();
		try {
			String query= String.format("select skills from job_skill where job_id=%d",job_id);
			ResultSet executeQuery = con.createStatement().executeQuery(query);
			while(executeQuery.next()) {
				apparent.add(executeQuery.getString("skills"));
			}
			String[] skills= new String[apparent.size()];
			for(int i=0;i<apparent.size();i++)skills[i]=apparent.get(i);
			jobSkill.setSkills(skills);
			exception=false;
		}catch (Exception e) {
			e.printStackTrace();
			exception= true;
		}
		return jobSkill;
		
	}
	
	public String skillsToString(JobSkill jobskill) {
		StringBuffer sb = new StringBuffer("");

		for(int i=0;i<jobskill.getSkills().length; i++) {
			sb.append(jobskill.getSkills()[i]);
			if(i!=jobskill.getSkills().length-1)sb.append(", ");
		}
		return new String(sb);
	}
}
