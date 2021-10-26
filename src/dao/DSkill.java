package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DSkill {

	String url="jdbc:mysql://localhost:3306/gig_economy";
	String uname="root";
	String pass="root";
	
	public void getCon()  
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public ArrayList<String> fetch() 
	{
		ArrayList<String> skill= new ArrayList<String>();
		getCon();
		String query= "select student_id ,student_name ,section_id from student ORDER BY student_name, student_id";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				String skill_type = rs.getString(1);
				skill.add(skill_type);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return skill;
	}
}
