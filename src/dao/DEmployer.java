package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pojo.Employer;


public class DEmployer {
	
	public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public boolean ping(String email) {
		String query= String.format("select job_id from employer where email=('%s')",email);
		try
		{
			if(con.createStatement().executeQuery(query).next()) {
				exception=false;
				return true;
			}
			else return false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return false;
	}
	
	/**
	 * 
	 * @param employer
	 * @return job id of current inserted job
	 */
	public int insert(Employer employer) {

		int job_id=0;
		try
		{
			String query= "insert into employer(email, job_discription, job_title, payment_method, date_from, date_to, wages_daily, wages_monthly) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, employer.getEmail());
			pst.setString(2, employer.getJob_discription());
			pst.setString(3, employer.getJob_title());
			pst.setString(4, employer.getPayment_method());
			pst.setDate(5, employer.getDate_from());
			pst.setDate(6, employer.getDate_to());
			pst.setInt(7, employer.getWages_daily());
			pst.setInt(8, employer.getWages_monthly());

			pst.addBatch();
			int[] executeBatch = pst.executeBatch();
			
			if(executeBatch.length>0) {
				String query2= String.format("select job_id from employer where email=('%s')",employer.getEmail());
				ResultSet rs= con.createStatement().executeQuery(query2);
				while(rs.next())job_id=rs.getInt("job_id");
				exception=false;
			}
			else exception=true;
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return job_id;
	}



	
	public ArrayList<Employer> apply(int candidate_id) {
		
		ArrayList<Employer> list=new ArrayList<Employer>();
		ArrayList<Integer> job_id_List = new ArrayList<Integer>();
		DJobApplied dJobApplied = new DJobApplied();
		try
		{
			ResultSet rs;
			String query_for_jobId ="select distinct  j.job_id from job_skill as j"
					+ " inner join candidate_skill as c where j.skills=c.skills"
					+ " and c.candidate_id="+candidate_id;
			rs= con.createStatement().executeQuery(query_for_jobId);
			while(rs.next())job_id_List.add(rs.getInt("job_id"));
						
			for(int job_ids:job_id_List) {
				if(dJobApplied.hasAlreadyApplied(job_ids)==false) {
					String final_query_employer="select * from employer where job_id="+job_ids;
					rs=con.createStatement().executeQuery(final_query_employer);
					while(rs.next()) {
						Employer employer = new Employer();
	
						int job_id=rs.getInt("job_id");
						String job_title=rs.getString("job_title");
						String email=rs.getString("email");
						Date date_to = rs.getDate("date_to");
						Date date_from = rs.getDate("date_from");
						int wages_daily=rs.getInt("wages_daily");
						int wages_monthly=rs.getInt("wages_monthly");
						String payment_method = rs.getString("payment_method");
						String job_discription=rs.getString("job_discription");
						
						employer.setEmail(email);
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
			}
			if(dJobApplied.exception==false)exception=false;
			else exception=true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return list;
	}
	
	public ArrayList<Employer> allJobs(String email){
		ArrayList<Employer> arrayList = new ArrayList<Employer>();
		try {
			String query=String.format("select * from employer where email=('%s')", email);
			ResultSet rs = con.createStatement().executeQuery(query);
			while(rs.next()) {
				Employer employer = new Employer();

				String job_title=rs.getString("job_title");	
				Date date_to = rs.getDate("date_to");
				Date date_from = rs.getDate("date_from");
				int wages_daily=rs.getInt("wages_daily");
				int wages_monthly=rs.getInt("wages_monthly");
				int job_id=rs.getInt("job_id");
				String payment_method = rs.getString("payment_method");
				String job_discription=rs.getString("job_discription");
				
				employer.setDate_from(date_from);
				employer.setDate_to(date_to);
				employer.setJob_discription(job_discription);
				employer.setJob_title(job_title);
				employer.setPayment_method(payment_method);
				employer.setWages_daily(wages_daily);
				employer.setWages_monthly(wages_monthly);
				employer.setJob_id(job_id);
				employer.setEmail(email);
				
				arrayList.add(employer);

			}
			exception=false;
		}catch (Exception e) {
			exception=true;
			e.printStackTrace();
			
		}
		return arrayList;
		
	}
	
	public ArrayList<Integer> jobId(String email) {
		ArrayList<Integer> arrayList = new ArrayList<Integer>();
		try
		{
			String query= String.format("select job_id from employer where email=('%s')",email);  
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())arrayList.add(rs.getInt("job_id"));
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return arrayList;
	}
}
