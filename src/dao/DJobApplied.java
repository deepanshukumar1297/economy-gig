package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import pojo.Candidate;
import pojo.CandidateSkill;
import pojo.Employer;
import pojo.Info;
import pojo.JobApplied;

public class DJobApplied {
	public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	public void insert(JobApplied apply, int number)
	{
		
		try
		{
			String query= "insert into job_applied values(?,?,?)";	//job_id , candidate_id, approve
			PreparedStatement pst= con.prepareStatement(query);
			for(int i=0; i<number; i++) {
				pst.setInt(1, apply.getJob_id()[i]);
				pst.setInt(2, apply.getCandidate_id());
				pst.setBoolean(3, apply.isApprove());
				
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
	
	public boolean hasAlreadyApplied(int job_id) {
		try {
			String query= String.format("select candidate_id from job_applied where job_id=%d",job_id);
			if(con.createStatement().executeQuery(query).next()) {
				exception=false;
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
			exception= true;
		}
		return false;
	}
	
	
	public ArrayList<Employer> pending(int candidate_id,boolean status){	
		ArrayList<Employer> list=new ArrayList<Employer>();
		try
		{
			String query= String.format("select job_id from job_applied where candidate_id=%d and approve=%b",candidate_id,status);  
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())
			{
				int job_id=rs.getInt("job_id");
				String final_query= String.format("select * from employer where job_id=%d", job_id);
				
				//can't use same rs for both since they are not independent
				ResultSet rs2= con.createStatement().executeQuery(final_query);
				while(rs2.next()) {
					Employer employer = new Employer();

					String job_title=rs2.getString("job_title");	
					Date date_to = rs2.getDate("date_to");
					Date date_from = rs2.getDate("date_from");
					int wages_daily=rs2.getInt("wages_daily");
					int wages_monthly=rs2.getInt("wages_monthly");
					String payment_method = rs2.getString("payment_method");
					String job_discription=rs2.getString("job_discription");
					
					employer.setDate_from(date_from);
					employer.setDate_to(date_to);
					employer.setJob_discription(job_discription);
					employer.setJob_title(job_title);
					employer.setPayment_method(payment_method);
					employer.setWages_daily(wages_daily);
					employer.setWages_monthly(wages_monthly);
					employer.setJob_id(job_id);
					
					list.add(employer);
				}
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

	public void delete(JobApplied jobApplied) {
		try {
			for(int job_id:jobApplied.getJob_id()) {
				String query= String.format("delete from job_applied where job_id=%d and candidate_id=%d",job_id,jobApplied.getCandidate_id());
				
				int i=con.prepareStatement(query).executeUpdate();
				if(i>0)exception=false;
				else exception = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
			exception= true;
		}
		
	}
	
	public ArrayList<Map<String, String>> allCandidate(int job_id) {
		
		ArrayList<Map<String,String>> arrayList = new ArrayList<Map<String, String>>();
		DCandidate dCandidate = new DCandidate();
		DInfo dInfo = new DInfo();
		DCandidateSkill dCandidateSkill = new DCandidateSkill();
		
		try {
			
			String query= String.format("select candidate_id from job_applied where job_id=%d and approve=true",job_id );
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				int candidate_id = rs.getInt("candidate_id");
				Candidate fetchInfo = dCandidate.fetchInfo(rs.getInt("candidate_id"));
				map.put("Self Discription", fetchInfo.getSelf_discription());
				
				String email=fetchInfo.getEmail();
				ArrayList<Info> fetch = dInfo.fetch(email);
				for(Info info:fetch) {
					map.put("Name", info.getName());
				}
				
				ArrayList<CandidateSkill> fetch2 = dCandidateSkill.fetch(candidate_id);
				for(CandidateSkill skills:fetch2) {
					String[] skills2 = skills.getSkills();
					StringBuffer sb = new StringBuffer("");
					int count=0;
					for(String s:skills2) {
						if(count!=0)sb.append(", ");
						sb.append(s);
						count++;
					}
					String actual=new String(sb);
					map.put("Skills", actual);
				}
				arrayList.add(map);
				
			}
			if(dCandidateSkill.exception==true || dCandidate.exception==true)exception=true;
			else exception=false;
		}catch (Exception e) {
			exception=true;
			e.printStackTrace();
		}
		return arrayList;
	}
	
	public ArrayList<ArrayList< String>> jobsToApprove(String email) {
		DEmployer demp = new DEmployer();
		DCandidate dCandidate = new DCandidate();
		DJobSkill dJobSkill = new DJobSkill();
		DCandidateSkill dCandidateSkill = new DCandidateSkill();
		ArrayList<ArrayList< String>> arrayList = new ArrayList<ArrayList< String>>();
		
		
		try {
			
			ArrayList<Integer> jobId = demp.jobId(email);
			
			for(int i=0;i<jobId.size();i++) {
				ArrayList< String> list = new ArrayList< String>();
				
				String query=String.format("select candidate_id from job_applied where job_id=%d and approve=false", jobId.get(i));
				ResultSet rs= con.createStatement().executeQuery(query);
				while(rs.next()) {
					list.add(Integer.toString(rs.getInt("candidate_id")));
					list.add(Integer.toString(jobId.get(i)));
					
					//it is better to make different method for it in demployer as it is being used in many places;
					ResultSet rs2=con.createStatement().executeQuery(String.format("select * from employer where job_id=%d", jobId.get(i)));
					while(rs2.next())list.add(rs2.getString("job_discription"));
					
					Candidate fetchInfo = dCandidate.fetchInfo(rs.getInt("candidate_id"));
					list.add(fetchInfo.getSelf_discription());
					
					list.add(dJobSkill.skillsToString(dJobSkill.fetchSkill(jobId.get(i))));
					
					list.add(dCandidateSkill.candidateSkillToString(dCandidateSkill.fetch(rs.getInt("candidate_id"))));
					
					arrayList.add(list);
				}
			}
			if(dJobSkill.exception==true || dCandidateSkill.exception==true)exception=true;
			else exception=false;
		} catch (Exception e) {
			exception=true;
			e.printStackTrace();
		}
		return arrayList;
	}

	public void changeApproveStatus(JobApplied jobApplied) {
		
		try
		{
			for(int i=0;i<jobApplied.getCandidate_ids().length;i++) {
				String query= "update job_applied set approve=? where job_id=? and candidate_id=?"; 
				PreparedStatement pst= con.prepareStatement(query);
				
				pst.setBoolean(1, jobApplied.isApprove());
				pst.setInt(2, jobApplied.getJob_id()[i]);
				pst.setInt(3, jobApplied.getCandidate_ids()[i]);
				pst.executeUpdate();

			}
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		
	}
	
	
	
}
