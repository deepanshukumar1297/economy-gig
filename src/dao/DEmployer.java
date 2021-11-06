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
	
	
	public ArrayList<Employer> fetch(String email) {
		String query= String.format("select * from employer where email=('%s')",email);  
		ArrayList<Employer> list=new ArrayList<Employer>();
		Employer employer = new Employer();
		try
		{
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())
			{
				int job_id=rs.getInt("job_id");
				String job_title=rs.getString("job_title");	
				Date date_to = rs.getDate("date_to");
				Date date_from = rs.getDate("date_from");
				int wages_daily=rs.getInt("wages_daily");
				int wages_monthly=rs.getInt("wages_monthly");
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
				
				list.add(employer);
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


	public void insert(Employer employer) {

		String query= "insert into employer(email, job_discription, job_title, payment_method, date_from, date_to, wages_daily, wages_monthly) values(?,?,?,?,?,?,?,?)";
		try
		{
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
			pst.executeBatch();
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		
	}


	public int jobId(String email) {
		int job_id = 0;
		try
		{
			String query= String.format("select job_id from employer where email=('%s')",email);  
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())job_id=rs.getInt("job_id");
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return job_id;
	}
}
