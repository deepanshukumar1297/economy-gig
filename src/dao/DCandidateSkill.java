package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pojo.CandidateSkill;

public class DCandidateSkill {
public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public void insert(CandidateSkill skill,int number_of_skill)
	{
		String query= "insert into candidate_skill values(?,?)";   //candidate_id skills
		try
		{
			PreparedStatement pst= con.prepareStatement(query);
			
			for(int i=0; i<number_of_skill; i++)
			{
				pst.setInt(1, skill.getCandidate_id());
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
	
	
	public ArrayList<CandidateSkill> fetch(int candidate_id) {
		ArrayList<String> arrayList = new ArrayList<String>();
		ArrayList<CandidateSkill> list = new ArrayList<CandidateSkill>();
		CandidateSkill candidateSkill = new CandidateSkill();
		try {
			String query=String.format("select skills from candidate_skill where candidate_id=%d", candidate_id);
			
			ResultSet rs= con.createStatement().executeQuery(query);
			int count=0;
			while(rs.next()) {
				arrayList.add(rs.getString("skills"));
				count++;
			}
			
			String[] skills=new String[count];
			for(int i=0;i<count;i++)skills[i]=arrayList.get(i);
			
			candidateSkill.setSkills(skills);
			list.add(candidateSkill);
			exception=false;
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			exception=true;
		}
		return list;
	}
	
	public ArrayList<String> show(int candidate_id){
		
		ArrayList<CandidateSkill> alreadyExist = fetch(candidate_id);
		DSkill dSkill = new DSkill();
		ArrayList<String> allskill = dSkill.fetch();
		
	
		for(int i=0; i<alreadyExist.get(0).getSkills().length; i++)
			for(int j=0; j<allskill.size(); j++ )
				if(alreadyExist.get(0).getSkills()[i].equalsIgnoreCase(allskill.get(j)))
					allskill.remove(j);
		
		return allskill;
		
	}
	
	public String candidateSkillToString(ArrayList<CandidateSkill> list) {
		StringBuffer sb = new StringBuffer("");

		for(int i=0;i<list.get(0).getSkills().length; i++) {
			sb.append(list.get(0).getSkills()[i]);
			if(i!=list.get(0).getSkills().length-1)sb.append(", ");
		}
		return new String(sb);
	}
}
