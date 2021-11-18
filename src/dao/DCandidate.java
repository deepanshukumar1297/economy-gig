package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pojo.Candidate;

public class DCandidate {
	
	public boolean exception;
	
	GetConnection get=new GetConnection();
	Connection con = get.getCon();
	
	public void insert(Candidate candidate)
	{
		try
		{
			if(!con.createStatement().executeQuery(String.format("select email from candidate where email=('%s')", candidate.getEmail())).next()) {
				String query= "insert into candidate(self_discription,email, picture) values(?,?,?)";
				PreparedStatement pst= con.prepareStatement(query);
				
				pst.setString(1, candidate.getSelf_discription());
				pst.setString(2, candidate.getEmail());
				pst.setString(3, candidate.getPicture());
				
				pst.addBatch();
				pst.executeBatch();
				exception=false;
			}
			else exception=true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
	}
	
	
	public boolean ping(String email) {
		String query= String.format("select candidate_id from candidate where email=('%s')",email);
		//System.out.println(query);
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
	
	
	public ArrayList<Candidate> fetch(String email) {
		
		ArrayList<Candidate> list=new ArrayList<Candidate>();
		Candidate candidate = new Candidate();
		
		String query= String.format("select * from candidate where email=('%s')",email);  
		//System.out.println(query);
		
		try
		{
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())
			{
				int candidate_id=rs.getInt("candidate_id");
				String self_description=rs.getString("self_discription");	
				String upi_id = rs.getString("upi_id");
				//Blob picture = rs.getBlob("picture");
				candidate.setSelf_discription(self_description);
				candidate.setUpi_id(upi_id);
				//candidate.setPicture(picture);
				candidate.setCandidate_id(candidate_id);
				
				list.add(candidate);
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
	
	public int candidateId(String email) {
		int candidate_id = 0;
		try
		{
			String query= String.format("select candidate_id from candidate where email=('%s')",email);  
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())candidate_id=rs.getInt("candidate_id");
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return candidate_id;
		
	}
	
	public Candidate fetchInfo(int candidateId) {
		
		Candidate candidate = new Candidate();
		
		String query= String.format("select * from candidate where candidate_id=%d",candidateId);  
		//System.out.println(query);
		
		try
		{
			ResultSet rs= con.createStatement().executeQuery(query);
			while(rs.next())
			{
				int candidate_id=rs.getInt("candidate_id");
				String self_description=rs.getString("self_discription");	
				String upi_id = rs.getString("upi_id");
				String email=rs.getString("email");
				//Blob picture = rs.getBlob("picture");
				candidate.setSelf_discription(self_description);
				candidate.setUpi_id(upi_id);
				//candidate.setPicture(picture);
				candidate.setCandidate_id(candidate_id);
				candidate.setEmail(email);
				
				
			}
			exception=false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			exception=true;
		}
		return candidate;
	}
}
